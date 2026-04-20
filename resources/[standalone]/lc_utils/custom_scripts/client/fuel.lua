--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

function Utils.CustomScripts.setVehicleFuel(vehicle, plate, model, fuel)
	if GetResourceState("qb-fuel") == "started" then
		exports["qb-fuel"]:SetFuel(vehicle, fuel)
		return
	end

	if GetResourceState("LegacyFuel") == "started" then
		exports["LegacyFuel"]:SetFuel(vehicle, fuel)
		return
	end

	SetVehicleFuelLevel(vehicle, fuel + 0.0)

end

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

--             
-- 
-- 
--                                                                          
--                                                                          
-- 
--             

