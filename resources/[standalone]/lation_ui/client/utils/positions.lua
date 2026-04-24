local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = GetCurrentResourceName

L0_1 = L0_1()

L1_1 = {}

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2

  L0_2 = GetConvar

  L1_2 = "lation:position:notify"

  L2_2 = ""

  L0_2 = L0_2(L1_2, L2_2)

  L1_2 = GetConvar

  L2_2 = "lation:position:menu"

  L3_2 = ""

  L1_2 = L1_2(L2_2, L3_2)

  L2_2 = GetConvar

  L3_2 = "lation:position:textui"

  L4_2 = ""

  L2_2 = L2_2(L3_2, L4_2)

  if L0_2 and "" ~= L0_2 then

    L1_1.notify = L0_2

  end

  if L1_2 and "" ~= L1_2 then

    L1_1.menu = L1_2

  end

  if L2_2 and "" ~= L2_2 then

    L1_1.textui = L2_2

  end

end

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "setPosition"

  L2_2 = L1_1

  L1_2.data = L2_2

  L0_2(L1_2)

end

L4_1 = AddEventHandler

L5_1 = "onClientResourceStart"

function L6_1(A0_2)

  local L1_2, L2_2

  L1_2 = L0_1

  if A0_2 == L1_2 then

    L1_2 = Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = L2_1

    L1_2()

    L1_2 = Wait

    L2_2 = 500

    L1_2(L2_2)

    L1_2 = L3_1

    L1_2()

  end

end

L4_1(L5_1, L6_1)









