local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = false

L1_1 = nil

L2_1 = nil

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:OpenPoliceCad"

function L5_1()

  local L0_2, L1_2, L2_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  if nil ~= L0_2 then

    L1_2 = L0_2.job

    if nil ~= L1_2 then

      L1_2 = L0_2.job

      L1_2 = L1_2.name

      if nil ~= L1_2 then

        goto lbl_14

      end

    end

  end

  do return end

  ::lbl_14::

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if not L1_2 then

    L1_2 = FW_Notify

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.CantUseItem

    return L1_2(L2_2)

  end

  L1_2 = L0_1

  if not L1_2 then

    L1_2 = TogglePause

    L2_2 = true

    L1_2(L2_2)

  end

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "close"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = L0_1

  if L2_2 then

    L2_2 = TogglePause

    L3_2 = false

    L2_2(L3_2)

    L2_2 = true

    L0_1 = L2_2

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 100

    L2_2(L3_2)

    L2_2 = false

    L0_1 = L2_2

  end

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L2_2 = FW_GetPlayerData

  L3_2 = false

  L2_2 = L2_2(L3_2)

  if nil ~= L2_2 then

    L3_2 = L2_2.job

    if nil ~= L3_2 then

      L3_2 = L2_2.job

      L3_2 = L3_2.name

      if nil ~= L3_2 then

        goto lbl_14

      end

    end

  end

  do return end

  ::lbl_14::

  L3_2 = L2_1

  if nil == L3_2 then

    -- [INST INST-028][RAC-007] getAdminState debe pedirse SIEMPRE que falte cache,
    -- no solo cuando IgnoreSettings == false. Con mapas en Config.Maps,
    -- IgnoreSettings es true y antes NUNCA se llamaba al callback → isAdmin nil
    -- y el tab SETTINGS no aparecía aunque el jugador tuviera ACE admin/god.
    L3_2 = FW_TriggerCallback

    L4_2 = "origen_police:server:getAdminState"

    function L5_2(A0_3)

      local L1_3

      L2_1 = A0_3

    end

    L3_2(L4_2, L5_2)

    while true do

      L3_2 = L2_1

      if nil ~= L3_2 then

        break

      end

      L3_2 = Citizen

      L3_2 = L3_2.Wait

      L4_2 = 0

      L3_2(L4_2)

    end

  end

  L3_2 = SetNuiFocusKeepInput

  L4_2 = false

  L3_2(L4_2)

  L3_2 = DisableAllControlActions

  L4_2 = 0

  L3_2(L4_2)

  L3_2 = Citizen

  L3_2 = L3_2.Wait

  L4_2 = 1

  L3_2(L4_2)

  if nil ~= A0_2 then

    L0_1 = A0_2

  else

    L3_2 = L0_1

    L3_2 = not L3_2

    L0_1 = L3_2

  end

  L3_2 = L0_1

  if L3_2 then

    L3_2 = Citizen

    L3_2 = L3_2.CreateThread

    function L4_2()

      local L0_3, L1_3, L2_3, L3_3

      while true do

        L0_3 = L0_1

        if not L0_3 then

          break

        end

        L0_3 = DisableAllControlActions

        L1_3 = 0

        L0_3(L1_3)

        L0_3 = EnableControlAction

        L1_3 = 0

        L2_3 = 249

        L3_3 = true

        L0_3(L1_3, L2_3, L3_3)

        L0_3 = EnableControlAction

        L1_3 = 1

        L2_3 = 249

        L3_3 = true

        L0_3(L1_3, L2_3, L3_3)

        L0_3 = EnableControlAction

        L1_3 = 2

        L2_3 = 249

        L3_3 = true

        L0_3(L1_3, L2_3, L3_3)

        L0_3 = Wait

        L1_3 = 0

        L0_3(L1_3)

      end

      while true do

        L0_3 = IsControlPressed

        L1_3 = 0

        L2_3 = 200

        L0_3 = L0_3(L1_3, L2_3)

        if not L0_3 then

          L0_3 = IsDisabledControlPressed

          L1_3 = 0

          L2_3 = 200

          L0_3 = L0_3(L1_3, L2_3)

          if not L0_3 then

            break

          end

        end

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 0

        L0_3(L1_3)

        L0_3 = DisableControlAction

        L1_3 = 0

        L2_3 = 200

        L3_3 = true

        L0_3(L1_3, L2_3, L3_3)

      end

      L0_3 = DisableControlAction

      L1_3 = 0

      L2_3 = 200

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

    end

    L3_2(L4_2)

    L3_2 = RequestAnimDict

    L4_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"

    L3_2(L4_2)

    while true do

      L3_2 = HasAnimDictLoaded

      L4_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"

      L3_2 = L3_2(L4_2)

      if L3_2 then

        break

      end

      L3_2 = Wait

      L4_2 = 500

      L3_2(L4_2)

    end

    L3_2 = "prop_cs_tablet"

    L4_2 = IsPedInAnyVehicle

    L5_2 = PlayerPedId

    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2()

    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

    if not L4_2 then

      L4_2 = TaskPlayAnim

      L5_2 = PlayerPedId

      L5_2 = L5_2()

      L6_2 = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a"

      L7_2 = "idle_a"

      L8_2 = 2.0

      L9_2 = 3.0

      L10_2 = -1

      L11_2 = 51

      L12_2 = 0

      L13_2 = false

      L14_2 = false

      L15_2 = false

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = CreateObject

      L5_2 = GetHashKey

      L6_2 = L3_2

      L5_2 = L5_2(L6_2)

      L6_2 = 0

      L7_2 = 0

      L8_2 = 0

      L9_2 = true

      L10_2 = true

      L11_2 = true

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

      L1_1 = L4_2

      L4_2 = AttachEntityToEntity

      L5_2 = L1_1

      L6_2 = PlayerPedId

      L6_2 = L6_2()

      L7_2 = GetPedBoneIndex

      L8_2 = PlayerPedId

      L8_2 = L8_2()

      L9_2 = 28422

      L7_2 = L7_2(L8_2, L9_2)

      L8_2 = -0.05

      L9_2 = 0.0

      L10_2 = 0.0

      L11_2 = 0.0

      L12_2 = 0.0

      L13_2 = 0.0

      L14_2 = true

      L15_2 = true

      L16_2 = 0

      L17_2 = true

      L18_2 = true

      L19_2 = true

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

    end

    L4_2 = exports

    L4_2 = L4_2.origen_police

    L5_2 = L4_2

    L4_2 = L4_2.FW_GetPlayerData

    L6_2 = false

    L4_2 = L4_2(L5_2, L6_2)

    L5_2 = {}

    L5_2.open = true

    L6_2 = Config

    L6_2 = L6_2.Translations

    L5_2.translations = L6_2

    L6_2 = exports

    L6_2 = L6_2.origen_police

    L7_2 = L6_2

    L6_2 = L6_2.GerPermissions

    L6_2 = L6_2(L7_2)

    L5_2.permissions = L6_2

    L6_2 = L2_1

    L5_2.isAdmin = L6_2

    L6_2 = {}

    L7_2 = L4_2.job

    L7_2 = L7_2.onduty

    L6_2.duty = L7_2

    L7_2 = L4_2.job

    L7_2 = L7_2.name

    L6_2.name = L7_2

    L7_2 = L4_2.job

    L7_2 = L7_2.grade

    L7_2 = L7_2.level

    L6_2.level = L7_2

    L5_2.jobData = L6_2

    L6_2 = Config

    L6_2 = L6_2.JobCategory

    L5_2.jobCategories = L6_2

    L6_2 = {}

    L7_2 = Config

    L7_2 = L7_2.ShowGuideButton

    L6_2.GuideBtn = L7_2

    L5_2.options = L6_2

    L6_2 = SendNUIMessage

    L7_2 = L5_2

    L6_2(L7_2)

    L5_2.permissions = nil

    L5_2.translations = nil

    L6_2 = Debuger

    L7_2 = "Open cad data: "

    L8_2 = json

    L8_2 = L8_2.encode

    L9_2 = L5_2

    L10_2 = {}

    L10_2.indent = true

    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L8_2(L9_2, L10_2)

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

    L6_2 = SetNuiFocus

    L7_2 = true

    L8_2 = true

    L6_2(L7_2, L8_2)

    L6_2 = SetNuiFocusKeepInput

    L7_2 = A1_2

    L6_2(L7_2)

  else

    L3_2 = L1_1

    if nil ~= L3_2 then

      L3_2 = ClearPedSecondaryTask

      L4_2 = PlayerPedId

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L4_2()

      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

      L3_2 = DetachEntity

      L4_2 = L1_1

      L5_2 = false

      L6_2 = false

      L3_2(L4_2, L5_2, L6_2)

      L3_2 = DeleteEntity

      L4_2 = L1_1

      L3_2(L4_2)

    end

    L3_2 = SetNuiFocus

    L4_2 = false

    L5_2 = false

    L3_2(L4_2, L5_2)

  end

