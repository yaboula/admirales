-- =====================================================
-- =====================================================

local defaultServicingData = {
  suspension = 100,
  tyres = 100,
  brakePads = 100,
  engineOil = 100,
  clutch = 100,
  airFilter = 100,
  sparkPlugs = 100,
  evMotor = 100,
  evBattery = 100,
  evCoolant = 100
}

AddStateBagChangeHandler("vehicleMileage", "", function(bagName, key, value)
  if not Config.EnableVehicleServicing then
    return
  end

  local vehicle = GetEntityFromStateBagName(bagName)
  if vehicle == 0 or not DoesEntityExist(vehicle) then
    return
  end

  if not (cache.vehicle == vehicle and cache.seat == -1) then
    return
  end

  local archetypeName = GetEntityArchetypeName(vehicle)
  if Config.ServicingBlacklist and type(Config.ServicingBlacklist) == "table" and lib.table.contains(Config.ServicingBlacklist, archetypeName) then
    return
  end

  if value % 1 ~= 0 or value < 1 then
    return
  end

  local model = GetEntityModel(vehicle)
  local isElectric = isVehicleElectric(archetypeName)
  local isSupportedVehicle = IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model)

  if not isSupportedVehicle then
    return
  end

  local vehicleState = Entity(vehicle).state
  local currentServicingData = vehicleState.servicingData or defaultServicingData

  for part, partConfig in pairs(Config.Servicing) do
    if not (partConfig.restricted == "electric" and not isElectric) and not (partConfig.restricted == "combustion" and isElectric) and not partConfig.restricted then
      local wearRate = 100 / (partConfig.lifespanInKm or 0)
      local newHealth = round(math.max(0, currentServicingData[part] - wearRate), 5)
      currentServicingData[part] = newHealth
    end
  end

  setVehicleStatebag(vehicle, "servicingData", currentServicingData, true)

  local serviceRequired = false
  for part, health in pairs(currentServicingData) do
    if health <= Config.ServiceRequiredThreshold then
      serviceRequired = true
    end
  end

  if serviceRequired then
    Framework.Client.Notify(Locale.serviceVehicleSoon, "error")
  end
end)

RegisterNUICallback("service-vehicle", function(data, cb)
  local partName = data.name
  local partStats = data.stats
  local partConfig = Config.Servicing[partName]

  if not partConfig or not partStats then
    return cb(false)
  end

  local vehicle = LocalPlayer.state.tabletConnectedVehicle and LocalPlayer.state.tabletConnectedVehicle.vehicleEntity
  if not vehicle or not DoesEntityExist(vehicle) then
    return cb(false)
  end

  local vehiclePlate = Framework.Client.GetPlate(vehicle)
  local vehicleState = Entity(vehicle).state
  local servicingData = vehicleState.servicingData
  local minigameProp = "spanner"

  if partName == "tyres" or partName == "brakePads" then
    minigameProp = "wheel"
  end

  playMinigame(vehicle, "prop", { prop = minigameProp }, function(success)
    showTabletAfterInteractionPrompt()
    SetNuiFocus(true, true)

    if not success then
      return cb(false)
    end

    local paymentSuccess = lib.callback.await("jg-mechanic:server:pay-for-service", false, vehiclePlate, partName)
    if not paymentSuccess then
      return cb(false)
    end

    Framework.Client.Notify(Locale.partServiced:format(Locale[partName] or partName), "success")
    servicingData[partName] = 100
    setVehicleStatebag(vehicle, "servicingData", servicingData, true)
    cb(true)
  end)
end)

RegisterNUICallback("get-service-history", function(data, cb)
  local vehicle = LocalPlayer.state.tabletConnectedVehicle and LocalPlayer.state.tabletConnectedVehicle.vehicleEntity
  if not vehicle or not DoesEntityExist(vehicle) then
    return cb(false)
  end
  local plate = Framework.Client.GetPlate(vehicle)
  local history = lib.callback.await("jg-mechanic:server:get-servicing-history", false, plate)
  cb(history)
end)
