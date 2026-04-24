-- =====================================================
-- =====================================================

local vehicleDataCache = {}

local STATEBAG_KEY_ALLOWLIST = {
  primarySecondarySync = true,
  disablePearl = true,
  enableStance = true,
  wheelsAdjIndv = true,
  stance = true,
  lightingControllerInstalled = true,
  xenons = true,
  underglowDirections = true,
  underglow = true,
  tuningConfig = true,
  servicingData = true,
  nitrousInstalledBottles = true,
  nitrousFilledBottles = true,
  nitrousCapacity = true,
  _sbFromTableSet = true,
}

local function normalizePlate(p)
  if type(p) ~= "string" then return false end
  p = p:gsub("^%s*(.-)%s*$", "%1")
  if p == "" or #p > 12 then return false end
  return p
end

local function authorizeVehicleAccess(src, veh, claimedPlate)
  if not src or src <= 0 then return false end
  if not veh or veh == 0 then return false end

  local ped = GetPlayerPed(src)
  if not ped or ped == 0 then return false end
  if GetVehiclePedIsIn(ped, false) ~= veh then return false end
  if GetPedInVehicleSeat(veh, -1) ~= ped then return false end

  local actualPlate = normalizePlate(GetVehicleNumberPlateText(veh))
  if not actualPlate then return false end
  local cp = claimedPlate and normalizePlate(claimedPlate) or actualPlate
  if not cp or cp ~= actualPlate then return false end
  return actualPlate
end

local function applyStatebagData(vehicle, data)
  if not vehicle or vehicle == 0 then
    return false
  end

  local vehicleState = Entity(vehicle).state

  if data.primarySecondarySync then
    vehicleState:set("primarySecondarySync", data.primarySecondarySync, true)
  end

  if data.disablePearl then
    vehicleState:set("disablePearl", data.disablePearl, true)
  end

  if data.enableStance ~= nil then
    vehicleState:set("enableStance", data.enableStance, true)
  end

  if data.wheelsAdjIndv then
    vehicleState:set("wheelsAdjIndv", data.wheelsAdjIndv, true)
  end

  if data.stance then
    vehicleState:set("stance", data.stance, true)
  end

  if data.lcInstalled then
    vehicleState:set("lightingControllerInstalled", data.lcInstalled, true)
  end

  if data.lcXenons then
    vehicleState:set("xenons", data.lcXenons, true)
  end

  if data.lcUnderglowDirections then
    vehicleState:set("underglowDirections", data.lcUnderglowDirections, true)
  end

  if data.lcUnderglow then
    vehicleState:set("underglow", data.lcUnderglow, true)
  end

  if data.tuningConfig then
    vehicleState:set("tuningConfig", data.tuningConfig, true)
  end

  if data.servicingData then
    vehicleState:set("servicingData", data.servicingData, true)
  end

  if data.nitrousInstalledBottles then
    vehicleState:set("nitrousInstalledBottles", data.nitrousInstalledBottles, true)
  end

  if data.nitrousFilledBottles then
    vehicleState:set("nitrousFilledBottles", data.nitrousFilledBottles, true)
  end

  if data.nitrousCapacity then
    vehicleState:set("nitrousCapacity", data.nitrousCapacity, true)
  end

  vehicleState:set("jgMechStatebagsApplied", true, true)
  debugPrint("applyStatebagData run successfully", "debug", Framework.Server.GetPlate(vehicle))
  return true
end

local function retrieveAndApplyVehicleData(vehicle, plate)
  local cachedData = vehicleDataCache[plate]
  if not cachedData then
    local dbData = MySQL.scalar.await("SELECT data FROM mechanic_vehicledata WHERE plate = ?", { plate })
    cachedData = dbData
    if not cachedData then
      debugPrint("Statebag data not available in cache or database - ignore if vehicle has not interacted with jg-mechanic", "warning", plate)
      return false
    end
    debugPrint("Retrieved statebag data from database", "debug", plate)
    vehicleDataCache[plate] = cachedData
  else
    debugPrint("Retrieved statebag data from cache", "debug", plate)
  end

  return applyStatebagData(vehicle, json.decode(cachedData))
end

local function saveVehicleDataToDb(plate, isUpdate)
  if not plate or plate == "" then
    print("^1[ERROR] Trying to write to mechanic_vehicledata with an empty vehicle plate - why are your vehicle plates returning as empty strings/false?")
    return false
  end

  if not vehicleDataCache[plate] then
    return false
  end

  if isUpdate then
    MySQL.update.await("UPDATE mechanic_vehicledata SET data = ? WHERE plate = ?", { vehicleDataCache[plate], plate })
  else
    MySQL.insert.await("INSERT INTO mechanic_vehicledata (plate, data) VALUES (?, ?) ON DUPLICATE KEY UPDATE plate = VALUES(plate), data = VALUES(data)", { plate, vehicleDataCache[plate] })
  end

  debugPrint("Statebag data saved to DB", "debug", plate)
  return true
