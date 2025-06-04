fx_version 'cerulean'
game 'gta5'
author 'F4 Studio'
description 'F4 Studio - FPS Menu'
version '1.0.0'
lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'ui/index.html'

client_scripts {
  "shared/config.lua",
  "client/utils.lua",
  "client/functions.lua",
  "client/init.lua",
}
server_script {
  "shared/server_config.lua",
  "server/utils.lua",
  "server/init.lua",
}

files {
	'ui/index.html',
	'ui/**/*',
}

local isEscrowed = false
if isEscrowed then
  escrow_ignore {
    "shared/*.lua",
    "client/open.lua",
    "server/open.lua",
  }
else
  escrow_ignore {
    "shared/*.lua",
    "client/**/*",
    "server/**/*",
  }
end