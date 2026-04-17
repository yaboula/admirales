Core = nil
Config.Framework = "Standalone"

local hasDonePreloading = {}
local startTime = GetGameTimer()

while Core == nil do
    TriggerEvent("__cfx_export_qb-core_GetCoreObject", function(getCore)
        Core = getCore()
        Config.Framework = "QBCore"
    end)

    TriggerEvent("__cfx_export_es_extended_getSharedObject", function(getCore)
        Core = getCore()
        Config.Framework = "ESX"
    end)

    Citizen.Wait(1000)

    if GetGameTimer() - startTime >= 10000 and Core == nil then
        Functions.Print(
        "Cannot fetch your framework. Please make sure you're using ESX & QBCore, and you're starting Character System after your framework")
    end
end

if Config.Framework == "QBCore" then
    AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
        Wait(1000)
        hasDonePreloading[Player.PlayerData.source] = true
    end)

    AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
        hasDonePreloading[src] = false
    end);

    if Location.EnableApartments ~= 'ps-housing' then
        Core.Functions.CreateCallback('17mov_CharacterSystem:getOwnedHouses', function(src, cb)
            local cid = Core.Functions.GetPlayer(src)?.PlayerData?.citizenid

            if cid ~= nil then
                local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', { cid })
                cb(houses)
            else
                cb({})
            end
        end)
    else
        Core.Functions.CreateCallback('17mov_CharacterSystem:getOwnedHouses', function(src, cb)
            local cid = Core.Functions.GetPlayer(src)?.PlayerData?.citizenid
            if cid ~= nil then
                local houses = MySQL.query.await('SELECT * FROM properties WHERE owner_citizenid = ?', {cid})
                cb(houses)
            else
                cb({})
            end
        end)
    end

    function GiveStarterItems(source)
        local src = source
        local Player = Core.Functions.GetPlayer(src)
        ---@diagnostic disable-next-line: undefined-field
        for _, v in pairs(Core?.Shared.StarterItems) do
            local info = {}
            if v.item == "id_card" then
                info.citizenid = Player.PlayerData.citizenid
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                info.gender = Player.PlayerData.charinfo.gender
                info.nationality = Player.PlayerData.charinfo.nationality
            elseif v.item == "driver_license" then
                info.firstname = Player.PlayerData.charinfo.firstname
                info.lastname = Player.PlayerData.charinfo.lastname
                info.birthdate = Player.PlayerData.charinfo.birthdate
                info.type = "Class C Driver License"
            end
            Player.Functions.AddItem(v.item, v.amount, false, info, 'qb-multicharacter:GiveStarterItems')
        end
    end

    function LoadHouseData(src)
        if Location.EnableApartments ~= 'ps-housing' then
            local HouseGarages = {}
            local Houses = {}
            ---@diagnostic disable-next-line: undefined-global
            local result = MySQL.query.await('SELECT * FROM houselocations', {})
            if result[1] ~= nil then
                for _, v in pairs(result) do
                    local owned = false
                    if tonumber(v.owned) == 1 then
                        owned = true
                    end
                    local garage = v.garage ~= nil and json.decode(v.garage) or {}
                    Houses[v.name] = {
                        coords = json.decode(v.coords),
                        owned = owned,
                        price = v.price,
                        locked = true,
                        adress = v.label,
                        tier = v.tier,
                        garage = garage,
                        decorations = {},
                    }
                    HouseGarages[v.name] = {
                        label = v.label,
                        takeVehicle = garage,
                    }
                end
            end
            TriggerClientEvent("qb-garages:client:houseGarageConfig", src, HouseGarages)
            TriggerClientEvent("qb-houses:client:setHouseConfig", src, Houses)
        else
            TriggerClientEvent("qb-houses:client:setHouseConfig", src, true)
        end
    end
