local clothing = {}

function clothing.loadPlayerSkin()
    ExecuteCommand("reloadskin")
    if GetResourceState("qb-clothing") == "started" then
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
    elseif GetResourceState("illenium-appearance") == "started" then
        local result = lib.callback.await("illenium-appearance:server:getAppearance")
        exports["illenium-appearance"]:setPlayerAppearance(result)
    elseif GetResourceState("rcore_clothing") == "started" then
        ExecuteCommand("reloadskin")
    elseif GetResourceState("skinchanger") == "started" and GetResourceState("esx_skin") == "started" then
        Framework.object.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    elseif GetResourceState("qs-appearance") == "started" or GetResourceState("ak47_clothing") == "started" or GetResourceState("ak47_qb_clothing") == "started" then
        ExecuteCommand("reloadskin")
    end
end

return clothing
