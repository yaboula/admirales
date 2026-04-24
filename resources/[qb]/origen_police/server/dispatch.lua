local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

L0_1 = 0

L1_1 = {}

L2_1 = Config

L2_1 = L2_1.HeatMapAlerts

if L2_1 then

  L2_1 = Citizen

  L2_1 = L2_1.CreateThread

  function L3_1()

    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

    L0_2 = MySQL

    L0_2 = L0_2.awaitQuery

    L1_2 = "SELECT COUNT(*) as count FROM origen_police_alerts"

    L0_2 = L0_2(L1_2)

    L1_2 = L0_2[1]

    L1_2 = L1_2.count

    if L1_2 > 100 then

      L2_2 = L1_2 - 100

      L3_2 = MySQL

      L3_2 = L3_2.awaitQuery

      L4_2 = "SELECT id FROM origen_police_alerts ORDER BY id ASC LIMIT ?"

      L5_2 = {}

      L6_2 = L2_2

      L5_2[1] = L6_2

      L3_2 = L3_2(L4_2, L5_2)

      L4_2 = #L3_2

      if L4_2 > 0 then

        L4_2 = {}

        L5_2 = ipairs

        L6_2 = L3_2

        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

          L11_2 = table

          L11_2 = L11_2.insert

          L12_2 = L4_2

          L13_2 = L10_2.id

          L11_2(L12_2, L13_2)

        end

        L5_2 = table

        L5_2 = L5_2.concat

        L6_2 = L4_2

        L7_2 = ","

        L5_2 = L5_2(L6_2, L7_2)

        L6_2 = MySQL

        L6_2 = L6_2.awaitRawExec

        L7_2 = "DELETE FROM origen_police_alerts WHERE id IN ("

        L8_2 = L5_2

        L9_2 = ")"

        L7_2 = L7_2 .. L8_2 .. L9_2

        L6_2(L7_2)

      end

    end

    L2_2 = MySQL

    L2_2 = L2_2.awaitQuery

    L3_2 = "SELECT x, y, job FROM origen_police_alerts"

    L2_2 = L2_2(L3_2)

    L3_2 = 1

    L4_2 = #L2_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = L2_2[L6_2]

      L8_2 = L7_2.job

      L7_2 = L1_1

      L9_2 = L2_2[L6_2]

      L10_2 = L9_2.job

      L9_2 = L1_1

      L9_2 = L9_2[L10_2]

      if not L9_2 then

        L9_2 = {}

      end

      L7_2[L8_2] = L9_2

      L7_2 = table

      L7_2 = L7_2.insert

      L8_2 = L2_2[L6_2]

      L9_2 = L8_2.job

      L8_2 = L1_1

      L8_2 = L8_2[L9_2]

      L9_2 = {}

      L10_2 = L2_2[L6_2]

      L10_2 = L10_2.x

      L9_2.x = L10_2

      L10_2 = L2_2[L6_2]

      L10_2 = L10_2.y

      L9_2.y = L10_2

      L7_2(L8_2, L9_2)

    end

  end

  L2_1(L3_1)

end

L2_1 = pairs

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.CustomCommandAlert

L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)

for L6_1, L7_1 in L2_1, L3_1, L4_1, L5_1 do

  L8_1 = RegisterCommand

  L9_1 = L6_1

  function L10_1(A0_2, A1_2, A2_2)

    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

    L3_2 = A0_2

    L4_2 = A1_2[1]

    if not L4_2 then

      L4_2 = TriggerClientEvent

      L5_2 = "origen_police:ShowNotification"

      L6_2 = L3_2

      L7_2 = Config

      L7_2 = L7_2.Translations

      L7_2 = L7_2.CantSendEmpty

      L8_2 = " /"

      L9_2 = L6_1

      L7_2 = L7_2 .. L8_2 .. L9_2

      return L4_2(L5_2, L6_2, L7_2)

    end

    L4_2 = SendAlert

    L5_2 = {}

    L6_2 = L7_1.jobCategory

    L5_2.job = L6_2

    L6_2 = table

    L6_2 = L6_2.concat

    L7_2 = A1_2

    L8_2 = " "

    L6_2 = L6_2(L7_2, L8_2)

    L5_2.message = L6_2

    L6_2 = GetEntityCoords

    L7_2 = GetPlayerPed

    L8_2 = L3_2

    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2)

    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L5_2.coords = L6_2

    L5_2.type = "GENERALES"

    L6_2 = Config

    L6_2 = L6_2.Translations

    L6_2 = L6_2.Call911

    L5_2.title = L6_2

    L5_2.playerID = L3_2

    L4_2(L5_2)

    L4_2 = CreateLog

    L5_2 = {}

    L5_2.type = "DispatchAlerts"

    L6_2 = {}

    L7_2 = Config

    L7_2 = L7_2.LogsTranslations

    L7_2 = L7_2.Alert

    L7_2 = L7_2.title

    L6_2.title = L7_2

    L7_2 = Config

    L7_2 = L7_2.LogsTranslations

    L7_2 = L7_2.Alert

    L7_2 = L7_2.message

    L8_2 = L7_2

    L7_2 = L7_2.format

    L9_2 = L6_1

    L10_2 = table

    L10_2 = L10_2.concat

    L11_2 = A1_2

    L12_2 = " "

    L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)

    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)

    L6_2.description = L7_2

    L6_2.color = 1791423

    L5_2.embed = L6_2

    L5_2.source = L3_2

    L4_2(L5_2)

    L4_2 = L7_1.triggerEvent

    if L4_2 then

      L4_2 = TriggerClientEvent

      L5_2 = L7_1.triggerEvent

      L6_2 = L3_2

      L7_2 = table

      L7_2 = L7_2.concat

      L8_2 = A1_2

      L9_2 = " "

      L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L7_2(L8_2, L9_2)

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    end

  end

  L11_1 = false

  L8_1(L9_1, L10_1, L11_1)

