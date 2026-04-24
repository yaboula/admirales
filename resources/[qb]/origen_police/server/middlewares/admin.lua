local L0_1, L1_1, L2_1

L0_1 = {}

L1_1 = {}

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  if not L3_2 then

    L3_2 = L1_1

    L3_2 = L3_2[A0_2]

    if L3_2 then

      L3_2 = A1_2

      L4_2 = false

      return L3_2(L4_2)

    end

  end

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  if not L3_2 then

    L3_2 = L1_1

    L3_2 = L3_2[A0_2]

    if not L3_2 then

      L3_2 = Framework

      L3_2 = L3_2.Functions

      L3_2 = L3_2.HasPermission

      L4_2 = A0_2

      L5_2 = "admin"

      L3_2 = L3_2(L4_2, L5_2)

      if L3_2 then

        L3_2 = L0_1

        L3_2[A0_2] = true

        L3_2 = A2_2

        return L3_2()

      end

      L3_2 = L1_1

      L3_2[A0_2] = true

      L3_2 = A1_2

      L4_2 = false

      return L3_2(L4_2)

    end

  end

  L3_2 = A2_2

  L3_2()

end

AdminMDW = L2_1

