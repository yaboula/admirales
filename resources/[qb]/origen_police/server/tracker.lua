local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = {}

Trackers = L0_1

L0_1 = Citizen

L0_1 = L0_1.CreateThread

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L0_2 = MySQL

  L0_2 = L0_2.awaitQuery

  L1_2 = "SELECT * FROM origen_police_ankle"

  L0_2 = L0_2(L1_2)

  L1_2 = Wait

  L2_2 = 2000

  L1_2(L2_2)

  if not L0_2 then

    return

  end

  L1_2 = pairs

  L2_2 = L0_2

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = FW_GetPlayerFromCitizenid

    L8_2 = L6_2.citizenid

    L7_2 = L7_2(L8_2)

    if L7_2 then

      L8_2 = L7_2.PlayerData

      if L8_2 then

        L8_2 = L7_2.PlayerData

        L8_2 = L8_2.source

        if L8_2 then

          L8_2 = Trackers

          L9_2 = L7_2.PlayerData

          L9_2 = L9_2.source

          L8_2[L9_2] = L6_2

          L8_2 = TriggerClientEvent

          L9_2 = "origen_police:client:SetAnkleCuff"

          L10_2 = L7_2.PlayerData

          L10_2 = L10_2.source

          L11_2 = true

          L8_2(L9_2, L10_2, L11_2)

        end

      end

    end

  end

end

L0_1(L1_1)

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L1_2 = pairs

  L2_2 = Trackers

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = FW_GetPlayer

    L8_2 = L5_2

    L7_2 = L7_2(L8_2)

    L8_2 = L6_2.citizenid

    if L8_2 == A0_2 and L7_2 then

      L8_2 = L7_2.PlayerData

      if L8_2 then

        L8_2 = L7_2.PlayerData

        L8_2 = L8_2.citizenid

        if L8_2 == A0_2 then

          L8_2 = FW_GetPlayerFromCitizenid

          L9_2 = L6_2.policeOwner

          L8_2 = L8_2(L9_2)

          L9_2 = L8_2.PlayerData

          L9_2 = L9_2.charinfo

          if not L9_2 then

            L9_2 = print

            L10_2 = "Invalid charinfo while getting the tracker from CID: "

            L11_2 = A0_2

            return L9_2(L10_2, L11_2)

          end

          L9_2 = L8_2.PlayerData

          L9_2 = L9_2.metadata

          if not L9_2 then

            L9_2 = print

            L10_2 = "Invalid metadata while getting the tracker from CID: "

            L11_2 = A0_2

            return L9_2(L10_2, L11_2)

          end

          L9_2 = L8_2.PlayerData

          L9_2 = L9_2.charinfo

          L9_2 = L9_2.firstname

          L10_2 = " "

          L11_2 = L8_2.PlayerData

          L11_2 = L11_2.charinfo

          L11_2 = L11_2.lastname

          L12_2 = " ("

          L13_2 = L8_2.PlayerData

          L13_2 = L13_2.metadata

          L13_2 = L13_2.police_badge

          if not L13_2 then

            L13_2 = "0000"

          end

          L14_2 = ")"

          L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2

          L6_2.policeLabel = L9_2

          L9_2 = {}

          L10_2 = table

          L10_2 = L10_2.unpack

          L11_2 = GetEntityCoords

          L12_2 = GetPlayerPed

          L13_2 = L5_2

          L12_2, L13_2, L14_2 = L12_2(L13_2)

          L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2, L13_2, L14_2)

          L10_2, L11_2, L12_2, L13_2, L14_2 = L10_2(L11_2, L12_2, L13_2, L14_2)

          L9_2[1] = L10_2

          L9_2[2] = L11_2

          L9_2[3] = L12_2

          L9_2[4] = L13_2

          L9_2[5] = L14_2

          L6_2.coords = L9_2

          L6_2.targetId = L5_2

          return L6_2

        end

      end

    end

  end

  L1_2 = nil

  return L1_2

end

GetTrackerFromCitizenid = L0_1

L0_1 = RegisterServerAction

