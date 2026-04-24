local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:UpdateTraffic"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L2_2 = L2_2[A0_2]

  if L2_2 then

    L2_2 = RemoveRoadNodeSpeedZone

    L3_2 = Public

    L3_2 = L3_2.TrafficZones

    L3_2 = L3_2[A0_2]

    L3_2 = L3_2.id

    L2_2(L3_2)

    L2_2 = Public

    L2_2 = L2_2.TrafficZones

    L2_2 = L2_2[A0_2]

    L2_2.type = A1_2

    L2_2 = Public

    L2_2 = L2_2.TrafficZones

    L2_2 = L2_2[A0_2]

    L2_2 = L2_2.type

    if "stop" == L2_2 then

      L2_2 = Public

      L2_2 = L2_2.TrafficZones

      L2_2 = L2_2[A0_2]

      L3_2 = AddRoadNodeSpeedZone

      L4_2 = Public

      L4_2 = L4_2.TrafficZones

      L4_2 = L4_2[A0_2]

      L4_2 = L4_2.coords

      L5_2 = 50.0

      L6_2 = 0.0

      L7_2 = false

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)

      L2_2.id = L3_2

      L2_2 = Public

      L2_2 = L2_2.TrafficZones

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.blip

      if L2_2 then

        L2_2 = SetBlipColour

        L3_2 = Public

        L3_2 = L3_2.TrafficZones

        L3_2 = L3_2[A0_2]

        L3_2 = L3_2.blip

        L4_2 = 6

        L2_2(L3_2, L4_2)

      end

    else

      L2_2 = Public

      L2_2 = L2_2.TrafficZones

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.type

      if "slow" == L2_2 then

        L2_2 = Public

        L2_2 = L2_2.TrafficZones

        L2_2 = L2_2[A0_2]

        L3_2 = AddRoadNodeSpeedZone

        L4_2 = Public

        L4_2 = L4_2.TrafficZones

        L4_2 = L4_2[A0_2]

        L4_2 = L4_2.coords

        L5_2 = 50.0

        L6_2 = 5.0

        L7_2 = false

        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)

        L2_2.id = L3_2

        L2_2 = Public

        L2_2 = L2_2.TrafficZones

        L2_2 = L2_2[A0_2]

        L2_2 = L2_2.blip

        if L2_2 then

          L2_2 = SetBlipColour

          L3_2 = Public

          L3_2 = L3_2.TrafficZones

          L3_2 = L3_2[A0_2]

          L3_2 = L3_2.blip

          L4_2 = 44

          L2_2(L3_2, L4_2)

        end

      end

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:AddTrafficZone"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = onduty

  if L1_2 then

    L1_2 = AddBlipForRadius

    L2_2 = A0_2.coords

    L3_2 = 50.0

    L1_2 = L1_2(L2_2, L3_2)

    A0_2.blip = L1_2

    L1_2 = SetBlipAlpha

    L2_2 = A0_2.blip

    L3_2 = 100

    L1_2(L2_2, L3_2)

  end

  L1_2 = A0_2.type

  if "stop" == L1_2 then

    L1_2 = AddRoadNodeSpeedZone

    L2_2 = A0_2.coords

    L3_2 = 50.0

    L4_2 = 0.0

    L5_2 = false

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)

    A0_2.id = L1_2

    L1_2 = A0_2.blip

    if L1_2 then

      L1_2 = SetBlipColour

      L2_2 = A0_2.blip

      L3_2 = 6

      L1_2(L2_2, L3_2)

    end

  else

    L1_2 = A0_2.type

    if "slow" == L1_2 then

      L1_2 = AddRoadNodeSpeedZone

      L2_2 = A0_2.coords

      L3_2 = 50.0

      L4_2 = 5.0

      L5_2 = false

      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)

      A0_2.id = L1_2

      L1_2 = A0_2.blip

      if L1_2 then

        L1_2 = SetBlipColour

        L2_2 = A0_2.blip

        L3_2 = 44

        L1_2(L2_2, L3_2)

      end

    end

  end

  L1_2 = table

  L1_2 = L1_2.insert

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:RemoveTraffic"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = Public

  L1_2 = L1_2.TrafficZones

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = Public

    L1_2 = L1_2.TrafficZones

    L1_2 = L1_2[A0_2]

    L1_2 = L1_2.blip

    if L1_2 then

      L1_2 = RemoveBlip

      L2_2 = Public

      L2_2 = L2_2.TrafficZones

      L2_2 = L2_2[A0_2]

      L2_2 = L2_2.blip

      L3_2 = 17

      L1_2(L2_2, L3_2)

    end

    L1_2 = RemoveRoadNodeSpeedZone

    L2_2 = Public

    L2_2 = L2_2.TrafficZones

    L2_2 = L2_2[A0_2]

    L2_2 = L2_2.id

    L1_2(L2_2)

    L1_2 = table

    L1_2 = L1_2.remove

    L2_2 = Public

    L2_2 = L2_2.TrafficZones

    L3_2 = A0_2

    L1_2(L2_2, L3_2)

  end

end

L0_1(L1_1, L2_1)

