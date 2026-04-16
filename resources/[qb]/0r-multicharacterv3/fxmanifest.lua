fx_version 'cerulean'
game {'gta5'}
lua54 'yes'

author 'vezironi'
description 'A multicharacter that everyone can customize and looks modern'

scriptname '0r-multicharacterv3'
version '1.0.8'

shared_scripts {
    '@ox_lib/init.lua',
    'config/*.lua',
    'shared/*.lua',
}

client_scripts {
    'client/*.lua',
    'modules/**/**/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'modules/**/**/server.lua',
    'server/*.lua',
}

escrow_ignore {
    'config/*.lua',
    'shared/*.lua',
    'modules/**/**/*.lua',
    'server/commands.lua',
    'server/discord.lua',
    'server/functions.lua',
    'server/getskin.lua',
    'server/logs.lua',
    'server/tebex.lua',
    'server/webhooks.lua',
}

files {
    'web/build/*.*',
    'web/build/**/*.*',
    'locales/*.json',
}

ui_page 'web/build/index.html'

dependencies {
    'ox_lib',
}

dependency '/assetpacks'