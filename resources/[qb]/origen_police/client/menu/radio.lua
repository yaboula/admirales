local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:AddPlayerMultiFrec"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = SendNUIMessage

  L4_2 = {}

  L4_2.radioMenu = "AddPlayerMultiFrec"

  L4_2.id = A0_2

  L4_2.frec = A1_2

  L4_2.data = A2_2

  L5_2 = GetPlayerServerId

  L6_2 = PlayerId

  L6_2 = L6_2()

  L5_2 = L5_2(L6_2)

  L5_2 = A0_2 == L5_2

  L4_2.i = L5_2

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:Disconnected"

function L2_1()

  local L0_2, L1_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.radioMenu = "Disconnected"

  L0_2(L1_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:talking"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radioMenu = "Talking"

  L3_2.target = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:RemovePlayerMultiFrec"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radioMenu = "RemovePlayerMultiFrec"

  L3_2.id = A0_2

  L3_2.frec = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SetMuted"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radioMenu = "SetMuted"

  L3_2.id = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SetReady"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radioMenu = "SetReady"

  L3_2.id = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "LoadFrecList"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = A1_2

  L3_2 = {}

  L4_2 = exports

  L4_2 = L4_2.origen_police

  L5_2 = L4_2

  L4_2 = L4_2.GetPoliceRadioChannels

  L4_2 = L4_2(L5_2)

  L3_2.freq = L4_2

  L4_2 = exports

  L4_2 = L4_2.origen_police

  L5_2 = L4_2

  L4_2 = L4_2.GetPoliceRadioButtons

  L4_2 = L4_2(L5_2)

  L3_2.buttons = L4_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "LoadRadioBinds"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = A1_2

  L3_2 = {}

  L4_2 = exports

  L4_2 = L4_2.origen_police

  L5_2 = L4_2

  L4_2 = L4_2.GetPoliceRadioBinds

  L4_2 = L4_2(L5_2)

  L3_2.binds = L4_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

