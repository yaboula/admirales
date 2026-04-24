local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1

L0_1 = 1

L1_1 = false

L2_1 = false

L3_1 = false

L4_1 = nil

L5_1 = false

L6_1 = false

L7_1 = false

L8_1 = Citizen

L8_1 = L8_1.CreateThread

function L9_1()

  local L0_2, L1_2, L2_2

  L0_2 = Wait

  L1_2 = 5000

  L0_2(L1_2)

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "translations"

  L2_2 = Config

  L2_2 = L2_2.Translations

  L1_2.translations = L2_2

  L0_2(L1_2)

end

L8_1(L9_1)

L8_1 = RegisterCommand

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.Minimap

L9_1 = L9_1.cmd

function L10_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = Config

  L0_2 = L0_2.ChangeMinimapSize

  if not L0_2 then

    return

  end

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if L1_2 then

    L1_2 = L0_2.job

    L1_2 = L1_2.onduty

    if L1_2 then

      L1_2 = L0_1

      if 3 == L1_2 then

        L1_2 = 1

        L0_1 = L1_2

      else

        L1_2 = L0_1

        L1_2 = L1_2 + 1

        L0_1 = L1_2

      end

      L1_2 = L0_1

      if 1 == L1_2 then

        L1_2 = SetBigmapActive

        L2_2 = false

        L3_2 = false

        L1_2(L2_2, L3_2)

      else

        L1_2 = L0_1

        if 2 == L1_2 then

          L1_2 = SetBigmapActive

          L2_2 = true

          L3_2 = false

          L1_2(L2_2, L3_2)

        else

          L1_2 = L0_1

          if 3 == L1_2 then

            L1_2 = SetBigmapActive

            L2_2 = true

            L3_2 = true

            L1_2(L2_2, L3_2)

          end

        end

      end

    end

  end

end

L8_1(L9_1, L10_1)

L8_1 = RegisterKeyMapping

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.Minimap

L9_1 = L9_1.cmd

L10_1 = Config

L10_1 = L10_1.Commands

L10_1 = L10_1.Minimap

L10_1 = L10_1.description

L11_1 = "keyboard"

L12_1 = Config

L12_1 = L12_1.Commands

L12_1 = L12_1.Minimap

L12_1 = L12_1.key

L8_1(L9_1, L10_1, L11_1, L12_1)

L8_1 = RegisterCommand

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.QuickAccess

L9_1 = L9_1.cmd

function L10_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = IsNuiFocused

  L3_2 = L3_2()

  if L3_2 then

    return

  end

  L3_2 = FW_GetPlayerData

  L4_2 = false

  L3_2 = L3_2(L4_2)

  L4_2 = CanOpenQuickAccessMenu

  L4_2 = L4_2()

  if L4_2 then

    L4_2 = SendNUIMessage

    L5_2 = {}

    L5_2.action = "OpenQuickAccess"

    L6_2 = L3_1

    if not L6_2 then

      L6_2 = Config

      L6_2 = L6_2.Translations

      if L6_2 then

        goto lbl_25

      end

    end

    L6_2 = nil

    ::lbl_25::

    L5_2.translations = L6_2

    L6_2 = exports

    L6_2 = L6_2.origen_police

    L7_2 = L6_2

    L6_2 = L6_2.GerPermissions

    L6_2 = L6_2(L7_2)

    L5_2.permissions = L6_2

    L6_2 = {}

    L7_2 = L3_2.job

    L7_2 = L7_2.onduty

    L6_2.duty = L7_2

    L7_2 = L3_2.job

    L7_2 = L7_2.name

    L6_2.name = L7_2

    L7_2 = L3_2.job

    L7_2 = L7_2.grade

    L7_2 = L7_2.level

    L6_2.level = L7_2

    L5_2.jobData = L6_2

    L6_2 = {}

    L7_2 = Config

    L7_2 = L7_2.Confiscate

    L6_2.confiscate = L7_2

    L7_2 = Config

    L7_2 = L7_2.Holster

    L6_2.holster = L7_2

    L5_2.options = L6_2

    L4_2(L5_2)

    L4_2 = SetNuiFocus

    L5_2 = true

    L6_2 = Config

    L6_2 = L6_2.Actions

    L6_2 = L6_2.QuickAccessShowCursor

    L4_2(L5_2, L6_2)

    L4_2 = Citizen

    L4_2 = L4_2.CreateThread

    function L5_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3

      L0_3 = SetNuiFocusKeepInput

      L1_3 = Config

      L1_3 = L1_3.Actions

      L1_3 = L1_3.QuickAccessKeepInput

      L0_3(L1_3)

      while true do

        L0_3 = IsNuiFocused

        L0_3 = L0_3()

        if not L0_3 then

          break

        end

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 0

        L0_3(L1_3)

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

        L0_3 = pairs

        L1_3 = Config

        L1_3 = L1_3.Actions

        L1_3 = L1_3.QuickAccessAllowedInputs

        L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)

        for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do

          L6_3 = EnableControlAction

          L7_3 = 0

          L8_3 = L5_3

          L9_3 = true

          L6_3(L7_3, L8_3, L9_3)

        end

      end

      L0_3 = SetNuiFocusKeepInput

      L1_3 = false

      L0_3(L1_3)

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

    L4_2(L5_2)

  end

end

L8_1(L9_1, L10_1)

L8_1 = RegisterNUICallback

L9_1 = "translationsRecived"

function L10_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = true

  L3_1 = L2_2

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L8_1(L9_1, L10_1)

L8_1 = RegisterKeyMapping

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.QuickAccess

L9_1 = L9_1.cmd

L10_1 = Config

L10_1 = L10_1.Commands

L10_1 = L10_1.QuickAccess

L10_1 = L10_1.description

L11_1 = "keyboard"

L12_1 = Config

L12_1 = L12_1.Commands

L12_1 = L12_1.QuickAccess

L12_1 = L12_1.key

L8_1(L9_1, L10_1, L11_1, L12_1)

L8_1 = RegisterNUICallback

L9_1 = "notification"

