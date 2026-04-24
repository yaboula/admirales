local L0_1, L1_1, L2_1

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:talking"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = pairs

  L3_2 = A0_2

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = TriggerClientEvent

    L9_2 = "origen_police:client:talking"

    L10_2 = L6_2

    L11_2 = source

    L12_2 = A1_2

    L8_2(L9_2, L10_2, L11_2, L12_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:SetFreq"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = SetFreq

  L2_2 = source

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:SetMultiFrec"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = Config

  L3_2 = L3_2.PoliceJobName

  if A0_2 == L3_2 then

    if "entrada" == A1_2 or "none" == A1_2 then

      L3_2 = TriggerEvent

      L4_2 = "origen_police:server:removeref"

      L5_2 = source

      L3_2(L4_2, L5_2)

    else

      L3_2 = TriggerEvent

      L4_2 = "origen_police:server:updateref"

      L5_2 = {}

      L6_2 = source

      L5_2.source = L6_2

      L7_2 = A1_2

      L6_2 = A1_2.upper

      L6_2 = L6_2(L7_2)

      L5_2.unit = L6_2

      L3_2(L4_2, L5_2)

    end

  end

  L3_2 = SetMultiFrec

  L4_2 = source

  L5_2 = A0_2

  L6_2 = A1_2

  L7_2 = A2_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:moveplayer"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:SetMultiFrec"

  L5_2 = A0_2

  L6_2 = A1_2

  L7_2 = A2_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:Mute"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = MutePlayer

  L3_2 = source

  L4_2 = A0_2

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterServerEvent

L1_1 = "origen_police:server:Ready"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  if A2_2 then

    L3_2 = 1

    L4_2 = #A2_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = ReadyPlayer

      L8_2 = A2_2[L6_2]

      L9_2 = A0_2

      L10_2 = A1_2

      L7_2(L8_2, L9_2, L10_2)

      L7_2 = A2_2[L6_2]

      L8_2 = source

      if L7_2 ~= L8_2 then

        L7_2 = TriggerClientEvent

        L8_2 = "origen_police:client:SyncQuick"

        L9_2 = A2_2[L6_2]

        L10_2 = {}

        L10_2.ready = A1_2

        L7_2(L8_2, L9_2, L10_2)

      end

    end

  else

    L3_2 = ReadyPlayer

    L4_2 = source

    L5_2 = A0_2

    L6_2 = A1_2

    L3_2(L4_2, L5_2, L6_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:GetMultiFrecs"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = A2_2.group

  if not L3_2 then

    L3_2 = Config

    L3_2 = L3_2.PoliceJobName

    A2_2.group = L3_2

  end

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:SetMultiFrecTargets"

  L5_2 = A0_2

  L6_2 = MultiFrecs

  L7_2 = A2_2.group

  L6_2 = L6_2[L7_2]

  L3_2(L4_2, L5_2, L6_2)

  L3_2 = A1_2

  L4_2 = MultiFrecs

  L5_2 = A2_2.group

  L4_2 = L4_2[L5_2]

  if not L4_2 then

    L4_2 = {}

  end

  L3_2(L4_2)

  L3_2 = pairs

  L4_2 = MultiFrecs

  L5_2 = A2_2.group

  L4_2 = L4_2[L5_2]

  if not L4_2 then

    L4_2 = {}

  end

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2[A0_2]

    if L9_2 then

      return

    end

  end

  L3_2 = A2_2.group

  L4_2 = Config

  L4_2 = L4_2.PoliceJobName

  if L3_2 == L4_2 then

    L3_2 = MultiFrecs

    L4_2 = A2_2.group

    L5_2 = MultiFrecs

    L6_2 = A2_2.group

    L5_2 = L5_2[L6_2]

    if not L5_2 then

      L5_2 = {}

    end

    L3_2[L4_2] = L5_2

    L3_2 = MultiFrecs

    L4_2 = A2_2.group

    L3_2 = L3_2[L4_2]

    L3_2 = L3_2.entrada

    L4_2 = {}

    L4_2.muted = false

    L4_2.ready = true

    L5_2 = FW_GetPlayer

    L6_2 = A0_2

    L5_2 = L5_2(L6_2)

    if L5_2 then

      L5_2 = L5_2.PlayerData

    end

    L5_2 = L5_2.job

    L5_2 = L5_2.name

    L4_2.job = L5_2

    L3_2[A0_2] = L4_2

  end

end

L0_1(L1_1, L2_1)

L0_1 = AddEventHandler

L1_1 = "playerDropped"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2

  L1_2 = source

  if not L1_2 then

    return

  end

  L1_2 = pairs

  L2_2 = Frecs

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = source

    L7_2 = L6_2[L7_2]

    if L7_2 then

      L7_2 = source

      L6_2[L7_2] = nil

      L7_2 = pairs

      L8_2 = L6_2

      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

        L13_2 = TriggerClientEvent

        L14_2 = "origen_police:client:RemovePlayerTarget"

        L15_2 = L11_2

        L16_2 = source

        L13_2(L14_2, L15_2, L16_2)

      end

      break

    end

  end

  L1_2 = pairs

  L2_2 = MultiFrecs

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = pairs

    L8_2 = L6_2

    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

      L13_2 = source

      L13_2 = L12_2[L13_2]

      if L13_2 then

        L13_2 = source

        L12_2[L13_2] = nil

        L13_2 = pairs

        L14_2 = L6_2

        L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)

        for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do

          L19_2 = pairs

          L20_2 = L18_2

          L19_2, L20_2, L21_2, L22_2 = L19_2(L20_2)

          for L23_2, L24_2 in L19_2, L20_2, L21_2, L22_2 do

            L25_2 = TriggerClientEvent

            L26_2 = "origen_police:client:RemovePlayerMultiFrec"

            L27_2 = L23_2

            L28_2 = source

            L29_2 = L11_2

            L25_2(L26_2, L27_2, L28_2, L29_2)

          end

        end

        if "police" == L5_2 then

          L13_2 = TriggerEvent

          L14_2 = "origen_police:server:removeref"

          L15_2 = source

          L13_2(L14_2, L15_2)

        end

        break

      end

    end

  end

end

L0_1(L1_1, L2_1)

