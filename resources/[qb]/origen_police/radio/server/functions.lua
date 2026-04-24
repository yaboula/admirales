local L0_1, L1_1, L2_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L2_2 = pairs

  L3_2 = Frecs

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = L7_2[A0_2]

    if L8_2 then

      L7_2[A0_2] = nil

      L8_2 = pairs

      L9_2 = L7_2

      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)

      for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do

        L14_2 = TriggerClientEvent

        L15_2 = "origen_police:client:RemovePlayerTarget"

        L16_2 = L12_2

        L17_2 = A0_2

        L14_2(L15_2, L16_2, L17_2)

      end

      break

    end

  end

  if A1_2 > 0 then

    L2_2 = Frecs

    L2_2 = L2_2[A1_2]

    if not L2_2 then

      L2_2 = Frecs

      L3_2 = {}

      L2_2[A1_2] = L3_2

    end

    L2_2 = Frecs

    L2_2 = L2_2[A1_2]

    L2_2[A0_2] = true

    L2_2 = pairs

    L3_2 = Frecs

    L3_2 = L3_2[A1_2]

    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

      if L6_2 ~= A0_2 then

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police:client:AddPlayerTarget"

        L10_2 = L6_2

        L11_2 = A0_2

        L8_2(L9_2, L10_2, L11_2)

      else

        L8_2 = TriggerClientEvent

        L9_2 = "origen_police:client:SetTargets"

        L10_2 = L6_2

        L11_2 = Frecs

        L11_2 = L11_2[A1_2]

        L8_2(L9_2, L10_2, L11_2)

      end

    end

  end

end

SetFreq = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = type

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = nil

  if "table" == L1_2 then

    L3_2 = {}

    L2_2 = L3_2

    L3_2 = pairs

    L4_2 = A0_2

    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

      L2_2[L7_2] = L8_2

    end

  else

    L2_2 = A0_2

  end

  return L2_2

end

Shallowcopy = L0_1

