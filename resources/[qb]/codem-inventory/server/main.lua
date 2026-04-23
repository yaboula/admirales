RegisterServerEvent("codem-inventory:server:openVehicleTrunk")
AddEventHandler("codem-inventory:server:openVehicleTrunk", function(plate, maxWeight, slots, unknown)
    local playerId = source
    
    ServerPlayerKey[playerId] = "CODEM" .. math.random(10000, 999999999) .. "saas" .. math.random(10000, 999999999) .. "KEY"
    TriggerClientEvent("codem-inventory:client:setkey", playerId, ServerPlayerKey[playerId])

    if not plate then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.VEHICLEPLATENOTFOUND)
        return
    end

    plate = customToLower(plate)
    local correctedPlate = string.lower(string.gsub(plate, "%s+", ""))

    if not VehicleInventory[correctedPlate] then
        VehicleInventory[correctedPlate] = {
            glovebox = {},
            trunk = {},
            plate = correctedPlate,
            maxweight = maxWeight or 0,
            slot = slots or 0
        }
        TriggerClientEvent("codem-inventory:client:newVehiclePlateInsert", -1, correctedPlate, maxWeight, slots)
    end

    local trunkData = {
        trunk = VehicleInventory[correctedPlate].trunk,
        slot = VehicleInventory[correctedPlate].slot,
        maxweight = VehicleInventory[correctedPlate].maxweight,
        plate = correctedPlate
    }

    TriggerClientEvent("codem-inventory:client:openVehicleTrunk", playerId, trunkData)
end)

RegisterServerEvent("codem-inventory:SwapInventoryToVehicleTrunk")
AddEventHandler("codem-inventory:SwapInventoryToVehicleTrunk", function(swapData)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    swapData.newSlot = tostring(swapData.newSlot)
    swapData.oldSlot = tostring(swapData.oldSlot)
    local plate = customToLower(swapData.plate)

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 1006 SATIR")
        return
    end

    local item = playerInventory[swapData.oldSlot]
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    if not VehicleInventory[plate] then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.VEHICLEPLATENOTFOUND)
        return
    end

    local trunkInventory = VehicleInventory[plate].trunk
    if not trunkInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLE)
        return
    end

    local emptySlot = FindFirstEmptySlot(trunkInventory, tonumber(swapData.maxslot))
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLEINVENTORY)
        return
    end

    local emptySlotStr = tostring(emptySlot)
    local itemAmount = playerInventory[swapData.oldSlot].amount or 1
    local targetItem = trunkInventory[swapData.newSlot]

    local weightCheck = CheckInventoryWeight(trunkInventory, item.weight * item.amount, swapData.weight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLEINVENTORY)
        return
    end

    if targetItem then
        if not item.unique and not targetItem.unique then
            item.slot = emptySlotStr
            trunkInventory[emptySlotStr] = item
            playerInventory[swapData.oldSlot] = nil
            TriggerClientEvent("codem-inventory:client:updateVehicleTrunkItem", -1, plate, emptySlotStr, trunkInventory[emptySlotStr])
        elseif targetItem.name == item.name then
            targetItem.amount = targetItem.amount + item.amount
            playerInventory[swapData.oldSlot] = nil
            TriggerClientEvent("codem-inventory:client:updateVehicleTrunkItem", -1, plate, swapData.newSlot, trunkInventory[swapData.newSlot])
        else
            item.slot = emptySlotStr
            trunkInventory[emptySlotStr] = item
            playerInventory[swapData.oldSlot] = nil
            swapData.newSlot = emptySlotStr
        end
    else
        item.slot = swapData.newSlot
        trunkInventory[swapData.newSlot] = item
        playerInventory[swapData.oldSlot] = nil
    end

    UpdateVehicleInventory(plate, trunkInventory)

    if Config.CashItem and item.name == "cash" then
        local totalCash = GetItemsTotalAmount(playerId, "cash")
        local player = GetPlayer(playerId)
        
        if Config.Framework == "qb" or Config.Framework == "oldqb" then
            player.Functions.SetMoney("cash", totalCash)
        else
            player.setMoney(tonumber(totalCash))
        end
    else
        SetInventory(playerId)
    end

    TriggerClientEvent("codem-inventory:client:updateVehicleTrunkItem", -1, plate, swapData.newSlot, trunkInventory[tostring(swapData.newSlot)])
    TriggerClientEvent("codem-inventory:client:removeitemtoclientInventory", playerId, swapData.oldSlot, itemAmount)

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. "-" .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Plate : " .. plate .. " " .. Locales[Config.Language].notification.INVENTORYTOTRUNK
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMTRUNK, "green", logData, playerId, "trunk")
    end
end)

function UpdateVehicleInventory(plate, inventory)
    local correctedPlate = string.lower(string.gsub(plate, "%s+", ""))
    local query = [[
        INSERT INTO codem_new_vehicleandglovebox (plate, trunk) VALUES (@plate, @trunk) ON DUPLICATE KEY UPDATE plate = @plate, trunk = @trunk
    ]]
    local params = {
        ["@plate"] = correctedPlate,
        ["@trunk"] = json.encode(inventory)
    }
    
    local success, error = pcall(function()
        UpdateInventorySql(query, params)
    end)
    
    if not success then
        print("UpdateVehicleInventory Error: " .. error)
    end
end

function UpdateVehicleGlovebox(plate, inventory)
    local correctedPlate = string.lower(string.gsub(plate, "%s+", ""))
    local query = [[
        INSERT INTO codem_new_vehicleandglovebox (plate, glovebox) VALUES (@plate, @glovebox) ON DUPLICATE KEY UPDATE plate = @plate, glovebox = @glovebox
    ]]
    local params = {
        ["@plate"] = correctedPlate,
        ["@glovebox"] = json.encode(inventory)
    }
    
    local success, error = pcall(function()
        UpdateInventorySql(query, params)
    end)
    
    if not success then
        print("UpdateVehicleGlovebox Error: " .. error)
    end
end

