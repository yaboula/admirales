local L0_1, L1_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  if nil == A0_2 then

    L1_2 = 0

    return L1_2

  end

  L1_2 = 0

  L2_2 = pairs

  L3_2 = A0_2

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2 in L2_2, L3_2, L4_2, L5_2 do

    L1_2 = L1_2 + 1

  end

  return L1_2

end

GetTableLength = L0_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2

  function L3_2(A0_3, A1_3, A2_3, A3_3, A4_3, A5_3)

    local L6_3, L7_3, L8_3

    L6_3 = A0_3 - A4_3

    L7_3 = A3_3 - A5_3

    L6_3 = L6_3 * L7_3

    L7_3 = A2_3 - A4_3

    L8_3 = A1_3 - A5_3

    L7_3 = L7_3 * L8_3

    L6_3 = L6_3 - L7_3

    return L6_3

  end

  L4_2 = {}

  L5_2 = 1

  L6_2 = #A0_2

  L7_2 = 1

  for L8_2 = L5_2, L6_2, L7_2 do

    L9_2 = #A0_2

    L9_2 = L8_2 % L9_2

    L9_2 = L9_2 + 1

    L10_2 = L3_2

    L11_2 = A1_2

    L12_2 = A2_2

    L13_2 = A0_2[L8_2]

    L13_2 = L13_2[1]

    L14_2 = A0_2[L8_2]

    L14_2 = L14_2[2]

    L15_2 = A0_2[L9_2]

    L15_2 = L15_2[1]

    L16_2 = A0_2[L9_2]

    L16_2 = L16_2[2]

    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)

    L10_2 = L10_2 < 0

    L4_2[L8_2] = L10_2

  end

  L5_2 = 2

  L6_2 = #L4_2

  L7_2 = 1

  for L8_2 = L5_2, L6_2, L7_2 do

    L9_2 = L4_2[L8_2]

    L10_2 = L4_2[1]

    if L9_2 ~= L10_2 then

      L9_2 = false

      return L9_2

    end

  end

  L5_2 = true

  return L5_2

end

isInside = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2)

  local L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L8_2 = vector3

  L9_2 = A0_2.x

  L10_2 = A0_2.y

  L11_2 = A2_2

  L8_2 = L8_2(L9_2, L10_2, L11_2)

  L9_2 = vector3

  L10_2 = A0_2.x

  L11_2 = A0_2.y

  L12_2 = A3_2

  L9_2 = L9_2(L10_2, L11_2, L12_2)

  L10_2 = vector3

  L11_2 = A1_2.x

  L12_2 = A1_2.y

  L13_2 = A2_2

  L10_2 = L10_2(L11_2, L12_2, L13_2)

  L11_2 = vector3

  L12_2 = A1_2.x

  L13_2 = A1_2.y

  L14_2 = A3_2

  L11_2 = L11_2(L12_2, L13_2, L14_2)

  L12_2 = DrawPoly

  L13_2 = L8_2

  L14_2 = L9_2

  L15_2 = L10_2

  L16_2 = A4_2

  L17_2 = A5_2

  L18_2 = A6_2

  L19_2 = A7_2

  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L12_2 = DrawPoly

  L13_2 = L9_2

  L14_2 = L11_2

  L15_2 = L10_2

  L16_2 = A4_2

  L17_2 = A5_2

  L18_2 = A6_2

  L19_2 = A7_2

  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L12_2 = DrawPoly

  L13_2 = L10_2

  L14_2 = L11_2

  L15_2 = L9_2

  L16_2 = A4_2

  L17_2 = A5_2

  L18_2 = A6_2

  L19_2 = A7_2

  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L12_2 = DrawPoly

  L13_2 = L10_2

  L14_2 = L9_2

  L15_2 = L8_2

  L16_2 = A4_2

  L17_2 = A5_2

  L18_2 = A6_2

  L19_2 = A7_2

  L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

end

DrawWall = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)

  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L5_2 = World3dToScreen2d

  L6_2 = A0_2

  L7_2 = A1_2

  L8_2 = A2_2

  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2, L8_2)

  L8_2 = GetGameplayCamCoords

  L8_2 = L8_2()

  L9_2 = GetDistanceBetweenCoords

  L10_2 = L8_2.x

  L11_2 = L8_2.y

  L12_2 = L8_2.z

  L13_2 = A0_2

  L14_2 = A1_2

  L15_2 = A2_2

  L16_2 = 1

  L9_2 = L9_2(L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)

  L10_2 = 1

  L10_2 = L10_2 / L9_2

  L10_2 = L10_2 * 2

  L11_2 = GetGameplayCamFov

  L11_2 = L11_2()

  L12_2 = 1

  L11_2 = L12_2 / L11_2

  L11_2 = L11_2 * 100

  L12_2 = L10_2 * L11_2

  L10_2 = L12_2 * A3_2

  if L5_2 then

    L12_2 = SetTextScale

    L13_2 = 0.0

    L14_2 = L10_2

    L12_2(L13_2, L14_2)

    L12_2 = SetTextFont

    L13_2 = 0

    L12_2(L13_2)

    L12_2 = SetTextProportional

    L13_2 = 1

    L12_2(L13_2)

    L12_2 = SetTextColour

    L13_2 = 255

    L14_2 = 255

    L15_2 = 255

    L16_2 = 255

    L12_2(L13_2, L14_2, L15_2, L16_2)

    L12_2 = SetTextDropshadow

    L13_2 = 0

    L14_2 = 0

    L15_2 = 0

    L16_2 = 0

    L17_2 = 255

    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

    L12_2 = SetTextEdge

    L13_2 = 2

    L14_2 = 0

    L15_2 = 0

    L16_2 = 0

    L17_2 = 150

    L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

    L12_2 = SetTextDropShadow

    L12_2()

    L12_2 = SetTextOutline

    L12_2()

    L12_2 = SetTextEntry

    L13_2 = "STRING"

    L12_2(L13_2)

    L12_2 = SetTextCentre

    L13_2 = 1

    L12_2(L13_2)

    L12_2 = AddTextComponentString

    L13_2 = A4_2

    L12_2(L13_2)

    L12_2 = DrawText

    L13_2 = L6_2

    L14_2 = L7_2

    L12_2(L13_2, L14_2)

  end

end

Draw3DText = L0_1

