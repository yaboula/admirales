local L0_1, L1_1, L2_1

L0_1 = FW_CreateUseableItem

L1_1 = "k9"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = FW_GetPlayer

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if L1_2 then

    L1_2 = L1_2.PlayerData

  end

  if not L1_2 then

    return

  end

  L2_2 = CanOpenTablet

  L3_2 = L1_2.job

  L3_2 = L3_2.name

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[1]

  if L2_2 then

    L2_2 = TriggerClientEvent

    L3_2 = "origen_police:client:CallK9"

    L4_2 = A0_2

    L2_2(L3_2, L4_2)

  end

end

L0_1(L1_1, L2_1)

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L3_2 = Debuger

  L4_2 = "Badge use: "

  L5_2 = A0_2

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = A1_2

  L6_2 = L6_2(L7_2)

  L7_2 = A2_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if L3_2 then

    L3_2 = L3_2.PlayerData

  end

  if not L3_2 then

    return

  end

  L4_2 = CanOpenTablet

  L5_2 = L3_2.job

  L5_2 = L5_2.name

  L4_2 = L4_2(L5_2)

  L4_2 = L4_2[1]

  L5_2 = Config

  L5_2 = L5_2.OnlyPoliceCanUseBadge

  if L5_2 and not L4_2 then

    return

  end

  L5_2 = Config

  L5_2 = L5_2.Framework

  if "esx" == L5_2 then

    L5_2 = L3_2.items

    L6_2 = pairs

    L7_2 = L5_2

    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

      L12_2 = L11_2.name

      if L12_2 == A1_2 then

        L12_2 = {}

        A1_2 = L12_2

        L12_2 = L11_2.name

        A1_2.name = L12_2

        L12_2 = GetItemMetadata

        L13_2 = L11_2

        L12_2 = L12_2(L13_2)

        A1_2.info = L12_2

        L12_2 = GetItemMetadata

        L13_2 = L11_2

        L12_2 = L12_2(L13_2)

        A1_2.metadata = L12_2

      end

    end

  end

  L5_2 = A1_2.info

  if nil == L5_2 then

    L5_2 = {}

    A1_2.info = L5_2

  end

  L5_2 = A1_2.metadata

  if nil == L5_2 then

    L5_2 = {}

    A1_2.metadata = L5_2

  end

  L5_2 = A1_2.info

  L5_2.type = A2_2

  L5_2 = A1_2.metadata

  L5_2.type = A2_2

  L5_2 = TriggerClientEvent

  L6_2 = "origen_police:client:showbadge"

  L7_2 = A0_2

  L8_2 = GetItemMetadata

  L9_2 = A1_2

  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2)

  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

end

BadgeUse = L0_1

L0_1 = FW_CreateUseableItem

L1_1 = "lspd_badge"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = A0_2

  L3_2 = BadgeUse

  L4_2 = L2_2

  L5_2 = A1_2

  L6_2 = "LSPD"

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateUseableItem

L1_1 = "bcsd_badge"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = A0_2

  L3_2 = BadgeUse

  L4_2 = L2_2

  L5_2 = A1_2

  L6_2 = "BCSD"

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateUseableItem

L1_1 = "fib_badge"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = A0_2

  L3_2 = BadgeUse

  L4_2 = L2_2

  L5_2 = A1_2

  L6_2 = "FIB"

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:showbadge"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:viewbadge"

  L4_2 = A0_2

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

end

L0_1(L1_1, L2_1)

