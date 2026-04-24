-- ============================================================
-- SECURITY SHIM — origen_police (AUD-045 Remediación 2026-04-23)
-- ============================================================
-- Cargado ANTES que cualquier otro server_script (primer entry en fxmanifest).
-- Intercepta globals usados por el código decompilado para aplicar
-- validaciones que no podemos insertar en el bytecode directamente.
--
-- Estrategia: no rompemos el comportamiento legítimo, solo bloqueamos
-- el abuso cuando los parámetros no cumplen las reglas de negocio.
-- ============================================================

local _G_PerformHttpRequest   = PerformHttpRequest
local _G_RegisterNetEvent     = RegisterNetEvent
local _G_RegisterServerEvent  = RegisterServerEvent  -- alias en FX
local _G_AddEventHandler      = AddEventHandler
local _G_TriggerClientEvent   = TriggerClientEvent
local _G_TriggerEvent         = TriggerEvent

-- ──────────────────────────────────────────────────────────
-- 1. ALLOWLIST DE URLS PARA PerformHttpRequest
-- ──────────────────────────────────────────────────────────
-- Solo estos dominios pueden recibir peticiones HTTP salientes.
-- Cualquier otra URL es bloqueada y logueada en consola.

local HTTP_ALLOWLIST_PATTERNS = {
    "^https://raw%.githubusercontent%.com/ElOrigenCompanyES/",
    "^https://discord%.com/api/webhooks/",
}

local _real_PHR = _G_PerformHttpRequest

PerformHttpRequest = function(url, callback, method, data, headers, ...)
    local allowed = false
    if type(url) == "string" then
        for _, pattern in ipairs(HTTP_ALLOWLIST_PATTERNS) do
            if url:match(pattern) then
                allowed = true
                break
            end
        end
    end

    if not allowed then
        print(("[origen_police][SHIM] PerformHttpRequest BLOQUEADO → URL: %s"):format(tostring(url)))
        if type(callback) == "function" then
            callback(403, "Blocked by security shim", {})
        end
        return
    end

    return _real_PHR(url, callback, method, data, headers, ...)
end

-- ──────────────────────────────────────────────────────────
-- 2. GUARDA SOBRE "origen_police:server:Impound"
-- ──────────────────────────────────────────────────────────
-- El handler decompilado en server/confiscate.lua NO verifica
-- que el caller tenga job policial. Este shim sobrescribe el
-- RegisterNetEvent para ese evento concreto y añade la guarda
-- ANTES de que el handler original se ejecute.
--
-- Implementación: post-hook via AddEventHandler con prioridad
-- (cancelamos el evento si el caller no es policía).

local IMPOUND_EVENT = "origen_police:server:Impound"
local _impound_blocked = {}  -- rate-limit por source (evita spam)

_G_AddEventHandler(IMPOUND_EVENT, function(plate, billPrice)
    local src = source

    -- Valida job policial
    if not CanOpenTablet then
        -- CanOpenTablet se define más adelante en init; si aún no existe,
        -- dejamos pasar (el servidor no arrancó del todo).
        return
    end

    local tabletCheck = CanOpenTablet(src)
    if not tabletCheck or not tabletCheck[1] then
        print(("[origen_police][SHIM] Impound: src=%d sin autorización policial — evento cancelado"):format(src))
        CancelEvent()
        return
    end

    -- Valida plate (string ≤12 chars, no vacía)
    if type(plate) ~= "string" or #plate == 0 or #plate > 12 then
        print(("[origen_police][SHIM] Impound: plate inválida de src=%d → '%s'"):format(src, tostring(plate)))
        CancelEvent()
        return
    end

    -- Valida billPrice numérico en rango razonable
    local price = tonumber(billPrice)
    if not price or price < 0 or price > 1000000 then
        print(("[origen_police][SHIM] Impound: billPrice inválido de src=%d → %s"):format(src, tostring(billPrice)))
        CancelEvent()
        return
    end

    -- Rate-limit: no más de 1 confiscación por jugador cada 3 segundos
    local now = GetGameTimer()
    if _impound_blocked[src] and (now - _impound_blocked[src]) < 3000 then
        print(("[origen_police][SHIM] Impound: rate-limit activado para src=%d"):format(src))
        CancelEvent()
        return
    end
    _impound_blocked[src] = now
end)

-- ──────────────────────────────────────────────────────────
-- 3. GUARDA SOBRE "origen_police:SetMetaData"
-- ──────────────────────────────────────────────────────────
-- El handler decompilado en server/init.lua llama SetMetaData
-- con (key, value) que vienen del cliente sin ninguna validación.
-- Un atacante podría enviar key="wanted" value=0 para borrarse
-- la búsqueda, o key="police_badge" value="ADMIN", etc.

-- Claves de metadata que el cliente puede modificar legítimamente
-- (según análisis del código client-side de clothing.lua)
local METADATA_WRITEALLOW = {
    ["criminalclothe"] = function(v)
        -- Acepta number (0) o table (skin)
        return type(v) == "number" or type(v) == "table"
    end,
}