function L0_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2

  if not A3_2 then

    L4_2 = {}

    A3_2 = L4_2

  end

  L4_2 = false

  L5_2 = true

  L6_2 = false

  L7_2 = MultiFrecs

  L7_2 = L7_2[A1_2]

  if not L7_2 then

    L7_2 = MultiFrecs

    L8_2 = {}

    L7_2[A1_2] = L8_2

  end

  L7_2 = pairs

  L8_2 = MultiFrecs

  L8_2 = L8_2[A1_2]

  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

    L13_2 = L12_2[A0_2]

    if L13_2 then

      L13_2 = Shallowcopy

      L14_2 = L12_2[A0_2]

      L13_2 = L13_2(L14_2)

      L14_2 = L12_2[A0_2]

      L14_2 = L14_2.muted

      L15_2 = L12_2[A0_2]

      L5_2 = L15_2.ready

      L4_2 = L14_2

      L12_2[A0_2] = nil

      L6_2 = L11_2

      if "none" == A2_2 then

        L14_2 = MultiFrecs

        L15_2 = MultiFrecs

        L15_2 = L15_2[A1_2]

        if not L15_2 then

          L15_2 = {}

        end

        L14_2[A1_2] = L15_2

        L14_2 = MultiFrecs

        L14_2 = L14_2[A1_2]

        L14_2 = L14_2.entrada

        L14_2[A0_2] = L13_2

      end

      break

    end

  end

  if L6_2 then

    L7_2 = TriggerClientEvent

    L8_2 = "origen_police:client:RemovePlayerMultiFrec"

    L9_2 = A0_2

    L10_2 = A0_2

    L11_2 = L6_2

    L7_2(L8_2, L9_2, L10_2, L11_2)

    L7_2 = pairs

    L8_2 = MultiFrecs

    L8_2 = L8_2[A1_2]

    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

    for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

      L13_2 = pairs

      L14_2 = L12_2

      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)

      for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do

        L19_2 = TriggerClientEvent

        L20_2 = "origen_police:client:RemovePlayerMultiFrec"

        L21_2 = L17_2

        L22_2 = A0_2

        L23_2 = L6_2

        L19_2(L20_2, L21_2, L22_2, L23_2)

      end

    end

    if "entrada" == L6_2 then

      L7_2 = TriggerEvent

      L8_2 = "origen_police:server:PlayerReady"

      L9_2 = A0_2

      L10_2 = true

      L7_2(L8_2, L9_2, L10_2)

    end

  else

    L7_2 = TriggerEvent

    L8_2 = "origen_police:server:PlayerReady"

    L9_2 = A0_2

    L10_2 = true

    L7_2(L8_2, L9_2, L10_2)

  end

  if "none" ~= A2_2 then

    L7_2 = MultiFrecs

    L7_2 = L7_2[A1_2]

    L7_2 = L7_2[A2_2]

    if not L7_2 then

      L7_2 = MultiFrecs

      L7_2 = L7_2[A1_2]

      L8_2 = {}

      L7_2[A2_2] = L8_2

    end

    L7_2 = GetPlayerIcName

    L8_2 = A0_2

    L9_2 = A1_2

    L7_2, L8_2 = L7_2(L8_2, L9_2)

    L9_2 = MultiFrecs

    L9_2 = L9_2[A1_2]

    L9_2 = L9_2[A2_2]

    L10_2 = {}

    L10_2.name = L7_2

    L10_2.muted = L4_2

    L10_2.ready = L5_2

    L10_2.grade = L8_2

    L11_2 = FW_GetPlayer

    L12_2 = A0_2

    L11_2 = L11_2(L12_2)

    if L11_2 then

      L11_2 = L11_2.PlayerData

    end

    L11_2 = L11_2.job

    L11_2 = L11_2.name

    L10_2.job = L11_2

    L9_2[A0_2] = L10_2

    L9_2 = pairs

    L10_2 = A3_2

    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

      L15_2 = MultiFrecs

      L15_2 = L15_2[A1_2]

      L15_2 = L15_2[A2_2]

      L15_2 = L15_2[A0_2]

      L15_2[L13_2] = L14_2

    end

    L9_2 = pairs

    L10_2 = MultiFrecs

    L10_2 = L10_2[A1_2]

    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

      L15_2 = pairs

      L16_2 = L14_2

      L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)

      for L19_2, L20_2 in L15_2, L16_2, L17_2, L18_2 do

        L21_2 = TriggerClientEvent

        L22_2 = "origen_police:client:AddPlayerMultiFrec"

        L23_2 = L19_2

        L24_2 = A0_2

        L25_2 = A2_2

        L26_2 = MultiFrecs

        L26_2 = L26_2[A1_2]

        L26_2 = L26_2[A2_2]

        L26_2 = L26_2[A0_2]

        L21_2(L22_2, L23_2, L24_2, L25_2, L26_2)

      end

    end

  else

    L7_2 = TriggerClientEvent

    L8_2 = "origen_police:client:Disconnected"

    L9_2 = A0_2

    L7_2(L8_2, L9_2)

  end

end

