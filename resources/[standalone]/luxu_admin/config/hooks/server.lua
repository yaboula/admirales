exports("getHooks", function()
    local function deleteEntity(entity)
        DeleteEntity(entity)
    end

    local function deleteVehicle(entity)
        if GetResourceState("AdvancedParking") == "started" then
            return exports["AdvancedParking"]:DeleteVehicle(vehicle, false)
        end
        DeleteEntity(entity)
    end

    return {
        deleteEntity = deleteEntity,
        deleteVehicle = deleteVehicle,
    }
end)

--- Uncomment this if you need

-- Report Created
-- AddEventHandler("luxu_admin:server:report_created", function(data)
--     local chatId = data.chat_id --[[@as number]]
--     local authorSource = data.author_source --[[@as number]]
--     local authorName = data.author_name --[[@as string]]
-- end)