RegisterServerEvent("codem-inventory:swapVehicleTrunkToInventory")
AddEventHandler("codem-inventory:swapVehicleTrunkToInventory", function(swapData)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    swapData.newSlot = tostring(swapData.newSlot)
    swapData.oldSlot = tostring(swapData.oldSlot)
    local plate = tostring(swapData.plate)

    local trunkInventory = VehicleInventory[plate]
    if trunkInventory then
        trunkInventory = VehicleInventory[plate].trunk
    end
    
    if not trunkInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLE)
        return
    end

    local item = trunkInventory[swapData.oldSlot]
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    if item and item.type == "bag" then
        local bagCount = CheckBagItem(playerId)
        if tonumber(bagCount) > tonumber(Config.MaxBackPackItem) then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.MAXBAGPACKITEM)
            return
        end
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 1132 SATIR")
        return
    end

    local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
        return
    end

    local weightCheck = CheckInventoryWeight(playerInventory, item.weight * item.amount, Config.MaxWeight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.INVENTORYISFULL)
        return
    end

    local emptySlotStr = tostring(emptySlot)
    local targetSlot = playerInventory[swapData.newSlot]
    
    if not targetSlot then
        item.slot = swapData.newSlot
        playerInventory[swapData.newSlot] = item
    else
        if targetSlot.name == item.name then
            if not item.unique and not (playerInventory[swapData.oldSlot] and playerInventory[swapData.oldSlot].unique) then
                targetSlot.amount = targetSlot.amount + item.amount
            else
                item.slot = emptySlotStr
                playerInventory[emptySlotStr] = item
                swapData.newSlot = emptySlotStr
            end
        else
            local newEmptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
            if not newEmptySlot then
                TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.FAILEDANEWSLOT)
                return
            end
            local newEmptySlotStr = tostring(newEmptySlot)
            item.slot = newEmptySlotStr
            playerInventory[newEmptySlotStr] = item
            swapData.newSlot = newEmptySlotStr
        end
    end

    if Config.CashItem and item.name == "cash" then
        AddMoney(playerId, "cash", item.amount)
    else
        SetInventory(playerId)
    end

    trunkInventory[swapData.oldSlot] = nil
    UpdateVehicleInventory(swapData.plate, trunkInventory)
    
    TriggerClientEvent("codem-inventory:client:RemoveVehicleTrunkItem", -1, swapData.plate, swapData.oldSlot, trunkInventory[tostring(swapData.oldSlot)])
    TriggerClientEvent("codem-inventory:client:additem", playerId, tostring(swapData.newSlot), playerInventory[tostring(swapData.newSlot)])

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. " - " .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Plate : " .. swapData.plate .. " " .. Locales[Config.Language].notification.TRUNKTOINVENTORY
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMS, "green", logData, playerId)
    end
end)

RegisterServerEvent("codem-inventory:swapVehicleGloveboxToInventory")
AddEventHandler("codem-inventory:swapVehicleGloveboxToInventory", function(swapData)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    swapData.newSlot = tostring(swapData.newSlot)
    swapData.oldSlot = tostring(swapData.oldSlot)
    local plate = tostring(swapData.plate)

    local gloveboxInventory = GloveBoxInventory[plate]
    if gloveboxInventory then
        gloveboxInventory = GloveBoxInventory[plate].glovebox
    end
    
    if not gloveboxInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.GLOVEBOXINVENTORYNOTFOUND)
        return
    end

    local item = gloveboxInventory[swapData.oldSlot]
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    if item and item.type == "bag" then
        local bagCount = CheckBagItem(playerId)
        if tonumber(bagCount) > tonumber(Config.MaxBackPackItem) then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.MAXBAGPACKITEM)
            return
        end
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 1214 SATIR")
        return
    end

    local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
        return
    end

    local weightCheck = CheckInventoryWeight(playerInventory, item.weight * item.amount, Config.MaxWeight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.INVENTORYISFULL)
        return
    end

    local emptySlotStr = tostring(emptySlot)
    local targetSlot = playerInventory[swapData.newSlot]
    
    if not targetSlot then
        item.slot = swapData.newSlot
        playerInventory[swapData.newSlot] = item
    else
        if targetSlot.name == item.name then
            if not item.unique and not (playerInventory[swapData.oldSlot] and playerInventory[swapData.oldSlot].unique) then
                targetSlot.amount = targetSlot.amount + item.amount
            else
                item.slot = emptySlotStr
                playerInventory[emptySlotStr] = item
                swapData.newSlot = emptySlotStr
            end
        else
            local newEmptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
            if not newEmptySlot then
                TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.FAILEDANEWSLOT)
                return
            end
            local newEmptySlotStr = tostring(newEmptySlot)
            item.slot = newEmptySlotStr
            playerInventory[newEmptySlotStr] = item
            swapData.newSlot = newEmptySlotStr
        end
    end

    gloveboxInventory[swapData.oldSlot] = nil

    if Config.CashItem and item.name == "cash" then
        AddMoney(playerId, "cash", item.amount)
    else
        SetInventory(playerId)
    end

    UpdateVehicleGlovebox(swapData.plate, gloveboxInventory)
    
    TriggerClientEvent("codem-inventory:client:RemoveVehicleGloveboxItem", -1, swapData.plate, swapData.oldSlot, gloveboxInventory[tostring(swapData.oldSlot)])
    TriggerClientEvent("codem-inventory:client:additem", playerId, tostring(swapData.newSlot), playerInventory[tostring(swapData.newSlot)])

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. " - " .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Plate : " .. swapData.plate .. " " .. Locales[Config.Language].notification.GLOVEBOXTOINVENTORY
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMS, "green", logData, playerId)
    end
end)

-- Shop operations
RegisterServerEvent("codem-inventory:swapShopToInventory")
AddEventHandler("codem-inventory:swapShopToInventory", function(shopData, jobData)
    local playerId = tonumber(source)
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 1293 SATIR")
        return
    end

    local itemData = shopData.itemname
    if not itemData then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUND)
        return
    end

    local shopConfig = Config.Shops[shopData.shopname]
    if not shopConfig then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.SHOPNOTFOUND)
        return
    end

    -- [SECFIX-C2] Validacion server-side de precio / cantidad / paymentMethod.
    -- Antes el cliente enviaba price, count, grade y paymentMethod libremente, lo
    -- que permitia comprar con precio negativo o cero, cantidades gigantes, o
    -- pagar con metodos inexistentes. Ahora se forzan valores del servidor.
    do
        local serverItem, serverItemKey = nil, nil
        if type(shopConfig.items) == "table" then
            for k, v in pairs(shopConfig.items) do
                if v and v.name == itemData.name then
                    serverItem, serverItemKey = v, k
                    break
                end
            end
        end
        if not serverItem then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUND)
            TriggerEvent('codem-inventory:cheaterlogs', { playerName = GetName(playerId), playerIdentifier = playerId, reason = "Shop: item no existe en shop config", event = "shop:item-spoof" })
            return
        end
        itemData.price = tonumber(serverItem.price) or 0
        itemData.grade = serverItem.grade
        if itemData.price <= 0 then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUND)
            return
        end
        local pm = tostring(shopData.paymentMethod or "cash")
        if pm ~= "cash" and pm ~= "bank" then
            shopData.paymentMethod = "cash"
        end
    end

    local _reqAmount = tonumber(shopData.amount) or 0
    if _reqAmount <= 0 then
        itemData.count = 1
    else
        itemData.count = _reqAmount
    end

    itemData.count = tonumber(itemData.count) or 1
    -- [SECFIX-C2] cap de cantidad por transaccion (anti abuso / anti overflow)
    local MAX_BUY_PER_TX = 100
    if itemData.count < 1 then itemData.count = 1 end
    if itemData.count > MAX_BUY_PER_TX then itemData.count = MAX_BUY_PER_TX end
    itemData.price = tonumber(itemData.price)

    local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
        return
    end

    local configItem = Config.Itemlist[itemData.name]
    if not configItem then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDITEMLIST)
        return
    end

    if itemData.grade then
        if jobData and jobData.grade and jobData.name then
            for jobName, jobInfo in pairs(shopConfig.job) do
                if jobData.name == jobName then
                    if tonumber(jobData.grade) >= tonumber(itemData.grade) then
                        local itemConfig = Config.Itemlist[itemData.name]
                        if itemConfig.unique then
                            itemData.count = 1
                        end
                        
                        local totalPrice = itemData.price * itemData.count
                        local playerMoney = GetPlayerMoney(playerId, shopData.paymentMethod)
                        
                        if tonumber(playerMoney) < tonumber(totalPrice) then
                            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ENOUGHMONEY)
                            return
                        end
                        
                        if AddItem(playerId, itemConfig.name, itemData.count) then
                            RemoveMoney(playerId, shopData.paymentMethod, totalPrice)
                        end
                    else
                        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOTGRADE)
                        return
                    end
                end
            end
        else
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.JOBNOTFOUND)
            return
        end
    else
        local itemConfig = Config.Itemlist[itemData.name]
        if itemConfig.unique then
            itemData.count = 1
        end
        
        local totalPrice = itemData.price * itemData.count
        local playerMoney = GetPlayerMoney(playerId, shopData.paymentMethod)
        
        if tonumber(playerMoney) < tonumber(totalPrice) then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ENOUGHMONEY)
            return
        end
        
        if AddItem(playerId, itemConfig.name, itemData.count) then
            RemoveMoney(playerId, shopData.paymentMethod, totalPrice)
            
            if Config.UseDiscordWebhooks then
                local logData = {
                    playername = GetName(playerId) .. "-" .. playerId,
                    itemname = shopData.itemname.label,
                    info = shopData.info or nil,
                    amount = shopData.itemname.count or shopData.itemname.amount,
                    reason = Locales[Config.Language].notification.SHOPTOINVENTORY
                }
                TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.BUYITEM, "green", logData, playerId, "shop")
            end
        end
    end
