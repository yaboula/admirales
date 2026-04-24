local ESX = Framework.object
local QBCore = Framework.object
local QBX = Framework.object
local Ox = Framework.object --[[ @as OxServer ]]

---@class PlayerServer
local player = {}

---@param source number
---@return table?
function player.getPlayerObject(source)
    if Framework.name == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Framework.name == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    elseif Framework.name == 'qbx' then
        return QBX.Functions.GetPlayer(source)
    elseif Framework.name == 'ox' then
        return Ox.GetPlayer(source)
    elseif Framework.name == 'vrp' then
        return vRP.users_by_source[source]
    end
end

---@param playerObj table
function player.getCharId(playerObj)
    if Framework.name == 'esx' then
        return playerObj.getIdentifier()
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.citizenid
    elseif Framework.name == 'ox' then
        return (playerObj --[[ @as OxPlayer ]]).charId
    elseif Framework.name == 'vrp' then
        return playerObj.cid
    else
        return "" --[[ CUSTOM FRAMEWORK ]]
    end
end

---@param playerObj table
---@return string
function player.getCharName(playerObj)
    if Framework.name == 'esx' then
        return playerObj.getName()
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.charinfo.firstname .. " " .. playerObj.PlayerData.charinfo.lastname
    elseif Framework.name == 'vrp' then
        local name = vRP.Identity(playerObj.user_id)
        return name
    end
    return "NOT FOUND"
end

---@param playerObj table
---@return string
function player.getCharBirthday(playerObj)
    if Framework.name == 'esx' then
        return playerObj.get("dateofbirth")
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.charinfo.birthdate
    elseif Framework.name == 'ox' then
        return playerObj.get("birthdate")
    end
end

---@param source number
function player.revive(source)
    TriggerClientEvent('visn_are:resetHealthBuffer', source)

    if GetResourceState('wasabi_ambulance_v2') == "started" then
        exports['wasabi_ambulance_v2']:RevivePlayer(source)
    elseif GetResourceState('wasabi_ambulance') == "started" then
        exports.wasabi_ambulance:RevivePlayer(source)
    elseif GetResourceState("qs-medical-creator") == "started" then
        TriggerClientEvent('ambulance:revivePlayer', source, true, true)
    elseif GetResourceState('ars_ambulancejob') == "started" then
        TriggerClientEvent('ars_ambulancejob:healPlayer', source, { revive = true })
    elseif GetResourceState('tk_ambulancejob') == "started" then
        exports.tk_ambulancejob:revive(source, true)
    else
        if Framework.name == 'qb' or Framework.name == 'qbx' then
            TriggerClientEvent('hospital:client:Revive', source)
            TriggerClientEvent('qbx_medical:client:playerRevived', source)
        elseif Framework.name == 'esx' then
            TriggerClientEvent('esx_ambulancejob:revive', source)
            Player(source).state:set('isDead', false, true)
        end
    end

    Luxu.triggerClientEvent("actions:revive", source)

    TriggerClientEvent('refine-hp:client:Revive', source)
    TriggerClientEvent('refine-hp:client:adminHeal', source)
end

---@param source number
---@param playerObj table
---@return string?
function player.getPhoneNumber(source, playerObj)
    if GetResourceState("okokPhone") == "started" then
        return exports['okokPhone']:getPhoneNumberFromSource(source)
    end

    if GetResourceState("lb-phone") == "started" then
        return Player(source).state.phoneNumber
    end

    if GetResourceState("qs-smartphone-pro") == "started" then
        local id = playerObj?.PlayerData?.citizenid or playerObj.identifier
        return exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(id, false) --[[@as string]]
    end

    if Framework.name == 'esx' then
        return Player(source).state.phoneNumber
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.charinfo.phone
    end
end

---@param playerObj table
---@return table<string,number>
function player.getMoneyAccounts(playerObj)
    if Framework.name == 'esx' then
        local data = playerObj.getAccounts()
        local accounts = {}
        for _, a in ipairs(data) do
            accounts[a.name] = a.money
        end
        return accounts
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.money
    elseif Framework.name == 'ox' then
        local account = playerObj.getAccount()
        return { bank = account.get("balance") } --[[ @as table {[string]:number} ]]
    elseif Framework.name == 'vrp' then
        return { bank = vRP.getBank({ playerObj }), money = vRP.getMoney({ playerObj }) }
    else
        return {} --[[ CUSTOM FRAMEWORK ]]
    end
end