elseif Config.Framework == "ESX" then
    function ChangeESXConfig(path)
        local ESXConfigPath = GetResourcePath('es_extended') .. path
        local file = io.open(ESXConfigPath, "r")

        if not file then
            return false
        end

        local content = file:read("*all")
        file:close()

        if not content then
            Functions.Print(
            "Cannot read your es_extended config file. Please make sure that Config.Multichar in your es_extended is set to true")
            return false
        end

        local multicharExists = string.match(content, 'Config.Multichar%s*=%s*')

        if multicharExists then
            local currentMulticharValue = string.match(content, 'Config.Multichar%s*=%s*(%a+)')
            if currentMulticharValue ~= "true" then
                local updatedContent = string.gsub(content, '(Config.Multichar%s*=%s*)[^;\r\n]*', '%1true')

                file = io.open(ESXConfigPath, "w")

                if not file then
                    Functions.Print(
                    "Cannot open your es_extended config file. Please make sure that Config.Multichar in your es_extended is set to true")
                    return false
                end

                file:write(updatedContent)
                file:close()
                Functions.Print(
                "Automatically changed your es_extended/config.lua:Config.Multichar to true as it's required")
            end
        else
            Functions.Print(
            "Config.Multichar not found in your es_extended config file. Please make sure that Config.Multichar in your es_extended is set to true")
        end

        return true
    end

    CreateThread(function()
        -- OLD ESX METHOD
        if not ChangeESXConfig('/config.lua') then
            -- NEW ESX METHOD
            if not ChangeESXConfig('/shared/config/main.lua') then
                Functions.Print(
                "Cannot open your es_extended config file. Please make sure that Config.Multichar in your es_extended is set to true")
            end
        end
    end)
end

-- Fetching discord user roles from guild
function FetchDiscordRoles(memberId)
    local promise = promise.new()

    if memberId == nil then
        promise:resolve(nil)
        return
    end

    PerformHttpRequest(
    string.format("https://discord.com/api/v10/guilds/%s/members/%s", Selector.Discord.Guild, memberId),
        function(status, body)
            if status ~= 200 then
                promise:resolve(nil)
                return
            end

            local user = json.decode(body)
            promise:resolve(user.roles)
        end, "GET", "", {
        ["Authorization"] = string.format("Bot %s", Selector.Discord.Token),
        ['Content-Type'] = 'application/json'
    })

    return Citizen.Await(promise)
end

local function NormalizeSlots(value, fallback)
    local slots = tonumber(value) or tonumber(fallback) or 1
    slots = math.floor(slots)

    if slots < 1 then
        slots = 1
    elseif slots > 9 then
        slots = 9
    end

    return slots
end

local function ListHasValue(list, value, caseInsensitive)
    if type(list) ~= "table" or value == nil then
        return false
    end

    local lookup = tostring(value)
    if caseInsensitive then
        lookup = lookup:lower()
    end

    for key, entry in pairs(list) do
        local candidate

        if type(entry) == "string" or type(entry) == "number" then
            candidate = tostring(entry)
        elseif type(key) == "string" and entry == true then
            candidate = key
        end

        if candidate then
            if caseInsensitive then
                candidate = candidate:lower()
            end

            if candidate == lookup then
                return true
            end
        end
    end

    return false
end

local function BuildIdentifierLookup(src)
    local lookup = {}
    local identifiers = GetPlayerIdentifiers(src)

    if type(identifiers) ~= "table" then
        return lookup
    end

    for i = 1, #identifiers do
        local identifier = identifiers[i]
        if type(identifier) == "string" and identifier ~= "" then
            lookup[identifier] = true
        end
    end

    return lookup
end

local function RuleMatchesIdentifiers(identifierLookup, identifiers)
    if type(identifierLookup) ~= "table" or type(identifiers) ~= "table" then
        return false
    end

    for key, entry in pairs(identifiers) do
        local identifier

        if type(entry) == "string" then
            identifier = entry
        elseif type(key) == "string" and entry == true then
            identifier = key
        end

        if identifier and identifierLookup[identifier] then
            return true
        end
    end

    return false
end

local function RuleMatchesAce(src, acePermissions)
    if type(acePermissions) ~= "table" then
        return false
    end

    for _, permission in pairs(acePermissions) do
        if type(permission) == "string" and IsPlayerAceAllowed(src, permission) then
            return true
        end
    end

    return false
end

local function RuleMatchesQBCorePermission(src, qbPermissions)
    if type(qbPermissions) ~= "table" then
        return false
    end

    if Config.Framework ~= "QBCore" or not Core or not Core.Functions or not Core.Functions.HasPermission then
        return false
    end

    for _, permission in pairs(qbPermissions) do
        if type(permission) == "string" and Core.Functions.HasPermission(src, permission) then
            return true
        end
    end

    return false
