local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = nil

function L1_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2

  L4_2 = L0_1

  if L4_2 then

    L4_2 = false

    return L4_2

  end

  L4_2 = promise

  L5_2 = L4_2

  L4_2 = L4_2.new

  L4_2 = L4_2(L5_2)

  L0_1 = L4_2

  L4_2 = SetNuiFocus

  L5_2 = true

  L6_2 = true

  L4_2(L5_2, L6_2)

  L4_2 = SendNUIMessage

  L5_2 = {}

  L5_2.action = "startSkillCheck"

  L6_2 = {}

  L6_2.difficulty = A1_2

  L6_2.inputs = A2_2

  L6_2.title = A0_2

  L6_2.size = A3_2

  L5_2.data = L6_2

  L4_2(L5_2)

  L4_2 = Citizen

  L4_2 = L4_2.Await

  L5_2 = L0_1

  L4_2 = L4_2(L5_2)

  L5_2 = L4_2 or L5_2

  if not L4_2 then

    L5_2 = false

  end

  return L5_2

end

function L2_1()

  local L0_2, L1_2

  L0_2 = L0_1

  if not L0_2 then

    L0_2 = error

    L1_2 = "No skillCheck is active"

    L0_2(L1_2)

  end

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "skillCheckCancel"

  L0_2(L1_2)

end

function L3_1()

  local L0_2, L1_2

  L0_2 = L0_1

  L0_2 = nil ~= L0_2

  return L0_2

end

L4_1 = RegisterNUICallback

L5_1 = "skillCheckOver"

function L6_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = L0_1

  if L2_2 then

    L2_2 = SetNuiFocus

    L3_2 = false

    L4_2 = false

    L2_2(L3_2, L4_2)

    L2_2 = L0_1

    L3_2 = L2_2

    L2_2 = L2_2.resolve

    L4_2 = A0_2

    L2_2(L3_2, L4_2)

    L2_2 = nil

    L0_1 = L2_2

  end

end

L4_1(L5_1, L6_1)

L4_1 = exports

L5_1 = "skillCheck"

L6_1 = L1_1

L4_1(L5_1, L6_1)

L4_1 = exports

L5_1 = "cancelSkillCheck"

L6_1 = L2_1

L4_1(L5_1, L6_1)

L4_1 = exports

L5_1 = "skillCheckActive"

L6_1 = L3_1

L4_1(L5_1, L6_1)









