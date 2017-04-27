RegisterNetEvent('jobssystem:create_target')
AddEventHandler('jobssystem:create_target', function()
		nigger =  CreatePed(5, 0xD172497E, -1033.14, -2731.23, 29.5394, 211.587, false, true)
		SetBlockingOfNonTemporaryEvents(nigger, true)
		SetPedCombatAttributes(nigger, 46, true)
		SetPedFleeAttributes(nigger, 0, 0)
		--SetPedRelationshipGroupHash(nigger, GetHashKey("CIVFEMALE"))
		TaskWanderStandard(nigger, 0, 0)
end)





Citizen.CreateThread(function ()
	RequestModel(GetHashKey("a_m_m_afriamer_01"))
	while not HasModelLoaded(GetHashKey("a_m_m_afriamer_01")) do
		Wait(1)
	end
	while true do
		Citizen.Wait(0)
	end
end)

