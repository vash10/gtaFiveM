RegisterServerEvent('killerJob:addMoney')
AddEventHandler('killerJob:addMoney', function(amount)
  TriggerEvent('es:getPlayerFromId', source, function(user)
    user:addMoney((amount))
     end)
end)
