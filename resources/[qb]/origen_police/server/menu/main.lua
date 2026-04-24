local L0_1, L1_1, L2_1

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:RemoveItem"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    L4_2 = A1_2

    L5_2 = false

    return L4_2(L5_2)

  end

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = A1_2

    L5_2 = L3_2.Functions

    L5_2 = L5_2.RemoveItem

    L6_2 = A2_2.item_name

    L7_2 = A2_2.amount

    L8_2 = A2_2.slot

    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)

    L4_2(L5_2, L6_2, L7_2, L8_2)

  else

    L4_2 = L3_2.Functions

    L4_2 = L4_2.RemoveItem

    L5_2 = A2_2.item_name

    L6_2 = A2_2.amount

    L7_2 = A2_2.slot

    L4_2(L5_2, L6_2, L7_2)

    L4_2 = A1_2

    L5_2 = true

    L4_2(L5_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetClosestPlayers"

function L2_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L4_2 = {}

  L5_2 = 1

  L6_2 = #A2_2

  L7_2 = 1

  for L8_2 = L5_2, L6_2, L7_2 do

    L9_2 = FW_GetPlayer

    L10_2 = A2_2[L8_2]

    L9_2 = L9_2(L10_2)

    if L9_2 then

      L10_2 = L9_2.PlayerData

      if L10_2 then

        L10_2 = L9_2.PlayerData

        L10_2 = L10_2.job

        if L10_2 then

          L10_2 = A3_2.job

          if L10_2 then

            L10_2 = A3_2.job

            L11_2 = L9_2.PlayerData

            L11_2 = L11_2.job

            L11_2 = L11_2.name

            if L10_2 == L11_2 then

              goto lbl_81

            end

          end

          L10_2 = MySQL

          L10_2 = L10_2.awaitQuery

          L11_2 = "SELECT image FROM "

          L12_2 = Config

          L12_2 = L12_2.Framework

          if "qbcore" == L12_2 then

            L12_2 = "players"

            if L12_2 then

              goto lbl_39

            end

          end

          L12_2 = "users"

          ::lbl_39::

          L13_2 = " WHERE "

          L14_2 = Config

          L14_2 = L14_2.Framework

          if "qbcore" == L14_2 then

            L14_2 = "citizenid"

            if L14_2 then

              goto lbl_48

            end

          end

          L14_2 = "identifier"

          ::lbl_48::

          L15_2 = " = ?"

          L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2

          L12_2 = {}

          L13_2 = L9_2.PlayerData

          L13_2 = L13_2.citizenid

          L12_2[1] = L13_2

          L10_2 = L10_2(L11_2, L12_2)

          L11_2 = L10_2[1]

          if L11_2 then

            L11_2 = L10_2[1]

            L10_2 = L11_2.image

          else

            L10_2 = nil

          end

          L11_2 = table

          L11_2 = L11_2.insert

          L12_2 = L4_2

          L13_2 = {}

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.citizenid

          L13_2.citizenid = L14_2

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.charinfo

          L14_2 = L14_2.firstname

          L13_2.firstname = L14_2

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.charinfo

          L14_2 = L14_2.lastname

          L13_2.lastname = L14_2

          L13_2.image = L10_2

          L11_2(L12_2, L13_2)

        end

      end

    end

    ::lbl_81::

  end

  L5_2 = A1_2

  L6_2 = L4_2

  L5_2(L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateUseableItem

L1_1 = Config

L1_1 = L1_1.Commands

L1_1 = L1_1.OpenPoliceCad

L1_1 = L1_1.item

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:client:OpenPoliceCad"

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L0_1(L1_1, L2_1)

