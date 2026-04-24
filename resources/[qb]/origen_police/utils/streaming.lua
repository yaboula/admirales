local L0_1, L1_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RequestModel

  L3_2 = A0_2

  L2_2(L3_2)

  L2_2 = GetGameTimer

  L2_2 = L2_2()

  while true do

    L3_2 = HasModelLoaded

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    if L3_2 then

      break

    end

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L3_2 = L3_2 - L2_2

    if A1_2 < L3_2 then

      L3_2 = false

      return L3_2

    end

    L3_2 = Wait

    L4_2 = 0

    L3_2(L4_2)

  end

  L3_2 = true

  return L3_2

end

LoadModel = L0_1