end)

-- Backpack operations
RegisterServerEvent("codem-inventory:openbackpack")
AddEventHandler("codem-inventory:openbackpack", function(backpackItem)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    if not backpackItem or not backpackItem.info then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMINFONOTFOUND)
        return
    end

    local itemInfo = backpackItem.info

    -- [SECFIX-C4] Ownership check: el cliente enviaba libremente backpackItem.info.series
    -- permitiendo abrir la mochila de cualquier otro jugador con conocer su series.
    -- Ahora verificamos que el jugador posea realmente un item con ese series.
    do
        local series = itemInfo.series
        if not series or tostring(series) == "" then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMINFONOTFOUND)
            return
        end
        local playerInv = PlayerServerInventory[identifier] and PlayerServerInventory[identifier].inventory
        local ownsBag = false
        local ownedSlot, ownedWeight = nil, nil
        if type(playerInv) == "table" then
            for _, invItem in pairs(playerInv) do
                if type(invItem) == "table" and invItem.info and invItem.info.series == series then
                    local cfg = Config.Itemlist[invItem.name]
                    if cfg and (cfg.type == "bag" or cfg.stash or cfg.backpack or invItem.info.weight) then
                        ownsBag = true
                        ownedSlot = invItem.slot
                        ownedWeight = invItem.info.weight or (cfg and cfg.weight)
                        break
                    end
                    ownsBag = true
                    ownedSlot = invItem.slot
                    ownedWeight = invItem.info.weight
                    break
                end
            end
        end
        if not ownsBag then
            TriggerEvent('codem-inventory:cheaterlogs', { playerName = GetName(playerId), playerIdentifier = playerId, reason = "openbackpack: series no pertenece al jugador", event = "backpack:ownership" })
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMINFONOTFOUND)
            return
        end
        -- forzar valores server-side (ignorar slot/weight del cliente)
        itemInfo.slot = ownedSlot or itemInfo.slot
        itemInfo.weight = ownedWeight or itemInfo.weight
    end

    local backpackData = {
        inventory = {},
        slot = itemInfo.slot or 0,
        maxweight = itemInfo.weight or 0,
        backpackname = itemInfo.series
    }

    if ServerStash[itemInfo.series] then
        backpackData.inventory = ServerStash[itemInfo.series].inventory
        if not backpackData.inventory then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.BACKPACKINVNOTFOUND)
            return
        end
    else
        ExecuteSql("INSERT INTO codem_new_stash (stashname, inventory) VALUES (@stashname, @inventory) ON DUPLICATE KEY UPDATE stashname = @stashname, inventory = @inventory", {
            stashname = itemInfo.series,
            inventory = json.encode({})
        })
        
        ServerStash[itemInfo.series] = {
            inventory = {}
        }
    end

    TriggerClientEvent("codem-inventory:GetBackPackItem", playerId, backpackData)
end)-- Global variables
Core = nil
nuiLoaded = false

-- Inventory storage tables
PlayerServerInventory = {}
ServerGround = {}
ServerStash = {}
VehicleInventory = {}
GloveBoxInventory = {}
Identifier = {}
ServerPlayerKey = {}
cooldown = {}
ClothingInventory = {}

-- ⚠️ Warning: duplicateItemsLookup appears to be undefined - originally L0_1 = {}
local duplicateItemsLookup = {}

-- Initialize core framework
CreateThread(function()
    Core = GetCore()
end)

function SetInventory(playerId)
    local numericPlayerId = tonumber(playerId)
    local identifier = Identifier[numericPlayerId]
    if not identifier then
        return
    end

    local playerInventory = PlayerServerInventory[identifier]
    if not playerInventory then
        return
    end

    while Core == nil do
        Wait(0)
    end

    if Config.Framework == "qb" or Config.Framework == "oldqb" then
        local player = GetPlayer(numericPlayerId)
        if player then
            local playerIdentifier = GetIdentifier(numericPlayerId)
            if not playerIdentifier then
                return
            end
            player.Functions.SetPlayerData("items", PlayerServerInventory[playerIdentifier].inventory)
        end
    elseif Config.Framework == "esx" then
        local player = Core.GetPlayerFromId(playerId)
        if player then
            local playerIdentifier = GetIdentifier(numericPlayerId)
            if not playerIdentifier then
                return
            end
            player.set("inv", PlayerServerInventory[playerIdentifier].inventory)
        end
    end
end

-- Resource conflict warnings
CreateThread(function()
    Wait(15000)
    if GetResourceState("qb-weapons") == "started" then
        for i = 1, 20 do
            print("PLS DELETE QB-WEAPONS RESOURCE")
        end
    end
end)

CreateThread(function()
    Wait(5000)
    if GetResourceState("qb-smallresources") == "started" then
        local weapDrawFile = LoadResourceFile("qb-smallresources", "client/weapdraw.lua")
        if weapDrawFile then
            for i = 1, 20 do
                print("PLS DELETE QB-SMALLRESOURCES/CLIENT/WEAPDRAW.LUA")
            end
        end
    end
end)

CreateThread(function()
    -- Empty thread - placeholder in original
end)

