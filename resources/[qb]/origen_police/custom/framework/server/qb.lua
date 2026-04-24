if Config.Framework ~= "qbcore" then return end

if GetResourceState("qb-core") ~= "started" then

    while true do

        print("^0[^5Origen Police^0] qb-core is not started, please make sure to start origen_police after qb-core^0")

        Wait(2000)

    end

end

Framework = exports['qb-core']:GetCoreObject()

-- Callbacks que NO requieren job policial (accesibles por cualquier jugador).
-- Estos son callbacks informativos cuyo resultado es seguro para cualquier source.
local CALLBACK_PUBLIC_WHITELIST = {
    ["origen_police:server:GetPoliceCount"]        = true,
    ["origen_police:server:GetPlayerConfiscatedVehicles"] = true,
    ["origen_police:server:TakeOutConfiscatedVehicle"]    = true,
    ["origen_police:server:OpenPoliceArmoury"]     = true,
    ["origen_police:server:OpenPoliceStash"]       = true,
    ["origen_police:server:GetPlayerMetadata"]     = true,
    ["origen_police:callback:GetStationsList"]     = true,
    ["origen_police:server:GetJobs"]               = true,
    ["origen_police:server:GetVehicles"]           = true,
}

function FW_CreateCallback(name, callback, mdw)

    Framework.Functions.CreateCallback(name, function(source, cb1, ...)

        -- Guarda de job policial en todos los callbacks no públicos
        if not CALLBACK_PUBLIC_WHITELIST[name] then
            if not CanOpenTablet then
                -- CanOpenTablet se carga antes por hooks/server.lua; si no existe aún,
                -- rechazamos por seguridad (fail-closed).
                print(("[origen_police][SHIM] FW_CreateCallback '%s': CanOpenTablet no disponible — rechazando src=%d"):format(name, source))
                cb1(false)
                return
            end
            local tabletCheck = CanOpenTablet(source)
            if not tabletCheck or not tabletCheck[1] then
                print(("[origen_police][SHIM] FW_CreateCallback '%s': src=%d sin job policial — rechazado"):format(name, source))
                cb1(false)
                return
            end
        end

        if mdw then

            local args = {...}

            mdw(source, cb1, function()

                callback(source, cb1, table.unpack(args))

            end)

        else

            callback(source, cb1, ...)

        end

    end)

end

function FW_GetPlayer(source)

    local Player = Framework.Functions.GetPlayer(source)

    if Player == nil then return nil end

    return Player

end

function FW_GetPlayerFromCitizenid(citizenid)

    return Framework.Functions.GetPlayerByCitizenId(citizenid) or Framework.Functions.GetOfflinePlayerByCitizenId(citizenid)

end

function FW_CreateUseableItem(name, cb)

    if Config.Inventory == "ox_inventory" then

        exports(name, function(event, item, inventory, slot, data)

            cb(inventory.id, inventory.items[slot])

        end)

        return

    end

    Framework.Functions.CreateUseableItem(name, cb)

end

function FW_CommandsAdd(name, help, arguments, argsrequired, callback, permission, ...)

    Framework.Commands.Add(name, help, arguments, argsrequired, callback, permission, ...)

end

exports('FW_CreateCallback', FW_CreateCallback)

exports("FW_GetPlayer", FW_GetPlayer)

exports("FW_GetPlayerFromCitizenid", FW_GetPlayerFromCitizenid)

exports("FW_CreateUseableItem", FW_CreateUseableItem)

exports("FW_CommandsAdd", FW_CommandsAdd)

exports('GetCoreObject', function()

    return Framework

end)

