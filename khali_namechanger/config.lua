Config = {}

Config.Locale = 'de'

Config.Locales = {
    de = {
        title = 'Admin Namensänderung',
        change = 'Ändern',
        close = 'Schließen',
        history = 'Verlauf',
        success = 'Name erfolgreich geändert',

        webhook_title = 'Namensänderung Log',
        webhook_admin = 'Admin',
        webhook_job = 'Job',
        webhook_old = 'Alter Name',
        webhook_new = 'Neuer Name',
        webhook_id = 'Character ID'
    },

    en = {
        title = 'Admin Name Change',
        change = 'Change',
        close = 'Close',
        history = 'History',
        success = 'Name changed successfully',

        webhook_title = 'Name Change Log',
        webhook_admin = 'Admin',
        webhook_job = 'Job',
        webhook_old = 'Old Name',
        webhook_new = 'New Name',
        webhook_id = 'Character ID'
    }
}

Config.AdminCommand = 'changename'

Config.AllowedJobs = {
    'admin',
    'superadmin',
    'railroad',
    'police'
}

Config.MinNameLength = 3


Config.DiscordWebhook = 'YOUR_WEBHOOK_LINK'