-- Resource start handler
AddEventHandler("onResourceStart", function(resourceName)
    while Core == nil do
        Wait(0)
    end
    
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    
    if Config.Framework == "qb" or Config.Framework == "oldqb" then
        local players = Core.Functions.GetQBPlayers()
        for playerId in pairs(players) do
            SetMethods(playerId)
        end
    end
end)

-- Database initialization threads
CreateThread(function()
    local stashData = ExecuteSql("SELECT * FROM `codem_new_stash`")
    local deletedCount = 0
    
    for i = 1, #stashData do
        local stash = stashData[i]
        local inventory = json.decode(stash.inventory or "{}")
        
        if next(inventory) == nil then
            ExecuteSql("DELETE FROM `codem_new_stash` WHERE `stashname` = @stashname", {
                ["@stashname"] = stash.stashname
            })
            deletedCount = deletedCount + 1
        else
            ServerStash[stash.stashname] = {
                stashname = stash.stashname,
                inventory = inventory
            }
        end
    end
    
    if deletedCount > 0 then
        print("^2 Deleted empty stash records, count: " .. deletedCount .. " ^0")
    end
end)

CreateThread(function()
    if Config.ItemClothingSystem then
        local clothingData = ExecuteSql("SELECT * FROM `codem_new_clothingsitem`")
        local deletedCount = 0
        
        for i = 1, #clothingData do
            local clothing = clothingData[i]
            local inventory = json.decode(clothing.inventory or "{}")
            
            if next(inventory) == nil then
                ExecuteSql("DELETE FROM `codem_new_clothingsitem` WHERE `identifier` = @identifier", {
                    ["@identifier"] = clothing.identifier
                })
                deletedCount = deletedCount + 1
            else
                ClothingInventory[clothing.identifier] = {
                    identifier = clothing.identifier,
                    inventory = inventory
                }
            end
        end
        
        if deletedCount > 0 then
            print("^2Deleted empty clothing data records, count: " .. deletedCount .. "^0")
        end
        
        for _, playerId in pairs(GetPlayers()) do
            local numericId = tonumber(playerId)
            local identifier = GetIdentifier(numericId)
            
            if ClothingInventory[identifier] then
                TriggerClientEvent("codem-inventory:loadclothingdata", numericId, ClothingInventory[identifier].inventory)
            end
        end
    end
end)

CreateThread(function()
    local vehicleData = ExecuteSql("SELECT * FROM `codem_new_vehicleandglovebox`")
    local deletedCount = 0
    
    for i = 1, #vehicleData do
        local vehicle = vehicleData[i]
        local correctedPlate = string.lower(string.gsub(vehicle.plate, "%s+", ""))
        
        if correctedPlate ~= vehicle.plate then
            ExecuteSql("UPDATE `codem_new_vehicleandglovebox` SET `plate` = @correctedPlate WHERE `plate` = @originalPlate", {
                ["@correctedPlate"] = correctedPlate,
                ["@originalPlate"] = vehicle.plate
            })
        end
        
        local trunkInventory = json.decode(vehicle.trunk or "{}")
        local gloveboxInventory = json.decode(vehicle.glovebox or "{}")
        
        if next(trunkInventory) == nil and next(gloveboxInventory) == nil then
            ExecuteSql("DELETE FROM `codem_new_vehicleandglovebox` WHERE `plate` = @plate", {
                ["@plate"] = vehicle.plate
            })
            deletedCount = deletedCount + 1
        else
            if next(trunkInventory) ~= nil then
                VehicleInventory[correctedPlate] = {
                    plate = correctedPlate,
                    trunk = trunkInventory
                }
            end
            
            if next(gloveboxInventory) ~= nil then
                GloveBoxInventory[correctedPlate] = {
                    plate = correctedPlate,
                    glovebox = gloveboxInventory
                }
            end
        end
    end
    
    if deletedCount > 0 then
        print("^2 DELETED EMPTY VEHICLE SQL, COUNT : " .. deletedCount .. "^0")
    end
end)

