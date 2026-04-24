--[[ Custom Functions — Server Side — Admirales ]]

--[[
  Usa este archivo para registrar los callbacks de servidor correspondientes
  a los addons definidos en client.lua.

  Documentación: https://docs.luxu.gg/
  Referencia de tipos: config/custom_functions/types.lua
  Guía para IA: config/custom_functions/AGENTS.md

  IMPORTANTE: Siempre valida source, target y permisos antes de ejecutar acciones.
  Siempre comprobar IsOnDuty(source) para acciones privilegiadas.

  Firmas:
    RegisterAddonCallback("nombre", function(source, target, ...) ... end, "permission.opcional")
    RegisterOfflineAddonCallback("nombre", function(source, target) ... end, "permission.opcional")
    RegisterAddonStatisticBlocksCallback("key", function(source) return { title, value, description } end)
]]

-- Añade aquí los callbacks de servidor para tus addons personalizados

RegisterAddonCallback("qb_prison_jail", function(source, target, time)
    if not source or not target then return false end
    
    -- Solo ejecutar si el QBCore Admin tiene acceso a jail (lo heredan los god/admin)
    if not IsPlayerAceAllowed(source, "command.jail") then 
        return false 
    end

    local admin = QBCore.Functions.GetPlayer(source)
    local targetPlayer = QBCore.Functions.GetPlayer(target)

    if not admin or not targetPlayer then return false end

    -- Trigger event para enviar a la prisión oficial de QBCore, usa el mismo pipe de policejob para limpiar estados (cuffs, etc)
    TriggerClientEvent("police:client:SendToJail", targetPlayer.PlayerData.source, time)
    
    return true
end)
