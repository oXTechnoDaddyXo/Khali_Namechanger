--[[
    ╔═══════════════════════════════════════════════════════════════════╗
    ║                                                                   ║
    ║               N A M E C H A N G E R                               ║
    ║           ─────────────────────────                               ║
    ║             VORP Namechanger System                               ║
    ║               Redemption Script                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ║                                                                   ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   Server:    oXTechnoKhaliXo Scripts                              ║
    ║   Creator:   oXTechnoKhaliXo                                      ║
    ║   Discord:   https://discord.gg/8NjehNeEuZ                        ║
    ╠═══════════════════════════════════════════════════════════════════╣
    ║   © 2026 oXTechnoKhaliXo | All Rights Reserved                    ║
    ╚═══════════════════════════════════════════════════════════════════╝
]]
fx_version 'cerulean'
game 'rdr3'

name 'khali_namechanger'
author 'oXTechnoKhaliXo'
description 'Western Name Changer'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependencies {
    'vorp_core'
}