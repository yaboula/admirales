--[[ Custom Functions — Client Side — Admirales ]]

--[[
  Usa este archivo para añadir botones personalizados, quick actions y toggles
  en el panel de luxu_admin.

  Documentación: https://docs.luxu.gg/
  Referencia de tipos: config/custom_functions/types.lua
  Guía para IA: config/custom_functions/AGENTS.md

  IMPORTANTE: Toda acción privilegiada DEBE validarse en server.lua.
]]

RegisterAddons({
    -- [INST INST-027] Integración con qb-prison (Prisión principal de Admirales)
    {
        type = "button",
        name = "qb_prison_jail",
        label = "Prisión Oficial",
        icon = "mdi:handcuffs",
        color = "#ef4444",
        -- Pedir Input del tiempo antes de ejecutar el callback al servidor
        inputs = {
            { type = "number", name = "time", label = "Meses en prisión", placeholder = "Ej: 10" },
        },
        handler = function(target, callServer, options)
            local time = tonumber(options.time)
            if not time or time <= 0 then 
                exports["JustNotify"]:SendTextAlert("error", "Tiempo inválido", 3000)
                return 
            end
            
            callServer(time)
        end,
    },
})

RegisterAddonStatisticBlocks({
    -- Añade aquí keys de bloques de estadísticas personalizadas
    -- Empareja con RegisterAddonStatisticBlocksCallback en server.lua
})

-- Export de utilidad: otros recursos pueden usar exports['luxu_admin']:isStaff()
-- para verificar si el jugador local es staff de luxu_admin
exports("isStaff", function()
    return Luxu.callbackSync("staff:isStaff")
end)