end

local function RuleMatchesDiscordRoles(userRoles, configuredRoles)
    if type(userRoles) ~= "table" or type(configuredRoles) ~= "table" then
        return false
    end

    for _, role in pairs(userRoles) do
        if ListHasValue(configuredRoles, role, false) then
            return true
        end
    end

    return false
end

-- Returns max character slots for player
Selector.GetMaxSlots = function(src)
    local identifier = GetPlayerIdentifierByType(src, Config.PrimaryIdentifier)
    local maxCharacters = NormalizeSlots(Selector.MaxCharacters, 1)

    if identifier and Selector.PlayerMaxCharacters[identifier] ~= nil then
        maxCharacters = NormalizeSlots(Selector.PlayerMaxCharacters[identifier], maxCharacters)
    end

    -- esx_multicharacter support
    ---@diagnostic disable-next-line: undefined-global
    if identifier and MySQL.scalar.await("SELECT COUNT(*) FROM information_schema.tables WHERE table_name = 'multicharacter_slots' AND table_schema = DATABASE()") > 0 then
        ---@diagnostic disable-next-line: undefined-global
        local databaseSlots = MySQL.scalar.await('SELECT slots FROM multicharacter_slots WHERE identifier = ?', { identifier })
        if databaseSlots ~= nil then
            maxCharacters = NormalizeSlots(databaseSlots, maxCharacters)
        end
    end

    local playerJob
    local playerGang
    local playerGroup

    if Config.Framework == "QBCore" and Core and Core.Functions and Core.Functions.GetPlayer then
        local player = Core.Functions.GetPlayer(src)
        if player and player.PlayerData then
            playerJob = player.PlayerData.job and player.PlayerData.job.name or nil
            playerGang = player.PlayerData.gang and player.PlayerData.gang.name or nil
        end
    elseif Config.Framework == "ESX" and Core and Core.GetPlayerFromId then
        local xPlayer = Core.GetPlayerFromId(src)
        if xPlayer then
            playerJob = xPlayer.job and xPlayer.job.name or nil
            playerGang = xPlayer.job2 and xPlayer.job2.name or nil
            playerGroup = xPlayer.getGroup and xPlayer.getGroup() or nil
        end
    end

    local userRoles
    local shouldFetchDiscordRoles = false

    if Selector.Discord and Selector.Discord.Enable then
        if type(Selector.Discord.Roles) == "table" and next(Selector.Discord.Roles) ~= nil then
            shouldFetchDiscordRoles = true
        end

        if Selector.SlotAccess and Selector.SlotAccess.Enable and type(Selector.SlotAccess.Rules) == "table" then
            for _, rule in pairs(Selector.SlotAccess.Rules) do
                if type(rule) == "table" and type(rule.discordRoles) == "table" and next(rule.discordRoles) ~= nil then
                    shouldFetchDiscordRoles = true
                    break
                end
            end
        end
    end

    if shouldFetchDiscordRoles then
        local discordId = GetPlayerIdentifierByType(src, "discord")
        if discordId then
            userRoles = FetchDiscordRoles(discordId:gsub("discord:", ""))
        end
    end

    if type(userRoles) == "table" and Selector.Discord and Selector.Discord.Enable and type(Selector.Discord.Roles) == "table" then
        local discordSlots = 0

        for _, role in pairs(userRoles) do
            if Selector.Discord.Roles[role] ~= nil then
                local roleSlots = NormalizeSlots(Selector.Discord.Roles[role], maxCharacters)
                if roleSlots > discordSlots then
                    discordSlots = roleSlots
                end
            end
        end

        if discordSlots > 0 then
            maxCharacters = discordSlots
        end
    end

    if Selector.SlotAccess and Selector.SlotAccess.Enable and type(Selector.SlotAccess.Rules) == "table" then
        local mode = tostring(Selector.SlotAccess.Mode or "highest"):lower()
        local identifierLookup = BuildIdentifierLookup(src)

        for _, rule in pairs(Selector.SlotAccess.Rules) do
            if type(rule) == "table" then
                local ruleSlots = NormalizeSlots(rule.slots or rule.maxSlots, maxCharacters)
                local isMatched = false

                if RuleMatchesIdentifiers(identifierLookup, rule.identifiers) then
                    isMatched = true
                end

                if not isMatched and ListHasValue(rule.jobs, playerJob, true) then
                    isMatched = true
                end

                if not isMatched and ListHasValue(rule.gangs, playerGang, true) then
                    isMatched = true
                end

                if not isMatched and ListHasValue(rule.esxGroups, playerGroup, true) then
                    isMatched = true
                end

                if not isMatched and RuleMatchesQBCorePermission(src, rule.qbPermissions) then
                    isMatched = true
                end

                if not isMatched and RuleMatchesAce(src, rule.acePermissions) then
                    isMatched = true
                end

                if not isMatched and RuleMatchesDiscordRoles(userRoles, rule.discordRoles) then
                    isMatched = true
                end

                if isMatched then
                    if mode == "first" then
                        maxCharacters = ruleSlots
                        break
                    elseif ruleSlots > maxCharacters then
                        maxCharacters = ruleSlots
                    end
                end
            end
        end
    end

    return NormalizeSlots(maxCharacters, 1)
