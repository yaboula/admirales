local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = {}

L1_1 = false

L2_1 = 0

L3_1 = {}

L4_1 = false

L5_1 = RegisterNetEvent

L6_1 = "origen_police:meCommand"

function L7_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = UseCommand

  L2_2 = "me"

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L5_1(L6_1, L7_1)

function L5_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2

  L0_2 = L4_1

  if L0_2 then

    return

  end

  L0_2 = true

  L4_1 = L0_2

  L0_2 = exports

  L0_2 = L0_2.origen_police

  L1_2 = L0_2

  L0_2 = L0_2.SetDefaultBind

  L2_2 = Config

  L2_2 = L2_2.Commands

  L2_2 = L2_2.OpenMiniDispatch

  L2_2 = L2_2.key

  L3_2 = "origen_police:dispatch:alertas"

  L0_2(L1_2, L2_2, L3_2)

  L0_2 = exports

  L0_2 = L0_2.origen_police

  L1_2 = L0_2

  L0_2 = L0_2.SetDefaultBind

  L2_2 = Config

  L2_2 = L2_2.Commands

  L2_2 = L2_2.AcceptAlert

  L2_2 = L2_2.key

  L3_2 = "origen_police:dispatch:mrkalert"

  L0_2(L1_2, L2_2, L3_2)

  L0_2 = exports

  L0_2 = L0_2.origen_police

  L1_2 = L0_2

  L0_2 = L0_2.SetDefaultBind

  L2_2 = Config

  L2_2 = L2_2.Commands

  L2_2 = L2_2.DeleteAlert

  L2_2 = L2_2.key

  L3_2 = "origen_police:dispatch:delalert"

  L0_2(L1_2, L2_2, L3_2)

  L0_2 = RegisterKeyMapping

  L1_2 = Config

  L1_2 = L1_2.Commands

  L1_2 = L1_2.NextAlert

  L1_2 = L1_2.cmd

  L2_2 = Config

  L2_2 = L2_2.Commands

  L2_2 = L2_2.NextAlert

  L2_2 = L2_2.description

  L3_2 = "keyboard"

  L4_2 = Config

  L4_2 = L4_2.Commands

  L4_2 = L4_2.NextAlert

  L4_2 = L4_2.key

  L0_2(L1_2, L2_2, L3_2, L4_2)

  L0_2 = RegisterKeyMapping

  L1_2 = Config

  L1_2 = L1_2.Commands

  L1_2 = L1_2.PreviousAlert

  L1_2 = L1_2.cmd

  L2_2 = Config

  L2_2 = L2_2.Commands

  L2_2 = L2_2.PreviousAlert

  L2_2 = L2_2.description

  L3_2 = "keyboard"

  L4_2 = Config

  L4_2 = L4_2.Commands

  L4_2 = L4_2.PreviousAlert

  L4_2 = L4_2.key

  L0_2(L1_2, L2_2, L3_2, L4_2)

  L0_2 = RegisterNetEvent

  L1_2 = "origen_police:dispatch:alertas"

  function L2_2(A0_3, A1_3, A2_3)

    local L3_3, L4_3, L5_3

    L3_3 = FW_GetPlayerData

    L4_3 = false

    L3_3 = L3_3(L4_3)

    L4_3 = onduty

    if L4_3 then

      L4_3 = IsNuiFocused

      L4_3 = L4_3()

      if not L4_3 then

        L4_3 = CanOpenTablet

        L5_3 = L3_3.job

        L5_3 = L5_3.name

        L4_3 = L4_3(L5_3)

        L4_3 = L4_3[1]

        if L4_3 then

          goto lbl_19

        end

      end

    end

    do return end

    ::lbl_19::

    L4_3 = ToggleAlerts

    L4_3()

  end

  L0_2(L1_2, L2_2)

  L0_2 = RegisterNetEvent

  L1_2 = "origen_police:dispatch:mrkalert"

  function L2_2(A0_3, A1_3, A2_3)

    local L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3

    L3_3 = onduty

    if not L3_3 then

      return

    end

    L3_3 = L1_1

    if L3_3 then

      L3_3 = IsWaypointActive

      L3_3 = L3_3()

      if L3_3 then

        L3_3 = DeleteWaypoint

        L3_3()

      else

        L3_3 = L2_1

        if L3_3 > 0 then

          L4_3 = L2_1

          L3_3 = L0_1

          L3_3 = L3_3[L4_3]

          if L3_3 then

            L4_3 = L2_1

            L3_3 = L0_1

            L3_3 = L3_3[L4_3]

            L3_3 = L3_3.coords

            L4_3 = GetEntityCoords

            L5_3 = PlayerPedId

            L5_3, L6_3, L7_3, L8_3, L9_3 = L5_3()

            L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)

            L5_3 = vector3

            L6_3 = L3_3.x

            L7_3 = L3_3.y

            L8_3 = L3_3.z

            L5_3 = L5_3(L6_3, L7_3, L8_3)

            L5_3 = L5_3 - L4_3

            L5_3 = #L5_3

            if L5_3 > 10 then

              L6_3 = SetNewWaypoint

              L7_3 = tonumber

              L8_3 = L3_3.x

              L7_3 = L7_3(L8_3)

              L8_3 = tonumber

              L9_3 = L3_3.y

              L8_3, L9_3 = L8_3(L9_3)

              L6_3(L7_3, L8_3, L9_3)

            else

              L6_3 = ShowNotification

              L7_3 = Config

              L7_3 = L7_3.Translations

              L7_3 = L7_3.ClosestAlert

              L6_3(L7_3)

            end

          end

        end

      end

    end

  end

  L0_2(L1_2, L2_2)

  L0_2 = RegisterNetEvent

  L1_2 = "origen_police:dispatch:delalert"

  function L2_2(A0_3, A1_3, A2_3)

    local L3_3

    L3_3 = onduty

    if not L3_3 then

      return

    end

    L3_3 = L1_1

    if L3_3 then

      L3_3 = Del

      L3_3()

    end

  end

  L0_2(L1_2, L2_2)

  L0_2 = RegisterCommand

  L1_2 = Config

  L1_2 = L1_2.Commands

  L1_2 = L1_2.NextAlert

  L1_2 = L1_2.cmd

  function L2_2(A0_3, A1_3, A2_3)

    local L3_3

    L3_3 = onduty

    if not L3_3 then

      return

    end

    L3_3 = L1_1

    if L3_3 then

      L3_3 = Next

      L3_3()

    end

  end

  L0_2(L1_2, L2_2)

  L0_2 = RegisterCommand

  L1_2 = Config

  L1_2 = L1_2.Commands

  L1_2 = L1_2.PreviousAlert

  L1_2 = L1_2.cmd

  function L2_2(A0_3, A1_3, A2_3)

    local L3_3

    L3_3 = onduty

    if not L3_3 then

      return

    end

    L3_3 = L1_1

    if L3_3 then

      L3_3 = Prev

      L3_3()

    end

  end

  L0_2(L1_2, L2_2)

