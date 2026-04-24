local FederalPlayers = {}

Citizen.CreateThread(function()

    local result = MySQL.awaitQuery("SELECT * FROM origen_police_federal")

    for i = 1, #result do

        local player = result[i]

        FederalPlayers[player.citizenid] = player

    end

end)

FW_CreateCallback("origen_police:callback:GetFederal", function(source, cb, citizenId)

    if not citizenId then

        local Player = FW_GetPlayer(source)

        if Player and Player.PlayerData and Player.PlayerData.citizenid then

            citizenId = Player.PlayerData.citizenid

        else

            return cb({})

        end

    end

    cb(FederalPlayers[citizenId] or {})

end)

RegisterServerEvent("origen_police:server:setfederal")

AddEventHandler("origen_police:server:setfederal", function(time, danger, joinedFrom)

    local Player = FW_GetPlayer(source)

    if not Player or not Player.PlayerData then return end

    local citizenid = Player.PlayerData.citizenid

    if time then

        Player.Functions.SetMetaData("federal", 1)

        if not FederalPlayers[citizenid] then

            local tableName = (Config.Framework == "esx" and "users") or "players"

            local columnId  = (Config.Framework == "esx" and "identifier") or "citizenid"

            local query = ("SELECT image FROM %s WHERE %s = ?"):format(tableName, columnId)

            local imgResult = MySQL.awaitQuery(query, { citizenid })

            local image = imgResult[1] and imgResult[1].image or nil

            FederalPlayers[citizenid] = {

                citizenid  = citizenid,

                time       = time,

                initial    = time,

                name       = ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname),

                date       = os.time() * 1000,

                danger     = danger or "NP",

                joinedfrom = joinedFrom or "Mission Row",

                online     = true,

                image      = image

            }

            MySQL.awaitInsert(

                "INSERT INTO origen_police_federal (citizenid, time, initial, name, danger, joinedfrom) VALUES (?, ?, ?, ?, ?, ?)",

                {

                    citizenid,

                    time,

                    time,

                    ("%s %s"):format(Player.PlayerData.charinfo.firstname, Player.PlayerData.charinfo.lastname),

                    danger or "NP",

                    joinedFrom or "Mission Row"

                }

            )

        else

            FederalPlayers[citizenid].online = true

        end

    else

        Player.Functions.SetMetaData("federal", 0)

        FederalPlayers[citizenid] = nil

        MySQL.awaitQuery("DELETE FROM origen_police_federal WHERE citizenid = ?", { citizenid })

        CreateLog({

            type   = "Federal",

            embed  = {

                title       = Config.LogsTranslations.ExitFederal.title,

                description = Config.LogsTranslations.ExitFederal.message,

                color       = 1791423

            },

            source = Player.PlayerData.source

        })

    end

end)

RegisterServerEvent("origen_police:server:updatemins")

AddEventHandler("origen_police:server:updatemins", function(minutes)

    local Player = FW_GetPlayer(source)

    if not Player or not Player.PlayerData or not Player.PlayerData.citizenid then return end

    local citizenid = Player.PlayerData.citizenid

    if FederalPlayers[citizenid] then

        FederalPlayers[citizenid].time = minutes

        MySQL.awaitUpdate("UPDATE origen_police_federal SET time = ? WHERE citizenid = ?", { minutes, citizenid })

    end

end)

RegisterCommand("celda", function(source, args)

    local Officer = FW_GetPlayer(source)

    if not Officer then return end

    local targetId = (Config.Framework == "esx" and args.id) or args[1]

    targetId = tonumber(targetId)

    if targetId == -1 then

        return BanPlayer(source, "Trying to send everyone to jail")

    end

    local officerCoords = GetEntityCoords(GetPlayerPed(source))

    local targetCoords  = GetEntityCoords(GetPlayerPed(targetId))

    if #(officerCoords - targetCoords) > 50 then

        return TriggerClientEvent("origen_police:ShowNotification", source, "You can't send someone to jail if you're not near them.")

    end

    local jailTime = (Config.Framework == "esx" and args.tiempo) or args[2]

    local danger   = (Config.Framework == "esx" and args.dangerous) or args[3]

    local canOpen = CanOpenTablet(Officer.PlayerData.job.name)[1]

    if canOpen then

        local onDuty = (Config.Framework == "qbcore" and Officer.PlayerData.job.onduty)

                    or (Config.Framework == "esx" and exports.origen_police:IsPlayerOnDuty(source))

        if onDuty then

            local Target = FW_GetPlayer(targetId)

            if Target and tonumber(jailTime) then

                TriggerClientEvent("origen_police:client:sendCitizenToFederal", source, targetId, tonumber(jailTime), danger)

                if not Config.OwnPrisionSystem then

                    TriggerClientEvent("SetFederal", targetId, tonumber(jailTime), danger)

                end

                CreateLog({

                    type   = "Federal",

                    embed  = {

                        title       = Config.LogsTranslations.EnterFederal.title,

                        description = Config.LogsTranslations.EnterFederal.message:format(jailTime, ("%s %s"):format(Officer.PlayerData.charinfo.firstname, Officer.PlayerData.charinfo.lastname)),

                        color       = 1791423

                    },

                    source = targetId

                })

            else

                TriggerClientEvent("origen_police:ShowNotification", source, Config.Translations.PlayerNotConnected)

            end

        end

    end

end, false)

FW_CreateCallback("origen_police:server:GetFederalList", function(source, cb)

    if not Config.OwnPrisionSystem and FederalPlayers then

        cb(FederalPlayers)

    else

        cb(GetFederalList())

    end

end)

AddEventHandler("playerDropped", function()

    local Player = FW_GetPlayer(source)

    if Player and Player.PlayerData and Player.PlayerData.citizenid then

        local citizenid = Player.PlayerData.citizenid

        if FederalPlayers[citizenid] then

            FederalPlayers[citizenid].online = false

        end

    end

end)

AddEventHandler("origen_police:client:OnPlayerUnload", function()

    local Player = FW_GetPlayer(source)

    if Player and Player.PlayerData and Player.PlayerData.citizenid then

        local citizenid = Player.PlayerData.citizenid

        if FederalPlayers[citizenid] then

            FederalPlayers[citizenid].online = false

        end

    end

end)

FW_CreateCallback("origen_police:server:releasefederal", function(source, cb, data)

    local Target = FW_GetPlayerFromCitizenid(data.citizenid)

    if Config.OwnPrisionSystem then

        return cb(ReleaseFederal(data.citizenid, Target.PlayerData.source))

    end

    if Target then

        TriggerClientEvent("SetFederal", Target.PlayerData.source)

    end

    FederalPlayers[data.citizenid] = nil

    MySQL.awaitQuery("DELETE FROM origen_police_federal WHERE citizenid = ?", { data.citizenid })

    cb(true)

end)

