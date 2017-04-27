require "resources/jobs/server"
function onWasted(killer, weapon, bodypart)--and getPlayerJob(killer) == 88 
	if ( killer and getElementType(killer) == "player" and getElementType(source) == "player" ) then
		TriggerEvent('es:getPlayerFromId', source, function(killer)
			local player = killer.identifier
			local salary = retrieve_target_worth(target_id)
			killer:addMoney(salary)
			TriggerClientEvent("es_freeroam:notify", source, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Salaire reçu :  + "..salary.."~g~€~s~~n~Joli nettoyage... Un de moins. Tiens, quelques billets pour couvrir les frais de pressing pour se débarasser de l'odeur : + "..salary_job.." ~g~€")
		end)
	end
end


fn = function()
    TriggerClientEvent('jobssystem:create_target', -1)
    SetTimeout(500.0, fn)
end
SetTimeout(50.0, fn)

RegisterServerEvent('jobssystem:killed_targed')
AddEventHandler('jobssystem:killed_targed', function(ped)
	addEventHandler("onClientPedWasted", ped, onWasted)
end)