-- [INST INST-028 RAC-002] 2026-04-23 — Rewrite LoadPolicePage NUI callback
-- FIX: Bug del decompilador CfxRE ("no visible label 'lbl_125' for <goto>").
-- El decompilado generaba gotos inválidos en Lua 5.4 → el script NO cargaba → Dispatch/Agent no respondían.
-- Semántica preservada 1:1. Backup: _backup_RAC-002/police.lua
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = nil

L1_1 = false

RegisterNUICallback("LoadPolicePage", function(data, cb)
    local result = {}
    local player = exports.origen_police:FW_GetPlayerData(true)
    local page   = data.page

    if page == "home" then
        result.service = player.job.onduty
        local done = false
        exports.origen_police:FW_TriggerCallback("origen_police:server:GetPoliceCount", function(cops)
            result.cops = cops
            done = true
        end)
        while not done do Citizen.Wait(0) end

    elseif page == "radio" or page == "central" then
        if L1_1 then
            return
        end

        local freq = false
        for _, item in pairs(player.items) do
            if item.name == "radio" then
                local mf = exports.origen_police:GetMultiFrec()
                freq = mf or freq
                if not mf then freq = "none" end
                exports.origen_police:Toggle(true)
                break
            end
        end

        if not freq then
            if not exports.origen_police:GetConfig("NeedRadioForDispatch") then
                local mf = exports.origen_police:GetMultiFrec()
                if mf then
                    freq = mf
                end
            end
            if not freq then freq = false end
        end

        if Config.HeatMapAlerts then
            if page == "central" and not L0_1 then
                L1_1 = true
                FW_TriggerCallback("origen_police:server:GetHeatAlerts", function(alerts)
                    L0_1 = alerts or {}
                end)
            end
        else
            if page == "central" then
                L0_1 = {}
            end
        end

        while not L0_1 and page == "central" do
            Citizen.Wait(0)
        end

        if page == "central" then
            result = L0_1
            L1_1 = false
        else
            result = freq
        end

    elseif page == "penalcode" then
        result.boss = player.job.isboss

    elseif page == "agents" then
        if GetResourceState("origen_police") == "started" then
            local minGrade = GetMinimunGrade(player.job.name, "AgentManagement")
            local level    = player.job.grade.level
            if minGrade <= level then
                result = true
            else
                result = false
            end
        else
            result = true
        end
    end

    cb(result)
end)

