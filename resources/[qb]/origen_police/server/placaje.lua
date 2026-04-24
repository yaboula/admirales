local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = RegisterServerAction

L1_1 = "origen_police:placaje_sv"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  if A0_2 then

    L1_2 = source

    if L1_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:placaje_cl"

  L3_2 = A0_2

  L4_2 = source

  L1_2(L2_2, L3_2, L4_2)

end

L3_1 = "placaje"

L4_1 = 200

L5_1 = 1

L6_1 = Config

L6_1 = L6_1.Actions

L6_1 = L6_1.AllowAllJobsTackle

L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)

