local L0_1, L1_1

L0_1 = IsNuiFocusKeepingInput

L0_1 = L0_1()

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = IsNuiFocusKeepingInput

  L2_2 = L2_2()

  L0_1 = L2_2

  L2_2 = SetNuiFocus

  L3_2 = true

  L4_2 = not A1_2

  L2_2(L3_2, L4_2)

  L2_2 = SetNuiFocusKeepInput

  L3_2 = A0_2

  L2_2(L3_2)

end

SetNuiFocusFixed = L1_1

function L1_1()

  local L0_2, L1_2, L2_2

  L0_2 = SetNuiFocus

  L1_2 = false

  L2_2 = false

  L0_2(L1_2, L2_2)

  L0_2 = SetNuiFocusKeepInput

  L1_2 = L0_1

  L0_2(L1_2)

end

ResetNuiFocus = L1_1