end

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = string

  L1_2 = L1_2.find

  L2_2 = A0_2

  L3_2 = "[<>]"

  L1_2 = L1_2(L2_2, L3_2)

  L1_2 = nil ~= L1_2

  return L1_2

end

TryingToInjectHTML = L2_1

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = 1

  L2_2 = Config

  L2_2 = L2_2.BlackListedWords

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = string

    L5_2 = L5_2.match

    L7_2 = A0_2

    L6_2 = A0_2.lower

    L6_2 = L6_2(L7_2)

    L7_2 = Config

    L7_2 = L7_2.BlackListedWords

    L7_2 = L7_2[L4_2]

    L8_2 = L7_2

    L7_2 = L7_2.lower

    L7_2, L8_2 = L7_2(L8_2)

    L5_2 = L5_2(L6_2, L7_2, L8_2)

    if L5_2 then

      L5_2 = true

      return L5_2

    end

  end

  L1_2 = false

  return L1_2

end

AnyWordBlackListed = L2_1

L2_1 = {}

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2

  L2_2 = source

  if not L2_2 then

    L2_2 = A0_2.playerID

  end

  if not A1_2 then

    L3_2 = A0_2.title

    if L3_2 then

      L3_2 = AnyWordBlackListed

      L4_2 = A0_2.title

      L3_2 = L3_2(L4_2)

      if L3_2 then

        return

      end

    end

    L3_2 = A0_2.message

    if L3_2 then

      L3_2 = AnyWordBlackListed

      L4_2 = A0_2.message

      L3_2 = L3_2(L4_2)

      if L3_2 then

        return

      end

    end

    if L2_2 then

      L3_2 = A0_2.ignoreCooldown

      if not L3_2 then

        L3_2 = L2_1

        L3_2 = L3_2[L2_2]

        if L3_2 then

          L3_2 = GetGameTimer

          L3_2 = L3_2()

          L4_2 = L2_1

          L4_2 = L4_2[L2_2]

          L3_2 = L3_2 - L4_2

          L4_2 = Config

          L4_2 = L4_2.MinAlertCooldown

          L4_2 = L4_2 * 1000

          if L3_2 < L4_2 then

            L3_2 = TriggerClientEvent

            L4_2 = "origen_police:ShowNotification"

            L5_2 = L2_2

            L6_2 = "You have to wait a bit to send another alert"

            return L3_2(L4_2, L5_2, L6_2)

          end

        end

      end

      L3_2 = L2_1

      L4_2 = GetGameTimer

      L4_2 = L4_2()

      L3_2[L2_2] = L4_2

    end

    L3_2 = pairs

    L4_2 = A0_2

    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

      L9_2 = type

      L10_2 = L8_2

      L9_2 = L9_2(L10_2)

      if "string" == L9_2 then

        L9_2 = TryingToInjectHTML

        L10_2 = L8_2

        L9_2 = L9_2(L10_2)

        if L9_2 then

          return

        end

      end

    end

    L3_2 = A0_2.coords

    if L3_2 then

      L3_2 = type

      L4_2 = A0_2.coords

      L3_2 = L3_2(L4_2)

      if "vector3" ~= L3_2 then

        L3_2 = type

        L4_2 = A0_2.coords

        L3_2 = L3_2(L4_2)

        if "vector4" ~= L3_2 then

          L3_2 = print

          L4_2 = "Invalid type for coords, expected vector3/4 got "

          L5_2 = type

          L6_2 = A0_2.coords

          L5_2 = L5_2(L6_2)

          L4_2 = L4_2 .. L5_2

          L3_2(L4_2)

        end

      end

    end

    L3_2 = A0_2.coords

    if not L3_2 then

      L3_2 = GetEntityCoords

      L4_2 = GetPlayerPed

      L5_2 = L2_2

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L4_2(L5_2)

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)

      A0_2.coords = L3_2

    end

    L3_2 = A0_2.coords

    if L3_2 then

      L3_2 = A0_2.coords

      L3_2 = L3_2.w

      if L3_2 then

        L3_2 = vector3

        L4_2 = A0_2.coords

        L4_2 = L4_2.x

        L5_2 = A0_2.coords

        L5_2 = L5_2.y

        L6_2 = A0_2.coords

        L6_2 = L6_2.z

        L3_2 = L3_2(L4_2, L5_2, L6_2)

        A0_2.coords = L3_2

      end

    end

    L3_2 = L0_1

    L3_2 = L3_2 + 1

    L0_1 = L3_2

    L3_2 = L0_1

    A0_2.code = L3_2

    L3_2 = A0_2.job

    if not L3_2 then

      L3_2 = FW_GetPlayer

      L4_2 = L2_2

      L3_2 = L3_2(L4_2)

      if not L3_2 then

        return

      end

      L4_2 = pairs

      L5_2 = Config

      L5_2 = L5_2.JobCategory

      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

        L10_2 = pairs

        L11_2 = L9_2

        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)

        for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do

          L16_2 = L15_2.name

          L17_2 = L3_2.PlayerData

          L17_2 = L17_2.job

          L17_2 = L17_2.name

          if L16_2 == L17_2 then

            A0_2.job = L8_2

            break

          end

        end

      end

    end

    L3_2 = A0_2.job

    if not L3_2 then

      L3_2 = "police"

    end

    A0_2.job = L3_2

    L3_2 = A0_2.metadata

    if L3_2 then

      L3_2 = Config

      L3_2 = L3_2.DisplayPlateOnVehicleAlerts

      if not L3_2 then

        L3_2 = A0_2.metadata

        L3_2.plate = nil

      end

    end

    if L2_2 then

      L3_2 = A0_2.playerID

      L3_2 = L2_2 or L3_2

      if true ~= L3_2 or not L2_2 then

        L3_2 = A0_2.playerID

      end

      A0_2.playerID = L3_2

    end

  end

  L3_2 = type

  L4_2 = A0_2.job

  L3_2 = L3_2(L4_2)

  if "table" == L3_2 then

    L3_2 = 1

    L4_2 = A0_2.job

    L4_2 = #L4_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = Shallowcopy

      L8_2 = A0_2

      L7_2 = L7_2(L8_2)

      L8_2 = A0_2.job

      L8_2 = L8_2[L6_2]

      L7_2.job = L8_2

      L8_2 = SendAlert

      L9_2 = L7_2

      L10_2 = true

      L8_2(L9_2, L10_2)

    end

  else

    L3_2 = {}

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "qbcore" == L4_2 then

      L4_2 = Config

      L4_2 = L4_2.JobCategory

      L5_2 = A0_2.job

      L4_2 = L4_2[L5_2]

      if nil == L4_2 then

        L4_2 = print

        L5_2 = "origen_police: ERROR: You are trying to send an alert with a job category that doesn't exist in the Config.JobCategory table in config/permissions.lua"

        L4_2(L5_2)

        return

      end

      L4_2 = pairs

      L5_2 = Config

      L5_2 = L5_2.JobCategory

      L6_2 = A0_2.job

      L5_2 = L5_2[L6_2]

      L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

      for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

        L10_2 = Framework

        L10_2 = L10_2.Functions

        L10_2 = L10_2.GetPlayersOnDuty

        L11_2 = L9_2.name

        L10_2, L11_2 = L10_2(L11_2)

        L12_2 = 1

        L13_2 = #L10_2

        L14_2 = 1

        for L15_2 = L12_2, L13_2, L14_2 do

          L16_2 = table

          L16_2 = L16_2.insert

          L17_2 = L3_2

          L18_2 = L10_2[L15_2]

          L16_2(L17_2, L18_2)

        end

      end

    else

      L4_2 = Config

      L4_2 = L4_2.Framework

      if "esx" == L4_2 then

        L4_2 = GetPlayersInDuty

        L5_2 = A0_2.job

        L4_2 = L4_2(L5_2)

        L3_2 = L4_2

      else

        L4_2 = {}

        L3_2 = L4_2

        L4_2 = print

        L5_2 = "Can't find supported framework: "

        L6_2 = Config

        L6_2 = L6_2.Framework

        L4_2(L5_2, L6_2)

      end

    end

    L4_2 = MySQL

    L4_2 = L4_2.awaitInsert

    L5_2 = "INSERT INTO origen_police_alerts (x, y, job) VALUES (?, ?, ?)"

    L6_2 = {}

    L7_2 = FW_Round

    L8_2 = A0_2.coords

    L8_2 = L8_2.x

    L7_2 = L7_2(L8_2)

    L8_2 = FW_Round

    L9_2 = A0_2.coords

    L9_2 = L9_2.y

    L8_2 = L8_2(L9_2)

    L9_2 = A0_2.job

    L6_2[1] = L7_2

    L6_2[2] = L8_2

    L6_2[3] = L9_2

    L4_2(L5_2, L6_2)

    L4_2 = Config

    L4_2 = L4_2.DispatchRedirect

    if L4_2 then

      L4_2 = 1

      L5_2 = #L3_2

      L6_2 = 1

      for L7_2 = L4_2, L5_2, L6_2 do

        L8_2 = CentralSuscribeds

        L9_2 = L3_2[L7_2]

        L8_2 = L8_2[L9_2]

        if L8_2 then

          L8_2 = TriggerClientEvent

          L9_2 = "origen_police_menu:client:ReceiveAlert"

          L10_2 = L3_2[L7_2]

          L11_2 = A0_2

          L8_2(L9_2, L10_2, L11_2)

        end

      end

      return

    end

    L4_2 = 1

    L5_2 = #L3_2

    L6_2 = 1

    for L7_2 = L4_2, L5_2, L6_2 do

      L8_2 = CentralSuscribeds

      L9_2 = L3_2[L7_2]

      L8_2 = L8_2[L9_2]

      if L8_2 then

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police_menu:client:ReceiveAlert"

        L10_2 = L3_2[L7_2]

        L11_2 = A0_2

        L8_2(L9_2, L10_2, L11_2)

        L8_2 = Config

        L8_2 = L8_2.RecieveAlwaysAlerts

        if L8_2 then

          L8_2 = TriggerClientEvent

          L9_2 = "origen_police:client:ReceiveAlert"

          L10_2 = L3_2[L7_2]

          L11_2 = A0_2

          L8_2(L9_2, L10_2, L11_2)

        end

      else

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police:client:ReceiveAlert"

        L10_2 = L3_2[L7_2]

        L11_2 = A0_2

        L8_2(L9_2, L10_2, L11_2)

      end

    end

  end

