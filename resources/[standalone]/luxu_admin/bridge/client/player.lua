---@class PlayerClient
local player = {}
--- Unequip player's weapon
---@param ped number
function player.disarm(ped)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    TriggerEvent("ox_inventory:disarm")
end

RegisterNetEvent('luxu_admin:client:giveVehicleKeys', function(plate, modelHash)
    if GetResourceState('dusa_vehiclekeys') == 'started' then
        exports['dusa_vehiclekeys']:AddKey(plate)
    end
end)

return player