function L10_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = ShowNotification

  L3_2 = A0_2

  L2_2(L3_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L8_1(L9_1, L10_1)

L8_1 = 0

L9_1 = RegisterNUICallback

L10_1 = "quickaction"

function L11_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L2_2 = A0_2.event

  if not L2_2 then

    L2_2 = A0_2.serverevent

  end

  if L2_2 then

    L4_2 = L2_2

    L3_2 = L2_2.find

    L5_2 = "^origen_police"

    L3_2 = L3_2(L4_2, L5_2)

    if not L3_2 then

      L3_2 = Debuger

      L4_2 = "Trying to execute event with unknown name"

      L3_2(L4_2)

      L3_2 = A1_2

      L4_2 = false

      return L3_2(L4_2)

    end

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L4_2 = L8_1

    L3_2 = L3_2 - L4_2

    L4_2 = 500

    if L3_2 <= L4_2 then

      L3_2 = Debuger

      L4_2 = "Trying too fast with action: "

      L5_2 = L2_2

      L6_2 = ", remaining time: "

      L7_2 = GetGameTimer

      L7_2 = L7_2()

      L8_2 = L8_1

      L7_2 = L7_2 - L8_2

      L3_2(L4_2, L5_2, L6_2, L7_2)

      L3_2 = ShowNotification

      L4_2 = "You are doing this too fast"

      return L3_2(L4_2)

    end

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L8_1 = L3_2

  end

  L3_2 = A0_2.action

  if "ReferenceIcon" == L3_2 then

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = GetVehiclePedIsIn

    L5_2 = L3_2

    L6_2 = false

    L4_2 = L4_2(L5_2, L6_2)

    if 0 ~= L4_2 then

      L5_2 = GetPedInVehicleSeat

      L6_2 = L4_2

      L7_2 = -1

      L5_2 = L5_2(L6_2, L7_2)

      if L5_2 == L3_2 then

        goto lbl_77

      end

      L5_2 = GetPedInVehicleSeat

      L6_2 = L4_2

      L7_2 = 0

      L5_2 = L5_2(L6_2, L7_2)

      if L5_2 == L3_2 then

        goto lbl_77

      end

    end

    L5_2 = TriggerServerEvent

    L6_2 = "origen_police:server:updateref"

    L7_2 = {}

    L8_2 = tonumber

    L9_2 = A0_2.id

    L8_2 = L8_2(L9_2)

    L7_2.sprite = L8_2

    L5_2(L6_2, L7_2)

    goto lbl_283

    ::lbl_77::

    L5_2 = {}

    L6_2 = -1

    L7_2 = 0

    L8_2 = 1

    for L9_2 = L6_2, L7_2, L8_2 do

      L10_2 = GetPedInVehicleSeat

      L11_2 = L4_2

      L12_2 = L9_2

      L10_2 = L10_2(L11_2, L12_2)

      if 0 ~= L10_2 then

        L11_2 = table

        L11_2 = L11_2.insert

        L12_2 = L5_2

        L13_2 = GetPlayerServerId

        L14_2 = NetworkGetPlayerIndexFromPed

        L15_2 = L10_2

        L14_2, L15_2 = L14_2(L15_2)

        L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)

        L11_2(L12_2, L13_2, L14_2, L15_2)

      end

    end

    L6_2 = TriggerServerEvent

    L7_2 = "origen_police:server:updateref"

    L8_2 = {}

    L9_2 = tonumber

    L10_2 = A0_2.id

    L9_2 = L9_2(L10_2)

    L8_2.sprite = L9_2

    L9_2 = L5_2

    L6_2(L7_2, L8_2, L9_2)

  else

    L3_2 = A0_2.action

    if "ReferenceColor" == L3_2 then

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = GetVehiclePedIsIn

      L5_2 = L3_2

      L6_2 = false

      L4_2 = L4_2(L5_2, L6_2)

      if 0 ~= L4_2 then

        L5_2 = GetPedInVehicleSeat

        L6_2 = L4_2

        L7_2 = -1

        L5_2 = L5_2(L6_2, L7_2)

        if L5_2 == L3_2 then

          goto lbl_143

        end

        L5_2 = GetPedInVehicleSeat

        L6_2 = L4_2

        L7_2 = 0

        L5_2 = L5_2(L6_2, L7_2)

        if L5_2 == L3_2 then

          goto lbl_143

        end

      end

      L5_2 = TriggerServerEvent

      L6_2 = "origen_police:server:updateref"

      L7_2 = {}

      L8_2 = tonumber

      L9_2 = A0_2.id

      L8_2 = L8_2(L9_2)

      L7_2.color = L8_2

      L5_2(L6_2, L7_2)

      goto lbl_283

      ::lbl_143::

      L5_2 = {}

      L6_2 = -1

      L7_2 = 0

      L8_2 = 1

      for L9_2 = L6_2, L7_2, L8_2 do

        L10_2 = GetPedInVehicleSeat

        L11_2 = L4_2

        L12_2 = L9_2

        L10_2 = L10_2(L11_2, L12_2)

        if 0 ~= L10_2 then

          L11_2 = table

          L11_2 = L11_2.insert

          L12_2 = L5_2

          L13_2 = GetPlayerServerId

          L14_2 = NetworkGetPlayerIndexFromPed

          L15_2 = L10_2

          L14_2, L15_2 = L14_2(L15_2)

          L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)

          L11_2(L12_2, L13_2, L14_2, L15_2)

        end

      end

      L6_2 = TriggerServerEvent

      L7_2 = "origen_police:server:updateref"

      L8_2 = {}

      L9_2 = tonumber

      L10_2 = A0_2.id

      L9_2 = L9_2(L10_2)

      L8_2.color = L9_2

      L9_2 = L5_2

      L6_2(L7_2, L8_2, L9_2)

    else

      L3_2 = A0_2.action

      if "ToggleReady" == L3_2 then

        L3_2 = PlayerPedId

        L3_2 = L3_2()

        L4_2 = GetVehiclePedIsIn

        L5_2 = L3_2

        L6_2 = false

        L4_2 = L4_2(L5_2, L6_2)

        if 0 ~= L4_2 then

          L5_2 = GetPedInVehicleSeat

          L6_2 = L4_2

          L7_2 = -1

          L5_2 = L5_2(L6_2, L7_2)

          if L5_2 == L3_2 then

            goto lbl_206

          end

          L5_2 = GetPedInVehicleSeat

          L6_2 = L4_2

          L7_2 = 0

          L5_2 = L5_2(L6_2, L7_2)

          if L5_2 == L3_2 then

            goto lbl_206

          end

        end

        L5_2 = TriggerServerEvent

        L6_2 = "origen_police:server:Ready"

        L7_2 = Config

        L7_2 = L7_2.PoliceJobName

        L8_2 = A0_2.state

        L5_2(L6_2, L7_2, L8_2)

        goto lbl_283

        ::lbl_206::

        L5_2 = {}

        L6_2 = -1

        L7_2 = 0

        L8_2 = 1

        for L9_2 = L6_2, L7_2, L8_2 do

          L10_2 = GetPedInVehicleSeat

          L11_2 = L4_2

          L12_2 = L9_2

          L10_2 = L10_2(L11_2, L12_2)

          if 0 ~= L10_2 then

            L11_2 = table

            L11_2 = L11_2.insert

            L12_2 = L5_2

            L13_2 = GetPlayerServerId

            L14_2 = NetworkGetPlayerIndexFromPed

            L15_2 = L10_2

            L14_2, L15_2 = L14_2(L15_2)

            L13_2, L14_2, L15_2 = L13_2(L14_2, L15_2)

            L11_2(L12_2, L13_2, L14_2, L15_2)

          end

        end

        L6_2 = TriggerServerEvent

        L7_2 = "origen_police:server:Ready"

        L8_2 = Config

        L8_2 = L8_2.PoliceJobName

        L9_2 = A0_2.state

        L10_2 = L5_2

        L6_2(L7_2, L8_2, L9_2, L10_2)

      else

        L3_2 = A0_2.action

        if "RadioCalls" == L3_2 then

          L3_2 = Calls

          L4_2 = A0_2.id

          L3_2(L4_2)

        else

          L3_2 = A0_2.command

          if L3_2 then

            L3_2 = type

            L4_2 = A0_2.command

            L3_2 = L3_2(L4_2)

            if "table" == L3_2 then

              L3_2 = pairs

              L4_2 = A0_2.command

              L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

              for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

                L9_2 = Config

                L9_2 = L9_2.Framework

                if L7_2 == L9_2 then

                  L9_2 = ExecuteCommand

                  L10_2 = L8_2

                  L9_2(L10_2)

                end

              end

            else

              L3_2 = ExecuteCommand

              L4_2 = A0_2.command

              L3_2(L4_2)

            end

          else

            L3_2 = A0_2.event

            if L3_2 then

              L3_2 = TriggerEvent

              L4_2 = A0_2.event

              L3_2(L4_2)

            else

              L3_2 = A0_2.serverevent

              if L3_2 then

                L3_2 = TriggerServerEvent

                L4_2 = A0_2.serverevent

                L3_2(L4_2)

              end

            end

          end

        end

      end

    end

  end

  ::lbl_283::

  L3_2 = A1_2

  L4_2 = true

  L3_2(L4_2)