end

SendAlert = L3_1

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2

  L2_2 = A1_2.code

  if not L2_2 then

    return

  end

  L2_2 = CanOpenTablet

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = {}

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = Config

    L4_2 = L4_2.JobCategory

    L4_2 = L4_2[L2_2]

    if nil == L4_2 then

      L4_2 = print

      L5_2 = "origen_police: ERROR: You are trying to send an alert with a job category that doesn't exist in the Config.JobCategory table in config/permissions.lua"

      L4_2(L5_2)

      return

    end

    L4_2 = pairs

    L5_2 = Config

    L5_2 = L5_2.JobCategory

    L5_2 = L5_2[L2_2]

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = Framework

      L10_2 = L10_2.Functions

      L10_2 = L10_2.GetPlayersOnDuty

      L11_2 = L9_2.name

      L10_2, L11_2 = L10_2(L11_2)

      L12_2 = 1

      L13_2 = #L10_2

      L14_2 = 1

      for L15_2 = L12_2, L13_2, L14_2 do

        L16_2 = table

        L16_2 = L16_2.insert

        L17_2 = L3_2

        L18_2 = L10_2[L15_2]

        L16_2(L17_2, L18_2)

      end

    end

  else

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "esx" == L4_2 then

      L4_2 = GetPlayersInDuty

      L5_2 = L2_2

      L4_2 = L4_2(L5_2)

      L3_2 = L4_2

    else

      L4_2 = {}

      L3_2 = L4_2

      L4_2 = print

      L5_2 = "Can't find supported framework: "

      L6_2 = Config

      L6_2 = L6_2.Framework

      L4_2(L5_2, L6_2)

    end

  end

  L4_2 = 1

  L5_2 = #L3_2

  L6_2 = 1

  for L7_2 = L4_2, L5_2, L6_2 do

    L8_2 = Config

    L8_2 = L8_2.RecieveAlwaysAlerts

    if L8_2 then

      L8_2 = TriggerClientEvent

      L9_2 = "origen_police:client:EditAlert"

      L10_2 = L3_2[L7_2]

      L11_2 = A1_2

      L8_2(L9_2, L10_2, L11_2)

      L8_2 = TriggerClientEvent

      L9_2 = "origen_police_menu:client:EditAlert"

      L10_2 = L3_2[L7_2]

      L11_2 = A1_2

      L8_2(L9_2, L10_2, L11_2)

    else

      L8_2 = CentralSuscribeds

      L9_2 = L3_2[L7_2]

      L8_2 = L8_2[L9_2]

      if not L8_2 then

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police:client:EditAlert"

        L10_2 = L3_2[L7_2]

        L11_2 = A1_2

        L8_2(L9_2, L10_2, L11_2)

      else

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police_menu:client:EditAlert"

        L10_2 = L3_2[L7_2]

        L11_2 = A1_2

        L8_2(L9_2, L10_2, L11_2)

      end

    end

  end

