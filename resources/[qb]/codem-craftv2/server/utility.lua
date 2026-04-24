function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function RegisterCallback(name, cbFunc)
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end

function WaitCore()
    while Core == nil do
        Wait(0)
    end
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        else
            return Player.PlayerData.citizenid
        end
    end
end

function GetName(source)
    if Config.Framework == "oldesx" or Config.Framework == "esx" then
        local xPlayer = Core.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getName()
        else
            return "0"
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local Player = Core.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
        end
    end
end

function GetPlayerInventory(source)
    local data = {}
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            for _, v in pairs(Player.getInventory()) do
                local amount = v.count or v.amount
                if v and tonumber(amount) > 0 then
                    local formattedData = {
                        name = string.lower(v.name),
                        label = v.label,
                        amount = amount,
                    }
                    table.insert(data, formattedData)
                end
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            for _, v in pairs(Player.PlayerData.items) do
                if v then
                    local amount = v.count or v.amount
                    if tonumber(amount) > 0 then
                        local formattedData = {
                            name = string.lower(v.name),
                            label = v.label,
                            amount = amount,
                        }
                        table.insert(data, formattedData)
                    end
                end
            end
        end
    end
    return data
end

function RemoveItem(src, item, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Inventory == "qb_inventory" then
            Player.Functions.RemoveItem(item, amount)
        elseif Config.Inventory == "esx_inventory" then
            Player.removeInventoryItem(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:RemoveItem(src, item, amount)
        elseif Config.Inventory == "codem-inventory" then
            exports['codem-inventory']:RemoveItem(src, item, amount)
        elseif Config.Inventory == "qs_inventory" then
            exports['qs-inventory']:RemoveItem(src, item, amount)
        end
    end
end

function AddItem(src, item, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Inventory == "qb_inventory" then
            Player.Functions.AddItem(item, amount)
        elseif Config.Inventory == "esx_inventory" then
            Player.addInventoryItem(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:AddItem(src, item, amount)
        elseif Config.Inventory == "codem-inventory" then
            Player.Functions.AddItem(item, amount)
        elseif Config.Inventory == "qs_inventory" then
            exports['qs-inventory']:AddItem(src, item, count)
        end
    end
end

function AddWeapon(src, item, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Inventory == "esx_inventory" then
            Player.addWeapon(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:AddItem(src, item, amount)
        end
    end
end

function RemoveWeapon(src, item, amount)
    local Player = GetPlayer(src)
    if Player then
        if Config.Inventory == "esx_inventory" then
            Player.removeWeapon(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:AddItem(src, item, amount)
        end
    end
end

RegisterNetEvent('QBCore:Server:OnPlayerUnload', function(id)
    local src = id
    TriggerClientEvent('codem-craftv2:clearPed', src)
end)


RegisterServerEvent("esx:playerLogout")
AddEventHandler("esx:playerLogout", function(source)
    local src = source
    TriggerClientEvent('codem-craftv2:clearPed', src)
end)


exports('addCraftPoint', addCraftPoint)

function addCraftPoint(source, amount)
    local src = source
    local identifier = GetIdentifier(src)
    local playerData = playerCraftData[identifier]
    if not playerData then
        return
    end
    playerData.profiledata.cp = tonumber(playerData.profiledata.cp) + tonumber(amount)
    TriggerClientEvent('codem-craft:updateProfileData', src, playerData.profiledata)
    saveDataOnline(src)
end

RegisterServerEvent('codem-craft:addCraftPoint', function(amount)
    local src = source
    local identifier = GetIdentifier(src)
    local playerData = playerCraftData[identifier]
    if not playerData then
        return
    end
    playerData.profiledata.cp = tonumber(playerData.profiledata.cp) + tonumber(amount)
    TriggerClientEvent('codem-craft:updateProfileData', src, playerData.profiledata)
    saveDataOnline(src)
end)