end

L9_1(L10_1, L11_1)

L9_1 = RegisterCommand

L10_1 = "esposar"

function L11_1()

  local L0_2, L1_2, L2_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if L1_2 then

    L1_2 = GetGameTimer

    L1_2 = L1_2()

    L2_2 = L8_1

    L1_2 = L1_2 - L2_2

    L2_2 = 500

    if L1_2 <= L2_2 then

      L1_2 = ShowNotification

      L2_2 = "You are doing this too fast"

      return L1_2(L2_2)

    end

    L1_2 = GetGameTimer

    L1_2 = L1_2()

    L8_1 = L1_2

    L1_2 = TriggerEvent

    L2_2 = "origen_police:client:cuffuncuff"

    L1_2(L2_2)

  end

end

L9_1(L10_1, L11_1)

L9_1 = false

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:setcuffstate"

function L12_1(A0_2)

  local L1_2, L2_2

  L1_2 = L9_1

  L1_2 = not L1_2

  L9_1 = L1_2

  L1_2 = Citizen

  L1_2 = L1_2.CreateThread

  function L2_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3

    L0_3 = TriggerServerEvent

    L1_3 = "origen_police:server:playcuffanim"

    L2_3 = A0_2

    L3_3 = L9_1

    L0_3(L1_3, L2_3, L3_3)

    L0_3 = GetPlayerPed

    L1_3 = GetPlayerFromServerId

    L2_3 = A0_2

    L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L1_3(L2_3)

    L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

    L1_3 = SetEntityCoords

    L2_3 = PlayerPedId

    L2_3 = L2_3()

    L3_3 = GetEntityCoords

    L4_3 = L0_3

    L3_3 = L3_3(L4_3)

    L4_3 = GetEntityForwardVector

    L5_3 = L0_3

    L4_3 = L4_3(L5_3)

    L3_3 = L3_3 + L4_3

    L1_3(L2_3, L3_3)

    L1_3 = SetEntityHeading

    L2_3 = PlayerPedId

    L2_3 = L2_3()

    L3_3 = GetEntityHeading

    L4_3 = L0_3

    L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L3_3(L4_3)

    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

    L1_3 = Citizen

    L1_3 = L1_3.Wait

    L2_3 = 5000

    L1_3(L2_3)

    L1_3 = PlayerPedId

    L1_3 = L1_3()

    L2_3 = LockInventory

    L3_3 = L9_1

    L2_3(L3_3)

    while true do

      L2_3 = L9_1

      if not L2_3 then

        break

      end

      L2_3 = Citizen

      L2_3 = L2_3.Wait

      L3_3 = 0

      L2_3(L3_3)

      L2_3 = GiveWeaponToPed

      L3_3 = L1_3

      L4_3 = GetHashKey

      L5_3 = "WEAPON_UNARMED"

      L4_3 = L4_3(L5_3)

      L5_3 = 0

      L6_3 = false

      L7_3 = true

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

      L2_3 = pairs

      L3_3 = Config

      L3_3 = L3_3.HandCuff

      L3_3 = L3_3.BlockedInputs

      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)

      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do

        L8_3 = DisableControlAction

        L9_3 = 0

        L10_3 = L7_3

        L11_3 = true

        L8_3(L9_3, L10_3, L11_3)

      end

      L2_3 = IsEntityPlayingAnim

      L3_3 = L1_3

      L4_3 = "mp_arresting"

      L5_3 = "idle"

      L6_3 = 3

      L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)

      if not L2_3 then

        L2_3 = TaskPlayAnim

        L3_3 = L1_3

        L4_3 = "mp_arresting"

        L5_3 = "idle"

        L6_3 = 8.0

        L7_3 = 8.0

        L8_3 = -1

        L9_3 = 51

        L10_3 = false

        L11_3 = false

        L12_3 = false

        L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

      end

    end

  end

  L1_2(L2_2)

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:playarrestanim"

function L12_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L1_2 = RequestAnimDict

  L2_2 = "mp_arrest_paired"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "mp_arrest_paired"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Wait

    L2_2 = 1

    L1_2(L2_2)

  end

  L1_2 = RequestAnimDict

  L2_2 = "mp_arresting"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "mp_arresting"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Wait

    L2_2 = 1

    L1_2(L2_2)

  end

  if A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "mp_arrest_paired"

    L4_2 = "cop_p2_back_right"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = 3750

    L8_2 = 2

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

  else

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "mp_arresting"

    L4_2 = "a_uncuff"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 2

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

  end

  L1_2 = Citizen

  L1_2 = L1_2.Wait

  L2_2 = 3500

  L1_2(L2_2)

  L1_2 = ClearPedTasks

  L2_2 = PlayerPedId

  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L2_2()

  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:playarrestedanim"

