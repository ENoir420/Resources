--set function from https://www.lua.org/pil/11.5.html
--leave this alone!
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end


----edit this block-------

--line 11 declares the int's of classes of cars you want banned
--a list of the car class numbers is here: https://runtime.fivem.net/doc/natives/#_0x29439776AAA00A62
--for instance, military is 19. to ban military vehicles set the line below to {19}.
bannedcarlist = Set{19,21}

----stop editing---------


RegisterNetEvent("carCommand")
AddEventHandler('carCommand', function(args,isadmin)
	carname = args[1]
	ped=PlayerPedId()
	if ped then
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 8.0, 0.5))
		if carname == nil then
			TriggerEvent('chatMessage', "^4Car Spawner", {255, 0, 0}, "^4Usage: ^7/car carname")
		else
			local hash = GetHashKey(carname)
			local class = GetVehicleClassFromName(hash)
			if bannedcarlist[class] and not isadmin then
				TriggerEvent('chatMessage', "^4Car Spawner", {255, 0, 0}, "^7The vehicle you are attempting to spawn is not allowed on this server.")
			else
				RequestModel(hash)
				local wait = 0
				TriggerEvent('chatMessage', "^4Car Spawner", {255, 0, 0}, "^7We are now attempting to load '".. carname .. "'. Please wait.")
				while not HasModelLoaded(hash) do
					if wait > 10000 then
						TriggerEvent('chatMessage', "^4Car Spawner", {255, 0, 0}, "^7Could not load the car model or the car does not exist.")
						break
					else
						Citizen.Wait(100)
						wait = wait+100
					end
				end
				if DoesEntityExist(lastcar) then
					DeleteEntity(lastcar)
				end
				if HasModelLoaded(hash) then
					TriggerEvent('chatMessage', "^4Car Spawner", {255, 0, 0}, "^4Your vehicle has spawned!")
					lastcar = CreateVehicle(hash, x, y, z, GetEntityHeading(ped)+90, 1, 0)
					SetVehicleEngineOn(lastcar,true,true,true)
					SetPedIntoVehicle(ped,lastcar,-1)
				end
			end
		end
	end
end)

RegisterCommand( "dv", function()
    TriggerEvent( "wk:deleteVehicle" )
end, false )
TriggerEvent( "chat:addSuggestion", "/dv", "Deletes the vehicle you're sat in, or standing next to." )

-- The distance to check in front of the player for a vehicle   
local distanceToCheck = 5.0

-- The number of times to retry deleting a vehicle if it fails the first time 
local numRetries = 5

-- Add an event handler for the deleteVehicle event. Gets called when a user types in /dv in chat
RegisterNetEvent( "wk:deleteVehicle" )
AddEventHandler( "wk:deleteVehicle", function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "You must be in the driver's seat!" )
            end 
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( ped, pos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                DeleteGivenVehicle( vehicle, numRetries )
            else 
                Notify( "~y~You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

function DeleteGivenVehicle( veh, timeoutMax )
    local timeout = 0 

    SetEntityAsMissionEntity( veh, true, true )
    DeleteVehicle( veh )

    if ( DoesEntityExist( veh ) ) then
        Notify( "~r~Failed to delete vehicle, trying again..." )

        -- Fallback if the vehicle doesn't get deleted
        while ( DoesEntityExist( veh ) and timeout < timeoutMax ) do 
            DeleteVehicle( veh )

            -- The vehicle has been banished from the face of the Earth!
            if ( not DoesEntityExist( veh ) ) then 
                Notify( "~g~Vehicle deleted." )
            end 

            -- Increase the timeout counter and make the system wait
            timeout = timeout + 1 
            Citizen.Wait( 500 )

            -- We've timed out and the vehicle still hasn't been deleted. 
            if ( DoesEntityExist( veh ) and ( timeout == timeoutMax - 1 ) ) then
                Notify( "~r~Failed to delete vehicle after " .. timeoutMax .. " retries." )
            end 
        end 
    else 
        Notify( "~g~Vehicle deleted." )
    end 
end 

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection( entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7 )
    local _, _, _, _, vehicle = GetShapeTestResult( rayHandle )
    
    if ( IsEntityAVehicle( vehicle ) ) then 
        return vehicle
    end 
end

-- Shows a notification on the player's screen 
function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end