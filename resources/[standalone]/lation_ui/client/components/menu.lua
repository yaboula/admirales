local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

L0_1 = {}

L1_1 = nil

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L1_2 = type

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if "table" == L1_2 then

    L1_2 = pairs

    L2_2 = A0_2

    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

      L7_2 = type

      L8_2 = L5_2

      L7_2 = L7_2(L8_2)

      if "number" ~= L7_2 then

        break

      end

      L7_2 = type

      L8_2 = L6_2

      L7_2 = L7_2(L8_2)

      if "table" ~= L7_2 then

        break

      end

      L7_2 = L6_2.id

      if L7_2 then

        L7_2 = ipairs

        L8_2 = A0_2

        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

          L13_2 = L2_1

          L14_2 = L12_2

          L13_2(L14_2)

        end

        return

      else

        break

      end

    end

    L1_2 = A0_2.id

    if L1_2 then

      L1_2 = A0_2.options

      if not L1_2 then

        L1_2 = {}

        A0_2.options = L1_2

      else

        L1_2 = A0_2.options

        L1_2 = #L1_2

        if 0 == L1_2 then

          L1_2 = {}

          L2_2 = pairs

          L3_2 = A0_2.options

          L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

          for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

            L8_2 = type

            L9_2 = L6_2

            L8_2 = L8_2(L9_2)

            if "string" == L8_2 then

              L8_2 = type

              L9_2 = L7_2

              L8_2 = L8_2(L9_2)

              if "table" == L8_2 then

                L8_2 = {}

                L8_2.title = L6_2

                L9_2 = pairs

                L10_2 = L7_2

                L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

                for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

                  L8_2[L13_2] = L14_2

                end

                L9_2 = table

                L9_2 = L9_2.insert

                L10_2 = L1_2

                L11_2 = L8_2

                L9_2(L10_2, L11_2)

              end

            end

          end

          L2_2 = #L1_2

          if L2_2 > 0 then

            A0_2.options = L1_2

          end

        end

      end

      L1_2 = ipairs

      L2_2 = A0_2.options

      L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

      for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

        L7_2 = A0_2.id

        L8_2 = "_option_"

        L9_2 = L5_2

        L7_2 = L7_2 .. L8_2 .. L9_2

        L6_2.id = L7_2

      end

      L2_2 = A0_2.id

      L1_2 = L0_1

      L1_2[L2_2] = A0_2

    else

      L1_2 = error

      L2_2 = "Menu must have an id"

      L1_2(L2_2)

    end

  else

    L1_2 = error

    L2_2 = "Menu must be a table"

    L1_2(L2_2)

  end

end

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L1_2 = L0_1

  L1_2 = L1_2[A0_2]

  if not L1_2 then

    L1_2 = error

    L2_2 = "No menu with id \""

    L3_2 = tostring

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    L4_2 = "\" found"

    L2_2 = L2_2 .. L3_2 .. L4_2

    L1_2(L2_2)

    return

  end

  L1_2 = L0_1

  L1_2 = L1_2[A0_2]

  L1_1 = A0_2

  L2_2 = {}

  L2_2.id = A0_2

  L3_2 = L1_2.title

  L2_2.title = L3_2

  L3_2 = L1_2.subtitle

  L2_2.subtitle = L3_2

  L3_2 = L1_2.menu

  L2_2.menu = L3_2

  L3_2 = L1_2.position

  L2_2.position = L3_2

  L3_2 = L1_2.canClose

  L2_2.canClose = L3_2

  L3_2 = {}

  L2_2.options = L3_2

  L3_2 = ipairs

  L4_2 = L1_2.options

  if not L4_2 then

    L4_2 = {}

  end

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = {}

    L10_2 = pairs

    L11_2 = L8_2

    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)

    for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do

      L16_2 = type

      L17_2 = L15_2

      L16_2 = L16_2(L17_2)

      if "function" ~= L16_2 then

        L9_2[L14_2] = L15_2

      end

    end

    L10_2 = L8_2.menu

    if L10_2 then

      L9_2.arrow = true

    end

    L10_2 = table

    L10_2 = L10_2.insert

    L11_2 = L2_2.options

    L12_2 = L9_2

    L10_2(L11_2, L12_2)

  end

  L3_2 = SetNuiFocusFixed

  L4_2 = false

  L5_2 = false

  L3_2(L4_2, L5_2)

  L3_2 = SendNUIMessage

  L4_2 = {}

  L4_2.action = "registerMenu"

  L4_2.data = L2_2

  L3_2(L4_2)

  L3_2 = SendNUIMessage

  L4_2 = {}

  L4_2.action = "showMenu"

  L5_2 = {}

  L5_2.menuId = A0_2

  L4_2.data = L5_2

  L3_2(L4_2)

