-- Check if throwables system is enabled
if Config.ThrowablesSystem == false then
  return
end

-- Global state variable for throwing process
throwingWeapon = nil

-- Convert rotation angles to direction vector
function GetDirectionFromRotation(rotation)
  local radianConversion = math.pi / 180
  
  -- Calculate X component (forward/backward)
  local xComponent = -math.sin(rotation.z * radianConversion) * math.abs(math.cos(rotation.x * radianConversion))
  
  -- Calculate Y component (left/right) 
  local yComponent = math.cos(rotation.z * radianConversion) * math.abs(math.cos(rotation.x * radianConversion))
  
  -- Calculate Z component (up/down)
  local zComponent = math.sin(rotation.x * radianConversion)
  
  return vector3(xComponent, yComponent, zComponent)
end

-- Apply physics to thrown weapon object
function PerformPhysics(weaponEntity)
  local throwForce = 25
  
  -- Unfreeze the entity so it can move
  FreezeEntityPosition(weaponEntity, false)
  
  local playerPed = PlayerPedId()
  local cameraRotation = GetGameplayCamRot(2)
  local throwDirection = GetDirectionFromRotation(cameraRotation)
  
  -- Set weapon heading based on camera direction
  SetEntityHeading(weaponEntity, cameraRotation.z + 90.0)
  
  -- Apply velocity in throw direction
  SetEntityVelocity(weaponEntity, 
    throwDirection.x * throwForce,
    throwDirection.y * throwForce, 
    throwDirection.z * throwForce
  )
end

-- Get weapon string name from hash
function GetWeaponString(weaponHash)
  for i = 1, #Config.WeaponsThrow do
    local weaponName = Config.WeaponsThrow[i]
    if weaponHash == GetHashKey(weaponName) then
      return weaponName
    end
  end
end

-- Main weapon throwing function
function ThrowCurrentWeapon()
  -- Prevent multiple simultaneous throws
  if throwingWeapon then
    return
  end
  
  local playerPed = PlayerPedId()
  local hasWeapon, currentWeaponHash = GetCurrentPedWeapon(playerPed, 1)
  local weaponString = GetWeaponString(currentWeaponHash)
  
  -- Exit if player doesn't have a throwable weapon
  if not hasWeapon or not weaponString then
    return
  end
  
  -- Set throwing state
  throwingWeapon = true
  
  -- Play throwing animation in separate thread
  CreateThread(function()
    PlayAnim(playerPed, "weapons@projectile@grenade_str", "throw_h_fb_backward", 8.0, -8.0, -1, 0)
    Wait(600)
    ClearPedTasks(playerPed)
  end)
  
  -- Wait for animation timing
  Wait(550)
  
  -- Get spawn position slightly above player
  local spawnPosition = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, 1.0)
  
  -- Get the weapon object from player
  local weaponObject = GetWeaponObjectFromPed(playerPed, true)
  local weaponModel = GetEntityModel(weaponObject)
  
  -- Remove weapon from player inventory
  RemoveWeaponFromPed(playerPed, currentWeaponHash)
  SetCurrentPedWeapon(playerPed, -1569615261, true) -- Switch to unarmed
  
  -- Delete the original weapon object
  DeleteEntity(weaponObject)
  
  -- Create new throwable prop
  local thrownWeapon = CreateProp(weaponModel, spawnPosition.x, spawnPosition.y, spawnPosition.z, true, false, true)
  
  -- Position the thrown weapon
  SetEntityCoords(thrownWeapon, spawnPosition.x, spawnPosition.y, spawnPosition.z)
  SetEntityHeading(thrownWeapon, GetEntityHeading(playerPed) + 90.0)
  
  -- Apply throwing physics
  PerformPhysics(thrownWeapon)
  
  -- Trigger server events for inventory management
  local weaponData = ClientWeaponData
  TriggerServerEvent("codem-inventory:removeWeaponItem", weaponData)
  ClientWeaponData = nil
  
  -- Wait for weapon to land
  Citizen.Wait(4000)
  
  -- Get final weapon position and notify server
  local finalPosition = GetEntityCoords(thrownWeapon)
  TriggerServerEvent("codem-inventory:server:throwweapon", weaponData, finalPosition, thrownWeapon)
  
  -- Reset throwing state
  throwingWeapon = nil
end

-- Initialize key binding and command
Citizen.CreateThread(function()
  -- Register the keybind
  RegisterKeyMapping("throwweapon", "Throw Weapon", "keyboard", Config.KeyBinds.ThrowWeapon)
  
  -- Register the command
  RegisterCommand("throwweapon", function()
    local playerPed = PlayerPedId()
    local hasWeapon, currentWeaponHash = GetCurrentPedWeapon(playerPed, 1)
    local weaponString = GetWeaponString(currentWeaponHash)
    
    -- Only throw if player has a throwable weapon
    if not hasWeapon or not weaponString then
      return
    end
    
    ThrowCurrentWeapon()
  end)
end)

-- Utility function to create props with model loading
function CreateProp(modelHash, ...)
  RequestModel(modelHash)
  
  while not HasModelLoaded(modelHash) do
    Wait(0)
  end
  
  local propObject = CreateObject(modelHash, ...)
  SetModelAsNoLongerNeeded(modelHash)
  
  return propObject
end

-- Utility function to play animations with dictionary loading
function PlayAnim(ped, animDict, ...)
  RequestAnimDict(animDict)
  
  while not HasAnimDictLoaded(animDict) do
    Wait(0)
  end
  
  TaskPlayAnim(ped, animDict, ...)
end