L1_1 = "origen_police:server:anklecuff"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L1_2 = source

  L2_2 = Trackers

  L2_2 = L2_2[A0_2]

  L2_2 = nil ~= L2_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L4_2 = FW_GetPlayer

  L5_2 = L1_2

  L4_2 = L4_2(L5_2)

  if not L3_2 or not L4_2 then

    return

  end

  L5_2 = ""

  if not L2_2 then

    L6_2 = MySQL

    L6_2 = L6_2.awaitInsert

    L7_2 = "INSERT INTO origen_police_ankle (citizenid, policeOwner) VALUES (@citizenid, @police)"

    L8_2 = {}

    L9_2 = L3_2.PlayerData

    L9_2 = L9_2.citizenid

    L8_2["@citizenid"] = L9_2

    L9_2 = L4_2.PlayerData

    L9_2 = L9_2.citizenid

    L8_2["@police"] = L9_2

    L6_2(L7_2, L8_2)

    L6_2 = Trackers

    L7_2 = {}

    L8_2 = L3_2.PlayerData

    L8_2 = L8_2.citizenid

    L7_2.citizenid = L8_2

    L8_2 = L4_2.PlayerData

    L8_2 = L8_2.citizenid

    L7_2.policeOwner = L8_2

    L8_2 = os

    L8_2 = L8_2.time

    L8_2 = L8_2()

    L7_2.date = L8_2

    L6_2[A0_2] = L7_2

    L5_2 = "Placed"

  else

    L6_2 = Trackers

    L6_2[A0_2] = nil

    L6_2 = MySQL

    L6_2 = L6_2.awaitQuery

    L7_2 = "DELETE FROM origen_police_ankle WHERE citizenid = @citizenid"

    L8_2 = {}

    L9_2 = L3_2.PlayerData

    L9_2 = L9_2.citizenid

    L8_2["@citizenid"] = L9_2

    L6_2(L7_2, L8_2)

    L5_2 = "Removed"

  end

  L6_2 = GetPlayerPed

  L7_2 = A0_2

  L6_2 = L6_2(L7_2)

  L7_2 = FreezeEntityPosition

  L8_2 = L6_2

  L9_2 = true

  L7_2(L8_2, L9_2)

  L7_2 = Wait

  L8_2 = 5000

  L7_2(L8_2)

  L7_2 = TriggerClientEvent

  L8_2 = "origen_police:client:SetAnkleCuff"

  L9_2 = A0_2

  L10_2 = not L2_2

  L7_2(L8_2, L9_2, L10_2)

  L7_2 = FreezeEntityPosition

  L8_2 = L6_2

  L9_2 = false

  L7_2(L8_2, L9_2)

  L7_2 = CreateLog

  L8_2 = {}

  L8_2.type = "Ankle"

  L9_2 = {}

  L10_2 = "Ankle Cuff - "

  L11_2 = L5_2

  L10_2 = L10_2 .. L11_2

  L9_2.title = L10_2

  L10_2 = string

  L10_2 = L10_2.format

  L11_2 = [[

**%s [%s]** has %s the ankle cuff of **%s [%s]**

Date: <t:%d:f>]]

  L12_2 = L4_2.PlayerData

  L12_2 = L12_2.charinfo

  L12_2 = L12_2.firstname

  L13_2 = " "

  L14_2 = L4_2.PlayerData

  L14_2 = L14_2.charinfo

  L14_2 = L14_2.lastname

  L12_2 = L12_2 .. L13_2 .. L14_2

  L13_2 = L1_2

  L14_2 = string

  L14_2 = L14_2.lower

  L15_2 = L5_2

  L14_2 = L14_2(L15_2)

  L15_2 = L3_2.PlayerData

  L15_2 = L15_2.charinfo

  L15_2 = L15_2.firstname

  L16_2 = " "

  L17_2 = L3_2.PlayerData

  L17_2 = L17_2.charinfo

  L17_2 = L17_2.lastname

  L15_2 = L15_2 .. L16_2 .. L17_2

  L16_2 = A0_2

  L17_2 = os

  L17_2 = L17_2.time

  L17_2 = L17_2()

  L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

  L9_2.description = L10_2

  if "Placed" == L5_2 then

    L10_2 = 65280

    if L10_2 then

      goto lbl_127

    end

  end

  L10_2 = 16711680

  ::lbl_127::

  L9_2.color = L10_2

  L8_2.embed = L9_2

  L8_2.source = L1_2

  L7_2(L8_2)

end

L3_1 = "ankle_cuff"

L4_1 = 300

L5_1 = 1

L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)

L0_1 = RegisterServerAction

L1_1 = "origen_police:server:ankleshock"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = Trackers

  L2_2 = tonumber

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L1_2 = L1_2[L2_2]

  if not L1_2 then

    L1_2 = print

    L2_2 = "No tracker on this player"

    return L1_2(L2_2)

  end

  L1_2 = FW_GetPlayer

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if not L1_2 then

    return

  end

  L2_2 = MySQL

  L2_2 = L2_2.awaitInsert

  L3_2 = "UPDATE origen_police_ankle SET lastShock = CURRENT_TIMESTAMP WHERE citizenid = ?"

  L4_2 = {}

  L5_2 = L1_2.PlayerData

  L5_2 = L5_2.citizenid

  L4_2[1] = L5_2

  L2_2(L3_2, L4_2)

  L2_2 = Trackers

  L3_2 = tonumber

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L2_2 = L2_2[L3_2]

  L3_2 = os

  L3_2 = L3_2.time

  L3_2 = L3_2()

  L3_2 = L3_2 * 1000

  L2_2.lastShock = L3_2

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:ankleshock"

  L4_2 = A0_2

  L2_2(L3_2, L4_2)

end

L3_1 = "ankle_shock"

L4_1 = 300

L5_1 = 1

L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:GetAnkleCuff"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = source

  L1_2 = FW_GetPlayer

  L2_2 = L0_2

  L1_2 = L1_2(L2_2)

  if not L1_2 then

    return

  end

  L2_2 = MySQL

  L2_2 = L2_2.awaitQuery

  L3_2 = "SELECT * FROM origen_police_ankle WHERE citizenid = ? LIMIT 1"

  L4_2 = {}

  L5_2 = L1_2.PlayerData

  L5_2 = L5_2.citizenid

  L4_2[1] = L5_2

  L2_2 = L2_2(L3_2, L4_2)

  if not L2_2 then

    return

  end

  L3_2 = L2_2[1]

  if not L3_2 then

    return

  end

  L2_2 = L2_2[1]

  L3_2 = Trackers

  L3_2[L0_2] = L2_2

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:SetAnkleCuff"

  L5_2 = L0_2

  L6_2 = true

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

