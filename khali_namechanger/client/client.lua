local open = false

RegisterNetEvent('khali_namechanger:openUI')
AddEventHandler('khali_namechanger:openUI', function(data)

    if open then return end
    open = true

    SetNuiFocus(true,true)

    SendNUIMessage({
        action = 'open',
        data = data
    })
end)

RegisterNUICallback('close', function(_,cb)
    open = false
    SetNuiFocus(false,false)
    cb('ok')
end)

RegisterNUICallback('changeName', function(d,cb)
    TriggerServerEvent('khali_namechanger:updateName', d.target, d.firstname, d.lastname)
    cb('ok')
end)

RegisterNUICallback('getHistory', function(d,cb)
    TriggerServerEvent('khali_namechanger:getHistory', d.target)
    cb('ok')
end)

RegisterNetEvent('khali_namechanger:sendHistory')
AddEventHandler('khali_namechanger:sendHistory', function(history)

    SendNUIMessage({
        action = 'history',
        history = history
    })

end)