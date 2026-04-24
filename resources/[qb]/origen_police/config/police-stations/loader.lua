local L0_1, L1_1, L2_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = vector4

  L2_2 = A0_2[1]

  L3_2 = A0_2[2]

  L4_2 = A0_2[3]

  L5_2 = A0_2[4]

  return L1_2(L2_2, L3_2, L4_2, L5_2)

end

ParseVector4 = L0_1

function L0_1(A0_2)

  local L1_2

  L1_2 = A0_2.x

  L1_2 = 0 == L1_2

  return L1_2

end

IsVecZero = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L1_2 = {}

  L2_2 = pairs

  L3_2 = A0_2

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    if "Options" == L6_2 then

    else

      L8_2 = pairs

      L9_2 = L7_2

      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)

      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do

        L14_2 = L13_2.coords

        if L14_2 then

          L14_2 = ParseVector4

          L15_2 = L13_2.coords

          L14_2 = L14_2(L15_2)

          L13_2.coords = L14_2

          L14_2 = IsVecZero

          L15_2 = L13_2.coords

          L14_2 = L14_2(L15_2)

          if L14_2 then

            L14_2 = print

            L15_2 = "^3WARNING: YOU HAVE A MARKER WITH COORDS IN THE WORLD COORDS; YOU SHOULD REMOVE IT TO AVOID ISSUES WITH HELP NOTIFICATIONS^0"

            L14_2(L15_2)

          end

        end

        L14_2 = L13_2.spawn

        if L14_2 then

          L14_2 = ParseVector4

          L15_2 = L13_2.spawn

          L14_2 = L14_2(L15_2)

          L13_2.spawn = L14_2

        end

      end

    end

    L1_2[L6_2] = L7_2

  end

  return L1_2

end

ParseCoords = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = LoadResourceFile

  L2_2 = GetCurrentResourceName

  L2_2 = L2_2()

  L3_2 = "config/police-stations/"

  L4_2 = A0_2

  L5_2 = ".json"

  L3_2 = L3_2 .. L4_2 .. L5_2

  L1_2 = L1_2(L2_2, L3_2)

  if not L1_2 then

    L2_2 = Debuger

    L3_2 = "The map "

    L4_2 = A0_2

    L5_2 = " does not exist, loading default gta map.^0"

    L3_2 = L3_2 .. L4_2 .. L5_2

    L2_2(L3_2)

    return

  end

  L2_2 = ParseCoords

  L3_2 = json

  L3_2 = L3_2.decode

  L4_2 = L1_2

  L3_2, L4_2, L5_2 = L3_2(L4_2)

  return L2_2(L3_2, L4_2, L5_2)

end

LoadMarkersData = L0_1

L0_1 = exports

L1_1 = "LoadMarkers"

L2_1 = LoadMarkersData

L0_1(L1_1, L2_1)