function L12_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L1_2 = RequestAnimDict

  L2_2 = "mp_arrest_paired"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "mp_arrest_paired"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Wait

    L2_2 = 1

    L1_2(L2_2)

  end

  L1_2 = RequestAnimDict

  L2_2 = "mp_arresting"

  L1_2(L2_2)

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = "mp_arresting"

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = Wait

    L2_2 = 1

    L1_2(L2_2)

  end

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  if A0_2 then

    L2_2 = TaskPlayAnim

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = "mp_arrest_paired"

    L5_2 = "crook_p2_back_right"

    L6_2 = 8.0

    L7_2 = -8.0

    L8_2 = 3750

    L9_2 = 2

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L13_2 = 0

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L2_2 = Config

    L2_2 = L2_2.HandCuff

    L2_2 = L2_2.SkillCheck

    L2_2 = L2_2.enabled

    if not L2_2 then

      L2_2 = Wait

      L3_2 = 3500

      L2_2(L3_2)

      L2_2 = GetEntityCoords

      L3_2 = GetPlayerPed

      L4_2 = PlayerId

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L4_2()

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

      L4_2 = false

      L2_2 = L2_2(L3_2, L4_2)

      L3_2 = CreateObject

      L4_2 = GetHashKey

      L5_2 = "p_cs_cuffs_02_s"

      L4_2 = L4_2(L5_2)

      L5_2 = L2_2.x

      L6_2 = L2_2.y

      L7_2 = L2_2.z

      L8_2 = true

      L9_2 = true

      L10_2 = true

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

      L4_1 = L3_2

      L3_2 = AttachEntityToEntity

      L4_2 = L4_1

      L5_2 = L1_2

      L6_2 = GetPedBoneIndex

      L7_2 = L1_2

      L8_2 = 60309

      L6_2 = L6_2(L7_2, L8_2)

      L7_2 = -0.02

      L8_2 = 0.06

      L9_2 = 0.03

      L10_2 = 290.0

      L11_2 = 155.0

      L12_2 = 80.0

      L13_2 = true

      L14_2 = false

      L15_2 = false

      L16_2 = false

      L17_2 = 0

      L18_2 = true

      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)

      L3_2 = TaskPlayAnim

      L4_2 = PlayerPedId

      L4_2 = L4_2()

      L5_2 = "mp_arresting"

      L6_2 = "idle"

      L7_2 = 8.0

      L8_2 = -8.0

      L9_2 = -1

      L10_2 = 49

      L11_2 = 0.0

      L12_2 = false

      L13_2 = false

      L14_2 = false

      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

      return

    end

    L2_2 = nil

    L3_2 = Citizen

    L3_2 = L3_2.CreateThread

    function L4_2()

      local L0_3, L1_3

      L0_3 = Config

      L0_3 = L0_3.HandCuff

      L0_3 = L0_3.SkillCheck

      L0_3 = L0_3.func

      L0_3 = L0_3()

      L2_2 = L0_3

    end

    L3_2(L4_2)

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = Config

    L4_2 = L4_2.HandCuff

    L4_2 = L4_2.SkillCheck

    L4_2 = L4_2.WaitChance

    L3_2(L4_2)

    if not L2_2 then

      L3_2 = GetEntityCoords

      L4_2 = GetPlayerPed

      L5_2 = PlayerId

      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L5_2()

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

      L5_2 = false

      L3_2 = L3_2(L4_2, L5_2)

      L4_2 = CreateObject

      L5_2 = GetHashKey

      L6_2 = "p_cs_cuffs_02_s"

      L5_2 = L5_2(L6_2)

      L6_2 = L3_2.x

      L7_2 = L3_2.y

      L8_2 = L3_2.z

      L9_2 = true

      L10_2 = true

      L11_2 = true

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

      L4_1 = L4_2

      L4_2 = AttachEntityToEntity

      L5_2 = L4_1

      L6_2 = L1_2

      L7_2 = GetPedBoneIndex

      L8_2 = L1_2

      L9_2 = 60309

      L7_2 = L7_2(L8_2, L9_2)

      L8_2 = -0.02

      L9_2 = 0.06

      L10_2 = 0.03

      L11_2 = 290.0

      L12_2 = 155.0

      L13_2 = 80.0

      L14_2 = true

      L15_2 = false

      L16_2 = false

      L17_2 = false

      L18_2 = 0

      L19_2 = true

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

      L4_2 = TaskPlayAnim

      L5_2 = PlayerPedId

      L5_2 = L5_2()

      L6_2 = "mp_arresting"

      L7_2 = "idle"

      L8_2 = 8.0

      L9_2 = -8.0

      L10_2 = -1

      L11_2 = 49

      L12_2 = 0.0

      L13_2 = false

      L14_2 = false

      L15_2 = false

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    else

      L3_2 = false

      L9_1 = L3_2

      L3_2 = ClearPedTasks

      L4_2 = PlayerPedId

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L4_2()

      L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

    end

  else

    L2_2 = L4_1

    if nil ~= L2_2 then

      L2_2 = DetachEntity

      L3_2 = L4_1

      L4_2 = true

      L5_2 = true

      L2_2(L3_2, L4_2, L5_2)

      L2_2 = DeleteEntity

      L3_2 = L4_1

      L2_2(L3_2)

      L2_2 = nil

      L4_1 = L2_2

    end

    L2_2 = TaskPlayAnim

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = "mp_arresting"

    L5_2 = "b_uncuff"

    L6_2 = 8.0

    L7_2 = -8.0

    L8_2 = -1

    L9_2 = 2

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L13_2 = 0

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 3500

    L2_2(L3_2)

    L2_2 = ClearPedTasks

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2()

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  end

end

L10_1(L11_1, L12_1)

function L10_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = false

  L9_1 = L0_2

  L0_2 = L4_1

  if nil ~= L0_2 then

    L0_2 = DetachEntity

    L1_2 = L4_1

    L2_2 = true

    L3_2 = true

    L0_2(L1_2, L2_2, L3_2)

    L0_2 = DeleteEntity

    L1_2 = L4_1

    L0_2(L1_2)

    L0_2 = nil

    L4_1 = L0_2

  end

  L0_2 = ClearPedTasks

  L1_2 = PlayerPedId

  L1_2, L2_2, L3_2 = L1_2()

  L0_2(L1_2, L2_2, L3_2)

end

RemoveHandCuff = L10_1

L10_1 = exports

L11_1 = "RemoveHandCuff"

L12_1 = RemoveHandCuff

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:cuffuncuff"

function L12_1()

  local L0_2, L1_2

  L0_2 = origen_police_cuffuncuff

  L0_2()

end

L10_1(L11_1, L12_1)

function L10_1()

  local L0_2, L1_2, L2_2

  L0_2 = IsPedInAnyVehicle

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = false

  L0_2 = L0_2(L1_2, L2_2)

  if L0_2 then

    return

  end

  L0_2 = handCuff

  function L1_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3

    if A0_3 then

      L1_3 = FW_GetClosestPlayer

      L1_3, L2_3 = L1_3()

      if -1 ~= L1_3 and L2_3 <= 3.0 and L2_3 > 0 then

        L3_3 = L2_1

        if not L3_3 then

          L3_3 = TriggerServerEvent

          L4_3 = "origen_police:server:cuffuncuffplayer"

          L5_3 = GetPlayerServerId

          L6_3 = L1_3

          L5_3, L6_3 = L5_3(L6_3)

          L3_3(L4_3, L5_3, L6_3)

        else

          L3_3 = ShowNotification

          L4_3 = Config

          L4_3 = L4_3.Translations

          L4_3 = L4_3.CantUncuff

          L5_3 = "error"

          L3_3(L4_3, L5_3)

        end

      else

        L3_3 = ShowNotification

        L4_3 = Config

        L4_3 = L4_3.Translations

        L4_3 = L4_3.NoPersonNear

        L5_3 = "error"

        L3_3(L4_3, L5_3)

      end

    else

      L1_3 = ShowNotification

      L2_3 = Config

      L2_3 = L2_3.Translations

      L2_3 = L2_3.CantDoThis

      L3_3 = "error"

      L1_3(L2_3, L3_3)

    end

  end

  L0_2(L1_2)

end

origen_police_cuffuncuff = L10_1