end

EditAlert = L3_1

L3_1 = exports

L4_1 = "SendAlert"

L5_1 = SendAlert

L3_1(L4_1, L5_1)

L3_1 = RegisterServerEvent

L4_1 = "SendAlert:police"

L5_1 = SendAlert

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "EditAlert"

L5_1 = EditAlert

L3_1(L4_1, L5_1)

L3_1 = RegisterServerEvent

L4_1 = "origen_police:server:EditAlert"

L5_1 = EditAlert

L3_1(L4_1, L5_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:server:EditAlert"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2

  L3_2 = EditAlert

  L4_2 = A0_2

  L5_2 = A2_2

  L3_2(L4_2, L5_2)

  L3_2 = A1_2

  L4_2 = true

  L3_2(L4_2)

end

L3_1(L4_1, L5_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:server:ForceSelectAlert"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L3_2 = CanOpenTablet

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  L4_2 = References

  L5_2 = References

  L5_2 = L5_2[L3_2]

  if not L5_2 then

    L5_2 = {}

  end

  L4_2[L3_2] = L5_2

  L4_2 = pairs

  L5_2 = References

  L5_2 = L5_2[L3_2]

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = L9_2.unit

    L11_2 = A2_2.unit

    if L10_2 == L11_2 then

      L10_2 = TriggerClientEvent

      L11_2 = "origen_police:client:ForceSelectAlert"

      L12_2 = L8_2

      L13_2 = A2_2.alert

      L10_2(L11_2, L12_2, L13_2)

    end

    L10_2 = A2_2.alert

    L11_2 = A2_2.unit

    L10_2.unit = L11_2

    L10_2 = TriggerClientEvent

    L11_2 = "origen_police_menu:client:EditAlert"

    L12_2 = L8_2

    L13_2 = A2_2.alert

    L10_2(L11_2, L12_2, L13_2)

    L10_2 = A2_2.alert

    L11_2 = string

    L11_2 = L11_2.format

    L12_2 = "%04d"

    L13_2 = A2_2.alert

    L13_2 = L13_2.code

    L11_2 = L11_2(L12_2, L13_2)

    L10_2.code = L11_2

    L10_2 = Translations

    L10_2 = L10_2.AlertAsigned

    L11_2 = L10_2

    L10_2 = L10_2.format

    L12_2 = A2_2.alert

    L12_2 = L12_2.code

    L13_2 = A2_2.unit

    L10_2 = L10_2(L11_2, L12_2, L13_2)

    L11_2 = TriggerClientEvent

    L12_2 = "origen_police:ForceNotification"

    L13_2 = L8_2

    L14_2 = L10_2

    L11_2(L12_2, L13_2, L14_2)

  end

  L4_2 = A1_2

  L5_2 = true

  L4_2(L5_2)

end

L3_1(L4_1, L5_1)

L3_1 = Config

L3_1 = L3_1.HeatMapAlerts

if not L3_1 then

  return

end

L3_1 = FW_CreateCallback

L4_1 = "origen_police:server:GetHeatAlerts"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = CanOpenTablet

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = A1_2

  L4_2 = L1_1

  L4_2 = L4_2[L2_2]

  if not L4_2 then

    L4_2 = {}

  end

  L3_2(L4_2)

end

L3_1(L4_1, L5_1)

