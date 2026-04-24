local L0_1, L1_1, L2_1, L3_1, L4_1

L0_1 = RegisterKeyMapping

L1_1 = "+radiotalk_police_org"

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.TalkRadio

L2_1 = L2_1.description

L3_1 = "keyboard"

L4_1 = Config

L4_1 = L4_1.Commands

L4_1 = L4_1.TalkRadio

L4_1 = L4_1.key

L0_1(L1_1, L2_1, L3_1, L4_1)

L0_1 = RegisterCommand

L1_1 = "+radiotalk_police_org"

function L2_1()

  local L0_2, L1_2

  L0_2 = StartTalkRadio

  L0_2()

end

L0_1(L1_1, L2_1)

L0_1 = RegisterCommand

L1_1 = "-radiotalk_police_org"

function L2_1()

  local L0_2, L1_2

  L0_2 = StopTalkRadio

  L0_2()

end

L0_1(L1_1, L2_1)

L0_1 = RegisterCommand

L1_1 = "+r_police_keybind"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L2_2 = A1_2[1]

  if L2_2 then

    L2_2 = Radio

    L2_2 = L2_2.Binds

    L3_2 = A1_2[1]

    L2_2 = L2_2[L3_2]

    if L2_2 then

      L2_2 = Config

      L2_2 = L2_2.BindFreqs

      L3_2 = Radio

      L3_2 = L3_2.Binds

      L4_2 = A1_2[1]

      L3_2 = L3_2[L4_2]

      L2_2 = L2_2[L3_2]

      if L2_2 then

        L2_2 = ""

        L3_2 = pairs

        L4_2 = Config

        L4_2 = L4_2.BindFreqs

        L5_2 = Radio

        L5_2 = L5_2.Binds

        L6_2 = A1_2[1]

        L5_2 = L5_2[L6_2]

        L4_2 = L4_2[L5_2]

        L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

        for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

          L2_2 = L7_2

        end

        L3_2 = StartTalkRadio

        L4_2 = Config

        L4_2 = L4_2.BindFreqs

        L5_2 = Radio

        L5_2 = L5_2.Binds

        L6_2 = A1_2[1]

        L5_2 = L5_2[L6_2]

        L4_2 = L4_2[L5_2]

        L4_2 = L4_2[L2_2]

        L3_2(L4_2)

      else

        L2_2 = DoAction

        L3_2 = Radio

        L3_2 = L3_2.Binds

        L4_2 = A1_2[1]

        L3_2 = L3_2[L4_2]

        L2_2(L3_2)

      end

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterCommand

L1_1 = "-r_police_keybind"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A1_2[1]

  if L2_2 then

    L2_2 = Radio

    L2_2 = L2_2.Binds

    L3_2 = A1_2[1]

    L2_2 = L2_2[L3_2]

    if L2_2 then

      L2_2 = Config

      L2_2 = L2_2.BindFreqs

      L3_2 = Radio

      L3_2 = L3_2.Binds

      L4_2 = A1_2[1]

      L3_2 = L3_2[L4_2]

      L2_2 = L2_2[L3_2]

      if L2_2 then

        L2_2 = StopTalkRadio

        L2_2()

      end

    end

  end

end

L0_1(L1_1, L2_1)