function L10_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = FW_GetClosestPlayer

  L0_2, L1_2 = L0_2()

  if -1 ~= L0_2 and L1_2 <= 3.0 and L1_2 > 0 then

    L2_2 = GetPlayerPed

    L3_2 = L0_2

    L2_2 = L2_2(L3_2)

    L3_2 = IsEntityAttachedToEntity

    L4_2 = L2_2

    L5_2 = PlayerPedId

    L5_2, L6_2, L7_2, L8_2 = L5_2()

    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

    L3_2 = not L3_2

    if L3_2 then

      L4_2 = IsEntityPlayingAnim

      L5_2 = L2_2

      L6_2 = "mp_arresting"

      L7_2 = "idle"

      L8_2 = 3

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

      if L4_2 then

        goto lbl_31

      end

    end

    L4_2 = L2_1

    ::lbl_31::

    if L4_2 then

      L4_2 = TriggerServerEvent

      L5_2 = "origen_police:server:dragplayer"

      L6_2 = GetPlayerServerId

      L7_2 = L0_2

      L6_2 = L6_2(L7_2)

      L7_2 = L3_2

      L4_2(L5_2, L6_2, L7_2)

      if L3_2 then

        L4_2 = GetPlayerServerId

        L5_2 = L0_2

        L4_2 = L4_2(L5_2)

        if L4_2 then

          goto lbl_46

        end

      end

      L4_2 = false

      ::lbl_46::

      L2_1 = L4_2

      L4_2 = Citizen

      L4_2 = L4_2.CreateThread

      function L5_2()

        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

        L0_3 = RequestAnimDict

        L1_3 = "amb@world_human_drinking@coffee@male@base"

        L0_3(L1_3)

        while true do

          L0_3 = HasAnimDictLoaded

          L1_3 = "amb@world_human_drinking@coffee@male@base"

          L0_3 = L0_3(L1_3)

          if L0_3 then

            break

          end

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 10

          L0_3(L1_3)

        end

        while true do

          L0_3 = L2_1

          if not L0_3 then

            break

          end

          L0_3 = DoesEntityExist

          L1_3 = L2_2

          L0_3 = L0_3(L1_3)

          if not L0_3 then

            break

          end

          L0_3 = IsPedOnFoot

          L1_3 = L2_2

          L0_3 = L0_3(L1_3)

          if not L0_3 then

            break

          end

          L0_3 = IsPedDeadOrDying

          L1_3 = L2_2

          L2_3 = true

          L0_3 = L0_3(L1_3, L2_3)

          if L0_3 then

            break

          end

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 100

          L0_3(L1_3)

          L0_3 = IsEntityPlayingAnim

          L1_3 = PlayerPedId

          L1_3 = L1_3()

          L2_3 = "amb@world_human_drinking@coffee@male@base"

          L3_3 = "base"

          L4_3 = 3

          L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)

          if not L0_3 then

            L0_3 = TaskPlayAnim

            L1_3 = PlayerPedId

            L1_3 = L1_3()

            L2_3 = "amb@world_human_drinking@coffee@male@base"

            L3_3 = "base"

            L4_3 = 8.0

            L5_3 = 8.0

            L6_3 = -1

            L7_3 = 49

            L8_3 = false

            L9_3 = false

            L10_3 = false

            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

          end

        end

        L0_3 = false

        L2_1 = L0_3

        L0_3 = ClearPedTasks

        L1_3 = PlayerPedId

        L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L1_3()

        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

      end

      L4_2(L5_2)

    else

      L4_2 = ShowNotification

      L5_2 = Config

      L5_2 = L5_2.Translations

      L5_2 = L5_2.HasToBeCuffed

      L6_2 = "error"

      L4_2(L5_2, L6_2)

    end

  else

    L2_2 = ShowNotification

    L3_2 = Config

    L3_2 = L3_2.Translations

    L3_2 = L3_2.NoPersonNear

    L4_2 = "error"

    L2_2(L3_2, L4_2)

  end

end

origen_police_drag = L10_1

function L10_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2

  L1_1 = A0_2

  L2_2 = L1_1

  if L2_2 then

    L2_2 = false

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = GetPlayerFromServerId

    L5_2 = A1_2

    L4_2 = L4_2(L5_2)

    L5_2 = GetPlayerPed

    L6_2 = L4_2

    L5_2 = L5_2(L6_2)

    L6_2 = AttachEntityToEntity

    L7_2 = L3_2

    L8_2 = L5_2

    L9_2 = 11816

    L10_2 = 0.28

    L11_2 = 0.43

    L12_2 = 0.0

    L13_2 = 0.0

    L14_2 = 0.0

    L15_2 = 0.0

    L16_2 = false

    L17_2 = false

    L18_2 = false

    L19_2 = false

    L20_2 = 2

    L21_2 = true

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

    L6_2 = Citizen

    L6_2 = L6_2.CreateThread

    function L7_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3

      while true do

        L0_3 = L1_1

        if not L0_3 then

          break

        end

        L0_3 = DoesEntityExist

        L1_3 = L5_2

        L0_3 = L0_3(L1_3)

        if not L0_3 then

          break

        end

        L0_3 = IsPedOnFoot

        L1_3 = L5_2

        L0_3 = L0_3(L1_3)

        if not L0_3 then

          break

        end

        L0_3 = IsPedDeadOrDying

        L1_3 = L5_2

        L2_3 = true

        L0_3 = L0_3(L1_3, L2_3)

        if L0_3 then

          break

        end

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 100

        L0_3(L1_3)

        L0_3 = PlayerPedId

        L0_3 = L0_3()

        L3_2 = L0_3

        L0_3 = GetPlayerPed

        L1_3 = L4_2

        L0_3 = L0_3(L1_3)

        L5_2 = L0_3

        L0_3 = IsEntityAttachedToEntity

        L1_3 = L3_2

        L2_3 = L5_2

        L0_3 = L0_3(L1_3, L2_3)

        if not L0_3 then

          L0_3 = AttachEntityToEntity

          L1_3 = L3_2

          L2_3 = L5_2

          L3_3 = 11816

          L4_3 = 0.28

          L5_3 = 0.43

          L6_3 = 0.0

          L7_3 = 0.0

          L8_3 = 0.0

          L9_3 = 0.0

          L10_3 = false

          L11_3 = false

          L12_3 = false

          L13_3 = false

          L14_3 = 2

          L15_3 = true

          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)

        end

        L0_3 = GetEntitySpeed

        L1_3 = L5_2

        L0_3 = L0_3(L1_3)

        L1_3 = 0.1

        if L0_3 > L1_3 then

          L0_3 = true

          L2_2 = L0_3

          L0_3 = TaskGoStraightToCoord

          L1_3 = L3_2

          L2_3 = GetEntityCoords

          L3_3 = L3_2

          L2_3 = L2_3(L3_3)

          L3_3 = GetEntityForwardVector

          L4_3 = L3_2

          L3_3 = L3_3(L4_3)

          L3_3 = L3_3 * 5.0

          L2_3 = L2_3 + L3_3

          L3_3 = GetEntitySpeed

          L4_3 = L5_2

          L3_3 = L3_3(L4_3)

          if L3_3 > 2.0 then

            L3_3 = 2.0

            if L3_3 then

              goto lbl_83

            end

          end

          L3_3 = 1.0

          ::lbl_83::

          L4_3 = -1

          L5_3 = GetEntityHeading

          L6_3 = L3_2

          L5_3 = L5_3(L6_3)

          L6_3 = 0.0

          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)

        else

          L0_3 = L2_2

          if L0_3 then

            L0_3 = false

            L2_2 = L0_3

            L0_3 = ClearPedTasks

            L1_3 = L3_2

            L0_3(L1_3)

          end

        end

      end

      L0_3 = false

      L1_1 = L0_3

      L0_3 = DetachEntity

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = true

      L3_3 = false

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = ClearPedTasks

      L1_3 = L3_2

      L0_3(L1_3)

    end

    L6_2(L7_2)

  else

    L2_2 = DetachEntity

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = true

    L5_2 = false

    L2_2(L3_2, L4_2, L5_2)

  end

end

origen_police_setdragstate = L10_1

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:setdragstate"

function L12_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = origen_police_setdragstate

  L3_2 = A0_2

  L4_2 = A1_2

  L2_2(L3_2, L4_2)

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:drag"

function L12_1()

  local L0_2, L1_2

  L0_2 = origen_police_drag

  L0_2()

end

L10_1(L11_1, L12_1)

