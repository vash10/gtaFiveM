fn = function()
    TriggerClientEvent('jobssystem:create_target', -1)
    SetTimeout(500.0, fn)
end
SetTimeout(50.0, fn)



RegisterServerEvent('killerJob:addMoney')
AddEventHandler('killerJob:addMoney', function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    user:addMoney((amount))
     end)
end)