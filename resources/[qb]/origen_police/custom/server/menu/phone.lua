local PhoneStructure = {

    ["qs-smartphone"] = {

        table = {

            ["qbcore"] = "players",

            ["esx"] = "users"

        },

        label = {

            ["qbcore"] = "charinfo",

            ["esx"] = "phone_number"

        },

        decoder = function(data)

            if Config.Framework == "qbcore" then 

                return data ~= nil and json.decode(data).phone or nil

            end

            return data

        end,

        identifier = {

            ["qbcore"] = "citizenid",

            ["esx"] = "identifier"

        },

        queryMethod = MySQL.awaitPrepare,

    },

    ["qs-smartphone-pro"] = "qs-smartphone",

    ["lb-phone"] = {

        table = "phone_phones",

        label = "phone_number",

        identifier = "owner_id"

    },

    ["gksphone"] = {

        table = "gksphone_settings",

        label = "phone_number",

        identifier = "identifier"

    },

    ["yseries"] = {

        table = "yphone_sim_cards",

        label = "sim_number",

        identifier = "phone_imei"

    },

    ["default"] = {

        ["qbcore"] = {

            table = "players",

            label = "charinfo",

            identifier = "citizenid",

            decoder = function(data)

                return data == nil and json.decode(data).phone or nil

            end,

            queryMethod = MySQL.awaitPrepare

        },

        ["esx"] = {

            table = "users",

            label = "phone_number",

            identifier = "identifier"

        }

    }

}

PhoneStructure = ParseScriptStructure(PhoneStructure, Config.Phone, 2)

function GetPhoneFromIdentifier(citizenid)

    return GetDataFromStructure(PhoneStructure, true, 300, 2, citizenid, 'XXXXXXXX')

end