function CheckDuplicateItems(playerId)
    local numericPlayerId = tonumber(playerId)
    local identifier = Identifier[numericPlayerId]
    if not identifier then
        return
    end

    local playerInventory = PlayerServerInventory[identifier]
    if not playerInventory then
        return
    end

    local inventory = playerInventory.inventory
    if not inventory then
        return
    end

    if identifier then
        local lastCheck = duplicateItemsLookup[numericPlayerId]
        if lastCheck then
            local timeDiff = os.time() - lastCheck
            if timeDiff < 600 then
                return
            end
        end
    end

    duplicateItemsLookup[numericPlayerId] = os.time()

    local seriesGroups = {}
    for slot, item in pairs(inventory) do
        if item.info and item.info.series then
            local series = item.info.series
            if not seriesGroups[series] then
                seriesGroups[series] = {}
            end
            table.insert(seriesGroups[series], item)
        end
    end

    for series, items in pairs(seriesGroups) do
        if #items > 1 then
            print("Duplicate items detected for series: " .. series .. ". Count: " .. #items .. " Player: " .. GetName(numericPlayerId))
            
            if Config.UseDiscordWebhooks then
                local logData = {
                    playername = GetName(numericPlayerId) .. "-" .. numericPlayerId,
                    reason = "DUPLICATE ITEMS DETECTED",
                    itemname = items[1].name,
                    info = items[1].info or nil,
                    amount = 1
                }
                
                TriggerEvent("codem-inventory:CreateLog", "DUPLICATE ITEMS", "green", logData, numericPlayerId, "cheater")
                DropPlayer(numericPlayerId, "Duplicate Player Inventory")
            end
        end
    end
end

-- Player inventory loading
RegisterServerEvent("codem-inventory:server:loadPlayerInventory")
AddEventHandler("codem-inventory:server:loadPlayerInventory", function()
    local playerId = tonumber(source)
    local identifier = GetIdentifier(playerId)
    local player = GetPlayer(playerId)
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    if Config.Framework == "qb" or Config.Framework == "oldqb" then
        local playerItems = player.PlayerData.items
        
        if PlayerServerInventory[identifier] and PlayerServerInventory[identifier].inventory then
            Identifier[playerId] = identifier
            PlayerServerInventory[identifier].inventory = playerItems
        else
            if Identifier[playerId] then
                Identifier[playerId] = nil
            end
            Identifier[playerId] = identifier
            PlayerServerInventory[identifier] = {
                identifier = identifier,
                inventory = playerItems
            }
        end
        
        if Config.ItemClothingSystem then
            if not ClothingInventory[identifier] then
                ClothingInventory[identifier] = {
                    identifier = identifier,
                    inventory = {}
                }
            end
            TriggerClientEvent("codem-inventory:loadclothingdata", playerId, ClothingInventory[identifier].inventory)
        end
        
        if Config.CashItem then
            local cashAmount = GetPlayerMoney(playerId, "cash")
            SetInventoryItems(playerId, "cash", cashAmount)
        end
        
        CheckDuplicateItems(playerId)
        
    elseif Config.Framework == "esx" or Config.Framework == "oldesx" then
        local playerItems = player.get("inv")
        
        if PlayerServerInventory[identifier] then
            Identifier[playerId] = identifier
            PlayerServerInventory[identifier].inventory = playerItems
        else
            Identifier[playerId] = identifier
            PlayerServerInventory[identifier] = {
                identifier = identifier,
                inventory = playerItems
            }
        end
        
        if Config.ItemClothingSystem then
            if not ClothingInventory[identifier] then
                ClothingInventory[identifier] = {
                    identifier = identifier,
                    inventory = {}
                }
            end
            TriggerClientEvent("codem-inventory:loadclothingdata", playerId, ClothingInventory[identifier].inventory)
        end
        
        if Config.CashItem then
            local cashAmount = GetPlayerMoney(playerId, "cash")
            SetInventoryItems(playerId, "cash", cashAmount)
        end
        
        CheckDuplicateItems(playerId)
    end

    TriggerClientEvent("codem-inventory:client:loadClientInventory", playerId, PlayerServerInventory[identifier].inventory)
    TriggerClientEvent("codem-inventory:client:loadAllVehicleInventory", playerId, VehicleInventory)
    TriggerClientEvent("codem-inventory:client:loadAllGround", playerId, ServerGround)
    TriggerClientEvent("codem-inventory:client:loadAllVehicleGlovebox", playerId, GloveBoxInventory)
    
    ServerPlayerKey[playerId] = "CODEM" .. math.random(10000, 999999999) .. "saas" .. math.random(10000, 999999999) .. "KEY"
    TriggerClientEvent("codem-inventory:client:setkey", playerId, ServerPlayerKey[playerId])
end)

-- Item swapping functions
RegisterServerEvent("codem-inventory:server:checkPlayerItemForSwap")
AddEventHandler("codem-inventory:server:checkPlayerItemForSwap", function(swapData)
    local playerId = source
    local numericPlayerId = tonumber(playerId)
    local identifier = Identifier[numericPlayerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    if cooldown[numericPlayerId] then
        return
    else
        cooldown[numericPlayerId] = true
        SetTimeout(600, function()
            cooldown[numericPlayerId] = nil
        end)
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 245 SATIR")
        return
    end

    local oldSlot = tostring(swapData.oldSlot)
    local newSlot = tostring(swapData.newSlot)
    local item = playerInventory[oldSlot]
    
    if item then
        playerInventory[newSlot] = item
        playerInventory[newSlot].slot = newSlot
        playerInventory[oldSlot] = nil
        
        TriggerClientEvent("codem-inventory:client:ChangeSwapItem", playerId, swapData.oldSlot, swapData.newSlot)
        SetInventory(playerId)
    end
end)

RegisterServerEvent("codem-inventory:server:checkPlayerItemForSwapTargetItem")
AddEventHandler("codem-inventory:server:checkPlayerItemForSwapTargetItem", function(swapData)
    local playerId = tonumber(source)
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    if cooldown[playerId] then
        return
    else
        cooldown[playerId] = true
        SetTimeout(1000, function()
            cooldown[playerId] = nil
        end)
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        debugprint("DIKKAT ENVANTER BULUNAMADI 319 SATIR")
        return
    end

    if playerInventory then
        local oldSlot = tostring(swapData.oldSlot)
        local newSlot = tostring(swapData.newSlot)
        local oldItem = playerInventory[oldSlot]
        local newItem = playerInventory[newSlot]
        
        if oldItem and newItem then
            if oldItem.name == newItem.name then
                if oldItem.unique or newItem.unique then
                    -- Swap unique items
                    playerInventory[oldSlot] = newItem
                    playerInventory[oldSlot].slot = oldSlot
                    playerInventory[newSlot] = oldItem
                    playerInventory[newSlot].slot = newSlot
                    
                    TriggerClientEvent("codem-inventory:client:ChangeSwapItemTargetItem", playerId, swapData.oldSlot, swapData.newSlot)
                    SetInventory(playerId)
                else
                    -- Combine stackable items
                    playerInventory[newSlot].amount = playerInventory[newSlot].amount + oldItem.amount
                    playerInventory[oldSlot] = nil
                    
                    TriggerClientEvent("codem-inventory:client:ChangeSwapItemSimilarItem", playerId, swapData.oldSlot, swapData.newSlot)
                    SetInventory(playerId)
                end
            else
                -- Swap different items
                playerInventory[oldSlot] = newItem
                playerInventory[oldSlot].slot = oldSlot
                playerInventory[newSlot] = oldItem
                playerInventory[newSlot].slot = newSlot
                
                TriggerClientEvent("codem-inventory:client:ChangeSwapItemTargetItem", playerId, swapData.oldSlot, swapData.newSlot)
                SetInventory(playerId)
            end
            Wait(1000)
        else
            Wait(1000)
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUND)
        end
    end
end)

-- Ground inventory operations
RegisterServerEvent("codem-inventory:SwapGroundToInventory")
AddEventHandler("codem-inventory:SwapGroundToInventory", function(swapData, groundId)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier or not ServerGround[groundId] then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 376 SATIR")
        return
    end

    local groundInventory = ServerGround[groundId].inventory
    local item = groundInventory[tostring(swapData.oldSlot)]
    
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUND)
        return
    end

    local weightCheck = CheckInventoryWeight(playerInventory, item.weight * item.amount, Config.MaxWeight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.INVENTORYISFULL)
        return
    end

    if item and item.type == "bag" then
        local bagCount = CheckBagItem(playerId)
        if tonumber(bagCount) > tonumber(Config.MaxBackPackItem) then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.MAXBAGPACKITEM)
            return
        end
    end

    function AddItemToInventory(slot, itemData)
        if playerInventory[slot] then
            if playerInventory[slot].name == itemData.name and not itemData.unique then
                playerInventory[slot].amount = playerInventory[slot].amount + itemData.amount
            end
        else
            if itemData.unique then
                local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
                if not emptySlot then
                    TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
                    return
                end
                slot = tostring(emptySlot)
                itemData.slot = slot
                playerInventory[slot] = itemData
                playerInventory[slot].slot = slot
            else
                local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
                slot = tostring(emptySlot)
                if not emptySlot then
                    TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
                    return
                end
                itemData.slot = slot
                playerInventory[slot] = itemData
                playerInventory[slot].slot = slot
            end
        end
        
        TriggerClientEvent("codem-inventory:client:additem", playerId, slot, playerInventory[slot])
        
        if Config.UseDiscordWebhooks then
            local logData = {
                playername = GetName(playerId) .. "-" .. playerId,
                itemname = item.label,
                info = item.info or nil,
                amount = item.amount,
                reason = Locales[Config.Language].notification.GROUNDTOINVENTORY
            }
            TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMS, "green", logData, playerId)
        end
    end

    AddItemToInventory(tostring(swapData.newSlot), item)
    
    groundInventory[swapData.oldSlot] = nil
    
    if not next(ServerGround[groundId].inventory) then
        ServerGround[groundId] = nil
        TriggerClientEvent("codem-inventory:client:removeGroundTable", -1, groundId)
    else
        TriggerClientEvent("codem-inventory:client:SetGroundTable", -1, groundId, ServerGround[groundId].coord, ServerGround[groundId].inventory)
    end

    if Config.CashItem and item.name == "cash" then
        AddMoney(playerId, "cash", item.amount)
    else
        SetInventory(playerId)
    end

    TriggerClientEvent("codem-inventory:dropanim", playerId)
