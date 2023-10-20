fx_version 'cerulean'
game 'gta5'

description 'Player Owned Pawnshop for QB'

version '2.0'

shared_scripts {
    'config.lua',
}

client_scripts {
	'client/main.lua',
	'client/menus.lua'
}

server_scripts {
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua',
}


--[[            
                DEPENDENCIES

                QBCore Framework - https://github.com/qbcore-framework/qb-core

                PolyZone - https://github.com/mkafrin/PolyZone

                qb-target - https://github.com/BerkieBb/qb-target

                qb-menu - https://github.com/qbcore-framework/qb-menu

                qb-input - https://github.com/qbcore-framework/qb-input                     --]]