end

-- Setup your own code after selecting character
Selector.CharacterChoosen = function(src, isNew)
    if Config.Framework == "QBCore" then
        repeat
            Wait(10)
        until hasDonePreloading[src];

        Core.Commands.Refresh(src)

        if Location.EnableQBHousing then
            LoadHouseData(src)
        end

        if isNew then
            GiveStarterItems(src)
        end
    elseif Config.Framework == "ESX" then

    end
end

if Selector.Relog then
    local function HasLogoutPermission(src)
        if type(src) ~= "number" or src <= 0 then
            return false
        end

        if Config.Framework == "QBCore" and Core and Core.Functions and Core.Functions.HasPermission then
            return Core.Functions.HasPermission(src, "admin") or Core.Functions.HasPermission(src, "god")
        end

        if Config.Framework == "ESX" and Core and Core.GetPlayerFromId then
            local xPlayer = Core.GetPlayerFromId(src)
            if xPlayer and xPlayer.getGroup then
                local group = xPlayer.getGroup()
                return group == "admin" or group == "superadmin"
            end
        end

        return IsPlayerAceAllowed(src, "group.admin")
    end

    local function LogoutToSelector(src)
        if not src or src <= 0 then
            return
        end

        if Config.Framework == "QBCore" then
            Core.Player.Logout(src)
        elseif Config.Framework == "ESX" then
            TriggerEvent("esx:playerLogout", src)
        end

        TriggerClientEvent("17mov_CharacterSystem:OpenSelector", src)
    end

    RegisterCommand("relog", function(src)
        LogoutToSelector(src)
    end, false)

    -- /logout alias with admin-only access (0r parity).
    RegisterCommand("logout", function(src)
        if not HasLogoutPermission(src) then
            Functions.Print(string.format("Blocked /logout from source %s (missing admin permission)", tostring(src)))
            return
        end

        LogoutToSelector(src)
    end, false)
end


if GetResourceState("rcore_clothing") ~= "missing" then
    function ChangeCharactersProperties(characters)
        for i = 1, #characters do
            if characters[i].used then
                local skin

                -- Try identifier, then citizenid
                local primary = characters[i].identifier
                if primary and primary ~= "" then
                    skin = exports["rcore_clothing"]:getSkinByIdentifier(primary)
                end

                if not (skin and skin.skin) then
                    local secondary = characters[i].citizenid
                    if secondary and secondary ~= "" then
                        skin = exports["rcore_clothing"]:getSkinByIdentifier(secondary)
                    end
                end

                -- Try composite key only if both parts exist
                if not (skin and skin.skin) then
                    local cid = characters[i].citizenid
                    local id = characters[i].identifier
                    if cid and id and cid ~= "" and id ~= "" then
                        skin = exports["rcore_clothing"]:getSkinByIdentifier(string.format("%s:%s", cid, id))
                    end
                end

                if skin and skin.skin then
                    skin.skin.model = skin.ped_model
                    characters[i].skinData = skin.skin
                end
            end
        end

        return characters
    end
end
