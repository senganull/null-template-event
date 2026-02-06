fx_version 'cerulean'
game 'gta5'

--[[
クライアント側で実行されるスクリプト
プレイヤーのPC(クライアント)にダウンロードされ実行される。
]]
client_scripts {
    'client/cl_events.lua'
}

--[[
サーバー側で実行されるスクリプト
サーバー本体でのみ実行される。
]]
server_scripts {
    'server/sv_events.lua'
}