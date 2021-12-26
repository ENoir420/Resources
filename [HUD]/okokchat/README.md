Hi, thank you for buying my script, I'm very grateful!

If you need help contact me on discord: okok#3488
Discord server: https://discord.gg/FauTgGRUku

1. Disable the chat resource you're using at the moment

2. How to change the chat to the right side
	Navigate to the styles.css file and on the line 22 change 'left: 40px;' to 'right: 40px;' and then on the line 42 do the same thing

3. How to add the system messages to ESX
	Navigate to es_extended/server/main.lua and search for the following code:

	AddEventHandler('chatMessage', function(playerId, author, message)
		if message:sub(1, 1) == '/' and playerId > 0 then
			CancelEvent()
			local commandName = message:sub(1):gmatch("%w+")()
			TriggerClientEvent('chat:addMessage', playerId, {args = {'^1SYSTEM', _U('commanderror_invalidcommand', commandName)}})
		end
	end)

	And replace it with the following:

	AddEventHandler('chatMessage', function(playerId, author, message)
		local time = os.date('%H:%M')

		if message:sub(1, 1) == '/' and playerId > 0 then
			CancelEvent()
			local commandName = message:sub(1):gmatch("%w+")()

			TriggerClientEvent('chat:addMessage', playerId, {
		    template = '<div class="chat-message system"><i class="fas fa-cog"></i> <b><span style="color: #df7b00">SYSTEM</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{1}</span></b><div style="margin-top: 5px; font-weight: 300;"><b>{0}</b> is not a valid command!</div></div>',
		    args = { commandName, time }
		})
		end
	end)

	Do that for all the commands you want, you can check every ESX command message on es_extended/locales/en.lua
