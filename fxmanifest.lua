fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author "MakeIT Studio // discord.gg/makeit"
description "A script that adds life to your RolePlay server by enabling random or forced dialogues with NPCs across the map."
version "1.0"

client_scripts {'client/*.lua'}

server_scripts {'server/*.lua'}

shared_scripts {'config.lua', "shared/*.lua", "config_functions.lua"}

ui_page 'ui/index.html'

files {'ui/**'}
