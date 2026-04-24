-- [INST INST-028] Diagnóstico temporal — 2026-04-23
-- Client-side: imprime en consola F8 y en chat in-game.

local function diagPrint(msg)
    print("^3[origen_police][DIAG]^0 " .. tostring(msg))
    TriggerEvent('chat:addMessage', {
        color = { 255, 200, 0 },
        multiline = true,
        args = { "[DIAG]", tostring(msg) }
    })
end

RegisterCommand("origendiag", function()
    diagPrint("═════════ INICIO DIAGNÓSTICO ═════════")

    local ok, err = pcall(function()
        diagPrint("Framework: " .. tostring(Config and Config.Framework))
        diagPrint("Inventory: " .. tostring(Config and Config.Inventory))
        diagPrint("VoiceSystem: " .. tostring(Config and Config.VoiceSystem))
        diagPrint("ShowCurrentStreet: " .. tostring(Config and Config.ShowCurrentStreet))
        diagPrint("NeedRadioForDispatch: " .. tostring(Config and Config.NeedRadioForDispatch))

        if not FW_GetPlayerData then
            diagPrint("✖ FW_GetPlayerData no existe")
            return
        end

        local Player = FW_GetPlayerData(false)
        if not Player then
            diagPrint("✖ FW_GetPlayerData() devolvió nil")
            return
        end

        local job = Player.job or {}
        diagPrint("job.name: '" .. tostring(job.name) .. "'")
        diagPrint("job.label: '" .. tostring(job.label) .. "'")
        diagPrint("job.onduty: " .. tostring(job.onduty))
        diagPrint("job.grade.level: " .. tostring((job.grade or {}).level))

        if CanOpenTablet then
            local ct = CanOpenTablet(job.name)
            diagPrint("CanOpenTablet[1] (pasa?): " .. tostring(ct and ct[1]))
            diagPrint("CanOpenTablet[2] (cat): " .. tostring(ct and ct[2]))
        else
            diagPrint("✖ CanOpenTablet no existe")
        end

        if Config and Config.Permissions then
            local p = Config.Permissions[job.name]
            if p then
                diagPrint("Perm.Dispatch: " .. tostring(p.Dispatch))
                diagPrint("Perm.AgentManagement: " .. tostring(p.AgentManagement))
            else
                diagPrint("✖ Permissions['" .. tostring(job.name) .. "'] = NIL")
            end
        end

        if Config and Config.JobCategory then
            for cat, list in pairs(Config.JobCategory) do
                local names = {}
                for _, j in pairs(list) do table.insert(names, j.name) end
                diagPrint("JobCategory['" .. cat .. "']: " .. table.concat(names, ", "))
            end
        end
    end)

    if not ok then
        diagPrint("✖ ERROR: " .. tostring(err))
    end
    diagPrint("═════════ FIN DIAGNÓSTICO ═════════")
end, false)

CreateThread(function()
    Wait(3000)
    print("^2[origen_police][DIAG]^0 Comando /origendiag cargado. Usar: /origendiag")
end)
