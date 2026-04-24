RegisterNetEvent("origen_police:client:domyfinguer", function()

    local PlayerData = FW_GetPlayerData(false)

    local text = Config.Translations['domyfinguer']:format((PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname))

    UseCommand('me', text)

end)

-- [INST INST-028][RAC-004] Comando de rescate /fixstuck — limpia estado visual
-- pegado tras cuff/uncuff/animaciones (filtros de pantalla, postfx, timecycle,
-- attachments y animaciones residuales). NO quita handcuffs reales (IsHandcuffed
-- vive en exports), sólo restaura la cámara/ped si se queda atascado tras
-- mp_arresting/a_uncuff. Seguro usarlo en cualquier momento. — 2026-04-23
RegisterCommand("fixstuck", function()

    local ped = PlayerPedId()

    ClearPedTasksImmediately(ped)
    ClearPedSecondaryTask(ped)
    ResetPedRagdollTimer(ped)
    SetPedToRagdoll(ped, 250, 250, 0, false, false, false)

    Citizen.SetTimeout(400, function()
        local p = PlayerPedId()
        ClearPedTasksImmediately(p)
        -- Anula cualquier animpostfx / timecycle pegado (flashlight, damage, etc.)
        AnimpostfxStopAll()
        ClearTimecycleModifier()
        SetTimecycleModifierStrength(0.0)
        -- Fuerza tercera persona brevemente para salir de clipping 1ª persona.
        local CAM_THIRD_PERSON_MED = 4
        SetFollowPedCamViewMode(CAM_THIRD_PERSON_MED)
        -- Desancla si quedó pegado a otro ped/objeto
        if IsEntityAttached(p) then
            DetachEntity(p, true, true)
        end
        -- Reaplica controles normales
        SetPlayerControl(PlayerId(), true, 0)
        FreezeEntityPosition(p, false)
        SetEntityInvincible(p, false)
        SetEntityCollision(p, true, true)
    end)

    if ShowNotification then
        ShowNotification("^2[Policía]^7 Estado visual restablecido.")
    else
        TriggerEvent("chat:addMessage", { args = { "^2[Policía]", "Estado visual restablecido." } })
    end

end, false)
TriggerEvent("chat:addSuggestion", "/fixstuck", "Desatascar cámara/animación tras cuff/uncuff (origen_police INST-028 RAC-004).")

function LeavePoliceEquipment(p)

    local PlayerData = FW_GetPlayerData(false)

    local invID = "armas_policiales_" .. (p.station or 0).."_"..PlayerData.citizenid

    local stashData = Config.Stashes.PoliceEquipment

    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, true)

end

function PoliceInventory(p)

    local PlayerData = FW_GetPlayerData(false)

    local invID = "inventario_policial_" .. (p.station or 0)

    local stashData = Config.Stashes.PoliceInventory

    OpenStash(invID, stashData.label, stashData.slots, stashData.weight, PlayerData.citizenid, false)

end

function OpenEvidenceInventory(p)

    OpenMenu('dialog', GetCurrentResourceName(), 'evidenceInventory', {

        title = "Enter the Evidence ID",

    }, function(data, menu)

        if type(data) ~= "table" then

            data = {value = data}

        end

        if data and data.value then

            local text = tostring(data.value)

            if text and text:gsub("%s+", "") ~= "" then

                local stashData = Config.Stashes.Evidence

                OpenStash("org_police_evidence_"..text, stashData.label.." "..text, stashData.slots, stashData.weight, nil, false)

            end

            menu.close()

        else

            ShowNotification(Config.Translations.MustEnterNumber)

        end

    end, function(data, menu)

        menu.close()

    end)

end

function CanOpenQuickAccessMenu()

    local PlayerData = FW_GetPlayerData(false)

    if PlayerData == nil or PlayerData.job == nil or PlayerData.job.name == nil then return false end

    return (CanOpenTablet(PlayerData.job.name)[1] and PlayerData.job.onduty)

end

function handCuff(cb)
    cb(true)

end

