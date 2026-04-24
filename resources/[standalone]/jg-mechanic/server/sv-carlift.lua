-- =====================================================
-- =====================================================

-- Car lift model hashes
local CAR_LIFT_PLATFORM_HASH = -1375594465
local CAR_LIFT_STAND_HASH = -277236775

-- Storage for created car lifts
local createdCarLifts = {}
local carLiftsInitialized = false

-- Create car lift platform and stand at specified location
local function createCarLift(x, y, z, heading)
  -- Create platform
  local platform = CreateObjectNoOffset(CAR_LIFT_PLATFORM_HASH, x, y, z - 1.025, true, true, true)
  
  if not platform then
    return false, false
  end
  
  -- Wait for platform to exist
  while not DoesEntityExist(platform) do
    Wait(1)
  end
  
  SetEntityHeading(platform, heading)
  FreezeEntityPosition(platform, true)
  
  -- Create stand
  local stand = CreateObjectNoOffset(CAR_LIFT_STAND_HASH, x, y, z - 1.0, true, true, true)
  
  if not stand then
    return false, false
  end
  
  -- Wait for stand to exist
  while not DoesEntityExist(stand) do
    Wait(1)
  end
  
  SetEntityHeading(stand, heading)
  FreezeEntityPosition(stand, true)
  
  -- Return network IDs
  local platformNetId = NetworkGetNetworkIdFromEntity(platform)
  local standNetId = NetworkGetNetworkIdFromEntity(stand)
  
  return platformNetId, standNetId
end

-- Initialize all car lifts for all mechanic locations
local function initializeCarLifts()
  carLiftsInitialized = true
  
  -- Delete existing car lifts if any
  if GlobalState.carLiftsData then
    for mechanicId, lifts in pairs(GlobalState.carLiftsData) do
      for _, lift in ipairs(lifts) do
        DeleteEntity(NetworkGetEntityFromNetworkId(lift.platform))
        DeleteEntity(NetworkGetEntityFromNetworkId(lift.stand))
      end
    end
  end
  
  local carLiftsData = {}
  
  -- Create car lifts for each mechanic location
  for mechanicId, location in pairs(Config.MechanicLocations) do
    if location.carLifts then
      -- Skip if already initialized
      if carLiftsData[mechanicId] and #carLiftsData[mechanicId] ~= 0 then
        goto continue
      end
      
      for index, coords in ipairs(location.carLifts) do
        local platformNetId, standNetId = createCarLift(coords.x, coords.y, coords.z, coords.w)
        
        if not platformNetId or not standNetId then
          return false
        end
        
        -- Initialize array if needed
        if not carLiftsData[mechanicId] then
          carLiftsData[mechanicId] = {}
        end
        
        -- Store car lift data
        table.insert(carLiftsData[mechanicId], {
          platform = platformNetId,
          stand = standNetId,
          coords = coords
        })
      end
    end
    
    ::continue::
  end
  
  createdCarLifts = carLiftsData
  GlobalState:set("carLiftsData", carLiftsData)
end

-- Callback: Get created lifts
lib.callback.register("jg-mechanic:server:get-created-lifts", function()
  -- Initialize lifts if not already done
  if not carLiftsInitialized then
    initializeCarLifts()
  end
  
  -- Wait for lifts to be created
  lib.waitFor(function()
    if createdCarLifts then
      return true
    end
  end, "Lifts say they have been created, but they are still false", 30000)
  
  return createdCarLifts
end)