end

StartAlerts = L5_1

function L5_1(A0_2)

  local L1_2, L2_2, L3_2

  if nil == A0_2 then

    L1_2 = L1_1

    A0_2 = not L1_2

  end

  L1_2 = L1_1

  if L1_2 ~= A0_2 then

    L1_1 = A0_2

    L1_2 = SendNUIMessage

    L2_2 = {}

    L2_2.action = "ShowAlerts"

    L3_2 = L1_1

    L2_2.value = L3_2

    L1_2(L2_2)

  end

end

ToggleAlerts = L5_1

L5_1 = RegisterNetEvent

L6_1 = "origen_police:client:ReceiveAlert"

function L7_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L2_2 = L3_1

  L2_2 = #L2_2

  if L2_2 > 0 then

    L2_2 = A0_2.type

    if L2_2 then

      L2_2 = 1

      L3_2 = L3_1

      L3_2 = #L3_2

      L4_2 = 1

      for L5_2 = L2_2, L3_2, L4_2 do

        L6_2 = L3_1

        L6_2 = L6_2[L5_2]

        L7_2 = A0_2.type

        if L6_2 == L7_2 then

          break

        end

        L6_2 = L3_1

        L6_2 = #L6_2

        if L5_2 == L6_2 then

          return

        end

      end

    end

  end

  L2_2 = PlaySoundFrontend

  L3_2 = -1

  L4_2 = "Event_Message_Purple"

  L5_2 = "GTAO_FM_Events_Soundset"

  L6_2 = false

  L2_2(L3_2, L4_2, L5_2, L6_2)

  L2_2 = type

  L3_2 = A0_2.coords

  L2_2 = L2_2(L3_2)

  if "table" == L2_2 then

    L2_2 = vector3

    L3_2 = A0_2.coords

    L3_2 = L3_2.x

    L4_2 = A0_2.coords

    L4_2 = L4_2.y

    L5_2 = A0_2.coords

    L5_2 = L5_2.z

    L2_2 = L2_2(L3_2, L4_2, L5_2)

    A0_2.coords = L2_2

  end

  L2_2 = GetEntityCoords

  L3_2 = PlayerPedId

  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2()

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  L3_2 = A0_2.coords

  L2_2 = L2_2 - L3_2

  L2_2 = #L2_2

  A0_2.distance = L2_2

  L2_2 = A0_2.distance

  L3_2 = 1000

  if L2_2 < L3_2 then

    L2_2 = FW_Round

    L3_2 = A0_2.distance

    L4_2 = 2

    L2_2 = L2_2(L3_2, L4_2)

    L3_2 = " m"

    L2_2 = L2_2 .. L3_2

    A0_2.distance = L2_2

  else

    L2_2 = FW_Round

    L3_2 = A0_2.distance

    L3_2 = L3_2 / 1000

    L4_2 = 2

    L2_2 = L2_2(L3_2, L4_2)

    L3_2 = " Km"

    L2_2 = L2_2 .. L3_2

    A0_2.distance = L2_2

  end

  L2_2 = GetStreetNameFromHashKey

  L3_2 = GetStreetNameAtCoord

  L4_2 = A0_2.coords

  L4_2 = L4_2.x

  L5_2 = A0_2.coords

  L5_2 = L5_2.y

  L6_2 = A0_2.coords

  L6_2 = L6_2.z

  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  A0_2.street = L2_2

  L2_2 = GetGameTimer

  L2_2 = L2_2()

  A0_2.time = L2_2

  L2_2 = table

  L2_2 = L2_2.insert

  L3_2 = L0_1

  L4_2 = A0_2

  L2_2(L3_2, L4_2)

  L2_2 = L0_1

  L2_2 = #L2_2

  L2_1 = L2_2

  L2_2 = SetAlert

  L3_2 = L2_1

  L2_2(L3_2)

  if A1_2 then

    L2_2 = IsWaypointActive

    L2_2 = L2_2()

    if L2_2 then

      L2_2 = DeleteWaypoint

      L2_2()

    end

    L2_2 = SetNewWaypoint

    L3_2 = tonumber

    L5_2 = L2_1

    L4_2 = L0_1

    L4_2 = L4_2[L5_2]

    L4_2 = L4_2.coords

    L4_2 = L4_2.x

    L3_2 = L3_2(L4_2)

    L4_2 = tonumber

    L6_2 = L2_1

    L5_2 = L0_1

    L5_2 = L5_2[L6_2]

    L5_2 = L5_2.coords

    L5_2 = L5_2.y

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  end

  L2_2 = ToggleAlerts

  L3_2 = true

  L2_2(L3_2)

