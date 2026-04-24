local L0_1, L1_1, L2_1

L0_1 = {}

Handlers = L0_1

L0_1 = Handlers

L1_1 = Handlers

L0_1.__index = L1_1

L0_1 = Handlers

function L1_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = setmetatable

  L2_2 = {}

  L3_2 = Handlers

  L1_2 = L1_2(L2_2, L3_2)

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = 1000

  end

  L1_2.interval = L2_2

  L2_2 = {}

  L1_2.registered = L2_2

  return L1_2

end

L0_1.new = L1_1

L0_1 = Handlers

function L1_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A0_2.registered

  L3_2 = A1_2.name

  L2_2 = L2_2[L3_2]

  if L2_2 then

    return

  end

  L2_2 = A0_2.registered

  L3_2 = A1_2.name

  L2_2[L3_2] = A1_2

  L2_2 = {}

  A1_2.callbacks = L2_2

  A1_2.lastResult = nil

  A1_2.lastExtra = nil

end

L0_1.Register = L1_1

L0_1 = Handlers

function L1_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2

  L3_2 = A0_2.registered

  L3_2 = L3_2[A1_2]

  if L3_2 then

    L3_2 = table

    L3_2 = L3_2.insert

    L4_2 = A0_2.registered

    L4_2 = L4_2[A1_2]

    L4_2 = L4_2.callbacks

    L5_2 = A2_2

    L3_2(L4_2, L5_2)

  end

end

L0_1.AddCallback = L1_1

L0_1 = Handlers

function L1_1(A0_2)

  local L1_2, L2_2

  L1_2 = Citizen

  L1_2 = L1_2.CreateThread

  function L2_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3

    while true do

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = A0_2.interval

      L0_3(L1_3)

      L0_3 = next

      L1_3 = A0_2.registered

      L0_3 = L0_3(L1_3)

      if not L0_3 then

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 1000

        L0_3(L1_3)

      else

        L0_3 = pairs

        L1_3 = A0_2.registered

        L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)

        for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do

          L6_3 = L5_3.check

          L7_3 = L5_3

          L6_3, L7_3 = L6_3(L7_3)

          L8_3 = L5_3.lastResult

          if L6_3 ~= L8_3 then

            L5_3.lastResult = L6_3

            L5_3.lastExtra = L7_3

            L8_3 = ipairs

            L9_3 = L5_3.callbacks

            L8_3, L9_3, L10_3, L11_3 = L8_3(L9_3)

            for L12_3, L13_3 in L8_3, L9_3, L10_3, L11_3 do

              L14_3 = L13_3

              L15_3 = L6_3

              L16_3 = L7_3

              L14_3(L15_3, L16_3)

            end

          end

        end

      end

    end

  end

  L1_2(L2_2)

end

L0_1.Start = L1_1

L0_1 = Handlers

L0_1 = L0_1.new

L1_1 = 1000

L0_1 = L0_1(L1_1)

HandlerManager = L0_1

L0_1 = HandlerManager

L1_1 = L0_1

L0_1 = L0_1.Register

L2_1 = VehicleSitHandler

L0_1(L1_1, L2_1)

L0_1 = HandlerManager

L1_1 = L0_1

L0_1 = L0_1.Start

L0_1(L1_1)