end

function L4_1(A0_2)

  local L1_2, L2_2

  L1_2 = L1_1

  if L1_2 then

    L2_2 = L1_1

    L1_2 = L0_1

    L1_2 = L1_2[L2_2]

    if L1_2 then

      L2_2 = L1_1

      L1_2 = L0_1

      L1_2 = L1_2[L2_2]

      if A0_2 then

        L2_2 = L1_2.onExit

        if L2_2 then

          L2_2 = L1_2.onExit

          L2_2()

        end

      end

    end

  end

  L1_2 = ResetNuiFocus

  L1_2()

  L1_2 = nil

  L1_1 = L1_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "hideMenu"

  L1_2(L2_2)

end

function L5_1()

  local L0_2, L1_2

  L0_2 = L1_1

  return L0_2

end

L6_1 = RegisterNUICallback

L7_1 = "menuClosed"

function L8_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = "ok"

  L2_2(L3_2)

  L2_2 = L4_1

  L3_2 = true

  L2_2(L3_2)

end

L6_1(L7_1, L8_1)

L6_1 = RegisterNUICallback

L7_1 = "clickContext"

function L8_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L2_2 = A1_2

  L3_2 = "ok"

  L2_2(L3_2)

  L2_2 = L1_1

  if L2_2 then

    L3_2 = L1_1

    L2_2 = L0_1

    L2_2 = L2_2[L3_2]

    if L2_2 then

      goto lbl_15

    end

  end

  L2_2 = ResetNuiFocus

  L2_2()

  do return end

  ::lbl_15::

  L3_2 = L1_1

  L2_2 = L0_1

  L2_2 = L2_2[L3_2]

  L3_2 = nil

  L4_2 = ipairs

  L5_2 = L2_2.options

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = L9_2.id

    L11_2 = A0_2.optionId

    if L10_2 == L11_2 then

      L3_2 = L9_2

      break

    end

  end

  if not L3_2 then

    L4_2 = ResetNuiFocus

    L4_2()

    return

  end

  L4_2 = L3_2.menu

  if L4_2 then

    L4_2 = L3_1

    L5_2 = L3_2.menu

    L4_2(L5_2)

    return

  end

  L4_2 = L3_2.event

  if not L4_2 then

    L4_2 = L3_2.serverEvent

    if not L4_2 then

      L4_2 = L3_2.onSelect

      if not L4_2 then

        return

      end

    end

  end

  L4_2 = nil

  L1_1 = L4_2

  L4_2 = SendNUIMessage

  L5_2 = {}

  L5_2.action = "hideMenu"

  L4_2(L5_2)

  L4_2 = ResetNuiFocus

  L4_2()

  L4_2 = L3_2.onSelect

  if L4_2 then

    L4_2 = L3_2.onSelect

    L5_2 = L3_2.args

    L4_2(L5_2)

  end

  L4_2 = L3_2.event

  if L4_2 then

    L4_2 = TriggerEvent

    L5_2 = L3_2.event

    L6_2 = L3_2.args

    L4_2(L5_2, L6_2)

  end

  L4_2 = L3_2.serverEvent

  if L4_2 then

    L4_2 = TriggerServerEvent

    L5_2 = L3_2.serverEvent

    L6_2 = L3_2.args

    L4_2(L5_2, L6_2)

  end

end

L6_1(L7_1, L8_1)

L6_1 = RegisterNUICallback

L7_1 = "menuBack"

function L8_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A1_2

  L3_2 = "ok"

  L2_2(L3_2)

  L2_2 = L1_1

  if L2_2 then

    L3_2 = L1_1

    L2_2 = L0_1

    L2_2 = L2_2[L3_2]

    if L2_2 then

      L3_2 = L1_1

      L2_2 = L0_1

      L2_2 = L2_2[L3_2]

      L3_2 = L2_2.menu

      if L3_2 then

        L3_2 = L2_2.onBack

        if L3_2 then

          L3_2 = L2_2.onBack

          L3_2()

        end

        L3_2 = L3_1

        L4_2 = L2_2.menu

        L3_2(L4_2)

      end

    end

  end

end

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "registerMenu"

L8_1 = L2_1

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "showMenu"

L8_1 = L3_1

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "hideMenu"

L8_1 = L4_1

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "getOpenMenu"

L8_1 = L5_1

L6_1(L7_1, L8_1)









