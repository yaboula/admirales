local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1

L0_1 = false

L1_1 = {}

L2_1 = {}

L3_1 = {}

L4_1 = nil

L5_1 = false

L6_1 = nil

function L7_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = A0_2 or nil

  if A0_2 then

    L2_2 = L1_1

    L2_2 = L2_2[A0_2]

  end

  if A0_2 and not L2_2 then

    L3_2 = error

    L4_2 = "No radial menu with such id found."

    return L3_2(L4_2)

  end

  L4_1 = L2_2

  L3_2 = SendNUIMessage

  L4_2 = {}

  L4_2.action = "openRadial"

  L5_2 = {}

  if L2_2 then

    L6_2 = L2_2.items

    if L6_2 then

      goto lbl_26

    end

  end

  L6_2 = L2_1

  ::lbl_26::

  L5_2.items = L6_2

  if L2_2 then

    L6_2 = true

    if L6_2 then

      goto lbl_33

    end

  end

  L6_2 = nil

  ::lbl_33::

  L5_2.sub = L6_2

  L5_2.option = A1_2

  L4_2.data = L5_2

  L3_2(L4_2)

end

function L8_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L1_2 = L0_1

  if not L1_2 then

    return

  end

  L1_2 = L4_1

  if L1_2 and A0_2 then

    L1_2 = L4_1.id

    if A0_2 == L1_2 then

      L1_2 = L7_1

      L2_2 = A0_2

      return L1_2(L2_2)

    else

      L1_2 = 1

      L2_2 = L3_1

      L2_2 = #L2_2

      L3_2 = 1

      for L4_2 = L1_2, L2_2, L3_2 do

        L5_2 = L3_1

        L5_2 = L5_2[L4_2]

        L6_2 = L5_2.id

        if L6_2 == A0_2 then

          L7_2 = L5_2.id

          L6_2 = L1_1

          L6_2 = L6_2[L7_2]

          L7_2 = 1

          L8_2 = L6_2.items

          L8_2 = #L8_2

          L9_2 = 1

          for L10_2 = L7_2, L8_2, L9_2 do

            L11_2 = L6_2.items

            L11_2 = L11_2[L10_2]

            L11_2 = L11_2.menu

            L12_2 = L4_1.id

            if L11_2 == L12_2 then

              L11_2 = L7_1

              L12_2 = L4_1.id

              return L11_2(L12_2)

            end

          end

          L4_1 = L6_2

          L7_2 = L3_1

          L7_2 = #L7_2

          L8_2 = L4_2

          L9_2 = -1

          for L10_2 = L7_2, L8_2, L9_2 do

            L11_2 = L3_1

            L11_2[L10_2] = nil

          end

          L7_2 = L7_1

          L8_2 = L4_1.id

          return L7_2(L8_2)

        end

      end

    end

    return

  end

  L1_2 = table

  L1_2 = L1_2.wipe

  L2_2 = L3_1

  L1_2(L2_2)

  L1_2 = L7_1

  L1_2()

end

L9_1 = RegisterKeyMapping

L10_1 = "lation_ui:radialMenu"

L11_1 = "Open Radial Menu"

L12_1 = "keyboard"

L13_1 = Config

L13_1 = L13_1.radial

if L13_1 then

  L13_1 = Config

  L13_1 = L13_1.radial

  L13_1 = L13_1.default_key

  if L13_1 then

    goto lbl_28

  end

end

L13_1 = "z"

::lbl_28::

L9_1(L10_1, L11_1, L12_1, L13_1)

L9_1 = RegisterCommand

L10_1 = "lation_ui:radialMenu"

