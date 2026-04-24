-- Car lift control constants
local MIN_HEIGHT = -1.025
local MAX_HEIGHT = 0.85
local HEIGHT_INCREMENT = 0.01

-- Car lift state variables
local currentLift = nil
local isMovingUp = false
local isMovingDown = false
local currentSound = nil

-- Shows the car lift UI controls
local function showCarLiftUI()
  SetNuiFocus(true, true)
  SendNUIMessage({
    showCarLift = true,
    locale = Locale
  })
end

-- NUI Callback: Raise the car lift
RegisterNUICallback("carlift-up", function(data, callback)
  if not currentLift or isMovingUp then
    callback(false)
    return
  end
  
  local shouldAttachVehicle = data.vAttach
  local platformProp = currentLift.platformProp
  local platformCoords = GetEntityCoords(platformProp)
  
  -- Calculate current height
  currentLift.height = platformCoords.z - currentLift.coords.z
  isMovingUp = true
  
  -- Find closest vehicle to attach
  local closestVehicle, vehicleCoords = lib.getClosestVehicle(platformCoords, 3.0, true)
  
  -- Play hydraulic sound
  currentSound = Framework.Client.PlaySound("hydraulic", vector3(currentLift.coords.x, currentLift.coords.y, currentLift.coords.z))
  
  CreateThread(function()
    while isMovingUp and currentLift and currentLift.height < MAX_HEIGHT do
      -- Increment height
      currentLift.height = currentLift.height + HEIGHT_INCREMENT
      local newZ = currentLift.coords.z + currentLift.height
      
      -- Move platform up
      SetEntityCoords(platformProp, currentLift.coords.x, currentLift.coords.y, newZ, false, false, false, false)
      
      -- Move attached vehicle if enabled
      if shouldAttachVehicle and closestVehicle and vehicleCoords and DoesEntityExist(closestVehicle) then
        SetEntityCoords(closestVehicle, vehicleCoords.x, vehicleCoords.y, newZ, false, false, false, false)
      end
      
      Wait(25)
    end
    
    -- Stop sound when reaching max height
    if currentLift and currentLift.height >= MAX_HEIGHT and currentSound then
      Framework.Client.StopSound(currentSound)
    end
  end)
  
  callback(true)
end)

-- NUI Callback: Lower the car lift
RegisterNUICallback("carlift-down", function(data, callback)
  if not currentLift or isMovingDown then
    callback(false)
    return
  end
  
  local shouldAttachVehicle = data.vAttach
  local platformProp = currentLift.platformProp
  local platformCoords = GetEntityCoords(platformProp)
  
  -- Calculate current height
  currentLift.height = platformCoords.z - currentLift.coords.z
  isMovingDown = true
  
  -- Find closest vehicle to attach
  local closestVehicle, vehicleCoords = lib.getClosestVehicle(platformCoords, 3.0, true)
  
  -- Play hydraulic sound
  currentSound = Framework.Client.PlaySound("hydraulic", vector3(currentLift.coords.x, currentLift.coords.y, currentLift.coords.z))
  
  CreateThread(function()
    while isMovingDown and currentLift and currentLift.height > MIN_HEIGHT do
      -- Decrement height
      currentLift.height = currentLift.height - HEIGHT_INCREMENT
      local newZ = currentLift.coords.z + currentLift.height
      
      -- Move platform down
      SetEntityCoords(platformProp, currentLift.coords.x, currentLift.coords.y, newZ, false, false, false, false)
      
      -- Move attached vehicle if enabled
      if shouldAttachVehicle and closestVehicle and vehicleCoords and DoesEntityExist(closestVehicle) then
        SetEntityCoords(closestVehicle, vehicleCoords.x, vehicleCoords.y, newZ, false, false, false, false)
      end
      
      Wait(25)
    end
    
    -- Stop sound when reaching min height
    if currentLift and currentLift.height <= MIN_HEIGHT and currentSound then
      Framework.Client.StopSound(currentSound)
    end
  end)
  
  callback(true)
end)

-- NUI Callback: Stop car lift movement
RegisterNUICallback("carlift-stop", function(data, callback)
  if not currentLift or not currentSound then
    callback(false)
    return
  end
  
  Framework.Client.StopSound(currentSound)
  isMovingUp = false
  isMovingDown = false
  
  callback(true)
end)

-- NUI Callback: Hide car lift controls
RegisterNUICallback("hide-carlift-controls", function(data, callback)
  SendNUIMessage({
    showCarLift = false
  })
  SetNuiFocus(false, false)
  
  callback(true)
end)

-- Called when player enters car lift zone
function onEnterCarliftZone(liftData)
  if not liftData then
    return
  end
  
  local platformProp = NetworkGetEntityFromNetworkId(liftData.platform)
  local standProp = NetworkGetEntityFromNetworkId(liftData.stand)
  
  Framework.Client.ShowTextUI(Config.UseCarLiftPrompt)
  
  currentLift = {
    platformProp = platformProp,
    standProp = standProp,
    coords = liftData.coords,
    height = 0
  }
  
  -- Thread to handle key press for opening UI
  CreateThread(function()
    while currentLift do
      if IsControlJustPressed(0, Config.UseCarLiftKey) then
        showCarLiftUI()
      end
      Wait(0)
    end
  end)
end

-- Called when player exits car lift zone
function onExitCarliftZone()
  currentLift = nil
  Framework.Client.HideTextUI()
  SetNuiFocus(false, false)
  SendNUIMessage({
    showCarLift = false
  })
end
