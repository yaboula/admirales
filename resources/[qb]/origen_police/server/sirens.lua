local L0_1, L1_1, L2_1, L3_1

L0_1 = Config

L0_1 = L0_1.SirensSystem

if not L0_1 then

  return

end

L0_1 = {}

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:PoliceHornState"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:PoliceHornState"

  L4_2 = -1

  L5_2 = A0_2

  L6_2 = A1_2

  L2_2(L3_2, L4_2, L5_2, L6_2)

  L2_2 = L0_1

  L3_2 = NetworkGetEntityFromNetworkId

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L2_2[A0_2] = L3_2

end

L1_1(L2_1, L3_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:PoliceSirenState"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = TriggerClientEvent

  L3_2 = "origen_police:client:PoliceSirenState"

  L4_2 = -1

  L5_2 = A0_2

  L6_2 = A1_2

  L2_2(L3_2, L4_2, L5_2, L6_2)

  L2_2 = L0_1

  L3_2 = NetworkGetEntityFromNetworkId

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L2_2[A0_2] = L3_2

end

L1_1(L2_1, L3_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 20000

    L0_2(L1_2)

    L0_2 = L0_1

    if nil ~= L0_2 then

      L0_2 = pairs

      L1_2 = L0_1

      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

      for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

        L6_2 = DoesEntityExist

        L7_2 = L5_2

        L6_2 = L6_2(L7_2)

        if not L6_2 then

          L6_2 = L0_1

          L6_2[L4_2] = nil

          L6_2 = TriggerClientEvent

          L7_2 = "origen_police:client:clearcache"

          L8_2 = -1

          L9_2 = L4_2

          L6_2(L7_2, L8_2, L9_2)

        end

      end

    end

  end

end

L1_1(L2_1)

