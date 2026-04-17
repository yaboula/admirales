local QBCore = exports['qb-core']:GetCoreObject()

-- Event triggered on change death status
RegisterNetEvent('hospital:server:SetDeathStatus', function(state)
    local src = source
    TriggerClientEvent(_e('client:setPlayerDeathStatus'), src, state)
end)

local function getMoneyValue(player, moneyType)
    return (player.PlayerData and player.PlayerData.money and player.PlayerData.money[moneyType]) or 0
end

local function addMoneyCommands()
    local function cashCommand(source)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        local cash = getMoneyValue(player, 'cash')
        TriggerClientEvent('QBCore:Notify', source, ('Cash Balance: $%s'):format(cash), 'primary')
    end

    local function bankCommand(source)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        local bank = getMoneyValue(player, 'bank')
        TriggerClientEvent('QBCore:Notify', source, ('Bank Balance: $%s'):format(bank), 'primary')
    end

    QBCore.Commands.Add('money', 'Check Cash and Bank Balance', {}, false, function(source)
        local player = QBCore.Functions.GetPlayer(source)
        if not player then return end
        local cash = getMoneyValue(player, 'cash')
        local bank = getMoneyValue(player, 'bank')
        TriggerClientEvent('QBCore:Notify', source, ('Cash: $%s | Bank: $%s'):format(cash, bank), 'primary')
    end, 'user')

    local qbHudState = GetResourceState('qb-hud')
    if qbHudState ~= 'started' and qbHudState ~= 'starting' then
        QBCore.Commands.Add('cash', 'Check Cash Balance', {}, false, function(source)
            cashCommand(source)
        end, 'user')

        QBCore.Commands.Add('bank', 'Check Bank Balance', {}, false, function(source)
            bankCommand(source)
        end, 'user')
    end
end

CreateThread(addMoneyCommands)