function player.setAccountMoney(source, playerObj, account, amount)
    -- Cash as Item ? Missing checks?
    if account == 'cash' and GetResourceState('ox_inventory') == 'started' then
        local current = exports.ox_inventory:GetItem(source, 'cash', nil, true) --[[ @as number ]]
        exports.ox_inventory:RemoveItem(source, 'cash', current or 0)
        exports.ox_inventory:AddItem(source, 'cash', amount)
    end

    if Framework.name == 'esx' then
        playerObj.setAccountMoney(account, amount)
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        playerObj.Functions.SetMoney(account, amount)
    elseif Framework.name == 'ox' then
        --[[    playerObj.setAccountMoney(account, amount) ]]
    end
end

---@param source number
---@param playerObj table
---@param item string
---@param count number
---@param slot? number
function player.removeItem(source, playerObj, item, count, slot)
    if Framework.name == 'esx' then
        playerObj.removeInventoryItem(item, count)
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        playerObj.Functions.RemoveItem(item, count)
    elseif Framework.name == 'ox' then
        exports.ox_inventory:RemoveItem(source, item, count, nil, slot)
    else
        --[[ CUSTOM FRAMEWORK ]]
    end
end

---@return boolean
function player:canCarryItem(source, playerObj, item, count)
    if GetResourceState("ox_inventory") == "started" then
        return exports.ox_inventory:CanCarryItem(source, item, count) == true
    elseif GetResourceState("origen_inventory") == "started" then
        return exports.origen_inventory:CanCarryItem(source, item, count)
    elseif GetResourceState("qs-inventory") == "started" then
        return exports['qs-inventory']:CanCarryItem(source, item, count)
    elseif GetResourceState("tgiann-inventory") == "started" then
        return exports["tgiann-inventory"]:CanCarryItem(source, item, count)
    elseif GetResourceState("core_inventory") == "started" then
        local inventory = 'content-' .. (self.getCharId(playerObj)):gsub(":", "")
        return exports['core_inventory']:canCarry(inventory, item, count)
    else
        return true
    end
end

function player.addItem(playerObj, item, count)
    if Framework.name == 'esx' then
        return playerObj.addInventoryItem(item, count)
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.addInventoryItem(item, count)
    end
end

---@param playerObj table
---@param status "thirst" | "hunger"
---@param value number
function player.setStatus(playerObj, status, value)
    if Framework.name == 'esx' then
        --[[ return playerObj.setStatus(status) ]]
        TriggerClientEvent('esx_status:set', playerObj.source, status, 1000000)
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        playerObj.Functions.SetMetaData(status, value)
        if status == 'hunger' or status == 'thirst' then
            TriggerClientEvent('hud:client:UpdateNeeds', playerObj.PlayerData.source,
                playerObj.PlayerData.metadata['hunger'],
                playerObj.PlayerData.metadata['thirst'])
        end
    elseif Framework.name == 'ox' then
        playerObj.setStatus(status, value)
    end
end

function player.setJob(playerObj, job, grade)
    if Framework.name == 'esx' then
        playerObj.setJob(job, grade)
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        playerObj.Functions.SetJob(job, grade)
    end
end

---@param playerObj table
---@return {name:string, label:string, grade:number, gradeName:string, duty:boolean} | nil
function player.getJob(playerObj)
    if Framework.name == 'esx' then
        local job = playerObj.getJob()
        if not job or not job.name then return nil end

        return {
            name = job.name,
            label = job.label or job.name,
            grade = job.grade,
            gradeName = job.grade_label,
            duty = job.onDuty and not job.name:find("off_"),
        }
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        if not playerObj.PlayerData.job or not playerObj.PlayerData.job.name then return nil end

        return {
            name = playerObj.PlayerData.job.name,
            label = playerObj.PlayerData.job.label or playerObj.PlayerData.job.name,
            grade = playerObj.PlayerData.job.grade.level,
            gradeName = playerObj.PlayerData.job.grade.name,
            duty = playerObj.PlayerData.job.duty,
        }
    end
end

---@param playerObj table
---@return {name:string, label:string, grade: {name:string, level:number, isboss:boolean}} | nil
function player.getGang(playerObj)
    if Framework.name == 'esx' then
        return nil -- ESX uses jobs for gangs
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData
            .gang --[[ @as {name:string, label:string, grade: {name:string, level:number, isboss:boolean}} ]]
    elseif Framework.name == 'ox' then
        return nil
    else
        return nil --[[ CUSTOM FRAMEWORK ]]
    end
end

