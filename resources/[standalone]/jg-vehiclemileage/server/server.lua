local function getMileageInKmByPlate(plate)
  if not plate or plate == "" then return false end
  
  local mileageKm = MySQL.scalar.await("SELECT mileage FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate})
  return mileageKm or 0
end

lib.callback.register("jg-vehiclemileage:server:get-mileage", function(_, plate)
  return getMileageInKmByPlate(plate)
end)

RegisterNetEvent("jg-vehiclemileage:server:update-mileage", function(plate, mileage)
  local src = source
  if type(plate) ~= "string" or plate == "" or #plate > 12 then return end

  local m = tonumber(mileage)
  if not m or m < 0 or m > 20000000 then return end

  -- Basic anti-abuse: only allow updates from the current driver
  local ped = GetPlayerPed(src)
  if not ped or ped == 0 then return end
  local veh = GetVehiclePedIsIn(ped, false)
  if not veh or veh == 0 then return end
  if GetPedInVehicleSeat(veh, -1) ~= ped then return end

  local vehPlate = GetVehicleNumberPlateText(veh)
  if not vehPlate or vehPlate == "" then return end
  vehPlate = (vehPlate:gsub("^%s*(.-)%s*$", "%1"))
  if vehPlate ~= plate then return end

  MySQL.update("UPDATE " .. Framework.VehiclesTable .. " SET mileage = ? WHERE plate = ?", { m, plate })
end)

-- SERVER EXPORTS --

---@param ent integer
---@return number|false mileageKm
exports("getMileageByEntity", function(ent)
  if not ent or ent == 0 then return false end
  if not DoesEntityExist(ent) then return false end

  return Entity(ent).state?.vehicleMileage or 0
end)

---@param plate string
---@return number|false mileageKm
exports("getMileageByPlate", function(plate)
  return getMileageInKmByPlate(plate)
end)

---@return "miles"|"kilometers"
exports("getUnit", function() return Config.Unit end)

---!! DEPRECATED, use getMileageByPlate
---@deprecated
---@param plate string
---@return number|false, string
exports("GetMileage", function(plate)
  local vehicle = MySQL.single.await("SELECT mileage FROM " .. Framework.VehiclesTable .. " WHERE plate = ?", {plate})
  if not vehicle then return false end
  return vehicle.mileage, Config.Unit
end)
