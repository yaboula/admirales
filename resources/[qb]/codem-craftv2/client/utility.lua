jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    SetPlayerJob()
    TriggerServerEvent('codem-craft:server:LoadData') -- Config ile senkronize et
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    SetPlayerJob()
    TriggerServerEvent('codem-craft:server:LoadData') -- Config ile senkronize et
end)

CreateThread(function()
    Core, Config.Framework = GetCore()
    SetPlayerJob()
    Wait(2000)
    TriggerServerEvent('codem-craft:server:LoadData') -- Config ile senkronize et
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    Wait(1000)
    SetPlayerJob()
end)
AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    if (resource == GetCurrentResourceName()) then
        -- Resource durduğunda artık LoadData çağırmaya gerek yok
    end
end)


function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do
            Wait(0)
        end
        while Core.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Wait(0)
        end
    else
        while Core == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Wait(0)
        end
    end
end

function SetPlayerJob(text)
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        jobData.jobname = PlayerData.job.name
        jobData.job_grade_name = PlayerData.job.label
        jobData.job_grade = tonumber(PlayerData.job.grade)
        TriggerServerEvent('codem-craft:checkJob', jobData.jobname)
        createBlips()
        spawnPed()
        Config.OpenTrigger()
    else
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level
        TriggerServerEvent('codem-craft:checkJob', jobData.jobname)
        createBlips()
        spawnPed()
        Config.OpenTrigger()
    end
end

local blips = {}
local peds = {}

function createBlips()
    while not jobData.jobname do
        Wait(100)
    end
    for _, blip in pairs(blips) do
        RemoveBlip(blip)
    end

    for k, v in pairs(Config.CraftSettings) do
        local showBlipForPlayer = false
        for _, job in pairs(v.job) do
            if _ == "all" or _ == jobData.jobname then
                showBlipForPlayer = true
                break
            end
        end
        if showBlipForPlayer and v.blip.show then
            blips[k] = AddBlipForCoord(tonumber(v.coords.intreactionCoords.x),
                tonumber(v.coords.intreactionCoords.y),
                tonumber(v.coords.intreactionCoords.z))
            SetBlipSprite(blips[k], v.blip.blipType)
            SetBlipDisplay(blips[k], 4)
            SetBlipScale(blips[k], v.blip.blipScale)
            SetBlipColour(blips[k], v.blip.blipColor)
            SetBlipAsShortRange(blips[k], true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(tostring(v.blip.blipName))
            EndTextCommandSetBlipName(blips[k])
        end
    end
end

function canOpen()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return false
    end
    return true
end

RegisterNetEvent('codem-craftv2:clearPed', function ()
    for _, ped in pairs(peds) do
        if DoesEntityExist(ped) then
            DeletePed(ped)
            DeleteEntity(ped)
        end
    end
end)

function spawnPed()
    while not jobData.jobname do
        Wait(100)
    end
    for _, ped in pairs(peds) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    peds = {}
    for k, v in pairs(Config.CraftSettings) do
        local shouldSpawn = false
        if v.job then
            for _, job in pairs(v.job) do
                if v.job then
                    if _ == "all" or _ == jobData.jobname then
                        shouldSpawn = true
                        break
                    end
                end
            end
        end
        if shouldSpawn and v['coords'].ped then
            WaitForModel(v['coords'].pedHash)
            local createNpc = CreatePed("PED_TYPE_PROSTITUTE", v['coords'].pedHash, v['coords'].pedCoords.x,
                v['coords'].pedCoords.y,
                v['coords'].pedCoords.z - 0.98, v['coords'].pedHeading, false, false)
            FreezeEntityPosition(createNpc, true)
            SetEntityInvincible(createNpc, true)
            SetBlockingOfNonTemporaryEvents(createNpc, true)

            table.insert(peds, createNpc)
        end
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 90)
end

RegisterNetEvent('codem-craft:openMenu', function(data)
    if data.prop then
        openCraftMenu(data.prop)
    end
end)


Citizen.CreateThread(function()
    Config.OpenTrigger = function()
        if Config.InteractionHandler == "qb-target" then
            for kk, vv in pairs(Config.CraftSettings) do
                exports['qb-target']:RemoveZone('codemcraft' .. kk)
            end
            for k, v in pairs(Config.CraftSettings) do
                local shouldShow = false
                if v.job then
                    for _, job in pairs(v.job) do
                        if _ == "all" or _ == jobData.jobname then
                            shouldShow = true
                            break
                        end
                    end
                end
                if shouldShow then
                    exports['qb-target']:AddBoxZone("codemcraft" .. k,
                        vector3(v['coords'].intreactionCoords.x, v['coords'].intreactionCoords.y,
                            v['coords'].intreactionCoords.z), 1.5,
                        1.5,
                        {
                            name = "codemcraft" .. k,
                            debugPoly = false,
                            heading = -20,
                            minZ = v['coords'].intreactionCoords.z - 2,
                            maxZ = v['coords'].intreactionCoords.z + 2,
                        }, {
                            options = {
                                {
                                    type = "client",
                                    event = "codem-craft:openMenu",
                                    prop = Config.CraftSettings[k],
                                    icon = 'fas fa-credit-card',
                                    label = "Open Craft Menu",

                                },
                            },
                            distance = 2
                        })
                end
            end
        elseif Config.InteractionHandler == "ox-target" then
            for kk, vv in pairs(Config.CraftSettings) do
                exports.ox_target:removeZone('codemcraft' .. kk)
            end
            for k, v in pairs(Config.CraftSettings) do
                local shouldShow = false
                if v.job then
                    for _, job in pairs(v.job) do
                        if _ == "all" or _ == jobData.jobname then
                            shouldShow = true
                            break
                        end
                    end
                end
                if shouldShow then
                    exports['ox_target']:addBoxZone({
                        coords = vector3(v['coords'].intreactionCoords.x, v['coords'].intreactionCoords.y, v['coords'].intreactionCoords.z),
                        minZ = v['coords'].intreactionCoords.z - 2,
                        maxZ = v['coords'].intreactionCoords.z + 2,
                        heading = -20,
                        name = "codemcraft" .. k,
                        id = "codemcraft" .. k,
                        options = {
                            {
                                type = "client",
                                event = "codem-craft:openMenu",
                                prop = Config.CraftSettings[k],
                                icon = 'fas fa-credit-card',
                                label = "Open Craft Menu",
                            },
                        },
                        distance = 2
                    })
                end
            end
        elseif Config.InteractionHandler == "drawtext" then
            Citizen.CreateThread(function()
                while not jobData.jobname do
                    Wait(100)
                end
                while true do
                    local wait = 1500
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    for k, v in pairs(Config.CraftSettings) do
                        local shouldShow = false
                        if v.job then
                            for _, job in pairs(v.job) do
                                if _ == "all" or _ == jobData.jobname then
                                    shouldShow = true
                                    break
                                end
                            end
                        end

                        if shouldShow then
                            local distance = #(coords - v['coords'].intreactionCoords)
                            if distance < 1.5 then
                                wait = 0
                                DrawText3D(v['coords'].intreactionCoords.x, v['coords'].intreactionCoords.y,
                                    v['coords'].intreactionCoords.z + 1.0,
                                    "Press [~g~E~s~] to Craft Menu")
                                if IsControlJustReleased(0, 38) then
                                    if canOpen() then
                                        openCraftMenu(Config.CraftSettings[k])
                                    end
                                end
                            end
                        end
                    end
                    Citizen.Wait(wait)
                end
            end)
        end
    end
end)
