local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = {}

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  if A0_2 then

    L1_2 = type

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if "table" == L1_2 then

      goto lbl_10

    end

  end

  L1_2 = nil

  do return L1_2 end

  ::lbl_10::

  L1_2 = A0_2.options

  if not L1_2 then

    L1_2 = A0_2

  end

  L2_2 = type

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  if "table" == L2_2 then

    L2_2 = #L1_2

    if 0 ~= L2_2 then

      goto lbl_24

    end

  end

  L2_2 = nil

  do return L2_2 end

  ::lbl_24::

  L2_2 = "input_"

  L3_2 = math

  L3_2 = L3_2.random

  L4_2 = 100000

  L5_2 = 999999

  L3_2 = L3_2(L4_2, L5_2)

  L2_2 = L2_2 .. L3_2

  L3_2 = {}

  L4_2 = A0_2.title

  L3_2.title = L4_2

  L4_2 = A0_2.subtitle

  L3_2.subtitle = L4_2

  L4_2 = A0_2.submitText

  L3_2.submitText = L4_2

  L4_2 = A0_2.cancelText

  L3_2.cancelText = L4_2

  L4_2 = A0_2.type

  if not L4_2 then

    L4_2 = "default"

  end

  L3_2.type = L4_2

  L4_2 = A0_2.cancel

  L3_2.cancel = L4_2

  L3_2.options = L1_2

  L3_2.callbackId = L2_2

  L4_2 = SetNuiFocus

  L5_2 = true

  L6_2 = true

  L4_2(L5_2, L6_2)

  L4_2 = SendNUIMessage

  L5_2 = {}

  L5_2.action = "showInputDialog"

  L5_2.data = L3_2

  L4_2(L5_2)

  L4_2 = promise

  L4_2 = L4_2.new

  L4_2 = L4_2()

  L5_2 = L0_1

  L5_2[L2_2] = L4_2

  L5_2 = Citizen

  L5_2 = L5_2.Await

  L6_2 = L4_2

  L5_2 = L5_2(L6_2)

  L6_2 = SetNuiFocus

  L7_2 = false

  L8_2 = false

  L6_2(L7_2, L8_2)

  return L5_2

end

L2_1 = RegisterNUICallback

L3_1 = "inputDialogSubmitted"

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

      L5_2 = A0_2.values

      if not L5_2 then

        L5_2 = {}

      end

      L3_2(L4_2, L5_2)

      L4_2 = A0_2.callbackId

      L3_2 = L0_1

      L3_2[L4_2] = nil

    end

  end

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNUICallback

L3_1 = "inputDialogClosed"

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

      L5_2 = nil

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

  L1_2.action = "hideInputDialog"

  L0_2(L1_2)

  L0_2 = pairs

  L1_2 = L0_1

  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

    L7_2 = L5_2

    L6_2 = L5_2.resolve

    L8_2 = nil

    L6_2(L7_2, L8_2)

    L6_2 = L0_1

    L6_2[L4_2] = nil

  end

end

L3_1 = exports

L4_1 = "input"

L5_1 = L1_1

L3_1(L4_1, L5_1)

L3_1 = exports

L4_1 = "closeInput"

L5_1 = L2_1

L3_1(L4_1, L5_1)









