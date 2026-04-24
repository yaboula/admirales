local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = Config

L0_1 = L0_1.Framework

if "esx" ~= L0_1 then

  return

end

L0_1 = {}

L1_1 = pairs

L2_1 = Config

L2_1 = L2_1.JobCategory

L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1)

for L5_1, L6_1 in L1_1, L2_1, L3_1, L4_1 do

  L7_1 = {}

  L0_1[L5_1] = L7_1

end

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server_esx:SetDuty"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = source

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:esx:SetDuty"

  L4_2 = L1_2

  L5_2 = A0_2

  L2_2(L3_2, L4_2, L5_2)

  L2_2 = CanOpenTablet

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  if A0_2 then

    L3_2 = 1

    L4_2 = L0_1

    L4_2 = L4_2[L2_2]

    L4_2 = #L4_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = L0_1

      L7_2 = L7_2[L2_2]

      L7_2 = L7_2[L6_2]

      if L7_2 == L1_2 then

        return

      end

    end

    L3_2 = table

    L3_2 = L3_2.insert

    L4_2 = L0_1

    L4_2 = L4_2[L2_2]

    L5_2 = L1_2

    L3_2(L4_2, L5_2)

  else

    L3_2 = 1

    L4_2 = L0_1

    L4_2 = L4_2[L2_2]

    L4_2 = #L4_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = L0_1

      L7_2 = L7_2[L2_2]

      L7_2 = L7_2[L6_2]

      if L7_2 == L1_2 then

        L7_2 = table

        L7_2 = L7_2.remove

        L8_2 = L0_1

        L8_2 = L8_2[L2_2]

        L9_2 = L6_2

        L7_2(L8_2, L9_2)

        return

      end

    end

  end

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2

  L1_2 = L0_1

  L1_2 = L1_2[A0_2]

  if not L1_2 then

    L1_2 = {}

  end

  return L1_2

end

GetPlayersInDuty = L1_1

L1_1 = exports

L2_1 = "GetPlayersInDuty"

L3_1 = GetPlayersInDuty

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L1_2 = A0_2

  L2_2 = CanOpenTablet

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  if not L2_2 then

    L3_2 = false

    return L3_2

  end

  L3_2 = L0_1

  L4_2 = L0_1

  L4_2 = L4_2[L2_2]

  if not L4_2 then

    L4_2 = {}

  end

  L3_2[L2_2] = L4_2

  L3_2 = L0_1

  L3_2 = L3_2[L2_2]

  L3_2 = #L3_2

  if 0 == L3_2 then

    L3_2 = false

    return L3_2

  end

  L3_2 = 1

  L4_2 = L0_1

  L4_2 = L4_2[L2_2]

  L4_2 = #L4_2

  L5_2 = 1

  for L6_2 = L3_2, L4_2, L5_2 do

    L7_2 = L0_1

    L7_2 = L7_2[L2_2]

    if L7_2 then

      L7_2 = L0_1

      L7_2 = L7_2[L2_2]

      L7_2 = L7_2[L6_2]

      if L7_2 == L1_2 then

        L7_2 = true

        return L7_2

      end

    end

  end

  L3_2 = false

  return L3_2

end

IsPlayerOnDuty = L1_1

L1_1 = exports

L2_1 = "IsPlayerOnDuty"

L3_1 = IsPlayerOnDuty

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L1_2 = pairs

  L2_2 = L0_1

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = pairs

    L8_2 = L6_2

    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

      if L12_2 == A0_2 then

        L13_2 = table

        L13_2 = L13_2.remove

        L14_2 = L6_2

        L15_2 = L11_2

        L13_2(L14_2, L15_2)

        return

      end

    end

  end

end

DropDutyPlayer = L1_1

L1_1 = exports

L2_1 = "DropDutyPlayer"

L3_1 = DropDutyPlayer

L1_1(L2_1, L3_1)

L1_1 = AddEventHandler

L2_1 = "playerDropped"

function L3_1(A0_2)

  local L1_2, L2_2

  L1_2 = source

  if not L1_2 then

    return

  end

  L1_2 = DropDutyPlayer

  L2_2 = source

  L1_2(L2_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:server_esx:ForceDropDuty"

function L3_1()

  local L0_2, L1_2

  L0_2 = DropDutyPlayer

  L1_2 = source

  L0_2(L1_2)

end

L1_1(L2_1, L3_1)

