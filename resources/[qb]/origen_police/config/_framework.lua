Config = {}

Config.Framework = "auto"
Config.MySQLSystem = "oxmysql"
Config.Language = "core"
Config.CustomNotify = false
Config.HousingSystem = "auto"
Config.VoiceSystem = "pma-voice"
-- [INST INST-028] 17mov_CharacterSystem no está en la lista de clothings soportados — 2026-04-23
-- OpenClothing() cae al else y solo imprime "No supported clothing found." sin crash.
-- SetCriminalClothes() skip silencioso. Funcionalidad de uniformes desactivada intencionalmente.
Config.Clothing = "default"
Config.Phone = "auto"
Config.Inventory = "auto"
Config.OxLibMenu = false
Config.Debug = true
Config.PoliceJobName = "police"
-- [INST INST-028] false = dispatch sin requerir item 'radio' en inventario.
-- Cuando se distribuya el item 'radio' a los policías, volver a true.
Config.NeedRadioForDispatch = false
Config.EvidenceDrawDistance = 20.0
Config.ConfiscateSystem = true
Config.AutoSetCriminalClothe = true
-- [INST INST-028] Bug de decompile en client/main.lua:835 — L0_1.enabled nunca se inicializa,
-- causa "attempt to compare boolean with nil" cuando el jugador entra en vehículo.
-- Rompe el módulo de radar y speedometer. Desactivado hasta parche oficial o RAC.
Config.ShowCurrentStreet = false
Config.ChangeMinimapSize = true
Config.ShowGuideButton = true
Config.CheckVersions = true
exports("GetConfig", function(key)

    return Config[key]

end)

if Config.Debug then

    function Debuger(...)

        print ('[^5Origen Police^0]', ...)

    end

else

    Debuger = function() end

end

if Config.Framework == "auto" then

    Config.Framework = GetResourceState("qb-core") == "started" and "qbcore" or "esx"

end

Config.Translations = Translations

Config.LogsTranslations = LogsTranslations

MySQL = {}

if Config.Language == "core" then

    Config.Language = GetConvar(Config.Framework == "esx" and "esx:locale" or "qb_locale", "en"):lower()

    if Config.Language:find("-") then

        Config.Language = Config.Language:sub(1, Config.Language:find("-") - 1)

    end

    if  Config.Language ~= "en" and

        Config.Language ~= "es" and

        Config.Language ~= "fr" and

        Config.Language ~= "it" and

        Config.Language ~= "cn" and

        Config.Language ~= "hu"

        then

        Config.Language = "en"

    end

end

local supportedInventories = {

    {name = "origen_inventory", resource = "origen_inventory", upperVersion=nil},

    {name = "qb-inventory", resource = "qb-inventory", upperVersion=nil},

    {name = "new-qb-inventory", resource = "qb-inventory", upperVersion={2, 0, 0}},

    {name = "qs-inventory", resource = "qs-inventory", upperVersion=nil},

    {name = "ox_inventory", resource = "ox_inventory", upperVersion=nil},

    {name = "ls-inventory", resource = "ls-inventory", upperVersion=nil},

    {name = "codem-inventory", resource = "codem-inventory", upperVersion=nil},

    {name = "core_inventory", resource = "core_inventory", upperVersion=nil},

    {name = "tgiann-inventory", resource = "tgiann-inventory", upperVersion=nil},

}

local supportedClothings = {

    {name = "illenium-appearance", resource = "illenium-appearance", upperVersion=nil},

    {name = "qb-clothing", resource = "qb-clothing", upperVersion=nil},

    {name = "fivem-appearance", resource = "fivem-appearance", upperVersion=nil},

    {name = "esx_skin", resource = "esx_skin", upperVersion=nil},

    {name = "codem-appearance", resource = "codem-appearance", upperVersion=nil},

    {name = "tgiann-clothing", resource = "tgiann-clothing", upperVersion=nil},

    {name = "dx_clothing", resource = "dx_clothing", upperVersion=nil},

    {name = "rcore_clothing", resource = "rcore_clothing", upperVersion=nil},

}

local supportedPhones = {

    {name = "qs-smartphone", resource = "qs-smartphone", upperVersion=nil},

    {name = "qs-smartphone-pro", resource = "qs-smartphone-pro", upperVersion=nil},

    {name = "gksphone", resource = "gksphone", upperVersion=nil},

    {name = "lb-phone", resource = "lb-phone", upperVersion=nil},

    {name = "yseries", resource = "yseries", upperVersion=nil},

}

local supportedHousings = {

    {name = "origen_housing", resource = "origen_housing", upperVersion=nil},

    {name = "qs-housing", resource = "qs-housing", upperVersion=nil},

    {name = "esx_property", resource = "esx_property", upperVersion=nil},

}

local function checkResource(configKey, supportedResources, defaultValue)

    for _, v in pairs(supportedResources) do

        if GetResourceState(v.resource) == "started" then

            if v.upperVersion then

                local version = GetResourceMetadata(v.resource, "version", 0)

                local versionTable = {}

                for w in string.gmatch(version, "%d+") do

                    table.insert(versionTable, tonumber(w))

                end

                if versionTable[1] >= v.upperVersion[1] and versionTable[2] >= v.upperVersion[2] and versionTable[3] >= v.upperVersion[3] then

                    Config[configKey] = v.name

                    return

                end

            else

                Config[configKey] = v.name

                return

            end

        end

    end

    if defaultValue then

        Config[configKey] = defaultValue

    else

        print("^1[Origen Police]^0 Couldn't find any supported " .. configKey .. " system, please set it manually in config/_framework.lua")

    end

end

if Config.Inventory == "auto" then

    checkResource("Inventory", supportedInventories)

end

if Config.Clothing == "auto" then

    checkResource("Clothing", supportedClothings)

end

if Config.Phone == "auto" then

    checkResource("Phone", supportedPhones, "default")

end

if Config.HousingSystem == "auto" then

    checkResource("HousingSystem", supportedHousings, "default")

end

