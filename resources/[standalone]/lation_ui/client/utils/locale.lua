local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = GetCurrentResourceName

L0_1 = L0_1()

L1_1 = {}

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = "locales/%s.json"

  L2_2 = L1_2

  L1_2 = L1_2.format

  L3_2 = A0_2

  L1_2 = L1_2(L2_2, L3_2)

  L2_2 = LoadResourceFile

  L3_2 = L0_1

  L4_2 = L1_2

  L2_2 = L2_2(L3_2, L4_2)

  if L2_2 then

    L3_2 = pcall

    L4_2 = json

    L4_2 = L4_2.decode

    L5_2 = L2_2

    L3_2, L4_2 = L3_2(L4_2, L5_2)

    if L3_2 and L4_2 then

      L5_2 = L4_2

      L6_2 = A0_2

      return L5_2, L6_2

    end

  elseif "en" ~= A0_2 then

    L3_2 = LoadResourceFile

    L4_2 = L0_1

    L5_2 = "locales/en.json"

    L3_2 = L3_2(L4_2, L5_2)

    L2_2 = L3_2

    if L2_2 then

      L3_2 = pcall

      L4_2 = json

      L4_2 = L4_2.decode

      L5_2 = L2_2

      L3_2, L4_2 = L3_2(L4_2, L5_2)

      if L3_2 and L4_2 then

        L5_2 = L4_2

        L6_2 = "en"

        return L5_2, L6_2

      end

    end

  end

  L3_2 = {}

  L4_2 = "none"

  return L3_2, L4_2

end

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = GetConvar

  L1_2 = "lation:locale"

  L2_2 = "en"

  L0_2 = L0_2(L1_2, L2_2)

  L1_2 = L2_1

  L2_2 = L0_2

  L1_2 = L1_2(L2_2)

  L1_1 = L1_2

end

function L4_1()

  local L0_2, L1_2, L2_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "setLocale"

  L2_2 = L1_1

  L1_2.data = L2_2

  L0_2(L1_2)

end

L5_1 = AddEventHandler

L6_1 = "onClientResourceStart"

function L7_1(A0_2)

  local L1_2, L2_2

  L1_2 = L0_1

  if A0_2 == L1_2 then

    L1_2 = Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = L3_1

    L1_2()

    L1_2 = Wait

    L2_2 = 500

    L1_2(L2_2)

    L1_2 = L4_1

    L1_2()

  end

end

L5_1(L6_1, L7_1)