end

function setVehicleStatebag(vehicle, key, value, saveToDb, plate)
  if not (vehicle and vehicle ~= 0 and key) or value == nil then
    debugPrint("Could not set statebag on vehicle - data:", "warning", key, value)
    return false
  end

  local vehiclePlate = plate or Framework.Server.GetPlate(vehicle)
  if not vehiclePlate then
    debugPrint("Could not get plate for vehicle", "warning", vehicle)
    return false
  end

  Entity(vehicle).state:set(key, value, true)

  if Config.ChangePlateDuringPreview and vehiclePlate == Config.ChangePlateDuringPreview then
    -- Do not save data if plate is the temporary preview plate
  else
    if not vehicleDataCache[vehiclePlate] then
      vehicleDataCache[vehiclePlate] = "{}"
    end
    local decodedData = json.decode(vehicleDataCache[vehiclePlate])
    decodedData[key] = value
    vehicleDataCache[vehiclePlate] = json.encode(decodedData)

    if saveToDb then
      SetTimeout(500, function()
        saveVehicleDataToDb(vehiclePlate)
      end)
    end
  end

  debugPrint("Successfully set statebag on vehicle", "debug", vehiclePlate, key, value)
  return true
end

lib.callback.register("jg-mechanic:server:retrieve-and-apply-veh-statebag-data", function(source, netId, plate)
  local vehicle = NetworkGetEntityFromNetworkId(netId)
  local normalizedPlate = normalizePlate(plate)
  if not (normalizedPlate and vehicle) or vehicle == 0 then
    debugPrint("Vehicle or plate were nil when running retrieve-and-apply-veh-statebag-data", "warning", netId)
    return false
  end
  local actualPlate = authorizeVehicleAccess(source, vehicle, normalizedPlate)
  if not actualPlate then
    return false
  end
  return retrieveAndApplyVehicleData(vehicle, actualPlate)
end)

lib.callback.register("jg-mechanic:server:set-vehicle-statebag", function(source, netId, key, value, saveToDb, plate)
  local vehicle = NetworkGetEntityFromNetworkId(netId)
  if type(key) ~= "string" or not STATEBAG_KEY_ALLOWLIST[key] then
    return false
  end
  local actualPlate = authorizeVehicleAccess(source, vehicle, plate)
  if not actualPlate then
    return false
  end
  return setVehicleStatebag(vehicle, key, value, saveToDb, actualPlate)
end)

lib.callback.register("jg-mechanic:server:set-vehicle-statebags", function(source, netId, data, saveToDb, plate)
  local vehicle = NetworkGetEntityFromNetworkId(netId)
  local actualPlate = authorizeVehicleAccess(source, vehicle, plate)
  if not actualPlate then
    return false
  end
  if type(data) ~= "table" then
    return false
  end
  for key, value in pairs(data) do
    if type(key) == "string" and STATEBAG_KEY_ALLOWLIST[key] then
      setVehicleStatebag(vehicle, key, value, false, actualPlate)
    end
  end
  if saveToDb then
    setVehicleStatebag(vehicle, "_sbFromTableSet", true, true, actualPlate)
  end
  return true
end)

lib.callback.register("jg-mechanic:server:save-veh-statebag-data-to-db", function(source, plate, isUpdate)
  local normalizedPlate = normalizePlate(plate)
  if not normalizedPlate then return false end

  local ped = GetPlayerPed(source)
  if not ped or ped == 0 then return false end
  local veh = GetVehiclePedIsIn(ped, false)
  if not veh or veh == 0 then return false end
  if GetPedInVehicleSeat(veh, -1) ~= ped then return false end

  local actualPlate = normalizePlate(GetVehicleNumberPlateText(veh))
  if not actualPlate or actualPlate ~= normalizedPlate then return false end

  return saveVehicleDataToDb(actualPlate, isUpdate)
end)

exports("vehiclePlateUpdated", function(oldPlate, newPlate)
  if oldPlate == newPlate then
    return
  end
  vehicleDataCache[newPlate] = vehicleDataCache[oldPlate]
  vehicleDataCache[oldPlate] = nil
  saveVehicleDataToDb(newPlate)
  MySQL.query.await("DELETE FROM mechanic_vehicledata WHERE plate = ?", { oldPlate })
  MySQL.query.await("UPDATE mechanic_orders SET plate = ? WHERE plate = ?", { newPlate, oldPlate })
  MySQL.query.await("UPDATE mechanic_servicing_history SET plate = ? WHERE plate = ?", { newPlate, oldPlate })
end)
