local L0_1, L1_1, L2_1

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:SetWantedLevel"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:SetWantedLevel"

  L4_2 = A0_2

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:SetDimension"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = GetVehiclePedIsIn

  L4_2 = GetPlayerPed

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  L5_2 = false

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = SetPlayerRoutingBucket

  L5_2 = A0_2

  L6_2 = A2_2

  L4_2(L5_2, L6_2)

  if 0 ~= L3_2 then

    L4_2 = SetEntityRoutingBucket

    L5_2 = L3_2

    L6_2 = A2_2

    L4_2(L5_2, L6_2)

  end

  L4_2 = A1_2

  L5_2 = true

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:confiscateveh"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = ConfiscateVehicle

  L4_2 = A0_2

  L5_2 = A1_2

  L6_2 = A2_2

  L7_2 = nil

  L8_2 = source

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetConfiscatedVehs"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2

  L3_2 = A1_2

  L4_2 = GetConfiscatedVehicles

  L5_2 = A2_2

  L4_2, L5_2 = L4_2(L5_2)

  L3_2(L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetBills"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    L4_2 = A1_2

    L5_2 = {}

    return L4_2(L5_2)

  end

  L4_2 = A1_2

  L5_2 = exports

  L5_2 = L5_2.origen_police

  L6_2 = L5_2

  L5_2 = L5_2.GetUnpayedBills

  L7_2 = L3_2.PlayerData

  L7_2 = L7_2.citizenid

  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)

  L4_2(L5_2, L6_2, L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "OsTime"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = os

  L3_2 = L3_2.time

  L3_2 = L3_2()

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:SetMetaData"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = FW_GetPlayer

  L3_2 = source

  L2_2 = L2_2(L3_2)

  if L2_2 then

    L3_2 = L2_2.Functions

    L3_2 = L3_2.SetMetaData

    L4_2 = A0_2

    if false == A1_2 then

      L5_2 = 0

      if L5_2 then

        goto lbl_20

      end

    end

    if true == A1_2 then

      L5_2 = 1

      if L5_2 then

        goto lbl_20

      end

    end

    L5_2 = A1_2

    ::lbl_20::

    L3_2(L4_2, L5_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GeneratePoliceBadge"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L3_2 = CanOpenTablet

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  L4_2 = FW_GetPlayer

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  if not L4_2 then

    L5_2 = A1_2

    L6_2 = "Player not found"

    return L5_2(L6_2)

  end

  L5_2 = "lspd_badge"

  L6_2 = pairs

  L7_2 = Config

  L7_2 = L7_2.JobCategory

  L7_2 = L7_2[L3_2]

  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

    L12_2 = L11_2.name

    L13_2 = L12_2

    L12_2 = L12_2.lower

    L12_2 = L12_2(L13_2)

    L13_2 = L4_2.PlayerData

    L13_2 = L13_2.job

    L13_2 = L13_2.name

    L14_2 = L13_2

    L13_2 = L13_2.lower

    L13_2 = L13_2(L14_2)

    if L12_2 == L13_2 then

      L5_2 = L11_2.badge

    end

  end

  L6_2 = Config

  L6_2 = L6_2.GenerateBadgeToTheAgent

  if L6_2 then

    L6_2 = A2_2.cid

    if L6_2 then

      L6_2 = FW_GetPlayerFromCitizenid

      L7_2 = A2_2.cid

      L6_2 = L6_2(L7_2)

      if not L6_2 then

        L7_2 = A1_2

        L8_2 = "Target player not found"

        return L7_2(L8_2)

      end

      L7_2 = L6_2.PlayerData

      L7_2 = L7_2.source

      if L7_2 then

        L7_2 = L6_2.PlayerData

        A0_2 = L7_2.source

        L4_2 = L6_2

      end

    end

  end

  if "fib_badge" == L5_2 then

    L6_2 = FW_GetPlayerFromCitizenid

    L7_2 = A2_2.cid

    L6_2 = L6_2(L7_2)

    if not L6_2 then

      L7_2 = A1_2

      L8_2 = "Target player not found for FIB badge"

      return L7_2(L8_2)

    end

    L7_2 = L6_2.PlayerData

    L7_2 = L7_2.source

    if L7_2 then

      L7_2 = TriggerClientEvent

      L8_2 = "origen_police:client:GenerateMugshotBadge"

      L9_2 = L6_2.PlayerData

      L9_2 = L9_2.source

      L10_2 = L6_2.PlayerData

      L10_2 = L10_2.charinfo

      L10_2 = L10_2.firstname

      L11_2 = " "

      L12_2 = L6_2.PlayerData

      L12_2 = L12_2.charinfo

      L12_2 = L12_2.lastname

      L10_2 = L10_2 .. L11_2 .. L12_2

      L11_2 = A0_2

      L12_2 = {}

      L13_2 = ServerConfig

      L13_2 = L13_2.Logs

      L13_2 = L13_2.Mugshots

      L12_2.url = L13_2

      L13_2 = Config

      L13_2 = L13_2.Fields

      L14_2 = Config

      L14_2 = L14_2.UploadMethod

      L13_2 = L13_2[L14_2]

      L12_2.fields = L13_2

      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)

      L7_2 = A1_2

      L8_2 = true

      return L7_2(L8_2)

    end

    L7_2 = A1_2

    L8_2 = "The police agent should be online to generate the badge"

    return L7_2(L8_2)

  end

  L6_2 = Config

  L6_2 = L6_2.Inventory

  if "qs-inventory" == L6_2 then

    L6_2 = exports

    L6_2 = L6_2["qs-inventory"]

    L7_2 = L6_2

    L6_2 = L6_2.AddItem

    L8_2 = A0_2

    L9_2 = L5_2

    L10_2 = 1

    L11_2 = false

    L12_2 = {}

    L13_2 = A2_2.grade

    L12_2.grade = L13_2

    L13_2 = A2_2.police_badge

    L12_2.n = L13_2

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L6_2 = A1_2

    L7_2 = true

    L6_2(L7_2)

    return

  end

  L6_2 = L4_2.Functions

  L6_2 = L6_2.AddItem

  L7_2 = L5_2

  L8_2 = 1

  L9_2 = false

  L10_2 = {}

  L11_2 = A2_2.grade

  L10_2.grade = L11_2

  L11_2 = A2_2.police_badge

  L10_2.n = L11_2

  L6_2(L7_2, L8_2, L9_2, L10_2)

  L6_2 = A1_2

  L7_2 = true

  L6_2(L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:pertenences"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = LeaveTakePertenences

  L2_2 = A0_2

  L3_2 = source

  L1_2(L2_2, L3_2)

end

L0_1(L1_1, L2_1)

function L0_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L0_2 = Config

  L0_2 = L0_2.JobCategory

  L1_2 = Config

  L1_2 = L1_2.PoliceJobName

  L0_2 = L0_2[L1_2]

  if nil == L0_2 then

    L0_2 = 0

    return L0_2

  end

  L0_2 = 0

  L1_2 = pairs

  L2_2 = Config

  L2_2 = L2_2.JobCategory

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = pairs

    L8_2 = L6_2

    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

      L13_2 = 0

      L14_2 = Framework

      L14_2 = L14_2.Functions

      L14_2 = L14_2.GetPlayersOnDuty

      L15_2 = L12_2.name

      L14_2, L15_2 = L14_2(L15_2)

      L16_2 = 1

      L17_2 = #L14_2

      L18_2 = 1

      for L19_2 = L16_2, L17_2, L18_2 do

        L13_2 = L13_2 + 1

      end

      L0_2 = L0_2 + L13_2

    end

  end

  return L0_2

end

GetCurrentCops = L0_1

L0_1 = CreateThread

function L1_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = Config

  L0_2 = L0_2.Framework

  if "esx" == L0_2 then

    return

  end

  while true do

    L0_2 = TriggerClientEvent

    L1_2 = "police:SetCopCount"

    L2_2 = -1

    L3_2 = GetCurrentCops

    L3_2 = L3_2()

    L0_2(L1_2, L2_2, L3_2)

    L0_2 = Wait

    L1_2 = 30000

    L0_2(L1_2)

  end

end

L0_1(L1_1)

L0_1 = exports

L1_1 = "GetBills"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = FW_GetPlayer

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if not L1_2 then

    L2_2 = {}

    return L2_2

  end

  L2_2 = exports

  L2_2 = L2_2.origen_police

  L3_2 = L2_2

  L2_2 = L2_2.GetUnpayedBills

  L4_2 = L1_2.PlayerData

  L4_2 = L4_2.citizenid

  return L2_2(L3_2, L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:SaveMugshot"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L3_2 = FW_GetPlayer

  L4_2 = A2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = Config

  L4_2 = L4_2.Inventory

  if "qs-inventory" == L4_2 then

    L4_2 = exports

    L4_2 = L4_2["qs-inventory"]

    L5_2 = L4_2

    L4_2 = L4_2.AddItem

    L6_2 = A2_2

    L7_2 = "fib_badge"

    L8_2 = 1

    L9_2 = false

    L10_2 = {}

    L10_2.url = A0_2

    L10_2.name = A1_2

    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

    return

  end

  L4_2 = L3_2.Functions

  L4_2 = L4_2.AddItem

  L5_2 = "fib_badge"

  L6_2 = 1

  L7_2 = false

  L8_2 = {}

  L8_2.url = A0_2

  L8_2.name = A1_2

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

