local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_customrob:currentlyRobbing')
AddEventHandler('esx_customrob:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_customrob:killBlip')
AddEventHandler('esx_customrob:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_customrob:setBlip')
AddEventHandler('esx_customrob:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_customrob:tooFar')
AddEventHandler('esx_customrob:tooFar', function()
	holdingUp, store = false, ''
	exports['mythic_notify']:DoCustomHudText('inform', _U('robbery_cancelled'))
end)

RegisterNetEvent('esx_customrob:robberyComplete')
AddEventHandler('esx_customrob:robberyComplete', function(award)
	holdingUp, store = false, ''
	exports['mythic_notify']:DoHudText('success', 'Robbery complete')
end)

Citizen.CreateThread(function()
	CreateObject(-1203351544, 598.28, -3139.25, 5.07, true, true, true)
end)

RegisterNetEvent('esx_customrob:startTimer')
AddEventHandler('esx_customrob:startTimer', function()
	local merryped2 = GetHashKey('s_m_y_marine_03')
	local gun = GetHashKey('WEAPON_COMBATPDW')
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		AddRelationshipGroup('Merryweather')

		RequestModel(-1275859404)
		merryped1 = CreatePed(30, -1275859404, 583.54, -3117.87, 19.00, 88.00, true, false)
		--CreatePed(30, merryped1, 583.54, -3117.87, 19.00, 88.00, true, false)
		SetPedArmour(merryped1, 100)
		SetPedAsEnemy(merryped1, true)
		SetPedRelationshipGroupHash(merryped1, 'Merryweather')
		GiveWeaponToPed(merryped1, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped1, GetPlayerPed(-1))
		SetPedAccuracy(merryped1, 100)
		SetPedDropsWeaponsWhenDead(merryped1, false)
		
		merryped2 = CreatePed(30, -1275859404, 600.9, -3138.72, 6.07, 360.00, true, false)
		SetPedArmour(merryped2, 100)
		SetPedAsEnemy(merryped2, true)
		SetPedRelationshipGroupHash(merryped2, 'Merryweather')
		GiveWeaponToPed(merryped2, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped2, GetPlayerPed(-1))
		SetPedAccuracy(merryped2, 100)
		SetPedDropsWeaponsWhenDead(merryped2, false)

		merryped3 = CreatePed(30, -1275859404, 567.12, -3211.72, 27.07, 350.00, true, false)
		SetPedArmour(merryped3, 100)
		SetPedAsEnemy(merryped3, true)
		SetPedRelationshipGroupHash(merryped3, 'Merryweather')
		GiveWeaponToPed(merryped3, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped3, GetPlayerPed(-1))
		SetPedAccuracy(merryped3, 100)
		SetPedDropsWeaponsWhenDead(merryped3, false)

		merryped4 = CreatePed(30, -1275859404, 588.55, -3165.58, 6.07, 350.00, true, false)
		SetPedArmour(merryped4, 100)
		SetPedAsEnemy(merryped4, true)
		SetPedRelationshipGroupHash(merryped4, 'Merryweather')
		GiveWeaponToPed(merryped4, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped4, GetPlayerPed(-1))
		SetPedAccuracy(merryped4, 100)
		SetPedDropsWeaponsWhenDead(merryped4, false)

		merryped5 = CreatePed(30, -1275859404, 548.16, -3144.00, 6.07, 300.00, true, false)
		SetPedArmour(merryped5, 100)
		SetPedAsEnemy(merryped5, true)
		SetPedRelationshipGroupHash(merryped5, 'Merryweather')
		GiveWeaponToPed(merryped5, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped5, GetPlayerPed(-1))
		SetPedAccuracy(merryped5, 100)
		SetPedDropsWeaponsWhenDead(merryped5, false)

		Citizen.Wait(100000)

		merryped6 = CreatePed(30, -1275859404, 512.55, -3118.49, 25.57, 266.00, true, false)
		SetPedArmour(merryped6, 100)
		SetPedAsEnemy(merryped6, true)
		SetPedRelationshipGroupHash(merryped6, 'Merryweather')
		GiveWeaponToPed(merryped6, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped6, GetPlayerPed(-1))
		SetPedAccuracy(merryped6, 100)
		SetPedDropsWeaponsWhenDead(merryped6, false)

		merryped7 = CreatePed(30, -1275859404, 508.17, -3159.81, 6.47, 298.00, true, false)
		SetPedArmour(merryped7, 0)
		SetPedAsEnemy(merryped7, true)
		SetPedRelationshipGroupHash(merryped7, 'Merryweather')
		GiveWeaponToPed(merryped7, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(merryped7, GetPlayerPed(-1))
		SetPedAccuracy(merryped7, 100)
		SetPedDropsWeaponsWhenDead(merryped7, false)

		merryped8 = CreatePed(30, -1275859404, 547.22, -3131.19, 17.47, 266.00, true, false)
		SetPedArmour(merryped8, 100)
		SetPedAsEnemy(merryped8, true)
		SetPedRelationshipGroupHash(merryped8, 'Merryweather')
		GiveWeaponToPed(merryped8, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped8, GetPlayerPed(-1))
		SetPedAccuracy(merryped8, 100)
		SetPedDropsWeaponsWhenDead(merryped8, false)

		merryped9 = CreatePed(30, -1275859404, 501.22, -3126.19, 6.47, 269.00, true, false)
		SetPedArmour(merryped9, 100)
		SetPedAsEnemy(merryped9, true)
		SetPedRelationshipGroupHash(merryped9, 'Merryweather')
		GiveWeaponToPed(merryped9, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped9, GetPlayerPed(-1))
		SetPedAccuracy(merryped9, 100)
		SetPedDropsWeaponsWhenDead(merryped9, false)

		merryped10 = CreatePed(30, -1275859404, 509.22, -3174.20, 6.47, 319.00, true, false)
		SetPedArmour(merryped10, 0)
		SetPedAsEnemy(merryped10, true)
		SetPedRelationshipGroupHash(merryped10, 'Merryweather')
		GiveWeaponToPed(merryped10, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped10, GetPlayerPed(-1))
		SetPedAccuracy(merryped10, 100)
		SetPedDropsWeaponsWhenDead(merryped10, false)

		Citizen.Wait(250000)

		merryped11 = CreatePed(30, -1275859404, 547.22, -3204.20, 22.47, 359.00, true, false)
		SetPedArmour(merryped11, 0)
		SetPedAsEnemy(merryped11, true)
		SetPedRelationshipGroupHash(merryped11, 'Merryweather')
		GiveWeaponToPed(merryped11, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped11, GetPlayerPed(-1))
		SetPedAccuracy(merryped11, 100)
		SetPedDropsWeaponsWhenDead(merryped11, false)

		merryped12 = CreatePed(30, -1275859404, 547.22, -3163.22, 6.07, 359.00, true, false)
		SetPedArmour(merryped12, 0)
		SetPedAsEnemy(merryped12, true)
		SetPedRelationshipGroupHash(merryped12, 'Merryweather')
		GiveWeaponToPed(merryped12, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped12, GetPlayerPed(-1))
		SetPedAccuracy(merryped12, 100)
		SetPedDropsWeaponsWhenDead(merryped12, false)

		merryped13 = CreatePed(30, -1275859404, 592.39, -3188.20, 6.47, 50.00, true, false)
		SetPedArmour(merryped13, 0)
		SetPedAsEnemy(merryped13, true)
		SetPedRelationshipGroupHash(merryped13, 'Merryweather')
		GiveWeaponToPed(merryped13, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped13, GetPlayerPed(-1))
		SetPedAccuracy(merryped13, 100)
		SetPedDropsWeaponsWhenDead(merryped13, false)

		merryped14 = CreatePed(30, -1275859404, 494.64, -3124.20, 6.47, 268.00, true, false)
		SetPedArmour(merryped14, 0)
		SetPedAsEnemy(merryped14, true)
		SetPedRelationshipGroupHash(merryped14, 'Merryweather')
		GiveWeaponToPed(merryped14, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped14, GetPlayerPed(-1))
		SetPedAccuracy(merryped14, 100)
		SetPedDropsWeaponsWhenDead(merryped14, false)

		merryped15 = CreatePed(30, -1275859404, 521.39, -3118.20, 18.47, 266.00, true, false)
		SetPedArmour(merryped15, 0)
		SetPedAsEnemy(merryped15, true)
		SetPedRelationshipGroupHash(merryped15, 'Merryweather')
		GiveWeaponToPed(merryped15, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped15, GetPlayerPed(-1))
		SetPedAccuracy(merryped15, 100)
		SetPedDropsWeaponsWhenDead(merryped15, false)

		Citizen.Wait(150000)

		merryped16 = CreatePed(30, -1275859404, 557.25, -3131.12, 17.37, 266.00, true, false)
		SetPedArmour(merryped16, 0)
		SetPedAsEnemy(merryped16, true)
		SetPedRelationshipGroupHash(merryped16, 'Merryweather')
		GiveWeaponToPed(merryped16, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped16, GetPlayerPed(-1))
		SetPedAccuracy(merryped16, 100)
		SetPedDropsWeaponsWhenDead(merryped16, false)

		merryped17 = CreatePed(30, -1275859404, 517.24, -3118.20, 25.57, 266.00, true, false)
		SetPedArmour(merryped17, 0)
		SetPedAsEnemy(merryped17, true)
		SetPedRelationshipGroupHash(merryped17, 'Merryweather')
		GiveWeaponToPed(merryped17, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped17, GetPlayerPed(-1))
		SetPedAccuracy(merryped17, 100)
		SetPedDropsWeaponsWhenDead(merryped17, false)

		merryped18 = CreatePed(30, -1275859404, 521.39, -3118.20, 18.47, 266.00, true, false)
		SetPedArmour(merryped18, 0)
		SetPedAsEnemy(merryped18, true)
		SetPedRelationshipGroupHash(merryped18, 'Merryweather')
		GiveWeaponToPed(merryped18, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped18, GetPlayerPed(-1))
		SetPedAccuracy(merryped18, 100)
		SetPedDropsWeaponsWhenDead(merryped18, false)

		merryped19 = CreatePed(30, -1275859404, 587.65, -3125.26, 17.47, 266.00, true, false)
		SetPedArmour(merryped19, 0)
		SetPedAsEnemy(merryped19, true)
		SetPedRelationshipGroupHash(merryped19, 'Merryweather')
		GiveWeaponToPed(merryped19, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped19, GetPlayerPed(-1))
		SetPedAccuracy(merryped19, 100)
		SetPedDropsWeaponsWhenDead(merryped19, false)

		merryped20 = CreatePed(30, -1275859404, 576.32, -3108.20, 6.47, 182.00, true, false)
		SetPedArmour(merryped20, 0)
		SetPedAsEnemy(merryped20, true)
		SetPedRelationshipGroupHash(merryped20, 'Merryweather')
		GiveWeaponToPed(merryped20, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped20, GetPlayerPed(-1))
		SetPedAccuracy(merryped20, 100)
		SetPedDropsWeaponsWhenDead(merryped20, false)

		Citizen.Wait(150000)

		merryped21 = CreatePed(30, -1275859404, 468.54, -3121.51, 6.07, 266.00, true, false)
		SetPedArmour(merryped21, 0)
		SetPedAsEnemy(merryped21, true)
		SetPedRelationshipGroupHash(merryped21, 'Merryweather')
		GiveWeaponToPed(merryped21, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped21, 100)
		SetPedDropsWeaponsWhenDead(merryped21, false)

		merryped22 = CreatePed(30, -1275859404, 484.39, -3112.22, 6.33, 227.00, true, false)
		SetPedArmour(merryped22, 0)
		SetPedAsEnemy(merryped22, true)
		SetPedRelationshipGroupHash(merryped22, 'Merryweather')
		GiveWeaponToPed(merryped22, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped22, 100)
		SetPedDropsWeaponsWhenDead(merryped22, false)

		merryped23 = CreatePed(30, -1275859404, 468.84, -3167.4, 6.07, 344.00, true, false)
		SetPedArmour(merryped23, 0)
		SetPedAsEnemy(merryped23, true)
		SetPedRelationshipGroupHash(merryped23, 'Merryweather')
		GiveWeaponToPed(merryped23, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		SetPedAccuracy(merryped23, 100)
		SetPedDropsWeaponsWhenDead(merryped23, false)

		Citizen.Wait(350000)

		merryped24 = CreatePed(30, -1275859404, 474.95, -3196.20, 6.07, 351.00, true, false)
		SetPedArmour(merryped24, 0)
		SetPedAsEnemy(merryped24, true)
		SetPedRelationshipGroupHash(merryped24, 'Merryweather')
		GiveWeaponToPed(merryped24, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped24, GetPlayerPed(-1))
		SetPedAccuracy(merryped24, 100)
		SetPedDropsWeaponsWhenDead(merryped24, false)

		merryped25 = CreatePed(30, -1275859404, 595.92, -3288.12, 18.71, 87.00, true, false)
		SetPedArmour(merryped25, 0)
		SetPedAsEnemy(merryped25, true)
		SetPedRelationshipGroupHash(merryped25, 'Merryweather')
		GiveWeaponToPed(merryped25, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped25, GetPlayerPed(-1))
		SetPedAccuracy(merryped25, 80)
		SetPedDropsWeaponsWhenDead(merryped25, false)

		merryped26 = CreatePed(30, -1275859404, 598.33, -3141.49, 6.07, 182.00, true, false)
		SetPedArmour(merryped26, 0)
		SetPedAsEnemy(merryped26, true)
		SetPedRelationshipGroupHash(merryped26, 'Merryweather')
		GiveWeaponToPed(merryped26, GetHashKey('WEAPON_CARBINERIFLE'), 250, false, true)
		TaskCombatPed(merryped26, GetPlayerPed(-1))
		SetPedAccuracy(merryped26, 80)
		SetPedDropsWeaponsWhenDead(merryped26, false)

		merryped27 = CreatePed(30, -1275859404, 542.49, -2992.64, 6.04, 179.00, true, false)
		SetPedArmour(merryped27, 0)
		SetPedAsEnemy(merryped27, true)
		SetPedRelationshipGroupHash(merryped27, 'Merryweather')
		GiveWeaponToPed(merryped27, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(merryped27, GetPlayerPed(-1))
		SetPedAccuracy(merryped27, 80)
		SetPedDropsWeaponsWhenDead(merryped27, false)

		merryped28 = CreatePed(30, -1285859404, 607.07, -3079.56, 6.07, 6.00, true, false)
		SetPedArmour(merryped28, 0)
		SetPedAsEnemy(merryped28, true)
		SetPedRelationshipGroupHash(merryped28, 'Merryweather')
		GiveWeaponToPed(merryped28, GetHashKey('WEAPON_RPG'), 250, false, true)
		TaskCombatPed(merryped28, GetPlayerPed(-1))
		SetPedAccuracy(merryped28, 80)
		SetPedDropsWeaponsWhenDead(merryped28, false)
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores) do
		local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
		SetBlipSprite(blip, 303)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 1)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Merryweather Heist')
		EndTextCommandSetBlipName(blip)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPos = GetEntityCoords(PlayerPedId(), true)

		for k,v in pairs(Stores) do
			local storePos = v.position
			local distance = Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z)

			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
					DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, 38) then
							TriggerServerEvent('esx_customrob:robberyStarted', k)
						end
					end
				end
			end
		end

		if holdingUp then
			local storePos = Stores[store].position
			if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Config.MaxDistance then
				TriggerServerEvent('esx_customrob:tooFar', store)
			end
		end
	end
end)