function L10_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L0_2 = FW_GetClosestPlayer

  L0_2, L1_2 = L0_2()

  L2_2 = FW_GetClosestVehicle

  L2_2 = L2_2()

  L3_2 = FW_GetPlayerData

  L4_2 = false

  L3_2 = L3_2(L4_2)

  L4_2 = CanOpenTablet

  L5_2 = L3_2.job

  L5_2 = L5_2.name

  L4_2 = L4_2(L5_2)

  L4_2 = L4_2[1]

  if L4_2 then

    L4_2 = L3_2.job

    L4_2 = L4_2.onduty

    if L4_2 then

      goto lbl_20

    end

  end

  do return end

  ::lbl_20::

  if -1 ~= L0_2 and L1_2 <= 3.0 and L1_2 > 0 then

    L4_2 = GetEntityCoords

    L5_2 = L2_2

    L4_2 = L4_2(L5_2)

    L5_2 = GetEntityCoords

    L6_2 = PlayerPedId

    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2()

    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L4_2 = L4_2 - L5_2

    L4_2 = #L4_2

    if L4_2 < 5 then

      L4_2 = L2_1

      if L4_2 then

        L4_2 = false

        L2_1 = L4_2

        L4_2 = ClearPedTasks

        L5_2 = PlayerPedId

        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2()

        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

        L4_2 = TriggerServerEvent

        L5_2 = "origen_police:server:dragplayer"

        L6_2 = GetPlayerServerId

        L7_2 = L0_2

        L6_2 = L6_2(L7_2)

        L7_2 = false

        L4_2(L5_2, L6_2, L7_2)

      end

      L4_2 = IsPedInAnyVehicle

      L5_2 = GetPlayerPed

      L6_2 = L0_2

      L5_2 = L5_2(L6_2)

      L6_2 = false

      L4_2 = L4_2(L5_2, L6_2)

      if not L4_2 then

        L4_2 = GetVehicleModelNumberOfSeats

        L5_2 = GetEntityModel

        L6_2 = L2_2

        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)

        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

        L4_2 = L4_2 - 2

        L5_2 = 0

        L6_2 = L4_2

        L7_2 = 1

        for L8_2 = L5_2, L6_2, L7_2 do

          L9_2 = IsVehicleSeatFree

          L10_2 = L2_2

          L11_2 = L4_2 - L8_2

          L9_2 = L9_2(L10_2, L11_2)

          if L9_2 then

            L9_2 = UseCommand

            L10_2 = "me"

            L11_2 = Config

            L11_2 = L11_2.Translations

            L11_2 = L11_2.VehicleinofME

            L9_2(L10_2, L11_2)

            L9_2 = TriggerServerEvent

            L10_2 = "origen_police:server:vehicleinof"

            L11_2 = GetPlayerServerId

            L12_2 = L0_2

            L11_2 = L11_2(L12_2)

            L12_2 = NetworkGetNetworkIdFromEntity

            L13_2 = L2_2

            L12_2 = L12_2(L13_2)

            L13_2 = L4_2 - L8_2

            L9_2(L10_2, L11_2, L12_2, L13_2)

            return

          end

        end

        L5_2 = ShowNotification

        L6_2 = Config

        L6_2 = L6_2.Translations

        L6_2 = L6_2.noSeat

        L5_2(L6_2)

      else

        L4_2 = UseCommand

        L5_2 = "me"

        L6_2 = Config

        L6_2 = L6_2.Translations

        L6_2 = L6_2.VehicleofinME

        L4_2(L5_2, L6_2)

        L4_2 = TriggerServerEvent

        L5_2 = "origen_police:server:vehicleinof"

        L6_2 = GetPlayerServerId

        L7_2 = L0_2

        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2(L7_2)

        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

      end

  end

  else

    L4_2 = ShowNotification

    L5_2 = Config

    L5_2 = L5_2.Translations

    L5_2 = L5_2.NoPersonNear

    L4_2(L5_2)

  end

end

origen_police_vehicleinof = L10_1

function L10_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  if A0_2 then

    L2_2 = TaskWarpPedIntoVehicle

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = NetworkGetEntityFromNetworkId

    L5_2 = A0_2

    L4_2 = L4_2(L5_2)

    L5_2 = A1_2

    L2_2(L3_2, L4_2, L5_2)

  else

    L2_2 = TaskLeaveVehicle

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = GetVehiclePedIsIn

    L5_2 = PlayerPedId

    L5_2 = L5_2()

    L6_2 = false

    L4_2 = L4_2(L5_2, L6_2)

    L5_2 = 16

    L2_2(L3_2, L4_2, L5_2)

    L2_2 = L9_1

    if L2_2 then

      L2_2 = Wait

      L3_2 = 100

      L2_2(L3_2)

      L2_2 = TaskPlayAnim

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = "mp_arresting"

      L5_2 = "idle"

      L6_2 = 8.0

      L7_2 = 8.0

      L8_2 = -1

      L9_2 = 51

      L10_2 = false

      L11_2 = false

      L12_2 = false

      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    end

  end

end

origen_police_statevehicleinof = L10_1

L10_1 = RegisterCommand

L11_1 = "vehicleinof"

function L12_1()

  local L0_2, L1_2

  L0_2 = origen_police_vehicleinof

  L0_2()

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:vehicleinof"

function L12_1()

  local L0_2, L1_2

  L0_2 = origen_police_vehicleinof

  L0_2()

end

L10_1(L11_1, L12_1)

L10_1 = RegisterNetEvent

L11_1 = "origen_police:client:statevehicleinof"

function L12_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = origen_police_statevehicleinof

  L3_2 = A0_2

  L4_2 = A1_2

  L2_2(L3_2, L4_2)

end

L10_1(L11_1, L12_1)

function L10_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if L1_2 then

    L1_2 = L0_2.job

    L1_2 = L1_2.onduty

    if L1_2 then

      goto lbl_16

    end

  end

  do return end

  ::lbl_16::

  L1_2 = FW_GetClosestPlayer

  L1_2, L2_2 = L1_2()

  if -1 ~= L1_2 and L2_2 <= 3.0 and L2_2 > 0 then

    L3_2 = CanSearchPlayer

    L4_2 = L1_2

    L3_2 = L3_2(L4_2)

    if L3_2 then

      L3_2 = GetPlayerServerId

      L4_2 = L1_2

      L3_2 = L3_2(L4_2)

      L4_2 = SearchClosestPlayer

      L5_2 = L3_2

      L4_2(L5_2)

    else

      L3_2 = ShowNotification

      L4_2 = Config

      L4_2 = L4_2.Translations

      L4_2 = L4_2.NotCuffed

      L5_2 = "error"

      L3_2(L4_2, L5_2)

    end

  else

    L3_2 = ShowNotification

    L4_2 = Config

    L4_2 = L4_2.Translations

    L4_2 = L4_2.NoPersonNear

    L5_2 = "error"

    L3_2(L4_2, L5_2)

  end

end

SearchClosest = L10_1

L10_1 = RegisterCommand

L11_1 = "cachearPolice"

L12_1 = SearchClosest

L10_1(L11_1, L12_1)

