function GetVehiclesByIdentifier(identifier)

    local status, data = pcall(function()

        if Config.Framework == "qbcore" then

            return MySQL.awaitQuery('SELECT hash, plate, wanted, garage FROM player_vehicles WHERE citizenid = ?', {identifier})

        else

            return MySQL.awaitQuery('SELECT plate, wanted, vehicle FROM owned_vehicles WHERE owner = ?', {identifier})

        end

    end)

    if not status then

        return {}

    end

    return data

end

function SearchDataFromVehicle(plate)

    if type(plate) ~= "string" then
        if Config and Config.Debug then
            print(("[origen_police][SearchDataFromVehicle] tipo inválido: %s"):format(type(plate)))
        end
        return {}
    end
    -- Normaliza entrada: trim + MAYÚSCULAS + sin espacios internos (QB guarda
    -- placas con padding/espacios; el NUI suele mandar minúsculas/trim flojo).
    local raw = plate
    plate = plate:match("^%s*(.-)%s*$") or ""
    plate = plate:upper():gsub("%s+", "")
    if plate == "" then
        if Config and Config.Debug then
            print("[origen_police][SearchDataFromVehicle] placa vacía tras normalizar")
        end
        return {}
    end
    local likepat = "%" .. plate .. "%"

    if Config and Config.Debug then
        print(("[origen_police][SearchDataFromVehicle] raw=%q norm=%q like=%q fw=%s")
            :format(raw, plate, likepat, tostring(Config.Framework)))
    end

    local status, data = pcall(function()

        if Config.Framework == "qbcore" then
            -- LEFT JOIN: evita perder filas si falta registro en players.
            -- UPPER + REPLACE(plate,' ','') en BD: hace la búsqueda insensible a
            -- mayúsculas y a espacios internos (ABC 123 / abc123 / ABC123 todo OK).
            -- COALESCE evita NULL en charinfo (el decompilado llama json.decode sin guard).
            -- [RAC-006] El error real era en el ON del JOIN (operation '='), NO en
            -- el LIKE. `players.citizenid` y `player_vehicles.citizenid` están en
            -- collations distintos (utf8mb4_unicode_ci vs utf8mb4_general_ci) por
            -- diferencias entre el SQL de QB y el del esquema base.
            -- Fuerza COLLATE utf8mb4_unicode_ci a AMBOS lados del = del JOIN y del
            -- LIKE — es un casteo a runtime y MySQL ya no se queja. unicode_ci es
            -- el collate canónico de QB, así que es el más seguro como destino.
            return MySQL.awaitQuery(
                "SELECT player_vehicles.citizenid, player_vehicles.hash, player_vehicles.plate, player_vehicles.garage, "
                .. "COALESCE(players.charinfo,'{\"firstname\":\"Unknown\",\"lastname\":\"\"}') AS charinfo "
                .. "FROM player_vehicles LEFT JOIN players ON "
                .. "player_vehicles.citizenid COLLATE utf8mb4_unicode_ci "
                .. "= players.citizenid COLLATE utf8mb4_unicode_ci "
                .. "WHERE UPPER(REPLACE(player_vehicles.plate,' ','')) COLLATE utf8mb4_unicode_ci "
                .. "LIKE ? COLLATE utf8mb4_unicode_ci LIMIT 50",
                { likepat }
            )

        else

            return MySQL.awaitQuery(
                "SELECT owned_vehicles.plate, owned_vehicles.owner, owned_vehicles.vehicle, users.firstname, users.lastname "
                .. "FROM owned_vehicles LEFT JOIN users ON "
                .. "owned_vehicles.owner COLLATE utf8mb4_unicode_ci "
                .. "= users.identifier COLLATE utf8mb4_unicode_ci "
                .. "WHERE UPPER(REPLACE(owned_vehicles.plate,' ','')) COLLATE utf8mb4_unicode_ci "
                .. "LIKE ? COLLATE utf8mb4_unicode_ci LIMIT 50",
                { likepat }
            )

        end

    end)

    if not status then
        print(("[origen_police][SearchDataFromVehicle] pcall ERROR: %s"):format(tostring(data)))
        return {}
    end

    if Config and Config.Debug then
        local n = 0
        if type(data) == "table" then n = #data end
        print(("[origen_police][SearchDataFromVehicle] filas=%d"):format(n))
        if n > 0 then
            print(("[origen_police][SearchDataFromVehicle] sample plate=%q citizenid=%q hash=%q")
                :format(tostring(data[1].plate), tostring(data[1].citizenid), tostring(data[1].hash)))
        end
    end

    return data or {}

