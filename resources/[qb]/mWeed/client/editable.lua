local cache = false

-- [INST INST-025 | 2026-04-22] HUD Integration
-- El servidor usa 0r-hud-v3 (no expone evento de hide).
-- Los eventos de codem-blackhudv2 / codem-venicehud están desactivados
-- porque esos recursos no están instalados.
-- Para activar hide del HUD en el futuro, añadir aquí el evento correcto.
function OnMenuOpen()
    -- TriggerEvent('codem-blackhudv2:SetForceHide', true, true)  -- no instalado
    -- TriggerEvent('codem-venicehud:SetForceHide', true)          -- no instalado
    -- TriggerEvent('0r-hud-v3:SetForceHide', true)               -- pendiente (sin API pública)
end

function OnMenuClose()
    -- TriggerEvent('codem-blackhudv2:SetForceHide', false, false) -- no instalado
    -- TriggerEvent('codem-venicehud:SetForceHide', false)         -- no instalado
    -- TriggerEvent('0r-hud-v3:SetForceHide', false)              -- pendiente (sin API pública)
end


function ShowHelpNotification(text)
    if Config.TextUIHandler == 'default' then
        AddTextEntry('helpNotification', text)
        DisplayHelpTextThisFrame('helpNotification', false)
    end
    if not cache then
        if Config.TextUIHandler == 'esx_textui' then
            TriggerEvent('ESX:TextUI', text)
        end
        if Config.TextUIHandler == 'qb_default_textui' then
            TriggerEvent('qb-core:client:DrawText', text, 'left')
        end
    
        if Config.TextUIHandler == 'custom' then
            -- Your code here
        end
        cache = true
    end
end

function HideHelpNotification()
    if cache then
        if Config.TextUIHandler == 'esx_textui' then
            TriggerEvent('ESX:HideUI')
        end
        if Config.TextUIHandler == 'qb_default_textui' then
            TriggerEvent('qb-core:client:HideText')
        end
        if Config.TextUIHandler == 'custom' then
            -- Your code here
        end
        cache = false
    end
end

function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Citizen.Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Citizen.Wait(0)
    end
    return incomingData
end

function WaitPlayer()
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then

        while Core.GetPlayerData()  == nil do
            Citizen.Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Citizen.Wait(0)
        end
    else
        while Core.Functions.GetPlayerData() == nil do
            Citizen.Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Citizen.Wait(0)
        end
    end
end