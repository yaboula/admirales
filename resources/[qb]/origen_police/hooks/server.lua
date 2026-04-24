local L0_1, L1_1

L0_1 = {}

function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)

  local L6_2, L7_2, L8_2

  L6_2 = L0_1

  L7_2 = L0_1

  L7_2 = L7_2[A2_2]

  if not L7_2 then

    L7_2 = {}

  end

  L6_2[A2_2] = L7_2

  L6_2 = RegisterNetEvent

  L7_2 = A0_2

  function L8_2(...)

    local L0_3, L1_3, L2_3, L3_3, L4_3

    L0_3 = source

    if L0_3 then

      L1_3 = A2_2

      L0_3 = L0_1

      L0_3 = L0_3[L1_3]

      L1_3 = source

      L0_3 = L0_3[L1_3]

      if L0_3 then

        L0_3 = GetGameTimer

        L0_3 = L0_3()

        L2_3 = A2_2

        L1_3 = L0_1

        L1_3 = L1_3[L2_3]

        L2_3 = source

        L1_3 = L1_3[L2_3]

        L0_3 = L0_3 - L1_3

        L1_3 = A3_2

        if L0_3 < L1_3 then

          L0_3 = BanPlayer

          L1_3 = source

          L2_3 = "Hook action detect too fast executions in event: "

          L3_3 = A0_2

          L2_3 = L2_3 .. L3_3

          L0_3(L1_3, L2_3)

          return

        end

      end

      L1_3 = A2_2

      L0_3 = L0_1

      L0_3 = L0_3[L1_3]

      L1_3 = source

      L2_3 = GetGameTimer

      L2_3 = L2_3()

      L0_3[L1_3] = L2_3

      L0_3 = A4_2

      if L0_3 then

        L0_3 = select

        L1_3 = A4_2

        L2_3, L3_3, L4_3 = ...

        L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)

        if L0_3 then

          goto lbl_48

        end

      end

      L0_3 = nil

      ::lbl_48::

      if -1 == L0_3 then

        L1_3 = BanPlayer

        L2_3 = source

        L3_3 = "Hook action with invalid source value in event: "

        L4_3 = A0_2

        L3_3 = L3_3 .. L4_3

        L1_3(L2_3, L3_3)

        return

      end

      L1_3 = A5_2

      if not L1_3 then

        L1_3 = CanOpenTablet

        L2_3 = source

        L1_3 = L1_3(L2_3)

        L1_3 = L1_3[1]

        if not L1_3 then

          L1_3 = BanPlayer

          L2_3 = source

          L3_3 = "Hook action without valid job"

          L1_3(L2_3, L3_3)

          return

        end

      end

    end

    L0_3 = A1_2

    L1_3, L2_3, L3_3, L4_3 = ...

    L0_3(L1_3, L2_3, L3_3, L4_3)

  end

  L6_2(L7_2, L8_2)

end

RegisterServerAction = L1_1

