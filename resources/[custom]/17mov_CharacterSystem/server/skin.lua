local function GetStorePrice(index)
    if type(index) ~= "number" or index ~= math.floor(index) then
        return nil
    end

    local store = Config.Stores[index]
    if type(store) ~= "table" or type(store.price) ~= "number" or store.price < 0 then
        return nil
    end

    return store.price
end

local function IsPrismBankingActive()
    return GetResourceState("prism_banking") == "started"
end

local function GetPrismPrimaryAccount(source)
    if not IsPrismBankingActive() then
        return nil
    end

    local ok, accounts = pcall(function()
        return exports["prism_banking"]:GetBankAccounts(source)
    end)

    if not ok or type(accounts) ~= "table" then
        return nil
    end

    local fallbackPersonalAccount = nil
    for _, account in pairs(accounts) do
        if type(account) == "table" and not account.isSociety and not account.isNomineeAccount then
            if account.primary then
                return account
            end
            if fallbackPersonalAccount == nil then
                fallbackPersonalAccount = account
            end
        end
    end

    return fallbackPersonalAccount
end

local function SyncPrismPrimaryBalance(source, frameworkBankBalance)
    if not IsPrismBankingActive() then
        return
    end

    local account = GetPrismPrimaryAccount(source)
    if not account or not account.accountNumber then
        return
    end

    local newBalance = tonumber(frameworkBankBalance)
    if not newBalance then
        return
    end

    exports.oxmysql:execute(
        "UPDATE prism_banking_accounts SET balance = ? WHERE accno = ?",
        { newBalance, account.accountNumber }
    )
end

local function AddPrismStoreTransaction(source, amount, shopType)
    if not IsPrismBankingActive() then
        return
    end

    local txAmount = tonumber(amount)
    if not txAmount then
        return
    end

    txAmount = math.floor(txAmount + 0.5)
    if txAmount <= 0 then
        return
    end

    local readableShopType = (type(shopType) == "string" and shopType ~= "") and shopType or "character_store"
    local customName = "Character System Purchase"
    local customDesc = string.format("Payment for %s", readableShopType)

    pcall(function()
        exports["prism_banking"]:AddBankingTransaction(source, "withdraw", txAmount, "character_system", false, customName, customDesc)
    end)
end

Functions.RegisterServerCallback("17mov_CharacterSystem:CheckIfHaveEnoughMoney", function(source, index)
    Functions.Debug("CHECKING MONEY")
    local price = GetStorePrice(index)
    if not price then
        return false
    end

    local playerBank, playerMoney = 0, 0

    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if not Player then
            return false
        end
        playerBank, playerMoney = Player?.PlayerData?.money?.bank, Player?.PlayerData?.money?.cash
    elseif Config.Framework == "ESX" then
        local Player = Core.GetPlayerFromId(source)
        if not Player or type(Player.accounts) ~= "table" then
            return false
        end
        for k,v in pairs(Player.accounts) do
            if v.name == "bank" then
                playerBank = v.money
            elseif v.name == "money" then
                playerMoney = v.money
            end
        end
    end

    playerBank = tonumber(playerBank) or 0
    playerMoney = tonumber(playerMoney) or 0

    Functions.Debug("Price: ", price)
    Functions.Debug("Player Cash: ", playerMoney)
    Functions.Debug("Player Bank: ", playerBank)
    Functions.Debug("RETURNING : ", (playerMoney >= price or playerBank >= price))

    return (playerMoney >= price or playerBank >= price)
end)

Functions.RegisterServerCallback("17mov_CharacterSystem:TryToCharge", function(source, index)
    local price = GetStorePrice(index)
    if not price then
        return false
    end

    local store = Config.Stores[index]
    local shopType = store and store.shopType or "character_store"

    local playerBank, playerMoney = 0, 0
    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if not Player then
            return false
        end
        playerBank, playerMoney = Player?.PlayerData?.money?.bank, Player?.PlayerData?.money?.cash
        playerBank = tonumber(playerBank) or 0
        playerMoney = tonumber(playerMoney) or 0

        if playerMoney >= price then
            local removed = Player.Functions.RemoveMoney("cash", price, "17mov_CharacterSystem:StorePurchase")
            if removed == false then
                return false
            end
            return true
        end

        if playerBank >= price then
            local removed = Player.Functions.RemoveMoney("bank", price, "17mov_CharacterSystem:StorePurchase")
            if removed == false then
                return false
            end

            local updatedFrameworkBank = tonumber(Player?.PlayerData?.money?.bank)
            if not updatedFrameworkBank then
                updatedFrameworkBank = playerBank - price
            end

            SyncPrismPrimaryBalance(source, updatedFrameworkBank)
            AddPrismStoreTransaction(source, price, shopType)
            return true
        end
    elseif Config.Framework == "ESX" then
        local Player = Core.GetPlayerFromId(source)
        if not Player or type(Player.accounts) ~= "table" then
            return false
        end
        for k,v in pairs(Player.accounts) do
            if v.name == "bank" then
                playerBank = v.money
            elseif v.name == "money" then
                playerMoney = v.money
            end
        end

        playerBank = tonumber(playerBank) or 0
        playerMoney = tonumber(playerMoney) or 0

        if playerMoney >= price then
            Player.removeAccountMoney("money", price)
            return true
        end

        if playerBank >= price then
            Player.removeAccountMoney("bank", price)
            local updatedFrameworkBank = playerBank - price
            SyncPrismPrimaryBalance(source, updatedFrameworkBank)
            AddPrismStoreTransaction(source, price, shopType)
            return true
        end
    end

    return false
end)