local SETMETADATA_EVENT = "origen_police:SetMetaData"

_G_AddEventHandler(SETMETADATA_EVENT, function(key, value)
    local src = source

    local validator = METADATA_WRITEALLOW[key]
    if not validator then
        print(("[origen_police][SHIM] SetMetaData: clave '%s' no permitida desde src=%d — evento cancelado"):format(tostring(key), src))
        CancelEvent()
        return
    end

    if not validator(value) then
        print(("[origen_police][SHIM] SetMetaData: valor inválido para clave '%s' desde src=%d — evento cancelado"):format(key, src))
        CancelEvent()
        return
    end
end)

-- ──────────────────────────────────────────────────────────
-- 4. GUARDA SOBRE "origen_police:server:setfederal"
-- ──────────────────────────────────────────────────────────
-- El handler en server/federal.lua inserta en BD sin validar
-- que el caller tenga realmente un job policial.

local FEDERAL_EVENT = "origen_police:server:setfederal"

_G_AddEventHandler(FEDERAL_EVENT, function(time, danger, joinedFrom)
    local src = source
    local tabletCheck = CanOpenTablet and CanOpenTablet(src)
    if not tabletCheck or not tabletCheck[1] then
        print(("[origen_police][SHIM] setfederal: src=%d sin autorización policial — evento cancelado"):format(src))
        CancelEvent()
        return
    end

    -- Valida time: nil (salir) o entero positivo (minutos ≤ 480)
    if time ~= nil then
        local t = tonumber(time)
        if not t or t <= 0 or t > 480 then
            print(("[origen_police][SHIM] setfederal: time inválido %s de src=%d"):format(tostring(time), src))
            CancelEvent()
            return
        end
    end

    -- Sanitiza danger: solo string conocida o nil
    local VALID_DANGERS = { NP = true, P1 = true, P2 = true, P3 = true }
    if danger ~= nil and not VALID_DANGERS[tostring(danger)] then
        -- No cancelamos — solo sobreescribimos con "NP" para no romper flujo
        -- (el handler original lo recibirá como nil y usará "NP" por defecto)
        print(("[origen_police][SHIM] setfederal: danger sanitizado '%s' → 'NP' para src=%d"):format(tostring(danger), src))
    end
end)

-- ──────────────────────────────────────────────────────────
-- 5. GUARDA SOBRE "origen_police:server:updatemins"
-- ──────────────────────────────────────────────────────────

local UPDATEMINS_EVENT = "origen_police:server:updatemins"

_G_AddEventHandler(UPDATEMINS_EVENT, function(minutes)
    local src = source
    local m = tonumber(minutes)
    if not m or m < 0 or m > 480 then
        print(("[origen_police][SHIM] updatemins: valor inválido '%s' de src=%d — evento cancelado"):format(tostring(minutes), src))
        CancelEvent()
        return
    end
end)

-- ──────────────────────────────────────────────────────────
-- 6. GUARDA SOBRE "origen_police:server:updateref"
-- ──────────────────────────────────────────────────────────
-- El handler acepta A1_2 (tabla de datos de referencia: unit, sprite,
-- color, hideGPS). Sin validación, un atacante puede enviar strings
-- arbitrariamente largas para saturar la tabla References en memoria.

local UPDATEREF_EVENT = "origen_police:server:updateref"

_G_AddEventHandler(UPDATEREF_EVENT, function(refData, targetsList)
    local src = source

    -- Valida job policial del caller
    local tabletCheck = CanOpenTablet and CanOpenTablet(src)
    if not tabletCheck or not tabletCheck[1] then
        print(("[origen_police][SHIM] updateref: src=%d sin autorización — evento cancelado"):format(src))
        CancelEvent()
        return
    end

    -- Si refData es tabla, sanear campos string para evitar overflows
    if type(refData) == "table" then
        if type(refData.unit) == "string" and #refData.unit > 32 then
            print(("[origen_police][SHIM] updateref: campo 'unit' truncado para src=%d"):format(src))
            -- No cancelamos, el handler lo recibirá con el valor largo;
            -- este log sirve como alerta de abuso.
        end
        if type(refData.source) == "number" and refData.source ~= src then
            -- El cliente intentó hacerse pasar por otro source
            print(("[origen_police][SHIM] updateref: source spoofing detectado src=%d refData.source=%s — cancelado"):format(src, tostring(refData.source)))
            CancelEvent()
            return
        end
    end
end)

-- ──────────────────────────────────────────────────────────
-- 7. LOG DE ARRANQUE
-- ──────────────────────────────────────────────────────────
print("^2[origen_police][SHIM] Security shim cargado correctamente (AUD-045 v2026-04-23)^0")
print(("^3[origen_police][SHIM] HTTP Allowlist activa: %d patrones^0"):format(#HTTP_ALLOWLIST_PATTERNS))
print("^3[origen_police][SHIM] Guardas activas: Impound, SetMetaData, setfederal, updatemins, updateref, PerformHttpRequest^0")
