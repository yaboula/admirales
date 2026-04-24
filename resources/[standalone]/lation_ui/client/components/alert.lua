local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = {}

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  if A0_2 then

    L1_2 = type

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if "table" == L1_2 then

      goto lbl_10

    end

  end

  L1_2 = "cancel"

  do return L1_2 end

  ::lbl_10::

  L1_2 = A0_2.header

  if not L1_2 then

    L1_2 = A0_2.content

    if not L1_2 then

      L1_2 = "cancel"

      return L1_2

    end

  end

  L1_2 = "alert_"

  L2_2 = math

  L2_2 = L2_2.random

  L3_2 = 100000

  L4_2 = 999999

  L2_2 = L2_2(L3_2, L4_2)

  L1_2 = L1_2 .. L2_2

  A0_2.callbackId = L1_2

  L2_2 = SetNuiFocus

  L3_2 = false

  L4_2 = false

  L2_2(L3_2, L4_2)

  L2_2 = SetNuiFocus

  L3_2 = true

  L4_2 = true

  L2_2(L3_2, L4_2)

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "showAlert"

  L3_2.data = A0_2

  L2_2(L3_2)

  L2_2 = promise

  L2_2 = L2_2.new

  L2_2 = L2_2()

  L3_2 = L0_1

  L3_2[L1_2] = L2_2

  L3_2 = Citizen

  L3_2 = L3_2.Await

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  L4_2 = SetNuiFocus

  L5_2 = false

  L6_2 = false

  L4_2(L5_2, L6_2)

  L4_2 = L3_2 or L4_2

  if not L3_2 then

    L4_2 = "cancel"

  end

  return L4_2

end

L2_1 = RegisterNUICallback

L3_1 = "alertCallback"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = A1_2

  L3_2 = "ok"

  L2_2(L3_2)

  L2_2 = A0_2.callbackId

  if L2_2 then

    L3_2 = A0_2.callbackId

    L2_2 = L0_1

    L2_2 = L2_2[L3_2]

    if L2_2 then

      L3_2 = A0_2.callbackId

      L2_2 = L0_1

      L2_2 = L2_2[L3_2]

      L4_2 = L2_2

      L3_2 = L2_2.resolve

      L5_2 = A0_2.result

      if not L5_2 then

        L5_2 = "cancel"

      end

      L3_2(L4_2, L5_2)

      L4_2 = A0_2.callbackId

      L3_2 = L0_1

      L3_2[L4_2] = nil

    end

  end

end

L2_1(L3_1, L4_1)

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = SetNuiFocus

  L1_2 = false

  L2_2 = false

  L0_2(L1_2, L2_2)

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "hideAlert"

  L0_2(L1_2)

  L0_2 = pairs

  L1_2 = L0_1

  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

    L7_2 = L5_2

    L6_2 = L5_2.resolve

    L8_2 = "cancel"

    L6_2(L7_2, L8_2)

    L6_2 = L0_1

    L6_2[L4_2] = nil

  end

end

L3_1 = exports

L4_1 = "alert"

L5_1 = L1_1

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "closeAlert"

L5_1 = L2_1

L3_1(L4_1, L5_1)









