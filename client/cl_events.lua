--[[
==========================================
Server to Client
サーバーから特定の処理命令をされた時に動く部分
==========================================
]]

--[[
ネットワークイベントとして登録することを宣言
これを書かないと、サーバーからこのイベント名で呼び出すことができない。
'null-template-event:clientAction'は任意のイベント名に
]]

RegisterNetEvent('null-template-event:clientAction')

--　イベントが呼び出された際の具体的な処理を定義する。
AddEventHandler('null-template-event:clientAction', function(args1, args2)
    -- ここに実行したい処理を書く。

    -- デバッグメッセージ
    print('サーバーからイベントを受信しました: null-template-event:clientAction')

    --受け取ったデータを表示
    print('args1 : ', args1)
    print('args2 : ', args2)

    --実用例 : 通知表示する、アイテムを付与するUIを表示するなど
end)


--[[
==========================================
Client to Server
プレイヤーの操作などをサーバーへ通知する部分
==========================================
]]

--動作確認用コマンド
RegisterCommand('test_send', function()
    --サーバーへ送りたいデータを用意
    local message = "Hello from Client"
    local count = 123

    --[[
    サーバー側のイベント 'null-template-event:serverAction'を発火させる。
    第一引数 : 呼び出すサーバー側のイベント名
    第二引数以降 : サーバーへ渡したいデータ(いくつでも可)
    ]]
    TriggerServerEvent('null-template-event:serverAction', message, count)

    print('サーバーへデータを送信しました。')
end, false)