end)

RegisterServerEvent("codem-inventory:SwapInventoryToGround")
AddEventHandler("codem-inventory:SwapInventoryToGround", function(swapData, groundId)
    local playerId = tonumber(source)
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    swapData.oldSlot = tostring(swapData.oldSlot)
    swapData.newSlot = tostring(swapData.newSlot)

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 459 SATIR")
        return
    end

    local groundInventory = {}
    if ServerGround[groundId] and ServerGround[groundId].inventory then
        groundInventory = ServerGround[groundId].inventory
    end

    local item = playerInventory[swapData.oldSlot]
    local targetItem = groundInventory[swapData.newSlot]

    if not swapData.newSlot then
        local emptySlot = FindFirstEmptySlot(groundInventory, Config.GroundSlots)
        if not emptySlot then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEGROUND)
            return
        end
        swapData.newSlot = tostring(emptySlot)
    end

    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    if not groundId then
        local newGroundId = GenerateGroundId()
        local playerCoords = GetEntityCoords(GetPlayerPed(playerId))
        
        item.object = nil
        ServerGround[newGroundId] = {
            inventory = {["1"] = item},
            coord = playerCoords,
            id = newGroundId
        }
        item.slot = "1"
        
        TriggerClientEvent("codem-inventory:client:SetGroundTable", -1, newGroundId, playerCoords, ServerGround[newGroundId].inventory)
    elseif targetItem then
        local emptySlot = FindFirstEmptySlot(groundInventory, Config.GroundSlots)
        if not emptySlot then
            TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEGROUND)
            return
        end
        
        local emptySlotStr = tostring(emptySlot)
        item.slot = emptySlotStr
        groundInventory[emptySlotStr] = item
        ServerGround[groundId].inventory = groundInventory
        
        TriggerClientEvent("codem-inventory:client:SetGroundTable", -1, groundId, ServerGround[groundId].coord, groundInventory)
    else
        local emptySlot = FindFirstEmptySlot(groundInventory, Config.GroundSlots)
        if not emptySlot then
            TriggerClientEvent("codem-inventory:client:notification", playerId, "No empty slot available in ground inventory")
            return
        end
        
        local emptySlotStr = tostring(emptySlot)
        item.slot = emptySlotStr
        groundInventory[emptySlotStr] = item
        ServerGround[groundId].inventory = groundInventory
        
        TriggerClientEvent("codem-inventory:client:SetGroundTable", -1, groundId, ServerGround[groundId].coord, groundInventory)
    end

    TriggerClientEvent("codem-inventory:client:removeitemtoclientInventory", playerId, swapData.oldSlot, playerInventory[swapData.oldSlot].amount)
    playerInventory[swapData.oldSlot] = nil

    if Config.CashItem and item.name == "cash" then
        local totalCash = GetItemsTotalAmount(playerId, "cash")
        local player = GetPlayer(playerId)
        
        if Config.Framework == "qb" or Config.Framework == "oldqb" then
            player.Functions.SetMoney("cash", totalCash)
        else
            player.setMoney(tonumber(totalCash))
        end
    else
        SetInventory(playerId)
    end

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. "-" .. playerId,
            itemname = item.label,
            info = item.info or nil,
            amount = item.amount,
            reason = Locales[Config.Language].notification.INVENTORYTOGROUND
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMGROUND, "green", logData, playerId, "drop")
    end

    TriggerClientEvent("codem-inventory:dropanim", playerId)
end)

function GenerateGroundId()
    local groundId = math.random(111111, 999999)
    while ServerGround[groundId] do
        groundId = math.random(111111, 999999)
    end
    return groundId
end

-- Stash operations
RegisterServerEvent("codem-inventory:server:openserverstash")
AddEventHandler("codem-inventory:server:openserverstash", function(playerId, stashName, slots, maxWeight, label)
    if slots and slots > 500 then
        slots = 500
    end
    
    if not maxWeight then
        maxWeight = 150000
    end

    local stashExists = ServerStash[stashName] ~= nil
    local stashInventory = {}
    
    if stashExists and ServerStash[stashName].inventory then
        stashInventory = ServerStash[stashName].inventory
    end

    local stashData = {
        inventory = stashInventory,
        slot = slots,
        maxweight = maxWeight,
        stashId = stashName,
        label = label
    }

    if not stashExists then
        ServerStash[stashName] = {
            inventory = {},
            stashname = stashName
        }
    end

    UpdateStashDatabase(stashName, stashInventory)
    TriggerClientEvent("codem-inventory:client:openstash", playerId, stashData)
end)

-- QB/ESX compatibility for stash opening
RegisterServerEvent("inventory:server:OpenInventory")
AddEventHandler("inventory:server:OpenInventory", function(inventoryType, stashName, options)
    local playerId = source
    
    if inventoryType == "traphouse" then
        local label = "STASH"
        local maxWeight = options.weight or 150000
        local slots = options.slots or 5
        
        local stashExists = ServerStash[stashName] ~= nil
        local stashInventory = {}
        
        if stashExists and ServerStash[stashName].inventory then
            stashInventory = ServerStash[stashName].inventory
        end

        local stashData = {
            inventory = stashInventory,
            slot = slots,
            maxweight = maxWeight,
            stashId = stashName,
            label = label
        }

        if not stashExists then
            ServerStash[stashName] = {
                inventory = {},
                stashname = stashName
            }
        end

        UpdateStashDatabase(stashName, stashInventory)
        TriggerClientEvent("codem-inventory:client:openstash", playerId, stashData)
        
    elseif inventoryType == "stash" then
        local label = "STASH"
        local maxWeight = 60000
        local slots = 50
        
        if options and next(options) ~= nil then
            maxWeight = options.maxweight or 60000
            slots = options.slots or 50
        end
        
        if stashName == "personelstash" then
            stashName = GetIdentifier(playerId)
        end
        
        local stashExists = ServerStash[stashName] ~= nil
        local stashInventory = {}
        
        if stashExists and ServerStash[stashName].inventory then
            stashInventory = ServerStash[stashName].inventory
        end

        local stashData = {
            inventory = stashInventory,
            slot = slots,
            maxweight = maxWeight,
            stashId = stashName,
            label = label
        }

        if not stashExists then
            ServerStash[stashName] = {
                inventory = {},
                stashname = stashName
            }
        end

        UpdateStashDatabase(stashName, stashInventory)
        TriggerClientEvent("codem-inventory:client:openstash", playerId, stashData)
    end
end)