end

TogglePause = L3_1

L3_1 = RegisterNUICallback

L4_1 = "ExecuteCommand"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = ExecuteCommand

  L3_2 = A0_2.command

  L2_2(L3_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "SetWaypointinCoords"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetNewWaypoint

  L3_2 = A0_2.x

  L4_2 = A0_2.y

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "GetClosestPlayers"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = exports

  L2_2 = L2_2.origen_police

  L3_2 = L2_2

  L2_2 = L2_2.FW_GetPlayersFromCoords

  L4_2 = GetEntityCoords

  L5_2 = PlayerPedId

  L5_2, L6_2, L7_2, L8_2 = L5_2()

  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

  L5_2 = 10

  L2_2 = L2_2(L3_2, L4_2, L5_2)

  L3_2 = 1

  L4_2 = #L2_2

  L5_2 = 1

  for L6_2 = L3_2, L4_2, L5_2 do

    L7_2 = GetPlayerServerId

    L8_2 = L2_2[L6_2]

    L7_2 = L7_2(L8_2)

    L2_2[L6_2] = L7_2

  end

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.FW_TriggerCallback

  L5_2 = "origen_police:server:GetClosestPlayers"

  function L6_2(A0_3)

    local L1_3, L2_3

    L1_3 = A1_2

    L2_3 = A0_3

    L1_3(L2_3)

  end

  L7_2 = L2_2

  L8_2 = A0_2

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "GetCoords"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = GetEntityCoords

  L3_2 = PlayerPedId

  L3_2, L4_2, L5_2, L6_2 = L3_2()

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

  L3_2 = A1_2

  L4_2 = {}

  L5_2 = L2_2.x

  L4_2.x = L5_2

  L5_2 = L2_2.y

  L4_2.y = L5_2

  L5_2 = L2_2.z

  L4_2.z = L5_2

  L5_2 = GetEntityHeading

  L6_2 = PlayerPedId

  L6_2 = L6_2()

  L5_2 = L5_2(L6_2)

  L4_2.w = L5_2

  L3_2(L4_2)

end

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "SendNUIMessage"

L5_1 = SendNUIMessage

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "TogglePause"

L5_1 = TogglePause

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "InTablet"

function L5_1()

  local L0_2, L1_2

  L0_2 = L0_1

  return L0_2

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNUICallback

L4_1 = "showGameMenu"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = ActivateFrontendMenu

  L3_2 = GetHashKey

  L4_2 = A0_2.menu

  L3_2 = L3_2(L4_2)

  L4_2 = 0

  L5_2 = -1

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:ForceNotification"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "ForceNotification"

  L2_2.notify = A0_2

  L1_2(L2_2)

end

L3_1(L4_1, L5_1)

L3_1 = AddEventHandler

L4_1 = "onResourceStop"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = GetCurrentResourceName

  L1_2 = L1_2()

  if A0_2 == L1_2 then

    L1_2 = L1_1

    if L1_2 then

      L1_2 = DeleteEntity

      L2_2 = L1_1

      L1_2(L2_2)

    end

  end

end

L3_1(L4_1, L5_1)

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.OpenPoliceCad

L3_1 = L3_1.cmd

if L3_1 then

  L3_1 = RegisterCommand

  L4_1 = Config

  L4_1 = L4_1.Commands

  L4_1 = L4_1.OpenPoliceCad

  L4_1 = L4_1.cmd

  function L5_1(A0_2, A1_2)

    local L2_2, L3_2

    L2_2 = TriggerEvent

    L3_2 = "origen_police:client:OpenPoliceCad"

    L2_2(L3_2)

  end

  L3_1(L4_1, L5_1)

  L3_1 = RegisterKeyMapping

  L4_1 = Config

  L4_1 = L4_1.Commands

  L4_1 = L4_1.OpenPoliceCad

  L4_1 = L4_1.cmd

  L5_1 = Config

  L5_1 = L5_1.Commands

  L5_1 = L5_1.OpenPoliceCad

  L5_1 = L5_1.description

  L6_1 = "keyboard"

  L7_1 = Config

  L7_1 = L7_1.Commands

  L7_1 = L7_1.OpenPoliceCad

  L7_1 = L7_1.key

  L3_1(L4_1, L5_1, L6_1, L7_1)

end