end

function GetDataFromVehicle(plate)

    local status, data = pcall(function()

        if Config.Framework == "qbcore" then
            -- [RAC-006] mismo collation fix que SearchDataFromVehicle: el JOIN
            -- entre player_vehicles.citizenid y players.citizenid puede tener
            -- collations distintos (unicode_ci vs general_ci) según el origen del
            -- esquema. Forzar COLLATE en ambos lados del = evita el error
            -- "Illegal mix of collations". El WHERE igualmente normalizado.
            return MySQL.awaitQuery(
                "SELECT player_vehicles.citizenid, player_vehicles.hash, player_vehicles.plate, "
                .. "player_vehicles.garage, player_vehicles.wanted, player_vehicles.description, "
                .. "COALESCE(players.charinfo,'{\"firstname\":\"Unknown\",\"lastname\":\"\"}') AS charinfo "
                .. "FROM player_vehicles LEFT JOIN players ON "
                .. "player_vehicles.citizenid COLLATE utf8mb4_unicode_ci "
                .. "= players.citizenid COLLATE utf8mb4_unicode_ci "
                .. "WHERE player_vehicles.plate COLLATE utf8mb4_unicode_ci "
                .. "= ? COLLATE utf8mb4_unicode_ci",
                { plate }
            )

        else

            return MySQL.awaitQuery(
                "SELECT owned_vehicles.plate, owned_vehicles.owner, owned_vehicles.vehicle, "
                .. "owned_vehicles.wanted, owned_vehicles.description, users.firstname, users.lastname "
                .. "FROM owned_vehicles LEFT JOIN users ON "
                .. "owned_vehicles.owner COLLATE utf8mb4_unicode_ci "
                .. "= users.identifier COLLATE utf8mb4_unicode_ci "
                .. "WHERE owned_vehicles.plate COLLATE utf8mb4_unicode_ci "
                .. "= ? COLLATE utf8mb4_unicode_ci",
                { plate }
            )

        end

    end)

    if not status then
        print(("[origen_police][GetDataFromVehicle] pcall ERROR: %s"):format(tostring(data)))
        return {}
    end

    return data or {}

end

-- Whitelist de columnas permitidas para UpdateVehicleData.
-- NUNCA añadir aquí columnas que no provengan del NUI de policía (html/js/vehicles.js).
-- Actualmente el NUI solo envía 'wanted' y 'description'.
local VEHICLE_UPDATE_WHITELIST = {
    ["wanted"]      = { valueType = "number",  min = 0, max = 1 },
    ["description"] = { valueType = "string",  maxLen = 500 },
}

function UpdateVehicleData(key, value, plate)

    local rule = VEHICLE_UPDATE_WHITELIST[key]

    if not rule then
        print("[origen_police][SECURITY] UpdateVehicleData: clave '" .. tostring(key) .. "' rechazada (no en whitelist)")
        return false
    end

    if type(plate) ~= "string" or #plate == 0 or #plate > 12 then
        print("[origen_police][SECURITY] UpdateVehicleData: plate inválida")
        return false
    end

    if rule.valueType == "number" then
        value = tonumber(value)
        if not value or value < rule.min or value > rule.max then
            print("[origen_police][SECURITY] UpdateVehicleData: valor numérico fuera de rango para clave '" .. key .. "'")
            return false
        end
    elseif rule.valueType == "string" then
        if type(value) ~= "string" then value = tostring(value) end
        if #value > rule.maxLen then
            value = string.sub(value, 1, rule.maxLen)
        end
    end

    local status, data = pcall(function()

        if Config.Framework == "qbcore" then

            return MySQL.awaitUpdate('UPDATE player_vehicles SET ' .. key .. ' = ? WHERE plate = ?', {value, plate}) > 0

        elseif Config.Framework == "esx" then

            return MySQL.awaitUpdate('UPDATE owned_vehicles SET ' .. key .. ' = ? WHERE plate = ?', {value, plate}) > 0

        end

    end)

    if not status then

        return {}

    end

    return data

end

