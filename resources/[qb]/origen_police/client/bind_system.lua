local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:OnPlayerLoaded"

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  while true do

    L1_2 = L0_2.citizenid

    if L1_2 then

      break

    end

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = FW_GetPlayerData

    L2_2 = true

    L1_2 = L1_2(L2_2)

    L0_2 = L1_2

  end

  L1_2 = L0_2.metadata

  L1_2 = L1_2.custom_police_keybind

  if not L1_2 then

    L1_2 = {}

  end

  L0_1 = L1_2

  L1_2 = LoadBinds

  L1_2()

end

L1_1(L2_1, L3_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L1_2 = L0_2.citizenid

    if L1_2 then

      L1_2 = L0_2.metadata

      L1_2 = L1_2.custom_police_keybind

      if not L1_2 then

        L1_2 = {}

      end

      L0_1 = L1_2

      L1_2 = LoadBinds

      L1_2()

    end

  end

end

L1_1(L2_1)

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = pairs

  L1_2 = L0_1

  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

    L6_2 = AddKeyBind

    L7_2 = L4_2

    L8_2 = L5_2

    L6_2(L7_2, L8_2)

  end

end

LoadBinds = L1_1

L1_1 = RegisterCommand

L2_1 = "custom_police_keybind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A1_2[1]

  if L2_2 then

    L3_2 = A1_2[1]

    L2_2 = L0_1

    L2_2 = L2_2[L3_2]

    if L2_2 then

      L2_2 = TriggerEvent

      L4_2 = A1_2[1]

      L3_2 = L0_1

      L3_2 = L3_2[L4_2]

      L2_2(L3_2)

    end

  end

end

L1_1(L2_1, L3_1)

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = RegisterKeyMapping

  L3_2 = "custom_police_keybind "

  L4_2 = A0_2

  L3_2 = L3_2 .. L4_2

  L4_2 = "custom_police_keybind "

  L5_2 = A0_2

  L4_2 = L4_2 .. L5_2

  L5_2 = "keyboard"

  L6_2 = A0_2

  L2_2(L3_2, L4_2, L5_2, L6_2)

  L2_2 = type

  L3_2 = L0_1

  L2_2 = L2_2(L3_2)

  if "table" ~= L2_2 then

    return

  end

  L2_2 = pairs

  L3_2 = L0_1

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    if A1_2 == L7_2 then

      L8_2 = L0_1

      L8_2[L6_2] = nil

      break

    end

  end

  L2_2 = L0_1

  L2_2[A0_2] = A1_2

  L2_2 = SetPlayerConfig

  L3_2 = "custom_police_keybind"

  L4_2 = L0_1

  L2_2(L3_2, L4_2)

end

AddKeyBind = L1_1

function L1_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = L0_1

  L1_2[A0_2] = nil

  L1_2 = SetPlayerConfig

  L2_2 = "custom_police_keybind"

  L3_2 = L0_1

  L1_2(L2_2, L3_2)

end

RemoveKeyBind = L1_1

function L1_1()

  local L0_2, L1_2

  L0_2 = L0_1

  return L0_2

end

GetKeyBinds = L1_1

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = type

  L3_2 = L0_1

  L2_2 = L2_2(L3_2)

  if "table" ~= L2_2 then

    return

  end

  L2_2 = pairs

  L3_2 = L0_1

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    if A1_2 == L7_2 then

      return

    end

  end

  L2_2 = AddKeyBind

  L3_2 = A0_2

  L4_2 = A1_2

  L2_2(L3_2, L4_2)

end

SetDefaultBind = L1_1

L1_1 = exports

L2_1 = "AddKeyBind"

L3_1 = AddKeyBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetDefaultBind"

L3_1 = SetDefaultBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "RemoveKeyBind"

L3_1 = RemoveKeyBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "GetKeyBinds"

L3_1 = GetKeyBinds

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "AddKeyBind"

L3_1 = AddKeyBind

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "SetDefaultBind"

L3_1 = SetDefaultBind

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "RemoveKeyBind"

L3_1 = RemoveKeyBind

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "GetKeyBinds"

function L3_1(A0_2)

  local L1_2, L2_2

  L1_2 = A0_2

  L2_2 = GetKeyBinds

  L2_2 = L2_2()

  L1_2(L2_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "AddKeyBind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = AddKeyBind

  L3_2 = table

  L3_2 = L3_2.unpack

  L4_2 = A0_2

  L3_2, L4_2 = L3_2(L4_2)

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "SetDefaultBind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetDefaultBind

  L3_2 = table

  L3_2 = L3_2.unpack

  L4_2 = A0_2

  L3_2, L4_2 = L3_2(L4_2)

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "RemoveKeyBind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RemoveKeyBind

  L3_2 = table

  L3_2 = L3_2.unpack

  L4_2 = A0_2

  L3_2, L4_2 = L3_2(L4_2)

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "GetKeyBinds"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = GetKeyBinds

  L3_2 = L3_2()

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