RegisterServerEvent("codem-inventory:server:openstash")
AddEventHandler("codem-inventory:server:openstash", function(stashName, slots, maxWeight, label, unknown)
    if slots and slots > 500 then
        slots = 500
    end
    
    if not maxWeight then
        maxWeight = 150000
    end

    local playerId = tonumber(source)
    
    ServerPlayerKey[playerId] = "CODEM" .. math.random(10000, 999999999) .. "saas" .. math.random(10000, 999999999) .. "KEY"
    TriggerClientEvent("codem-inventory:client:setkey", playerId, ServerPlayerKey[playerId])

    if stashName == "personelstash" then
        stashName = GetIdentifier(playerId)
    end

    local stashExists = ServerStash[stashName] ~= nil
    local stashInventory = {}
    
    if stashExists and ServerStash[stashName].inventory then
        stashInventory = ServerStash[stashName].inventory
    end

    local stashData = {
        inventory = stashInventory,
        slot = slots,
        maxweight = maxWeight,
        stashId = stashName,
        label = label
    }

    if not stashExists then
        ServerStash[stashName] = {
            inventory = {},
            stashname = stashName
        }
    end

    UpdateStashDatabase(stashName, stashInventory)
    TriggerClientEvent("codem-inventory:client:openstash", playerId, stashData)
end)

-- Stash item swapping
RegisterServerEvent("codem-inventory:SwapInventoryToStash")
AddEventHandler("codem-inventory:SwapInventoryToStash", function(swapData)
    local playerId = tonumber(source)
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 614 SATIR")
        return
    end

    local item = playerInventory[tostring(swapData.oldSlot)]
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    local stashInventory = ServerStash[swapData.stashId].inventory
    if not stashInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.STASHINVENTORYNOTFOUND)
        return
    end

    local weightCheck = CheckInventoryWeight(stashInventory, item.weight * item.amount, swapData.weight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLESTASH)
        return
    end

    if item.type == "bag" then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.YOUCANNOTPUTABAG)
        return
    end

    local emptySlot = FindFirstEmptySlot(stashInventory, tonumber(swapData.maxslot))
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLESTASH)
        return
    end

    if emptySlot == "nil" or emptySlot == nil then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLESTASH)
        return
    end

    if not item.unique then
        local targetSlot = stashInventory[tostring(swapData.newSlot)]
        if not targetSlot then
            stashInventory[tostring(emptySlot)] = item
            stashInventory[tostring(emptySlot)].slot = tostring(emptySlot)
        else
            local existingSlot = FindExistingItemSlot(stashInventory, item.name)
            if existingSlot then
                stashInventory[tostring(existingSlot)].amount = stashInventory[tostring(existingSlot)].amount + item.amount
            else
                stashInventory[tostring(emptySlot)] = item
                stashInventory[tostring(emptySlot)].slot = tostring(emptySlot)
            end
        end
    else
        stashInventory[tostring(emptySlot)] = item
        stashInventory[tostring(emptySlot)].slot = tostring(emptySlot)
    end

    TriggerClientEvent("codem-inventory:client:removeitemtoclientInventory", playerId, swapData.oldSlot, playerInventory[tostring(swapData.oldSlot)].amount)
    playerInventory[tostring(swapData.oldSlot)] = nil
    
    TriggerClientEvent("codem-inventory:UpdateStashItems", playerId, swapData.stashId, stashInventory)

    if Config.CashItem and item.name == "cash" then
        local totalCash = GetItemsTotalAmount(playerId, "cash")
        local player = GetPlayer(playerId)
        
        if Config.Framework == "qb" or Config.Framework == "oldqb" then
            player.Functions.SetMoney("cash", totalCash)
        else
            player.setMoney(tonumber(totalCash))
        end
    else
        SetInventory(playerId)
    end

    UpdateStashDatabase(swapData.stashId, stashInventory)

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. "-" .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Stash Name: " .. swapData.stashId .. " " .. Locales[Config.Language].notification.INVENTORYTOSTASH
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMSTASH, "green", logData, playerId, "stash")
    end
end)

RegisterServerEvent("codem-inventory:swapStashToInventory")
AddEventHandler("codem-inventory:swapStashToInventory", function(swapData)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    local stashInventory = ServerStash[swapData.stashId].inventory
    local item = stashInventory[swapData.oldSlot]
    
    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 700 SATIR")
        return
    end

    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    local weightCheck = CheckInventoryWeight(playerInventory, item.weight * item.amount, Config.MaxWeight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.INVENTORYISFULL)
        return
    end

    function AddItemToPlayerInventory(slot, itemData)
        if playerInventory[slot] then
            if playerInventory[slot].name == itemData.name and not itemData.unique then
                playerInventory[slot].amount = playerInventory[slot].amount + itemData.amount
            end
        else
            if itemData.unique then
                local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
                if not emptySlot then
                    TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
                    return false
                end
                slot = tostring(emptySlot)
                itemData.slot = slot
                playerInventory[slot] = itemData
                playerInventory[slot].slot = slot
            else
                local emptySlot = FindFirstEmptySlot(playerInventory, Config.MaxSlots)
                if not emptySlot then
                    TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEYOUR)
                    return false
                end
                slot = tostring(emptySlot)
                itemData.slot = slot
                playerInventory[slot] = itemData
                playerInventory[slot].slot = slot
            end
        end
        return slot
    end

    local newSlot = AddItemToPlayerInventory(swapData.newSlot, item)
    if not newSlot then
        return
    end

    newSlot = tostring(newSlot)
    stashInventory[swapData.oldSlot] = nil

    if Config.CashItem and item.name == "cash" then
        AddMoney(playerId, "cash", item.amount)
    else
        SetInventory(playerId)
    end

    TriggerClientEvent("codem-inventory:client:additem", playerId, newSlot, playerInventory[newSlot])
    TriggerClientEvent("codem-inventory:UpdateStashItems", playerId, swapData.stashId, stashInventory)
    
    UpdateStashDatabase(swapData.stashId, stashInventory)
    SetInventory(playerId)

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. "-" .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Stash Name: " .. swapData.stashId .. " " .. Locales[Config.Language].notification.STASHTOINVENTORY
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMS, "green", logData, playerId)
    end
end)

RegisterServerEvent("codem-inventory:swapStashToStash")
AddEventHandler("codem-inventory:swapStashToStash", function(swapData)
    local playerId = source
    
    if cooldown[playerId] then
        return
    else
        cooldown[playerId] = true
        SetTimeout(400, function()
            cooldown[playerId] = nil
        end)
    end

    local identifier = Identifier[playerId]
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    local stashId = swapData.stashId
    local oldSlot = tostring(swapData.oldSlot)
    local newSlot = tostring(swapData.newSlot)

    local stashInventory = ServerStash[stashId]
    if stashInventory then
        stashInventory = ServerStash[stashId].inventory
    end
    
    if not stashInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.STASHINVENTORYNOTFOUND)
        return
    end

    local oldItem = stashInventory[oldSlot]
    if not oldItem then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    local newItem = stashInventory[newSlot]
    
    if newItem and oldItem.name == newItem.name and not oldItem.unique then
        stashInventory[newSlot].amount = stashInventory[newSlot].amount + oldItem.amount
        stashInventory[oldSlot] = nil
    elseif newItem then
        local tempItem = stashInventory[newSlot]
        stashInventory[newSlot] = stashInventory[oldSlot]
        stashInventory[oldSlot] = tempItem
        stashInventory[oldSlot].slot = oldSlot
        stashInventory[newSlot].slot = newSlot
    else
        stashInventory[newSlot] = oldItem
        stashInventory[newSlot].slot = newSlot
        stashInventory[oldSlot] = nil
    end

    UpdateStashDatabase(stashId, stashInventory)
    TriggerClientEvent("codem-inventory:UpdateStashItems", playerId, stashId, stashInventory)
