-- =====================================================
-- =====================================================

if (Config.Framework == "auto" and GetResourceState("qb-core") == "started") or Config.Framework == "QBCore" then
  -- Player data
  -- RAC-fix: QBCore.Functions.* son nil al cruzar el boundary de export (msgpack no serializa funciones en tablas anidadas).
  -- GetPlayerData() sin args devuelve exactamente QBCore.PlayerData, así que accedemos directamente.
  Globals.PlayerData = QBCore.PlayerData or {}

  RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
  AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Globals.PlayerData = QBCore.PlayerData or {}
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  RegisterNetEvent("QBCore:Client:OnJobUpdate")
  AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
    Globals.PlayerData.job = job
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  RegisterNetEvent("QBCore:Client:OnGangUpdate")
  AddEventHandler("QBCore:Client:OnGangUpdate", function(gang)
    Globals.PlayerData.gang = gang
    TriggerEvent("jg-mechanic:client:refresh-mechanic-zones-and-blips")
  end)

  -- For jacksam's job creator
  RegisterNetEvent("jobs_creator:injectJobs", function(jobs)
    QBCore.Jobs = jobs
  end)
end
