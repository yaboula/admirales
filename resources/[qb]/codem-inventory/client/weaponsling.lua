-- Check if sling weapon system is enabled
if not Config.SlingWeapon then
  return
end

-- Global state tables
local attachedWeapons = {}
local hotbarWeapons = {}
local slingingPosition = "Back"

-- Main weapon sling monitoring thread
Citizen.CreateThread(function()
  while true do
    local playerPed = PlayerPedId()
    local hasAnyWeaponAttached = false
    
    -- Check if client inventory exists
    if ClientInventory ~= nil then
      -- Get hotbar weapons (slots 1-5)
      local currentHotbar = {
        [1] = ClientInventory["1"],
        [2] = ClientInventory["2"], 
        [3] = ClientInventory["3"],
        [4] = ClientInventory["4"],
        [5] = ClientInventory["5"]
      }
      hotbarWeapons = currentHotbar
      
      -- Process each hotbar slot
      for slotIndex, weaponItem in pairs(hotbarWeapons) do
        if weaponItem ~= nil and weaponItem.type == "weapon" then
          local weaponConfig = Config.WeaponSling.compatable_weapon_hashes[weaponItem.name]
          
          if weaponConfig ~= nil then
            -- Check if any weapon is already attached
            for _, isAttached in pairs(attachedWeapons) do
              if isAttached then
                hasAnyWeaponAttached = true
              end
            end
            
            -- Only attach if no weapon is currently attached
            if not hasAnyWeaponAttached then
              local weaponModel = weaponConfig.model
              local weaponHash = weaponConfig.hash
              
              -- Check if this specific weapon model isn't already attached
              if not attachedWeapons[weaponModel] then
                local currentWeapon = GetSelectedPedWeapon(playerPed)
                
                -- Only attach if weapon is not currently selected
                if currentWeapon ~= weaponHash then
                  local position = Config.WeaponSling.Positions[slingingPosition]
                  AttachWeapon(
                    weaponModel,
                    weaponHash,
                    position.bone,
                    position.x,
                    position.y,
                    position.z,
                    position.x_rotation,
                    position.y_rotation,
                    position.z_rotation
                  )
                end
              end
            end
          end
        end
      end
      
      -- Clean up weapons that should be removed
      for weaponModel, weaponData in pairs(attachedWeapons) do
        local currentWeapon = GetSelectedPedWeapon(playerPed)
        
        -- Remove weapon if it's currently selected or not in hotbar
        if currentWeapon == weaponData.hash or not IsWeaponInHotbar(weaponData.hash) then
          DeleteObject(weaponData.handle)
          attachedWeapons[weaponModel] = nil
        end
      end
    end
    
    Wait(1500)
  end
end)

-- Check if weapon is in hotbar slots
function IsWeaponInHotbar(weaponHash)
  for slotIndex, weaponItem in pairs(hotbarWeapons) do
    if weaponItem ~= nil and weaponItem.type == "weapon" then
      local weaponConfig = Config.WeaponSling.compatable_weapon_hashes[weaponItem.name]
      
      if weaponConfig ~= nil then
        local itemHash = GetHashKey(weaponItem.name)
        if weaponHash == itemHash then
          return true
        end
      end
    end
  end
  
  return false
end

-- Attach weapon to player back/front
function AttachWeapon(weaponModel, weaponHash, boneIndex, posX, posY, posZ, rotX, rotY, rotZ)
  local playerPed = PlayerPedId()
  local targetBone = GetPedBoneIndex(playerPed, boneIndex)
  
  -- Request and load weapon model
  RequestModel(weaponModel)
  while not HasModelLoaded(weaponModel) do
    Wait(100)
  end
  
  -- Create weapon object
  local weaponObject = CreateObject(GetHashKey(weaponModel), 1.0, 1.0, 1.0, true, true, false)
  
  -- Store weapon data
  attachedWeapons[weaponModel] = {
    hash = weaponHash,
    handle = weaponObject
  }
  
  -- Attach to player bone
  AttachEntityToEntity(
    weaponObject,
    playerPed,
    targetBone,
    posX, posY, posZ,
    rotX, rotY, rotZ,
    1, 1, 0, 0, 2, 1
  )
end

-- Command to toggle weapon sling position
RegisterCommand(Config.Commands.slingweapon, function()
  if slingingPosition == "Back" then
    slingingPosition = "Front"
  else
    slingingPosition = "Back"
  end
  
  -- Remove all currently attached weapons to reposition them
  for weaponModel, weaponData in pairs(attachedWeapons) do
    DeleteObject(weaponData.handle)
    attachedWeapons[weaponModel] = nil
  end
end)

-- Clean up on resource stop
AddEventHandler("onResourceStop", function(resourceName)
  if GetCurrentResourceName() == resourceName then
    local playerPed = PlayerPedId()
    
    -- Remove all attached weapons
    for weaponModel, weaponData in pairs(attachedWeapons) do
      DeleteObject(weaponData.handle)
      attachedWeapons[weaponModel] = nil
    end
    
    -- Clean up ground items if they exist
    if ClientGround then
      for groundId, groundData in pairs(ClientGround) do
        if groundData.inventory then
          for itemIndex, itemData in pairs(groundData.inventory) do
            if itemData.object then
              DeleteObject(itemData.object)
            end
          end
        end
      end
    end
  end
end)