function L10_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = Citizen

  L1_2 = L1_2.Wait

  L2_2 = 300

  L1_2(L2_2)

  while true do

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 50

    L1_2(L2_2)

    L1_2 = GetPlayerFromServerId

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    L2_2 = GetPlayerPed

    L3_2 = L1_2

    L2_2 = L2_2(L3_2)

    L3_2 = GetEntityCoords

    L4_2 = L2_2

    L3_2 = L3_2(L4_2)

    L4_2 = GetEntityCoords

    L5_2 = PlayerPedId

    L5_2, L6_2, L7_2, L8_2 = L5_2()

    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

    L5_2 = false

    if false == L5_2 then

      break

    end

    L6_2 = L3_2 - L4_2

    L6_2 = #L6_2

    if L6_2 > 4 then

      L6_2 = TriggerEvent

      L7_2 = Config

      L7_2 = L7_2.Inventory

      L8_2 = ":closeInv"

      L7_2 = L7_2 .. L8_2

      L6_2(L7_2)

      L6_2 = TriggerEvent

      L7_2 = Config

      L7_2 = L7_2.Inventory

      L8_2 = ":client:closeInventory"

      L7_2 = L7_2 .. L8_2

      L6_2(L7_2)

      L6_2 = ShowNotification

      L7_2 = Config

      L7_2 = L7_2.Translations

      L7_2 = L7_2.PersonFar

      L8_2 = "error"

      L6_2(L7_2, L8_2)

      break

    end

  end

end

StartSearchDistance = L10_1

L10_1 = exports

L11_1 = "IsHandcuffed"

function L12_1()

  local L0_2, L1_2

  L0_2 = L9_1

  return L0_2

end

L10_1(L11_1, L12_1)

L10_1 = AddReplaceExport

L11_1 = "qb-policejob"

L12_1 = "IsHandcuffed"

function L13_1()

  local L0_2, L1_2

  L0_2 = L9_1

  return L0_2

end

L10_1(L11_1, L12_1, L13_1)

