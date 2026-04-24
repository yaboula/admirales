local L0_1, L1_1, L2_1

L0_1 = Citizen

L0_1 = L0_1.CreateThread

function L1_1()

  local L0_2, L1_2, L2_2

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L1_2 = LoadPlayer

    L2_2 = L0_2

    L1_2(L2_2)

  end

end

L0_1(L1_1)

L0_1 = false

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 4000

    L0_2(L1_2)

    L0_2 = FW_GetPlayerData

    L1_2 = false

    L0_2 = L0_2(L1_2)

    L1_2 = L0_2.items

    if L1_2 then

      L1_2 = false

      L2_2 = pairs

      L3_2 = L0_2.items

      L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

      for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

        L8_2 = L7_2.name

        if "radio" == L8_2 then

          L1_2 = true

        end

      end

      if L1_2 then

        L2_2 = L0_1

        if not L2_2 then

          L2_2 = true

          L0_1 = L2_2

          L2_2 = TriggerEvent

          L3_2 = "origen_police:client:TakeDropRadio"

          L4_2 = true

          L2_2(L3_2, L4_2)

        end

      end

      if not L1_2 then

        L2_2 = L0_1

        if L2_2 then

          L2_2 = false

          L0_1 = L2_2

          L2_2 = TriggerEvent

          L3_2 = "origen_police:client:TakeDropRadio"

          L4_2 = false

          L2_2(L3_2, L4_2)

        end

      end

    end

  end

end

L1_1(L2_1)

