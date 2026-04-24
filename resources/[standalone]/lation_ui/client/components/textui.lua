local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = {}

L0_1.visible = false

L0_1.data = nil

L0_1.hash = nil

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  if A0_2 then

    L1_2 = type

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if "table" == L1_2 then

      goto lbl_10

    end

  end

  L1_2 = false

  do return L1_2 end

  ::lbl_10::

  L1_2 = A0_2.title

  if not L1_2 then

    L1_2 = A0_2.description

    if not L1_2 then

      L1_2 = A0_2.options

      if not L1_2 then

        L1_2 = false

        return L1_2

      end

    end

  end

  L1_2 = json

  L1_2 = L1_2.encode

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = L0_1.visible

  if L2_2 then

    L2_2 = L0_1.hash

    if L2_2 == L1_2 then

      L2_2 = true

      return L2_2

    end

  end

  L0_1.visible = true

  L0_1.data = A0_2

  L0_1.hash = L1_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "showTextUI"

  L4_2 = {}

  L5_2 = A0_2.title

  L4_2.title = L5_2

  L5_2 = A0_2.description

  L4_2.description = L5_2

  L5_2 = A0_2.position

  if not L5_2 then

    L5_2 = "right-center"

  end

  L4_2.position = L5_2

  L5_2 = A0_2.icon

  L4_2.icon = L5_2

  L5_2 = A0_2.iconColor

  L4_2.iconColor = L5_2

  L5_2 = A0_2.iconAnimation

  L4_2.iconAnimation = L5_2

  L5_2 = A0_2.keybind

  L4_2.keybind = L5_2

  L5_2 = A0_2.options

  L4_2.options = L5_2

  L5_2 = A0_2.bgColor

  L4_2.bgColor = L5_2

  L5_2 = A0_2.txtColor

  L4_2.txtColor = L5_2

  L3_2.data = L4_2

  L2_2(L3_2)

  L2_2 = true

  return L2_2

end

function L2_1()

  local L0_2, L1_2

  L0_2 = L0_1.visible

  if not L0_2 then

    L0_2 = false

    return L0_2

  end

  L0_1.visible = false

  L0_1.data = nil

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "hideTextUI"

  L0_2(L1_2)

  L0_2 = true

  return L0_2

end

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = L0_1.visible

  if L0_2 then

    L0_2 = L0_1.data

    if L0_2 then

      goto lbl_10

    end

  end

  L0_2 = false

  L1_2 = nil

  do return L0_2, L1_2 end

  ::lbl_10::

  L0_2 = L0_1.data

  L0_2 = L0_2.description

  L1_2 = L0_1.visible

  L2_2 = L0_2

  return L1_2, L2_2

end

L4_1 = exports

L5_1 = "showText"

L6_1 = L1_1

L4_1(L5_1, L6_1)

L4_1 = exports

L5_1 = "hideText"

L6_1 = L2_1

L4_1(L5_1, L6_1)

L4_1 = exports

L5_1 = "isOpen"

L6_1 = L3_1

L4_1(L5_1, L6_1)