SetMultiFrec = L0_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L3_2 = pairs

  L4_2 = MultiFrecs

  L4_2 = L4_2[A1_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2[A0_2]

    if L9_2 then

      L9_2 = L8_2[A0_2]

      L9_2.muted = A2_2

      break

    end

  end

  L3_2 = pairs

  L4_2 = MultiFrecs

  L4_2 = L4_2[A1_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = pairs

    L10_2 = L8_2

    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

      L15_2 = TriggerClientEvent

      L16_2 = "origen_police:client:SetMuted"

      L17_2 = L13_2

      L18_2 = A0_2

      L19_2 = A2_2

      L15_2(L16_2, L17_2, L18_2, L19_2)

    end

  end

end

MutePlayer = L0_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L3_2 = pairs

  L4_2 = MultiFrecs

  L4_2 = L4_2[A1_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2[A0_2]

    if L9_2 then

      L9_2 = L8_2[A0_2]

      L9_2.ready = A2_2

      break

    end

  end

  L3_2 = pairs

  L4_2 = MultiFrecs

  L4_2 = L4_2[A1_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = pairs

    L10_2 = L8_2

    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

      L15_2 = TriggerClientEvent

      L16_2 = "origen_police:client:SetReady"

      L17_2 = L13_2

      L18_2 = A0_2

      L19_2 = A2_2

      L15_2(L16_2, L17_2, L18_2, L19_2)

    end

  end

  L3_2 = TriggerEvent

  L4_2 = "origen_police:server:PlayerReady"

  L5_2 = A0_2

  L6_2 = A2_2

  L3_2(L4_2, L5_2, L6_2)

end

ReadyPlayer = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if "police" == A1_2 then

    if L2_2 then

      L3_2 = L2_2

      if L3_2 then

        L3_2 = L3_2.PlayerData

      end

      L3_2 = L3_2.charinfo

      L3_2 = L3_2.firstname

      L4_2 = " "

      L5_2 = L2_2

      if L5_2 then

        L5_2 = L5_2.PlayerData

      end

      L5_2 = L5_2.charinfo

      L5_2 = L5_2.lastname

      L6_2 = " ("

      L7_2 = L2_2

      if L7_2 then

        L7_2 = L7_2.PlayerData

      end

      L7_2 = L7_2.metadata

      L7_2 = L7_2.police_badge

      if not L7_2 then

        L7_2 = "0000"

      end

      L8_2 = ")"

      L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2

      if L3_2 then

        goto lbl_38

      end

    end

    L3_2 = GetPlayerName

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    ::lbl_38::

    if L2_2 then

      L4_2 = L2_2

      if L4_2 then

        L4_2 = L4_2.PlayerData

      end

      L4_2 = L4_2.job

      L4_2 = L4_2.grade

      L4_2 = L4_2.name

      if L4_2 then

        goto lbl_50

      end

    end

    L4_2 = "Desempleado"

    ::lbl_50::

    return L3_2, L4_2

  else

    if L2_2 then

      L3_2 = L2_2

      if L3_2 then

        L3_2 = L3_2.PlayerData

      end

      L3_2 = L3_2.charinfo

      L3_2 = L3_2.firstname

      L4_2 = " "

      L5_2 = L2_2

      if L5_2 then

        L5_2 = L5_2.PlayerData

      end

      L5_2 = L5_2.charinfo

      L5_2 = L5_2.lastname

      L3_2 = L3_2 .. L4_2 .. L5_2

      if L3_2 then

        goto lbl_73

      end

    end

    L3_2 = GetPlayerName

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    ::lbl_73::

    L4_2 = ""

    return L3_2, L4_2

  end

end

GetPlayerIcName = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L1_2 = {}

  L2_2 = MultiFrecs

  L2_2 = L2_2[A0_2]

  if not L2_2 then

    return L1_2

  end

  L2_2 = pairs

  L3_2 = MultiFrecs

  L3_2 = L3_2[A0_2]

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = pairs

    L9_2 = L7_2

    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)

    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do

      L14_2 = L13_2.ready

      if L14_2 then

        L1_2[L12_2] = true

      end

    end

  end

  return L1_2

end

GetPlayersReady = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L2_2 = {}

  L3_2 = pairs

  L4_2 = MultiFrecs

  L5_2 = Config

  L5_2 = L5_2.PoliceJobName

  L4_2 = L4_2[L5_2]

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = pairs

    L10_2 = L8_2

    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)

    for L13_2, L14_2 in L9_2, L10_2, L11_2, L12_2 do

      if A1_2 then

        if "entrada" ~= L7_2 then

          L15_2 = L14_2.job

          if L15_2 == A0_2 then

            L15_2 = L14_2.ready

            if L15_2 then

              L2_2[L13_2] = true

            end

          end

        end

      else

        L15_2 = L14_2.job

        if L15_2 == A0_2 then

          L15_2 = L14_2.ready

          if L15_2 then

            L2_2[L13_2] = true

          end

        end

      end

    end

  end

  return L2_2

end

GetPlayersReadyByJob = L0_1

function L0_1(A0_2)

  local L1_2

  L1_2 = MultiFrecs

  L1_2 = L1_2[A0_2]

  return L1_2

end

GetMultiFrecs = L0_1

L0_1 = exports

L1_1 = "GetPlayersReady"

L2_1 = GetPlayersReady

L0_1(L1_1, L2_1)

L0_1 = exports

L1_1 = "GetMultiFrecs"

L2_1 = GetMultiFrecs

L0_1(L1_1, L2_1)

L0_1 = exports

L1_1 = "GetPlayersReadyByJob"

L2_1 = GetPlayersReadyByJob

L0_1(L1_1, L2_1)