end

L5_1(L6_1, L7_1)

function L5_1()

  local L0_2, L1_2

  L0_2 = L2_1

  L1_2 = L0_2 - 1

  L0_2 = L0_1

  L0_2 = L0_2[L1_2]

  if L0_2 then

    L0_2 = L2_1

    L0_2 = L0_2 - 1

    L2_1 = L0_2

    L0_2 = SetAlert

    L1_2 = L2_1

    L0_2(L1_2)

    L0_2 = true

    return L0_2

  else

    L0_2 = false

    return L0_2

  end

end

Prev = L5_1

function L5_1()

  local L0_2, L1_2

  L0_2 = L2_1

  L1_2 = L0_2 + 1

  L0_2 = L0_1

  L0_2 = L0_2[L1_2]

  if L0_2 then

    L0_2 = L2_1

    L0_2 = L0_2 + 1

    L2_1 = L0_2

    L0_2 = SetAlert

    L1_2 = L2_1

    L0_2(L1_2)

    L0_2 = true

    return L0_2

  else

    L0_2 = false

    return L0_2

  end

end

Next = L5_1

function L5_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  if not A0_2 then

    A0_2 = L2_1

  end

  L1_2 = type

  L2_2 = L0_1

  L1_2 = L1_2(L2_2)

  if "table" ~= L1_2 then

    L1_2 = {}

    L0_1 = L1_2

  end

  L1_2 = pairs

  L2_2 = L0_1

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    if L5_2 == A0_2 then

      L7_2 = table

      L7_2 = L7_2.remove

      L8_2 = L0_1

      L9_2 = L5_2

      L7_2(L8_2, L9_2)

      break

    end

  end

  L1_2 = SetAlert

  L2_2 = L2_1

  L1_2 = L1_2(L2_2)

  if not L1_2 then

    L1_2 = Prev

    L1_2 = L1_2()

  end

  if not L1_2 then

    L2_2 = ToggleAlerts

    L3_2 = false

    L2_2(L3_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 500

    L2_2(L3_2)

    L2_2 = SendNUIMessage

    L3_2 = {}

    L3_2.action = "NoAlert"

    L2_2(L3_2)

  end

end

Del = L5_1

function L5_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = L2_1

  if L1_2 ~= A0_2 then

    L2_1 = A0_2

  end

  L1_2 = L0_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L2_2 = SendNUIMessage

    L3_2 = {}

    L3_2.action = "SetAlert"

    L4_2 = L1_2.title

    L3_2.title = L4_2

    L4_2 = L1_2.message

    L3_2.message = L4_2

    L4_2 = L1_2.annotation

    L3_2.annotation = L4_2

    L4_2 = L1_2.metadata

    L3_2.metadata = L4_2

    L4_2 = L1_2.distance

    L3_2.distance = L4_2

    L4_2 = L1_2.street

    L3_2.street = L4_2

    L4_2 = L1_2.code

    L3_2.code = L4_2

    L4_2 = L1_2.central

    L3_2.central = L4_2

    L4_2 = L1_2.playerID

    L3_2.playerID = L4_2

    L4_2 = L2_1

    L3_2.count = L4_2

    L4_2 = math

    L4_2 = L4_2.ceil

    L5_2 = GetGameTimer

    L5_2 = L5_2()

    L6_2 = L1_2.time

    L5_2 = L5_2 - L6_2

    L5_2 = L5_2 / 1000

    L4_2 = L4_2(L5_2)

    L3_2.ago = L4_2

    L4_2 = L0_1

    L4_2 = #L4_2

    L3_2.total = L4_2

    L2_2(L3_2)

    L2_2 = true

    return L2_2

  else

    L2_2 = false

    return L2_2

  end

end

SetAlert = L5_1

function L5_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = false

  L2_2 = false

  L3_2 = type

  L4_2 = L0_1

  L3_2 = L3_2(L4_2)

  if "table" ~= L3_2 then

    L3_2 = {}

    L0_1 = L3_2

  end

  L3_2 = pairs

  L4_2 = L0_1

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2.id

    if L9_2 == A0_2 then

      L9_2 = L0_1

      L1_2 = L9_2[L7_2]

      L2_2 = L7_2

      break

    end

  end

  L3_2 = L1_2

  L4_2 = L2_2

  return L3_2, L4_2

end

GetAlertFromId = L5_1

L5_1 = exports

L6_1 = "GetAlertFromId"

L7_1 = GetAlertFromId

L5_1(L6_1, L7_1)

L5_1 = RegisterNUICallback

L6_1 = "SetFilter"

function L7_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A0_2.filter

  L3_1 = L2_2

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L5_1(L6_1, L7_1)

L5_1 = RegisterNetEvent

L6_1 = "origen_police:client:EditAlert"

function L7_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L1_2 = 1

  L2_2 = L0_1

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = L0_1

    L5_2 = L5_2[L4_2]

    L5_2 = L5_2.code

    L6_2 = A0_2.code

    if L5_2 == L6_2 then

      L5_2 = type

      L6_2 = A0_2

      L5_2 = L5_2(L6_2)

      if "table" ~= L5_2 then

        L5_2 = {}

        A0_2 = L5_2

      end

      L5_2 = pairs

      L6_2 = A0_2

      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

        L11_2 = L0_1

        L11_2 = L11_2[L4_2]

        L11_2[L9_2] = L10_2

      end

      L5_2 = L2_1

      if L4_2 == L5_2 then

        L5_2 = SetAlert

        L6_2 = L2_1

        L5_2(L6_2)

      end

      break

    end

  end

end

L5_1(L6_1, L7_1)

L5_1 = RegisterNetEvent

L6_1 = "origen_police:client:ForceSelectAlert"

function L7_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = false

  L2_2 = 1

  L3_2 = L0_1

  L3_2 = #L3_2

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = L0_1

    L6_2 = L6_2[L5_2]

    L6_2 = L6_2.code

    L7_2 = A0_2.code

    if L6_2 == L7_2 then

      L6_2 = L0_1

      L6_2 = L6_2[L5_2]

      L6_2.central = true

      L6_2 = SetAlert

      L7_2 = L5_2

      L6_2(L7_2)

      L1_2 = true

      L6_2 = IsWaypointActive

      L6_2 = L6_2()

      if L6_2 then

        L6_2 = DeleteWaypoint

        L6_2()

      end

      L6_2 = SetNewWaypoint

      L7_2 = tonumber

      L8_2 = L0_1

      L8_2 = L8_2[L5_2]

      L8_2 = L8_2.coords

      L8_2 = L8_2.x

      L7_2 = L7_2(L8_2)

      L8_2 = tonumber

      L9_2 = L0_1

      L9_2 = L9_2[L5_2]

      L9_2 = L9_2.coords

      L9_2 = L9_2.y

      L8_2, L9_2 = L8_2(L9_2)

      L6_2(L7_2, L8_2, L9_2)

      break

    end

  end

  if not L1_2 then

    A0_2.central = true

    L2_2 = TriggerEvent

    L3_2 = "origen_police:client:ReceiveAlert"

    L4_2 = A0_2

    L5_2 = true

    L2_2(L3_2, L4_2, L5_2)

  end

end

L5_1(L6_1, L7_1)