function L10_1(A0_2)

  local L1_2, L2_2

  while true do

    L1_2 = HasAnimDictLoaded

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if L1_2 then

      break

    end

    L1_2 = RequestAnimDict

    L2_2 = A0_2

    L1_2(L2_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 5

    L1_2(L2_2)

  end

end

function L11_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L0_2 = L5_1

  if L0_2 then

    L0_2 = L10_1

    L1_2 = "move_strafe@first_person@generic"

    L0_2(L1_2)

    L0_2 = TaskPlayAnim

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L2_2 = "move_strafe@first_person@generic"

    L3_2 = "walk_bwd_180_loop"

    L4_2 = 3.0

    L5_2 = 1.0

    L6_2 = -1

    L7_2 = 1

    L8_2 = 0

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

  end

end

function L12_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L0_2 = L5_1

  if L0_2 then

    L0_2 = L10_1

    L1_2 = "move_strafe@first_person@generic"

    L0_2(L1_2)

    L0_2 = TaskPlayAnim

    L1_2 = PlayerPedId

    L1_2 = L1_2()

    L2_2 = "move_strafe@first_person@generic"

    L3_2 = "exit"

    L4_2 = 3.0

    L5_2 = 1.0

    L6_2 = -1

    L7_2 = 1

    L8_2 = 0

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

  end

end

L13_1 = RegisterNetEvent

L14_1 = "origen_police:client:getDragged"

function L15_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L2_2 = GetPlayerPed

  L3_2 = GetPlayerFromServerId

  L4_2 = A0_2

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L3_2(L4_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L3_2 = PlayerPedId

  L3_2 = L3_2()

  if "escort" == A1_2 then

    L4_2 = L6_1

    if not L4_2 then

      L4_2 = ClearPedTasks

      L5_2 = L3_2

      L4_2(L5_2)

      L4_2 = true

      L6_1 = L4_2

      L4_2 = L10_1

      L5_2 = "mp_arresting"

      L4_2(L5_2)

      L4_2 = L10_1

      L5_2 = "move_m@generic_variations@walk"

      L4_2(L5_2)

      L4_2 = TaskPlayAnim

      L5_2 = L3_2

      L6_2 = "mp_arresting"

      L7_2 = "idle"

      L8_2 = 8.0

      L9_2 = -8

      L10_2 = -1

      L11_2 = 49

      L12_2 = 0.0

      L13_2 = false

      L14_2 = false

      L15_2 = false

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = AttachEntityToEntity

      L5_2 = L3_2

      L6_2 = L2_2

      L7_2 = 1816

      L8_2 = 0.25

      L9_2 = 0.49

      L10_2 = 0.0

      L11_2 = 0.0

      L12_2 = 0.0

      L13_2 = 0.0

      L14_2 = false

      L15_2 = false

      L16_2 = false

      L17_2 = false

      L18_2 = 2

      L19_2 = true

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

    else

      L4_2 = false

      L6_1 = L4_2

      L4_2 = DetachEntity

      L5_2 = L3_2

      L4_2(L5_2)

      L4_2 = ClearPedTasks

      L5_2 = L3_2

      L4_2(L5_2)

    end

  elseif "stopdrag" == A1_2 then

    L4_2 = false

    L6_1 = L4_2

    L4_2 = DetachEntity

    L5_2 = L3_2

    L4_2(L5_2)

    L4_2 = ClearPedTasks

    L5_2 = L3_2

    L4_2(L5_2)

  else

    L4_2 = L6_1

    if not L4_2 then

      L4_2 = true

      L6_1 = L4_2

      L4_2 = ClearPedTasks

      L5_2 = L3_2

      L4_2(L5_2)

      L4_2 = L10_1

      L5_2 = "combat@drag_ped@"

      L4_2(L5_2)

      L4_2 = TaskPlayAnim

      L5_2 = L3_2

      L6_2 = "combat@drag_ped@"

      L7_2 = "injured_drag_ped"

      L8_2 = 8.0

      L9_2 = -8

      L10_2 = -1

      L11_2 = 5

      L12_2 = 0

      L13_2 = false

      L14_2 = false

      L15_2 = false

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = AttachEntityToEntity

      L5_2 = L3_2

      L6_2 = L2_2

      L7_2 = 1816

      L8_2 = 4103

      L9_2 = 0.48

      L10_2 = 0.0

      L11_2 = 0.0

      L12_2 = 0.0

      L13_2 = 0.0

      L14_2 = 0.0

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

    else

      L4_2 = false

      L6_1 = L4_2

      L4_2 = DetachEntity

      L5_2 = L3_2

      L4_2(L5_2)

      L4_2 = ClearPedTasks

      L5_2 = L3_2

      L4_2(L5_2)

    end

  end

end

L13_1(L14_1, L15_1)

L13_1 = RegisterNetEvent

L14_1 = "origen_police:client:doAnimation"

function L15_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  if "escort" == A0_2 then

    L2_2 = L7_1

    if L2_2 then

      L2_2 = ClearPedTasks

      L3_2 = L1_2

      L2_2(L3_2)

      L2_2 = false

      L7_1 = L2_2

    else

      L2_2 = true

      L7_1 = L2_2

      L2_2 = L10_1

      L3_2 = "amb@world_human_drinking@coffee@male@base"

      L2_2(L3_2)

      L2_2 = IsEntityPlayingAnim

      L3_2 = L1_2

      L4_2 = "amb@world_human_drinking@coffee@male@base"

      L5_2 = "base"

      L6_2 = 3

      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

      if 1 ~= L2_2 then

        L2_2 = TaskPlayAnim

        L3_2 = L1_2

        L4_2 = "amb@world_human_drinking@coffee@male@base"

        L5_2 = "base"

        L6_2 = 8.0

        L7_2 = -8

        L8_2 = -1

        L9_2 = 51

        L10_2 = 0

        L11_2 = false

        L12_2 = false

        L13_2 = false

        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

      end

    end

  elseif "stopdrag" == A0_2 then

    L2_2 = ClearPedTasks

    L3_2 = L1_2

    L2_2(L3_2)

  else

    L2_2 = L5_1

    if L2_2 then

      L2_2 = ClearPedTasks

      L3_2 = L1_2

      L2_2(L3_2)

      L2_2 = false

      L5_1 = L2_2

    else

      L2_2 = true

      L5_1 = L2_2

      L2_2 = L10_1

      L3_2 = "combat@drag_ped@"

      L2_2(L3_2)

      L2_2 = IsEntityPlayingAnim

      L3_2 = L1_2

      L4_2 = "combat@drag_ped@"

      L5_2 = "injured_drag_plyr"

      L6_2 = 3

      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

      if 1 ~= L2_2 then

        L2_2 = TaskPlayAnim

        L3_2 = L1_2

        L4_2 = "combat@drag_ped@"

        L5_2 = "injured_drag_plyr"

        L6_2 = 8.0

        L7_2 = -8

        L8_2 = -1

        L9_2 = 51

        L10_2 = 0

        L11_2 = false

        L12_2 = false

        L13_2 = false

        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

      end

    end

  end

end

L13_1(L14_1, L15_1)

L13_1 = RegisterCommand

L14_1 = "drag"

function L15_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if L1_2 then

    L1_2 = L0_2.job

    L1_2 = L1_2.onduty

    if L1_2 then

      goto lbl_16

    end

  end

  do return end

  ::lbl_16::

  L1_2 = FW_GetClosestPlayer

  L1_2, L2_2 = L1_2()

  if -1 ~= L1_2 and L2_2 <= 3.0 then

    L3_2 = TriggerServerEvent

    L4_2 = "origen_police:server:attachPlayer"

    L5_2 = GetPlayerServerId

    L6_2 = L1_2

    L5_2 = L5_2(L6_2)

    L6_2 = "drag"

    L3_2(L4_2, L5_2, L6_2)

  else

    L3_2 = ShowNotification

    L4_2 = Config

    L4_2 = L4_2.Translations

    L4_2 = L4_2.NoPersonNear

    L5_2 = "error"

    L3_2(L4_2, L5_2)

  end

end

L16_1 = false

L13_1(L14_1, L15_1, L16_1)

L13_1 = RegisterCommand

L14_1 = "+walkBackwards"

L15_1 = L11_1

L16_1 = false

L13_1(L14_1, L15_1, L16_1)

L13_1 = RegisterCommand

L14_1 = "-walkBackwards"

L15_1 = L12_1

L16_1 = false

L13_1(L14_1, L15_1, L16_1)

L13_1 = RegisterCommand

L14_1 = "StopWalkDrag"

function L15_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = L5_1

  if L0_2 then

    L0_2 = ClearPedTasks

    L1_2 = PlayerPedId

    L1_2, L2_2, L3_2, L4_2, L5_2 = L1_2()

    L0_2(L1_2, L2_2, L3_2, L4_2, L5_2)

    L0_2 = false

    L5_1 = L0_2

    L0_2 = FW_GetClosestPlayer

    L0_2, L1_2 = L0_2()

    if -1 ~= L0_2 and L1_2 <= 3.0 then

      L2_2 = TriggerServerEvent

      L3_2 = "origen_police:server:attachPlayer"

      L4_2 = GetPlayerServerId

      L5_2 = L0_2

      L4_2 = L4_2(L5_2)

      L5_2 = "stopdrag"

      L2_2(L3_2, L4_2, L5_2)

    end

  end

end

L16_1 = false

L13_1(L14_1, L15_1, L16_1)

L13_1 = Config

L13_1 = L13_1.Commands

L13_1 = L13_1.HandCuff

if L13_1 then

  L13_1 = RegisterKeyMapping

  L14_1 = "esposar"

  L15_1 = Config

  L15_1 = L15_1.Commands

  L15_1 = L15_1.HandCuff

  L15_1 = L15_1.description

  L16_1 = "keyboard"

  L17_1 = Config

  L17_1 = L17_1.Commands

  L17_1 = L17_1.HandCuff

  L17_1 = L17_1.key

  L13_1(L14_1, L15_1, L16_1, L17_1)

end

L13_1 = Config

L13_1 = L13_1.Commands

L13_1 = L13_1.QRR

if L13_1 then

  L13_1 = RegisterKeyMapping

  L14_1 = "qrr"

  L15_1 = Config

  L15_1 = L15_1.Commands

  L15_1 = L15_1.QRR

  L15_1 = L15_1.description

  L16_1 = "keyboard"

  L17_1 = Config

  L17_1 = L17_1.Commands

  L17_1 = L17_1.QRR

  L17_1 = L17_1.key

  L13_1(L14_1, L15_1, L16_1, L17_1)

end

L13_1 = Config

L13_1 = L13_1.Commands

L13_1 = L13_1.Ten20

if L13_1 then

  L13_1 = RegisterKeyMapping

  L14_1 = "10-20"

  L15_1 = Config

  L15_1 = L15_1.Commands

  L15_1 = L15_1.Ten20

  L15_1 = L15_1.description

  L16_1 = "keyboard"

  L17_1 = Config

  L17_1 = L17_1.Commands

  L17_1 = L17_1.Ten20

  L17_1 = L17_1.key

  L13_1(L14_1, L15_1, L16_1, L17_1)

end

L13_1 = Config

L13_1 = L13_1.Commands

L13_1 = L13_1.Tackle

if L13_1 then

  L13_1 = RegisterKeyMapping

  L14_1 = "placaje"

  L15_1 = Config

  L15_1 = L15_1.Commands

  L15_1 = L15_1.Tackle

  L15_1 = L15_1.description

  L16_1 = "keyboard"

  L17_1 = Config

  L17_1 = L17_1.Commands

  L17_1 = L17_1.Tackle

  L17_1 = L17_1.key

  L13_1(L14_1, L15_1, L16_1, L17_1)

end

L13_1 = Config

L13_1 = L13_1.Commands

L13_1 = L13_1.VehicleInto

if L13_1 then

  L13_1 = RegisterKeyMapping

  L14_1 = "vehicleinof"

  L15_1 = Config

  L15_1 = L15_1.Commands

  L15_1 = L15_1.VehicleInto

  L15_1 = L15_1.description

  L16_1 = "keyboard"

  L17_1 = Config

  L17_1 = L17_1.Commands

  L17_1 = L17_1.VehicleInto

  L17_1 = L17_1.key

  L13_1(L14_1, L15_1, L16_1, L17_1)

end

L13_1 = RegisterKeyMapping

L14_1 = "+walkBackwards"

L15_1 = "Walk Backwards"

L16_1 = "keyboard"

L17_1 = "S"

L13_1(L14_1, L15_1, L16_1, L17_1)

L13_1 = RegisterKeyMapping

L14_1 = "StopWalkDrag"

L15_1 = "Cancel drag"

L16_1 = "keyboard"

L17_1 = "X"

L13_1(L14_1, L15_1, L16_1, L17_1)

L13_1 = exports

L14_1 = "origenPoliceCuff"

L15_1 = origen_police_cuffuncuff

L13_1(L14_1, L15_1)

L13_1 = exports

L14_1 = "origenPoliceDrag"

L15_1 = origen_police_drag

L13_1(L14_1, L15_1)

L13_1 = exports

L14_1 = "origenPoliceVehicleInof"

L15_1 = origen_police_vehicleinof

L13_1(L14_1, L15_1)

