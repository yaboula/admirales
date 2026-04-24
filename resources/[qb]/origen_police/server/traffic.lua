local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:stoptraffic"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L0_2 = GetEntityCoords

  L1_2 = GetPlayerPed

  L2_2 = source

  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L1_2(L2_2)

  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

  L1_2 = 1

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = Public

    L5_2 = L5_2.TrafficZones

    L5_2 = L5_2[L4_2]

    L5_2 = L5_2.coords

    L5_2 = L5_2 - L0_2

    L5_2 = #L5_2

    if L5_2 < 20 then

      L5_2 = Public

      L5_2 = L5_2.TrafficZones

      L5_2 = L5_2[L4_2]

      L5_2.type = "stop"

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:client:UpdateTraffic"

      L7_2 = -1

      L8_2 = L4_2

      L9_2 = "stop"

      L5_2(L6_2, L7_2, L8_2, L9_2)

      L5_2 = pairs

      L6_2 = CentralSuscribeds

      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

        L11_2 = TriggerClientEvent

        L12_2 = "origen_police:client:UpdateCentralMark"

        L13_2 = L9_2

        L14_2 = "Traffic_"

        L15_2 = Public

        L15_2 = L15_2.TrafficZones

        L15_2 = #L15_2

        L14_2 = L14_2 .. L15_2

        L15_2 = {}

        L16_2 = {}

        L17_2 = L0_2.x

        L16_2.x = L17_2

        L17_2 = L0_2.y

        L16_2.y = L17_2

        L17_2 = L0_2.z

        L16_2.z = L17_2

        L15_2.coords = L16_2

        L15_2.type = "stop"

        L15_2.radius = 50

        L15_2.icon = "traffic"

        L11_2(L12_2, L13_2, L14_2, L15_2)

      end

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:ShowNotification"

      L7_2 = source

      L8_2 = Config

      L8_2 = L8_2.Translations

      L8_2 = L8_2.UpdatedLimitation

      L5_2(L6_2, L7_2, L8_2)

      return

    end

  end

  L1_2 = table

  L1_2 = L1_2.insert

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L3_2 = {}

  L3_2.coords = L0_2

  L3_2.type = "stop"

  L3_2.radius = 50

  L1_2(L2_2, L3_2)

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:client:AddTrafficZone"

  L3_2 = -1

  L4_2 = {}

  L4_2.coords = L0_2

  L4_2.type = "stop"

  L1_2(L2_2, L3_2, L4_2)

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:ShowNotification"

  L3_2 = source

  L4_2 = Config

  L4_2 = L4_2.Translations

  L4_2 = L4_2.NewLimitation

  L1_2(L2_2, L3_2, L4_2)

  L1_2 = pairs

  L2_2 = CentralSuscribeds

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = TriggerClientEvent

    L8_2 = "origen_police:client:AddCentralMark"

    L9_2 = L5_2

    L10_2 = "Traffic_"

    L11_2 = Public

    L11_2 = L11_2.TrafficZones

    L11_2 = #L11_2

    L10_2 = L10_2 .. L11_2

    L11_2 = {}

    L12_2 = {}

    L13_2 = L0_2.x

    L12_2.x = L13_2

    L13_2 = L0_2.y

    L12_2.y = L13_2

    L13_2 = L0_2.z

    L12_2.z = L13_2

    L11_2.coords = L12_2

    L11_2.type = "stop"

    L11_2.radius = 50

    L11_2.icon = "traffic"

    L7_2(L8_2, L9_2, L10_2, L11_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:slowtraffic"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L0_2 = GetEntityCoords

  L1_2 = GetPlayerPed

  L2_2 = source

  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L1_2(L2_2)

  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

  L1_2 = 1

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = Public

    L5_2 = L5_2.TrafficZones

    L5_2 = L5_2[L4_2]

    L5_2 = L5_2.coords

    L5_2 = L5_2 - L0_2

    L5_2 = #L5_2

    if L5_2 < 20 then

      L5_2 = Public

      L5_2 = L5_2.TrafficZones

      L5_2 = L5_2[L4_2]

      L5_2.type = "slow"

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:client:UpdateTraffic"

      L7_2 = -1

      L8_2 = L4_2

      L9_2 = "slow"

      L5_2(L6_2, L7_2, L8_2, L9_2)

      L5_2 = pairs

      L6_2 = CentralSuscribeds

      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

        L11_2 = TriggerClientEvent

        L12_2 = "origen_police:client:UpdateCentralMark"

        L13_2 = L9_2

        L14_2 = "Traffic_"

        L15_2 = Public

        L15_2 = L15_2.TrafficZones

        L15_2 = #L15_2

        L14_2 = L14_2 .. L15_2

        L15_2 = {}

        L16_2 = {}

        L17_2 = L0_2.x

        L16_2.x = L17_2

        L17_2 = L0_2.y

        L16_2.y = L17_2

        L17_2 = L0_2.z

        L16_2.z = L17_2

        L15_2.coords = L16_2

        L15_2.type = "slow"

        L15_2.radius = 50

        L15_2.icon = "traffic"

        L11_2(L12_2, L13_2, L14_2, L15_2)

      end

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:ShowNotification"

      L7_2 = source

      L8_2 = Config

      L8_2 = L8_2.Translations

      L8_2 = L8_2.UpdatedLimitation

      L5_2(L6_2, L7_2, L8_2)

      return

    end

  end

  L1_2 = table

  L1_2 = L1_2.insert

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L3_2 = {}

  L3_2.coords = L0_2

  L3_2.type = "slow"

  L3_2.radius = 50

  L1_2(L2_2, L3_2)

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:client:AddTrafficZone"

  L3_2 = -1

  L4_2 = {}

  L4_2.coords = L0_2

  L4_2.type = "slow"

  L1_2(L2_2, L3_2, L4_2)

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:ShowNotification"

  L3_2 = source

  L4_2 = Config

  L4_2 = L4_2.Translations

  L4_2 = L4_2.NewLimitation

  L1_2(L2_2, L3_2, L4_2)

  L1_2 = pairs

  L2_2 = CentralSuscribeds

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = TriggerClientEvent

    L8_2 = "origen_police:client:AddCentralMark"

    L9_2 = L5_2

    L10_2 = "Traffic_"

    L11_2 = Public

    L11_2 = L11_2.TrafficZones

    L11_2 = #L11_2

    L10_2 = L10_2 .. L11_2

    L11_2 = {}

    L12_2 = {}

    L13_2 = L0_2.x

    L12_2.x = L13_2

    L13_2 = L0_2.y

    L12_2.y = L13_2

    L13_2 = L0_2.z

    L12_2.z = L13_2

    L11_2.coords = L12_2

    L11_2.type = "slow"

    L11_2.radius = 50

    L11_2.icon = "traffic"

    L7_2(L8_2, L9_2, L10_2, L11_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:server:resumetraffic"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L0_2 = GetEntityCoords

  L1_2 = GetPlayerPed

  L2_2 = source

  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L1_2(L2_2)

  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

  L1_2 = 1

  L2_2 = Public

  L2_2 = L2_2.TrafficZones

  L2_2 = #L2_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = Public

    L5_2 = L5_2.TrafficZones

    L5_2 = L5_2[L4_2]

    L5_2 = L5_2.coords

    L5_2 = L5_2 - L0_2

    L5_2 = #L5_2

    if L5_2 < 20 then

      L5_2 = table

      L5_2 = L5_2.remove

      L6_2 = Public

      L6_2 = L6_2.TrafficZones

      L7_2 = L4_2

      L5_2(L6_2, L7_2)

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:client:RemoveTraffic"

      L7_2 = -1

      L8_2 = L4_2

      L5_2(L6_2, L7_2, L8_2)

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:ShowNotification"

      L7_2 = source

      L8_2 = Config

      L8_2 = L8_2.Translations

      L8_2 = L8_2.LimitationRemoved

      L5_2(L6_2, L7_2, L8_2)

      L5_2 = pairs

      L6_2 = CentralSuscribeds

      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

      for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

        L11_2 = TriggerClientEvent

        L12_2 = "origen_police:client:RemoveCentralMark"

        L13_2 = L9_2

        L14_2 = "Traffic_"

        L15_2 = L4_2

        L14_2 = L14_2 .. L15_2

        L11_2(L12_2, L13_2, L14_2)

      end

      return

    end

  end

  L1_2 = TriggerClientEvent

  L2_2 = "origen_police:ShowNotification"

  L3_2 = source

  L4_2 = Config

  L4_2 = L4_2.Translations

  L4_2 = L4_2.CantFindLimitation

  L1_2(L2_2, L3_2, L4_2)

end

L0_1(L1_1, L2_1)

