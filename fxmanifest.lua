fx_version 'cerulean'
lua54 'yes'
game 'gta5'

server_scripts {
    'server/functions.lua',
    'server/server.lua',
    'server/callbacks.lua'
}

client_scripts {
    'client/client.lua',
    'client/functions.lua'
}

shared_script {
    'shared/config.lua',
    '@ox_lib/init.lua',
}

dependency {
    'ox_lib'
}