-- [INST INST-028 RAC-002] Bloque original decompilado (373 líneas con goto inválidos) eliminado.
-- Ver _backup_RAC-002/police.lua para el código decompilado original completo.
--[==[ BEGIN DEAD CODE (inválido en Lua 5.4, comentado para referencia)
function L4_1_ORIG_DEADCODE(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = {}

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.FW_GetPlayerData

  L5_2 = true

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = A0_2.page

  if "home" == L4_2 then

    L4_2 = L3_2.job

    L4_2 = L4_2.onduty

    L2_2.service = L4_2

    L4_2 = false

    L5_2 = exports

    L5_2 = L5_2.origen_police

    L6_2 = L5_2

    L5_2 = L5_2.FW_TriggerCallback

    L7_2 = "origen_police:server:GetPoliceCount"

    function L8_2(A0_3)

      local L1_3

      L2_2.cops = A0_3

      L1_3 = true

      L4_2 = L1_3

    end

    L5_2(L6_2, L7_2, L8_2)

    while not L4_2 do

      L5_2 = Citizen

      L5_2 = L5_2.Wait

      L6_2 = 0

      L5_2(L6_2)

    end

  else

    L4_2 = A0_2.page

    if "radio" ~= L4_2 then

      L4_2 = A0_2.page

      if "central" ~= L4_2 then

        goto lbl_125

      end

    end

    L4_2 = L1_1

    if L4_2 then

      return

    end

    L2_2 = false

    L4_2 = pairs

    L5_2 = L3_2.items

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = L9_2.name

      if "radio" == L10_2 then

        L10_2 = exports

        L10_2 = L10_2.origen_police

        L11_2 = L10_2

        L10_2 = L10_2.GetMultiFrec

        L10_2 = L10_2(L11_2)

        L2_2 = L10_2 or L2_2

        if not L10_2 then

          L2_2 = "none"

        end

        L10_2 = exports

        L10_2 = L10_2.origen_police

        L11_2 = L10_2

        L10_2 = L10_2.Toggle

        L12_2 = true

        L10_2(L11_2, L12_2)

        break

      end

    end

    if not L2_2 then

      L4_2 = exports

      L4_2 = L4_2.origen_police

      L5_2 = L4_2

      L4_2 = L4_2.GetConfig

      L6_2 = "NeedRadioForDispatch"

      L4_2 = L4_2(L5_2, L6_2)

      if not L4_2 then

        L4_2 = exports

        L4_2 = L4_2.origen_police

        L5_2 = L4_2

        L4_2 = L4_2.GetMultiFrec

        L4_2 = L4_2(L5_2)

        if L4_2 then

          goto lbl_80

          L2_2 = L4_2 or L2_2

        end

      end

      L2_2 = false

    end

    ::lbl_80::

    L4_2 = Config

    L4_2 = L4_2.HeatMapAlerts

    if L4_2 then

      L4_2 = A0_2.page

      if "central" == L4_2 then

        L4_2 = L0_1

        if not L4_2 then

          L4_2 = true

          L1_1 = L4_2

          L4_2 = FW_TriggerCallback

          L5_2 = "origen_police:server:GetHeatAlerts"

          function L6_2(A0_3)

            local L1_3

            L1_3 = A0_3 or nil

            if not A0_3 then

              L1_3 = {}

            end

            L0_1 = L1_3

          end

          L4_2(L5_2, L6_2)

      end

    end

    else

      L4_2 = Config

      L4_2 = L4_2.HeatMapAlerts

      if not L4_2 then

        L4_2 = A0_2.page

        if "central" == L4_2 then

          L4_2 = {}

          L0_1 = L4_2

        end

      end

    end

    while true do

      L4_2 = L0_1

      if L4_2 then

        break

      end

      L4_2 = A0_2.page

      if "central" ~= L4_2 then

        break

      end

      L4_2 = Citizen

      L4_2 = L4_2.Wait

      L5_2 = 0

      L4_2(L5_2)

    end

    L4_2 = A0_2.page

    if "central" == L4_2 then

      L2_2 = L0_1

      L4_2 = false

      L1_1 = L4_2

      goto lbl_155

      ::lbl_125::

      L4_2 = A0_2.page

      if "penalcode" == L4_2 then

        L4_2 = L3_2.job

        L4_2 = L4_2.isboss

        L2_2.boss = L4_2

      else

        L4_2 = A0_2.page

        if "agents" == L4_2 then

          L4_2 = GetResourceState

          L5_2 = "origen_police"

          L4_2 = L4_2(L5_2)

          if "started" == L4_2 then

            L4_2 = GetMinimunGrade

            L5_2 = L3_2.job

            L5_2 = L5_2.name

            L6_2 = "AgentManagement"

            L4_2 = L4_2(L5_2, L6_2)

            L5_2 = L3_2.job

            L5_2 = L5_2.grade

            L5_2 = L5_2.level

            if L4_2 <= L5_2 then

              L2_2 = true

            else

              L2_2 = false

            end

          else

            L2_2 = true

          end

        end

      end

    end

  end

  ::lbl_155::

  L4_2 = A1_2

  L5_2 = L2_2

  L4_2(L5_2)

end

L2_1(L3_1, L4_1)
]==] -- END DEAD CODE RAC-002

L2_1 = RegisterNUICallback

L3_1 = "GetInventory"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = exports

  L2_2 = L2_2.origen_police

  L3_2 = L2_2

  L2_2 = L2_2.FW_GetPlayerData

  L4_2 = false

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = #A0_2

  if 0 == L3_2 then

    L3_2 = A1_2

    L4_2 = L2_2.items

    L3_2(L4_2)

  else

    L3_2 = {}

    L4_2 = pairs

    L5_2 = L2_2.items

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = InSmallArray

      L11_2 = L9_2.name

      L12_2 = A0_2

      L10_2 = L10_2(L11_2, L12_2)

      if L10_2 then

        L10_2 = table

        L10_2 = L10_2.insert

        L11_2 = L3_2

        L12_2 = L9_2

        L10_2(L11_2, L12_2)

      end

    end

    L4_2 = A1_2

    L5_2 = L3_2

    L4_2(L5_2)

  end

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:CloseRadioTab"

function L4_1()

  local L0_2, L1_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "CloseRadioTab"

  L0_2(L1_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:toggleDuty"

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  if A0_2 then

    L1_2 = Wait

    L2_2 = 2000

    L1_2(L2_2)

  end

  L1_2 = TriggerServerEvent

  L2_2 = "QBCore:ToggleDuty"

  L1_2(L2_2)

  L1_2 = TriggerServerEvent

  L2_2 = "origen_police:server_esx:SetDuty"

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.GetPoliceDuty

  L3_2 = L3_2(L4_2)

  L3_2 = not L3_2

  L1_2(L2_2, L3_2)

end

L2_1(L3_1, L4_1)

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = FW_TriggerCallback

  L2_2 = "origen_police:server:GetCameraUrl"

  function L3_2(A0_3)

    local L1_3, L2_3

    if A0_3 then

      L1_3 = A0_2

      L2_3 = A0_3

      L1_3(L2_3)

    else

      L1_3 = A0_2

      L2_3 = nil

      L1_3(L2_3)

    end

  end

  L1_2(L2_2, L3_2)

end

GetCameraWebhook = L2_1

L2_1 = exports

L3_1 = "GetWebhook"

L4_1 = GetCameraWebhook

L2_1(L3_1, L4_1)

L2_1 = false

L3_1 = RegisterNUICallback

L4_1 = "TakePicture"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = L2_1

  if not L2_2 then

    L2_2 = GetCameraWebhook

    function L3_2(A0_3)

      local L1_3, L2_3

      if not A0_3 then

        L1_3 = A1_2

        L2_3 = false

        L1_3(L2_3)

        L1_3 = false

        L2_1 = L1_3

        L1_3 = TogglePause

        L2_3 = false

        L1_3(L2_3)

        L1_3 = Wait

        L2_3 = 100

        L1_3(L2_3)

        L1_3 = TogglePause

        L2_3 = true

        L1_3(L2_3)

        L1_3 = ShowNotification

        L2_3 = "The camera logs are not configured correctly"

        return L1_3(L2_3)

      end

      L1_3 = true

      L2_1 = L1_3

      L1_3 = Citizen

      L1_3 = L1_3.CreateThread

      function L2_3()

        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4

        L0_4 = GetGameplayCamFov

        L0_4 = L0_4()

        L1_4 = PlayerPedId

        L1_4 = L1_4()

        L2_4 = GetEntityCoords

        L3_4 = L1_4

        L2_4 = L2_4(L3_4)

        L3_4 = vector3

        L4_4 = 0

        L5_4 = 0

        L6_4 = 0.6

        L3_4 = L3_4(L4_4, L5_4, L6_4)

        L2_4 = L2_4 + L3_4

        L3_4 = GetEntityForwardVector

        L4_4 = L1_4

        L3_4 = L3_4(L4_4)

        L3_4 = L3_4 * 0.7

        L2_4 = L2_4 + L3_4

        L3_4 = CreateCamWithParams

        L4_4 = "DEFAULT_SCRIPTED_CAMERA"

        L5_4 = L2_4

        L6_4 = GetEntityRotation

        L7_4 = L1_4

        L8_4 = 2

        L6_4 = L6_4(L7_4, L8_4)

        L7_4 = L0_4

        L3_4 = L3_4(L4_4, L5_4, L6_4, L7_4)

        L4_4 = L0_4

        L5_4 = IsMinimapRendering

        L5_4 = L5_4()

        L6_4 = SetCamActive

        L7_4 = L3_4

        L8_4 = true

        L6_4(L7_4, L8_4)

        L6_4 = RenderScriptCams

        L7_4 = true

        L8_4 = true

        L9_4 = 2000

        L10_4 = true

        L11_4 = false

        L6_4(L7_4, L8_4, L9_4, L10_4, L11_4)

        L6_4 = DisplayRadar

        L7_4 = false

        L6_4(L7_4)

        L6_4 = Citizen

        L6_4 = L6_4.Wait

        L7_4 = 2000

        L6_4(L7_4)

        L6_4 = false

        while true do

          L7_4 = L2_1

          if not L7_4 then

            break

          end

          L7_4 = Citizen

          L7_4 = L7_4.Wait

          L8_4 = 0

          L7_4(L8_4)

          L7_4 = HandleZoom

          L8_4 = L3_4

          L9_4 = L0_4

          L10_4 = L4_4

          L7_4 = L7_4(L8_4, L9_4, L10_4)

          L0_4 = L7_4

          L7_4 = CheckInputRotation

          L8_4 = L3_4

          L9_4 = L0_4

          L7_4(L8_4, L9_4)

          L7_4 = DisableAllControlActions

          L8_4 = 0

          L7_4(L8_4)

          L7_4 = IsDisabledControlJustPressed

          L8_4 = 0

          L9_4 = 176

          L7_4 = L7_4(L8_4, L9_4)

          if L7_4 and not L6_4 then

            L6_4 = true

            L7_4 = exports

            L7_4 = L7_4.origen_police

            L8_4 = L7_4

            L7_4 = L7_4.TakePhoto

            L9_4 = A0_3

            L7_4 = L7_4(L8_4, L9_4)

            A0_3 = L7_4

            L7_4 = exports

            L7_4 = L7_4.origen_police

            L8_4 = L7_4

            L7_4 = L7_4.FW_TriggerCallback

            L9_4 = "origen_police:police:UpdateCitizenStatus"

            function L10_4(A0_5)

              local L1_5, L2_5

              L1_5 = A1_2

              if A0_5 then

                L2_5 = A0_3

                if L2_5 then

                  goto lbl_8

                end

              end

              L2_5 = false

              ::lbl_8::

              L1_5(L2_5)

              L1_5 = false

              L2_1 = L1_5

              L1_5 = TogglePause

              L2_5 = true

              L1_5(L2_5)

            end

            L11_4 = {}

            L12_4 = A0_2.citizenid

            L11_4.citizenid = L12_4

            L11_4.column = "image"

            L12_4 = A0_3

            L11_4.value = L12_4

            L7_4(L8_4, L9_4, L10_4, L11_4)

          end

          L7_4 = IsDisabledControlJustPressed

          L8_4 = 0

          L9_4 = 177

          L7_4 = L7_4(L8_4, L9_4)

          if L7_4 and not L6_4 then

            L7_4 = A1_2

            L8_4 = false

            L7_4(L8_4)

            L7_4 = false

            L2_1 = L7_4

            L7_4 = TogglePause

            L8_4 = true

            L7_4(L8_4)

          end

        end

        L7_4 = DisplayRadar

        L8_4 = L5_4

        L7_4(L8_4)

        L7_4 = ClearPedTasks

        L8_4 = L1_4

        L7_4(L8_4)

        L7_4 = SetCamActive

        L8_4 = L3_4

        L9_4 = false

        L7_4(L8_4, L9_4)

        L7_4 = DestroyCam

        L8_4 = L3_4

        L9_4 = true

        L7_4(L8_4, L9_4)

        L7_4 = RenderScriptCams

        L8_4 = false

        L9_4 = true

        L10_4 = 2000

        L11_4 = true

        L12_4 = false

        L7_4(L8_4, L9_4, L10_4, L11_4, L12_4)

      end

      L1_3(L2_3)

    end

    L2_2(L3_2)

  end

end

L3_1(L4_1, L5_1)

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = GetDisabledControlNormal

  L3_2 = 0

  L4_2 = 220

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = GetDisabledControlNormal

  L4_2 = 0

  L5_2 = 221

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = GetCamRot

  L5_2 = A0_2

  L6_2 = 2

  L4_2 = L4_2(L5_2, L6_2)

  if 0.0 ~= L2_2 or 0.0 ~= L3_2 then

    L5_2 = L4_2.z

    L6_2 = L2_2 * -1.0

    L6_2 = L6_2 * 0.1

    L7_2 = A1_2 + 0.1

    L6_2 = L6_2 * L7_2

    L5_2 = L5_2 + L6_2

    L6_2 = math

    L6_2 = L6_2.max

    L7_2 = math

    L7_2 = L7_2.min

    L8_2 = 65.0

    L9_2 = L4_2.x

    L10_2 = L3_2 * -1.0

    L10_2 = L10_2 * 0.1

    L11_2 = A1_2 + 0.1

    L10_2 = L10_2 * L11_2

    L9_2 = L9_2 + L10_2

    L7_2 = L7_2(L8_2, L9_2)

    L8_2 = -65.0

    L6_2 = L6_2(L7_2, L8_2)

    L7_2 = SetCamRot

    L8_2 = A0_2

    L9_2 = L6_2

    L10_2 = 0.0

    L11_2 = L5_2

    L12_2 = 2

    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)

  end

end

CheckInputRotation = L3_1

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = IsDisabledControlJustPressed

  L4_2 = 0

  L5_2 = 241

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L3_2 = math

    L3_2 = L3_2.max

    L4_2 = A1_2 - 3.0

    L5_2 = 5.0

    L3_2 = L3_2(L4_2, L5_2)

    A1_2 = L3_2

  end

  L3_2 = IsDisabledControlJustPressed

  L4_2 = 0

  L5_2 = 242

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L3_2 = math

    L3_2 = L3_2.min

    L4_2 = A1_2 + 3.0

    L5_2 = A2_2

    L3_2 = L3_2(L4_2, L5_2)

    A1_2 = L3_2

  end

  L3_2 = GetCamFov

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L4_2 = math

  L4_2 = L4_2.abs

  L5_2 = A1_2 - L3_2

  L4_2 = L4_2(L5_2)

  L5_2 = 0.1

  if L4_2 < L5_2 then

    A1_2 = L3_2

  end

  L4_2 = SetCamFov

  L5_2 = A0_2

  L6_2 = A1_2 - L3_2

  L6_2 = L6_2 * 0.05

  L6_2 = L3_2 + L6_2

  L4_2(L5_2, L6_2)

  return A1_2

end

HandleZoom = L3_1

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = 0

  L3_2 = #A1_2

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = A1_2[L5_2]

    if L6_2 == A0_2 then

      L6_2 = true

      return L6_2

    end

  end

  L2_2 = false

  return L2_2

end

InSmallArray = L3_1

L3_1 = RegisterNUICallback

L4_1 = "ShowBodycam"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:ShowBodycam"

  L4_2 = tonumber

  L5_2 = A0_2.id

  L4_2, L5_2 = L4_2(L5_2)

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "ShowCarcam"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:ShowCarcam"

  L4_2 = tonumber

  L5_2 = A0_2.netid

  L4_2, L5_2 = L4_2(L5_2)

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "GetPoliceGrades"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = Framework

  L2_2 = L2_2.Shared

  L2_2 = L2_2.Jobs

  if not L2_2 then

    L3_2 = Debuger

    L4_2 = "The Framework.Shared.Jobs appear to be nil, please check your framework configuration."

    L3_2(L4_2)

    L3_2 = A1_2

    L4_2 = {}

    return L3_2(L4_2)

  end

  L3_2 = A0_2.job

  L3_2 = L2_2[L3_2]

  if not L3_2 then

    L3_2 = Debuger

    L4_2 = "The job '"

    L5_2 = A0_2.job

    L6_2 = "' does not exist in Framework.Shared.Jobs."

    L4_2 = L4_2 .. L5_2 .. L6_2

    L3_2(L4_2)

    L3_2 = A1_2

    L4_2 = {}

    return L3_2(L4_2)

  end

  L3_2 = A0_2.job

  L3_2 = L2_2[L3_2]

  L3_2 = L3_2.grades

  if not L3_2 then

    L3_2 = Debuger

    L4_2 = "The job '"

    L5_2 = A0_2.job

    L6_2 = "' does not have grades defined in Framework.Shared.Jobs."

    L4_2 = L4_2 .. L5_2 .. L6_2

    L3_2(L4_2)

    L3_2 = A1_2

    L4_2 = {}

    return L3_2(L4_2)

  end

  L3_2 = A1_2

  L4_2 = A0_2.job

  L4_2 = L2_2[L4_2]

  L4_2 = L4_2.grades

  L3_2(L4_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:HideCamHud"

function L5_1()

  local L0_2, L1_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "HideCamHud"

  L0_2(L1_2)

  L0_2 = TogglePause

  L1_2 = true

  L0_2(L1_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:rpol"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "RpolMessage"

  L2_2.message = A0_2

  L1_2(L2_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "SendRpolMessage"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = UseCommand

  L3_2 = "rpol"

  L4_2 = A0_2.message

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police_menu:client:ReceiveAlert"

function L5_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = GetEntityCoords

  L2_2 = PlayerPedId

  L2_2, L3_2, L4_2, L5_2 = L2_2()

  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)

  L2_2 = A0_2.coords

  L1_2 = L1_2 - L2_2

  L1_2 = #L1_2

  A0_2.distance = L1_2

  L1_2 = A0_2.distance

  L2_2 = 1000

  if L1_2 < L2_2 then

    L1_2 = FW_Round

    L2_2 = A0_2.distance

    L3_2 = 2

    L1_2 = L1_2(L2_2, L3_2)

    L2_2 = " m"

    L1_2 = L1_2 .. L2_2

    A0_2.distance = L1_2

  else

    L1_2 = FW_Round

    L2_2 = A0_2.distance

    L2_2 = L2_2 / 1000

    L3_2 = 2

    L1_2 = L1_2(L2_2, L3_2)

    L2_2 = " Km"

    L1_2 = L1_2 .. L2_2

    A0_2.distance = L1_2

  end

  L1_2 = GetStreetNameFromHashKey

  L2_2 = GetStreetNameAtCoord

  L3_2 = A0_2.coords

  L3_2 = L3_2.x

  L4_2 = A0_2.coords

  L4_2 = L4_2.y

  L5_2 = A0_2.coords

  L5_2 = L5_2.z

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2, L4_2, L5_2)

  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)

  A0_2.street = L1_2

  A0_2.time = 0

  L1_2 = PlaySoundFrontend

  L2_2 = -1

  L3_2 = "Event_Message_Purple"

  L4_2 = "GTAO_FM_Events_Soundset"

  L5_2 = false

  L1_2(L2_2, L3_2, L4_2, L5_2)

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "ReceiveAlert"

  L2_2.alert = A0_2

  L1_2(L2_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police_menu:client:EditAlert"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "EditAlert"

  L2_2.data = A0_2

  L1_2(L2_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:AddCentralMark"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "AddCentralMark"

  L3_2.id = A0_2

  L3_2.data = A1_2

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:UpdateCentralMark"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "UpdateCentralMark"

  L3_2.id = A0_2

  L3_2.data = A1_2

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:RemoveCentralMark"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "RemoveCentralMark"

  L2_2.id = A0_2

  L1_2(L2_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:UpdateCentralPositions"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "UpdateCentralPositions"

  L3_2.VehicleTrackeds = A0_2

  L3_2.Cops = A1_2

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