function L11_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = L5_1

  if L0_2 then

    return

  end

  L0_2 = L2_1

  L0_2 = #L0_2

  if 0 ~= L0_2 then

    L0_2 = IsNuiFocused

    L0_2 = L0_2()

    if not L0_2 then

      L0_2 = IsPauseMenuActive

      L0_2 = L0_2()

      if not L0_2 then

        goto lbl_18

      end

    end

  end

  do return end

  ::lbl_18::

  L0_2 = L0_1

  if L0_2 then

    L0_2 = L6_1

    return L0_2()

  end

  L0_2 = true

  L0_1 = L0_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "openRadial"

  L2_2 = {}

  L3_2 = L2_1

  L2_2.items = L3_2

  L1_2.data = L2_2

  L0_2(L1_2)

  L0_2 = SetNuiFocusFixed

  L1_2 = true

  L2_2 = false

  L0_2(L1_2, L2_2)

  L0_2 = SetCursorLocation

  L1_2 = 0.5

  L2_2 = 0.5

  L0_2(L1_2, L2_2)

  L0_2 = CreateThread

  function L1_2()

    local L0_3, L1_3, L2_3, L3_3

    while true do

      L0_3 = L0_1

      if not L0_3 then

        break

      end

      L0_3 = DisablePlayerFiring

      L1_3 = PlayerId

      L1_3 = L1_3()

      L2_3 = true

      L0_3(L1_3, L2_3)

      L0_3 = DisableControlAction

      L1_3 = 0

      L2_3 = 1

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = DisableControlAction

      L1_3 = 0

      L2_3 = 2

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = DisableControlAction

      L1_3 = 0

      L2_3 = 142

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = DisableControlAction

      L1_3 = 2

      L2_3 = 199

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = DisableControlAction

      L1_3 = 2

      L2_3 = 200

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = Wait

      L1_3 = 0

      L0_3(L1_3)

    end

  end

  L0_2(L1_2)

end

L12_1 = false

L9_1(L10_1, L11_1, L12_1)

function L9_1(A0_2)

  local L1_2, L2_2

  L2_2 = A0_2.id

  L1_2 = L1_1

  L1_2[L2_2] = A0_2

  L1_2 = GetInvokingResource

  L1_2 = L1_2()

  A0_2.resource = L1_2

  L1_2 = L4_1

  if L1_2 then

    L1_2 = L8_1

    L2_2 = A0_2.id

    L1_2(L2_2)

  end

end

function L10_1()

  local L0_2, L1_2

  L0_2 = L4_1

  if L0_2 then

    L0_2 = L4_1.id

  end

  return L0_2

end

function L11_1()

  local L0_2, L1_2

  L0_2 = L0_1

  if not L0_2 then

    return

  end

  L0_2 = false

  L0_1 = L0_2

  L0_2 = nil

  L4_1 = L0_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "openRadial"

  L1_2.data = false

  L0_2(L1_2)

  L0_2 = ResetNuiFocus

  L0_2()

  L0_2 = table

  L0_2 = L0_2.wipe

  L1_2 = L3_1

  L0_2(L1_2)

end

L6_1 = L11_1

function L11_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L1_2 = L2_1

  L1_2 = #L1_2

  L2_2 = GetInvokingResource

  L2_2 = L2_2()

  L3_2 = table

  L3_2 = L3_2.type

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if "array" ~= L3_2 or not A0_2 then

    L3_2 = {}

    L4_2 = A0_2

    L3_2[1] = L4_2

    A0_2 = L3_2

  end

  L3_2 = 1

  L4_2 = #A0_2

  L5_2 = 1

  for L6_2 = L3_2, L4_2, L5_2 do

    L7_2 = A0_2[L6_2]

    L7_2.resource = L2_2

    if 0 == L1_2 then

      L1_2 = L1_2 + 1

      L8_2 = L2_1

      L8_2[L1_2] = L7_2

    else

      L8_2 = 1

      L9_2 = L1_2

      L10_2 = 1

      for L11_2 = L8_2, L9_2, L10_2 do

        L12_2 = L2_1

        L12_2 = L12_2[L11_2]

        L12_2 = L12_2.id

        L13_2 = L7_2.id

        if L12_2 == L13_2 then

          L12_2 = L2_1

          L12_2[L11_2] = L7_2

          break

        end

        if L11_2 == L1_2 then

          L1_2 = L1_2 + 1

          L12_2 = L2_1

          L12_2[L1_2] = L7_2

        end

      end

    end

  end

  L3_2 = L0_1

  if L3_2 then

    L3_2 = L4_1

    if not L3_2 then

      L3_2 = L8_1

      L3_2()

    end

  end

end

function L12_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = nil

  L2_2 = 1

  L3_2 = L2_1

  L3_2 = #L3_2

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = L2_1

    L1_2 = L6_2[L5_2]

    L6_2 = L1_2.id

    if L6_2 == A0_2 then

      L6_2 = table

      L6_2 = L6_2.remove

      L7_2 = L2_1

      L8_2 = L5_2

      L6_2(L7_2, L8_2)

      break

    end

  end

  L2_2 = L0_1

  if not L2_2 then

    return

  end

  L2_2 = L8_1

  L3_2 = A0_2

  L2_2(L3_2)

