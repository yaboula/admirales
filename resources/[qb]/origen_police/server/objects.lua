local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

L0_1 = {}

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:placeobj"

function L3_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L5_2 = source

  L4_2 = L0_1

  L7_2 = source

  L6_2 = L0_1

  L6_2 = L6_2[L7_2]

  if not L6_2 then

    L6_2 = 0

  end

  L6_2 = L6_2 + 1

  L4_2[L5_2] = L6_2

  L5_2 = source

  L4_2 = L0_1

  L4_2 = L4_2[L5_2]

  L5_2 = Config

  L5_2 = L5_2.Actions

  L5_2 = L5_2.MaxObjectsPerPlayer

  if L4_2 > L5_2 then

    return

  end

  L4_2 = TriggerClientEvent

  L5_2 = "origen_police:client:placeobj"

  L6_2 = -1

  L7_2 = {}

  L8_2 = source

  L7_2.source = L8_2

  L9_2 = source

  L8_2 = L0_1

  L8_2 = L8_2[L9_2]

  L7_2.objectId = L8_2

  L8_2 = {}

  L8_2.model = A0_2

  L8_2.coords = A1_2

  L8_2.heading = A2_2

  L8_2.freeze = A3_2

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

L4_1 = "placeobj"

L5_1 = 400

L6_1 = nil

L7_1 = false

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

L1_1 = RegisterServerAction

L2_1 = "origen_police:callback:rmveobj"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  if L3_2 then

    L3_2 = L0_1

    L3_2 = L3_2[A0_2]

    if not (L3_2 < 1) then

      goto lbl_10

    end

  end

  do return end

  ::lbl_10::

  L3_2 = L0_1

  L4_2 = L0_1

  L4_2 = L4_2[A0_2]

  L4_2 = L4_2 - 1

  L3_2[A0_2] = L4_2

  L3_2 = L0_1

  L3_2 = L3_2[A0_2]

  if L3_2 <= 0 then

    L3_2 = L0_1

    L3_2[A0_2] = nil

  end

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:rmveobj"

  L5_2 = -1

  L6_2 = {}

  L6_2.source = A0_2

  L6_2.objectId = A1_2

  L3_2(L4_2, L5_2, L6_2)

  L3_2 = 1

  L4_2 = Public

  L4_2 = L4_2.Radars

  L4_2 = #L4_2

  L5_2 = 1

  for L6_2 = L3_2, L4_2, L5_2 do

    L7_2 = Public

    L7_2 = L7_2.Radars

    L7_2 = L7_2[L6_2]

    L7_2 = L7_2.objectCoords

    L7_2 = A2_2 - L7_2

    L7_2 = #L7_2

    L8_2 = 1.2

    if L7_2 < L8_2 then

      L7_2 = Debuger

      L8_2 = "Removing radar at coords: "

      L9_2 = tostring

      L10_2 = A2_2

      L9_2 = L9_2(L10_2)

      L8_2 = L8_2 .. L9_2

      L7_2(L8_2)

      L7_2 = table

      L7_2 = L7_2.remove

      L8_2 = Public

      L8_2 = L8_2.Radars

      L9_2 = L6_2

      L7_2(L8_2, L9_2)

      L7_2 = TriggerClientEvent

      L8_2 = "origen_police:client:removeradar"

      L9_2 = -1

      L10_2 = L6_2

      L7_2(L8_2, L9_2, L10_2)

      L7_2 = pairs

      L8_2 = CentralSuscribeds

      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

        L13_2 = TriggerClientEvent

        L14_2 = "origen_police:client:RemoveCentralMark"

        L15_2 = L11_2

        L16_2 = "Radar_"

        L17_2 = L6_2

        L16_2 = L16_2 .. L17_2

        L13_2(L14_2, L15_2, L16_2)

      end

      break

    end

  end

end

L4_1 = "removeobj"

L5_1 = 1000

L6_1 = nil

L7_1 = false

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

L1_1 = RegisterServerAction

L2_1 = "origen_police:server:placeradar"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L1_2 = table

  L1_2 = L1_2.insert

  L2_2 = Public

  L2_2 = L2_2.Radars

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:client:placeradar"

  L3_2 = -1

  L4_2 = A0_2

  L1_2(L2_2, L3_2, L4_2)

  A0_2.icon = "radar"

  L1_2 = pairs

  L2_2 = CentralSuscribeds

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = TriggerClientEvent

    L8_2 = "origen_police:client:AddCentralMark"

    L9_2 = L5_2

    L10_2 = "Radar_"

    L11_2 = Public

    L11_2 = L11_2.Radars

    L11_2 = #L11_2

    L10_2 = L10_2 .. L11_2

    L11_2 = json

    L11_2 = L11_2.decode

    L12_2 = json

    L12_2 = L12_2.encode

    L13_2 = A0_2

    L12_2, L13_2 = L12_2(L13_2)

    L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)

    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

  end

end

L4_1 = "placeradar"

L5_1 = 1000

L6_1 = nil

L7_1 = false

L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)