end)

function UpdateStashDatabase(stashName, inventory)
    local query = [[
            INSERT INTO codem_new_stash (stashname, inventory) VALUES (@stashname, @inventory) ON DUPLICATE KEY UPDATE inventory = @inventory
    ]]
    local params = {
        ["@stashname"] = stashName,
        ["@inventory"] = json.encode(inventory)
    }
    
    local success, error = pcall(function()
        UpdateInventorySql(query, params)
    end)
    
    if not success then
        print("Error updating stash database: " .. error)
    end
end

function FindExistingItemSlot(inventory, itemName)
    for slot, item in pairs(inventory) do
        if item.name == itemName then
            return slot
        end
    end
    return nil
end

-- Vehicle inventory operations
RegisterServerEvent("codem-inventory:server:openVehicleGlovebox")
AddEventHandler("codem-inventory:server:openVehicleGlovebox", function(plate, maxWeight, slots, unknown)
    local playerId = source
    
    ServerPlayerKey[playerId] = "CODEM" .. math.random(10000, 999999999) .. "saas" .. math.random(10000, 999999999) .. "KEY"
    TriggerClientEvent("codem-inventory:client:setkey", playerId, ServerPlayerKey[playerId])

    if not plate then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.VEHICLEPLATENOTFOUND)
        return
    end

    plate = customToLower(plate)

    if not GloveBoxInventory[plate] then
        GloveBoxInventory[plate] = {
            glovebox = {},
            plate = plate,
            maxweight = maxWeight or 0,
            slot = slots or 0
        }
        TriggerClientEvent("codem-inventory:client:newVehicleGloveboxPlateInsert", -1, plate, maxWeight, slots)
    end

    local gloveboxData = {
        glovebox = GloveBoxInventory[plate].glovebox,
        slot = GloveBoxInventory[plate].slot,
        maxweight = GloveBoxInventory[plate].maxweight,
        plate = plate
    }

    TriggerClientEvent("codem-inventory:client:openVehicleGlovebox", playerId, gloveboxData)
end)

RegisterServerEvent("codem-inventory:SwapInventoryToVehicleGlovebox")
AddEventHandler("codem-inventory:SwapInventoryToVehicleGlovebox", function(swapData)
    local playerId = source
    local identifier = Identifier[playerId]
    
    if not identifier then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.IDENTIFIERNOTFOUND)
        return
    end

    swapData.newSlot = tostring(swapData.newSlot)
    swapData.oldSlot = tostring(swapData.oldSlot)
    local plate = customToLower(swapData.plate)

    local playerInventory = PlayerServerInventory[identifier]
    if playerInventory then
        playerInventory = PlayerServerInventory[identifier].inventory
    end
    
    if not playerInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.PLAYERINVENTORYNOTFOUND)
        debugprint("DIKKAT ENVANTER BULUNAMADI 880 SATIR")
        return
    end

    local item = playerInventory[swapData.oldSlot]
    if not item then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.ITEMNOTFOUNDINGIVENSLOT)
        return
    end

    if not GloveBoxInventory[plate] then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.VEHICLEPLATENOTFOUND)
        return
    end

    local gloveboxInventory = GloveBoxInventory[plate].glovebox
    if not gloveboxInventory then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLE)
        return
    end

    local emptySlot = FindFirstEmptySlot(gloveboxInventory, tonumber(swapData.maxslot))
    if not emptySlot then
        TriggerClientEvent("codem-inventory:client:notification", playerId, "No empty slot available in the glovebox inventory")
        return
    end

    local emptySlotStr = tostring(emptySlot)
    local itemAmount = playerInventory[swapData.oldSlot].amount or 1
    local targetItem = gloveboxInventory[swapData.newSlot]

    local weightCheck = CheckInventoryWeight(gloveboxInventory, item.weight * item.amount, swapData.weight)
    if not weightCheck then
        TriggerClientEvent("codem-inventory:client:notification", playerId, Locales[Config.Language].notification.NOEMPTYSLOTAVILABLEVEHICLEINVENTORY)
        return
    end

    if targetItem then
        if not item.unique and not targetItem.unique then
            item.slot = emptySlotStr
            gloveboxInventory[emptySlotStr] = item
            playerInventory[swapData.oldSlot] = nil
            TriggerClientEvent("codem-inventory:client:updateVehicleGloveBoxItem", -1, plate, emptySlotStr, gloveboxInventory[emptySlotStr])
        elseif item.name == targetItem.name then
            targetItem.amount = targetItem.amount + item.amount
            playerInventory[swapData.oldSlot] = nil
            TriggerClientEvent("codem-inventory:client:updateVehicleGloveBoxItem", -1, plate, swapData.newSlot, gloveboxInventory[swapData.newSlot])
        else
            item.slot = emptySlotStr
            gloveboxInventory[emptySlotStr] = item
            playerInventory[swapData.oldSlot] = nil
            swapData.newSlot = emptySlotStr
        end
    else
        item.slot = swapData.newSlot
        gloveboxInventory[swapData.newSlot] = item
        playerInventory[swapData.oldSlot] = nil
    end

    if Config.CashItem and item.name == "cash" then
        local totalCash = GetItemsTotalAmount(playerId, "cash")
        local player = GetPlayer(playerId)
        
        if Config.Framework == "qb" or Config.Framework == "oldqb" then
            player.Functions.SetMoney("cash", totalCash)
        else
            player.setMoney(tonumber(totalCash))
        end
    else
        SetInventory(playerId)
    end

    TriggerClientEvent("codem-inventory:client:notification", playerId, "Item moved successfully.")
    TriggerClientEvent("codem-inventory:client:updateVehicleGloveBoxItem", -1, plate, swapData.newSlot, gloveboxInventory[tostring(swapData.newSlot)])
    TriggerClientEvent("codem-inventory:client:removeitemtoclientInventory", playerId, swapData.oldSlot, itemAmount)
    
    UpdateVehicleGlovebox(plate, gloveboxInventory)

    if Config.UseDiscordWebhooks then
        local logData = {
            playername = GetName(playerId) .. "-" .. playerId,
            itemname = item.label,
            amount = item.amount,
            info = item.info or nil,
            reason = "Plate : " .. swapData.plate .. " " .. Locales[Config.Language].notification.INVENTORYTOGLOVEBOX
        }
        TriggerEvent("codem-inventory:CreateLog", Locales[Config.Language].notification.ADDITEMGLOVEBOX, "green", logData, playerId, "glovebox")
    end
end)