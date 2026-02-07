--==========================================
--クライアントからサーバーへ
--プレイヤーから送られてきたデータを受け取る部分
--==========================================

--クライアントから送信されるイベント名を登録する
RegisterNetEvent('null-template-event:serverAction')

AddEventHandler('null-template-event:serverAction', function(args1, args2)
    -- 'source'はLuaが自動的に提供する変数,送信してきたプレイヤーのサーバーID(数値)が入っている。
    -- 非同期処理などで消える可能性があるので、ローカル変数に保存するのが定石
    local src = source

    print('ID: ' .. src .. 'のプレイヤーからデータを受信しました。')
    print('内容: ', args1, args2)

    --ここでデータベース保存や、全プレイヤーへの通知などを行う。
end)

--==========================================
--サーバーからクライアントへ
--サーバーから「接続している全員」にイベントを送る部分
--==========================================

RegisterCommand('test_all', function(source, args)
    local msg = "これは全員への通知です。"
    local data = "Important Data"

    --[[
    TriggerClientEventの第二引数に'-1'を指定すると全員に送信される。
    構文: TriggerClientEvent(イベント名, 送信先ID, 引数1, 引数2, ...)
    ]]
    TriggerClientEvent('null-template-event:clientAction', -1, msg, data)

    print('全プレイヤーへイベントを送信しました。')

end, false)

--==========================================
--サーバーからクライアントへ
--サーバーから「特定のプレイヤー」だけにイベントを送る部分
--==========================================

RegisterCommand('test_me', function(source, args)
    local targetId = source
    local msg = "あなただけの秘密メッセージです。"
    local data = "Personal Data"

    TriggerClientEvent('null-template-event:clientAction', targetId, msg, data)

    print('ID: ' .. targetId .. 'へ個別にイベントを送信しました。')
end, false)