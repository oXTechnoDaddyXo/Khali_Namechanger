local VORPcore = exports.vorp_core:GetCore()

local function allowed(src)
    local User = VORPcore.getUser(src)
    if not User then return false end

    local Char = User.getUsedCharacter
    if not Char then return false end

    local job = Char.job or Char.group

    for _,v in pairs(Config.AllowedJobs) do
        if v == job then return true end
    end

    return false
end

local function L(key)
    return Config.Locales[Config.Locale][key] or key
end

local function sendWebhook(oldName, newName, admin, job, id)

    if not Config.DiscordWebhook or Config.DiscordWebhook == "" then
        print("^1[NameChanger] Webhook fehlt!^0")
        return
    end

    local loc = Config.Locales[Config.Locale]

    local embed = {
        {
            title = loc.webhook_title,
            color = 16753920,
            fields = {
                { name = loc.webhook_admin, value = admin or "unknown", inline = true },
                { name = loc.webhook_job, value = job or "unknown", inline = true },
                { name = loc.webhook_id, value = tostring(id), inline = false },
                { name = loc.webhook_old, value = oldName or "unknown", inline = false },
                { name = loc.webhook_new, value = newName or "unknown", inline = false }
            },
            footer = { text = "khali_namechanger" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    PerformHttpRequest(Config.DiscordWebhook, function(err)
        if err ~= 200 and err ~= 204 then
            print("^1[NameChanger] Webhook Error: " .. tostring(err) .. "^0")
        end
    end, 'POST', json.encode({
        username = "Namechanger System",
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end

local function getOnline()
    local t = {}

    for _,id in pairs(GetPlayers()) do
        local User = VORPcore.getUser(tonumber(id))
        if User and User.getUsedCharacter then
            local c = User.getUsedCharacter
            t[c.charIdentifier] = true
        end
    end

    return t
end

-- OPEN UI
RegisterCommand(Config.AdminCommand, function(source)
    if source == 0 then return end
    if not allowed(source) then return end

    local online = getOnline()

    MySQL.query('SELECT charidentifier, firstname, lastname FROM characters', {}, function(res)

        local players = {}

        for _,v in pairs(res) do
            players[#players+1] = {
                id = v.charidentifier,
                name = v.firstname .. " " .. v.lastname,
                online = online[v.charidentifier] == true
            }
        end

        TriggerClientEvent('khali_namechanger:openUI', source, {
            players = players,
            locale = Config.Locale,
            text = Config.Locales[Config.Locale]
        })

    end)
end)

-- UPDATE NAME
RegisterServerEvent('khali_namechanger:updateName')
AddEventHandler('khali_namechanger:updateName', function(id, fn, ln)

    local src = source
    if not allowed(src) then return end

    MySQL.query('SELECT firstname, lastname FROM characters WHERE charidentifier=?',{id}, function(res)

        if not res[1] then return end

        local old = res[1].firstname .. " " .. res[1].lastname
        local new = fn .. " " .. ln

        MySQL.update('UPDATE characters SET firstname=?, lastname=? WHERE charidentifier=?',{
            fn, ln, id
        })

        local User = VORPcore.getUser(src)
        local Char = User and User.getUsedCharacter
        local job = Char and Char.job or "unknown"

        sendWebhook(old, new, GetPlayerName(src), job, id)

        TriggerClientEvent('vorp:TipBottom', src, L('success'), 4000)

    end)
end)

-- HISTORY
RegisterServerEvent('khali_namechanger:getHistory')
AddEventHandler('khali_namechanger:getHistory', function(id)

    local src = source

    MySQL.query('SELECT oldname,newname,admin FROM namechange_history WHERE charid=? ORDER BY id DESC LIMIT 25',{
        id
    }, function(res)

        TriggerClientEvent('khali_namechanger:sendHistory', src, res or {})

    end)
end)