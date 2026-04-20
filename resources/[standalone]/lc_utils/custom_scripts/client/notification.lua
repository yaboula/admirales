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

function Utils.CustomScripts.notify(type,message)
	local duration = (Config.notification and Config.notification.duration) or 8000
	local title = Utils.String.capitalizeFirst(type)

	if GetResourceState("JustNotify") == "started" then
		exports["JustNotify"]:Notify(title, message, duration, type)
		return
	end

	local QBCore = exports['qb-core']:GetCoreObject()
	QBCore.Functions.Notify(message, type, duration)

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