end

function L13_1()

  local L0_2, L1_2

  L0_2 = table

  L0_2 = L0_2.wipe

  L1_2 = L2_1

  L0_2(L1_2)

  L0_2 = L0_1

  if L0_2 then

    L0_2 = L8_1

    L0_2()

  end

end

function L14_1(A0_2)

  local L1_2

  L5_1 = A0_2

  L1_2 = L0_1

  if L1_2 and A0_2 then

    L1_2 = L6_1

    return L1_2()

  end

end

L15_1 = RegisterNUICallback

L16_1 = "radialClick"

function L17_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = A0_2 + 1

  L3_2 = nil

  L4_2 = nil

  L5_2 = L4_1

  if L5_2 then

    L5_2 = L4_1.items

    L3_2 = L5_2[L2_2]

    L4_2 = L4_1.id

  else

    L5_2 = L2_1

    L3_2 = L5_2[L2_2]

  end

  L5_2 = L4_1

  if L5_2 then

    L5_2 = L4_1.resource

    if L5_2 then

      goto lbl_23

    end

  end

  L5_2 = L3_2.resource

  ::lbl_23::

  L6_2 = L3_2.menu

  if L6_2 then

    L6_2 = L3_1

    L6_2 = #L6_2

    L7_2 = L6_2 + 1

    L6_2 = L3_1

    L8_2 = {}

    L9_2 = L4_1

    if L9_2 then

      L9_2 = L4_1.id

    end

    L8_2.id = L9_2

    L9_2 = L3_2.menu

    L8_2.option = L9_2

    L6_2[L7_2] = L8_2

    L6_2 = L7_1

    L7_2 = L3_2.menu

    L6_2(L7_2)

  else

    L6_2 = L3_2.keepOpen

    if not L6_2 then

      L6_2 = L6_1

      L6_2()

    end

  end

  L6_2 = L3_2.onSelect

  if L6_2 then

    L7_2 = type

    L8_2 = L6_2

    L7_2 = L7_2(L8_2)

    if "string" == L7_2 then

      L7_2 = exports

      L7_2 = L7_2[L5_2]

      L7_2 = L7_2[L6_2]

      L8_2 = L4_2

      L9_2 = L2_2

      return L7_2(L8_2, L9_2)

    end

    L7_2 = L6_2

    L8_2 = L4_2

    L9_2 = L2_2

    L7_2(L8_2, L9_2)

  end

end

L15_1(L16_1, L17_1)

L15_1 = RegisterNUICallback

L16_1 = "radialBack"

function L17_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = L3_1

  L2_2 = #L2_2

  L3_2 = L3_1

  L3_2 = L2_2 > 0 and L3_2

  if not L3_2 then

    return

  end

  L4_2 = L3_1

  L4_2[L2_2] = nil

  L4_2 = L3_2.id

  if L4_2 then

    L4_2 = L7_1

    L5_2 = L3_2.id

    L6_2 = L3_2.option

    return L4_2(L5_2, L6_2)

  end

  L4_2 = nil

  L4_1 = L4_2

  L4_2 = SendNUIMessage

  L5_2 = {}

  L5_2.action = "openRadial"

  L6_2 = {}

  L7_2 = L2_1

  L6_2.items = L7_2

  L7_2 = L3_2.option

  L6_2.option = L7_2

  L5_2.data = L6_2

  L4_2(L5_2)

end

L15_1(L16_1, L17_1)

L15_1 = RegisterNUICallback

L16_1 = "radialClose"

function L17_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = L0_1

  if not L2_2 then

    return

  end

  L2_2 = false

  L0_1 = L2_2

  L2_2 = nil

  L4_1 = L2_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "openRadial"

  L3_2.data = false

  L2_2(L3_2)

  L2_2 = ResetNuiFocus

  L2_2()

  L2_2 = table

  L2_2 = L2_2.wipe

  L3_2 = L3_1

  L2_2(L3_2)

end

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "registerRadial"

L17_1 = L9_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "addRadialItem"

L17_1 = L11_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "removeRadialItem"

L17_1 = L12_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "clearRadialItems"

L17_1 = L13_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "hideRadial"

L17_1 = L6_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "disableRadial"

L17_1 = L14_1

L15_1(L16_1, L17_1)

L15_1 = exports

L16_1 = "getCurrentRadialId"

L17_1 = L10_1

L15_1(L16_1, L17_1)









