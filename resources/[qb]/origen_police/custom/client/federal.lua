RegisterNetEvent("origen_police:client:OnFederalJoin", function()

end)

RegisterNetEvent("origen_police:client:OnFederalLeave", function()

end)

RegisterNetEvent("origen_police:client:sendCitizenToFederal", function(targetId, time, dangerous)

    if Config.OwnPrisionSystem and GetResourceState('rcore_prison') == 'started' then

        exports['rcore_prison']:Jail(targetId, time)

    end

end)

function SpawnInJail(PlayerData)

end

function setPrision(minutes, danger)

end

