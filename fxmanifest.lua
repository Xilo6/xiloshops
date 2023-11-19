fx_version "adamant"

author "Xilo"

game "gta5"

lua54 "yes"

client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

shared_scripts {
    "configuration.lua",
    "@es_extended/imports.lua",
    "@ox_lib/init.lua"
}