---@param source number
---@return {id:string?, name:string, birthday:string?, phoneNumber:string?, job:{name:string, label:string, grade:number, gradeName:string, duty:boolean}?, gang:{name:string, label:string, grade:{name:string, level:number, isboss:boolean}}?}?
function player.getCharacterData(source)
    local playerObj = player.getPlayerObject(source)
    if not playerObj then return nil end

    return {
        id = player.getCharId(playerObj),
        name = player.getCharName(playerObj),
        birthday = player.getCharBirthday(playerObj),
        phoneNumber = player.getPhoneNumber(source, playerObj),
        job = player.getJob(playerObj),
        gang = player.getGang(playerObj)
    }
end

---@param playerObj table
---@param gang string
---@param grade number
function player.setGang(playerObj, gang, grade)
    if Framework.name == "qb" or Framework.name == "qbx" then
        playerObj.Functions.SetGang(gang, grade)
    end
end

function player.giveVehicleKeys(source, plate, modelHash)
    local resources = {
        { name = "okokGarage",     event = "okokGarage:GiveKeys", args = { source, plate },                  type = "server" },
        { name = "qb-vehiclekeys", event = 'GiveKeys',            args = { source, plate },                  type = "export" },
        { name = "qs-vehiclekeys", event = 'GiveServerKeys',      args = { source, plate, modelHash, true }, type = "export" },
        { name = "cd_garage",      event = 'cd_garage:AddKeys',   args = { source, plate },                  type = "client" },
        { name = "gflp10-carkeys", event = 'AddCarkey',           args = { source, modelHash, plate },       type = "export" },
        { name = "wasabi_carlock", event = 'GiveKey',             args = { source, plate, false },           type = "export" }
    }

    if GetResourceState("qbx_vehiclekeys") == "started" and GetResourceState("qbx_vehicles") == "started" then
        local vehicle = exports.qbx_vehicles:GetVehicleIdByPlate(plate)
        if vehicle then
            return exports.qbx_vehiclekeys:GiveKeys(source, vehicle)
        end
    end

    for _, resource in ipairs(resources) do
        if GetResourceState(resource.name) == "started" then
            if resource.type == "server" then
                return TriggerEvent(resource.event, table.unpack(resource.args))
            elseif resource.type == "client" then
                return TriggerClientEvent(resource.event, table.unpack(resource.args))
            elseif resource.type == "export" then
                return exports[resource.name][resource.event](exports[resource.name][resource.event],
                    table.unpack(resource.args))
            end
        end
    end
    ---Fallback for clientside exports
    TriggerClientEvent("vehiclekeys:client:SetOwner", source, plate)
    --- Check client/player.lua
    TriggerClientEvent('luxu_admin:client:giveVehicleKeys', source, plate, modelHash)
end

function player.getGender(playerObj)
    if Framework.name == 'esx' then
        return playerObj.get("sex") == 0 and "male" or "female"
    elseif Framework.name == 'qb' or Framework.name == 'qbx' then
        return playerObj.PlayerData.charinfo.gender == 0 and "male" or "female"
    end
end

function player.openClothingMenu(source)
    if GetResourceState('illenium-appearance') == "started" then
        TriggerClientEvent("illenium-appearance:client:openClothingShop", source, true)
    elseif GetResourceState('qb-clothing') == "started" then
        TriggerClientEvent('qb-clothing:client:openMenu', source)
    elseif GetResourceState('esx_skin') == "started" then
        TriggerClientEvent('esx_skin:openSaveableMenu', source)
    elseif GetResourceState("dpclothing") == "started" or GetResourceState("dpclothing-master") == "started" then
        TriggerClientEvent("dpc:ToggleMenu", source)
    elseif GetResourceState("rcore_clothing") == "started" then
        TriggerClientEvent('rcore_clothing:openShop', source, "binco")
    elseif GetResourceState("ak47_clothing") == "started" then
        TriggerClientEvent('ak47_clothing:openOutfit', source)
    elseif GetResourceState("ak47_qb_clothing") == "started" then
        TriggerClientEvent('ak47_qb_clothing:openOutfit', source)
    elseif GetResourceState("qs-appearance") == "started" then
        TriggerClientEvent("illenium-appearance:client:openClothingShop", source, true)
    elseif GetResourceState("codem-appearance") == "started" then
        TriggerClientEvent('codem-appearance:OpenClothing', source)
        TriggerClientEvent("qb-clothing:client:openMenu", source)
    elseif GetResourceState("0r-clothingv2") == "started" then
        TriggerClientEvent('0r-clothing:openCharacterCreationMenu', source, true, true)
    end
end

return player
