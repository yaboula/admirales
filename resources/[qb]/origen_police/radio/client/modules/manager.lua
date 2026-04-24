local L0_1, L1_1, L2_1, L3_1

CurrentFrec = nil

function L0_1(A0_2)

  local L1_2, L2_2, L3_2

  if nil ~= A0_2 then

    L1_2 = Radio

    L1_2.Enabled = A0_2

  else

    L1_2 = Radio

    L2_2 = Radio

    L2_2 = L2_2.Enabled

    L2_2 = not L2_2

    L1_2.Enabled = L2_2

  end

  L1_2 = Radio

  L1_2 = L1_2.Enabled

  if not L1_2 then

    L1_2 = TriggerEvent

    L2_2 = "origen_police:client:CloseRadioTab"

    L1_2(L2_2)

  end

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "status"

  L3_2 = Radio

  L3_2 = L3_2.Enabled

  L2_2.status = L3_2

  L1_2(L2_2)

end

Toggle = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = Radio

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = 0

  end

  L1_2.Frec = L2_2

  L1_2 = TriggerServerEvent

  L2_2 = "origen_police:server:SetFreq"

  L3_2 = Radio

  L3_2 = L3_2.Frec

  L1_2(L2_2, L3_2)

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "set_freq"

  L3_2 = Radio

  L3_2 = L3_2.Frec

  L2_2.new_freq = L3_2

  L1_2(L2_2)

end

SetFreq = L0_1

function L0_1(A0_2)

  local L1_2, L2_2

  L1_2 = Radio

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = {}

  end

  L1_2.Targets = L2_2

end

SetTargets = L0_1

function L0_1(A0_2)

  local L1_2

  L1_2 = Radio

  L1_2 = L1_2.Targets

  L1_2[A0_2] = true

end

AddPlayerTarget = L0_1

function L0_1(A0_2)

  local L1_2

  L1_2 = Radio

  L1_2 = L1_2.Targets

  L1_2[A0_2] = nil

end

RemovePlayerTarget = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  if not A0_2 then

    L2_2 = Config

    A0_2 = L2_2.PoliceJobName

  end

  L2_2 = Radio

  L3_2 = A0_2 or L3_2

  if not A0_2 then

    L3_2 = "none"

  end

  L2_2.MultiGroup = L3_2

  L2_2 = Radio

  L3_2 = A1_2 or L3_2

  if not A1_2 then

    L3_2 = "none"

  end

  L2_2.MultiFrec = L3_2

  CurrentFrec = A1_2

  L2_2 = FW_GetPlayerData

  L3_2 = true

  L2_2 = L2_2(L3_2)

  L3_2 = {}

  if L2_2 then

    L4_2 = L2_2.metadata

    if L4_2 then

      L4_2 = L2_2.metadata

      L4_2 = L4_2.divisions

      if L4_2 then

        L4_2 = pairs

        L5_2 = L2_2.metadata

        L5_2 = L5_2.divisions

        L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

        for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

          L10_2 = #L3_2

          L10_2 = L10_2 + 1

          L11_2 = Translations

          L11_2 = L11_2.DivisionsData

          L11_2 = L11_2[L8_2]

          if L11_2 then

            L11_2 = Translations

            L11_2 = L11_2.DivisionsData

            L11_2 = L11_2[L8_2]

            L11_2 = L11_2.icon

            if L11_2 then

              goto lbl_50

            end

          end

          L11_2 = nil

          ::lbl_50::

          L3_2[L10_2] = L11_2

        end

      end

    end

  end

  L4_2 = TriggerServerEvent

  L5_2 = "origen_police:server:SetMultiFrec"

  L6_2 = Radio

  L6_2 = L6_2.MultiGroup

  L7_2 = Radio

  L7_2 = L7_2.MultiFrec

  L8_2 = {}

  L8_2.divisions = L3_2

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

SetMultiFrec = L0_1

function L0_1(A0_2)

  local L1_2, L2_2

  L1_2 = Radio

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = {}

  end

  L1_2.MultiFrecTargets = L2_2

end

SetMultiFrecTargets = L0_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = pairs

  L4_2 = Radio

  L4_2 = L4_2.MultiFrecTargets

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2[A0_2]

    if L9_2 then

      L8_2[A0_2] = nil

      break

    end

  end

  L3_2 = Radio

  L3_2 = L3_2.MultiFrecTargets

  L3_2 = L3_2[A1_2]

  if not L3_2 then

    L3_2 = Radio

    L3_2 = L3_2.MultiFrecTargets

    L4_2 = {}

    L3_2[A1_2] = L4_2

  end

  L3_2 = Radio

  L3_2 = L3_2.MultiFrecTargets

  L3_2 = L3_2[A1_2]

  L4_2 = A2_2 or L4_2

  if not A2_2 then

    L4_2 = true

  end

  L3_2[A0_2] = L4_2

end

AddPlayerMultiFrec = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  if A1_2 then

    L2_2 = Radio

    L2_2 = L2_2.MultiFrecTargets

    L2_2 = L2_2[A1_2]

    if L2_2 then

      L2_2 = Radio

      L2_2 = L2_2.MultiFrecTargets

      L2_2 = L2_2[A1_2]

      L2_2[A0_2] = nil

  end

  else

    L2_2 = pairs

    L3_2 = Radio

    L3_2 = L3_2.MultiFrecTargets

    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

      L8_2 = L7_2[A0_2]

      if L8_2 then

        L7_2[A0_2] = nil

        break

      end

    end

  end

end

RemovePlayerMultiFrec = L0_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = tonumber

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  A0_2 = L3_2

  L3_2 = RemovePlayerMultiFrec

  L4_2 = A0_2

  L3_2(L4_2)

  L3_2 = AddPlayerMultiFrec

  L4_2 = A0_2

  L5_2 = A2_2

  L3_2(L4_2, L5_2)

  L3_2 = TriggerServerEvent

  L4_2 = "origen_police:server:moveplayer"

  L5_2 = A0_2

  L6_2 = A1_2

  L7_2 = A2_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

end

MovePlayerMultiFrec = L0_1

function L0_1(A0_2)

  local L1_2, L2_2

  if nil ~= A0_2 then

    L1_2 = Radio

    L1_2.Muted = A0_2

  else

    L1_2 = Radio

    L2_2 = Radio

    L2_2 = L2_2.Muted

    L2_2 = not L2_2

    L1_2.Muted = L2_2

  end

end

ToggleMute = L0_1

function L0_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = pairs

  L3_2 = Radio

  L3_2 = L3_2.MultiFrecTargets

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = L7_2[A0_2]

    if L8_2 then

      L8_2 = L7_2[A0_2]

      L8_2.muted = A1_2

      break

    end

  end

end

SetMuted = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = Radio

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = 1

  end

  L1_2.Anim = L2_2

  L1_2 = RequestAnimDict

  L2_2 = RadioConfig

  L2_2 = L2_2.Anims

  L3_2 = Radio

  L3_2 = L3_2.Anim

  L2_2 = L2_2[L3_2]

  L2_2 = L2_2.Dict

  L1_2(L2_2)

  L1_2 = SetPlayerConfig

  L2_2 = "radio_police.anim"

  L3_2 = Radio

  L3_2 = L3_2.Anim

  L1_2(L2_2, L3_2)

end

SetAnim = L0_1

L0_1 = 1

L1_1 = RegisterCommand

L2_1 = Config

L2_1 = L2_1.Commands

L2_1 = L2_1.ChangeRadioAnim

L2_1 = L2_1.cmd

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = L0_1

  L0_2 = L0_2 + 1

  L0_1 = L0_2

  L0_2 = L0_1

  L1_2 = GetTableLength

  L2_2 = RadioConfig

  L2_2 = L2_2.Anims

  L1_2 = L1_2(L2_2)

  if L0_2 > L1_2 then

    L0_2 = 1

    L0_1 = L0_2

  end

  L0_2 = SetAnim

  L1_2 = L0_1

  L0_2(L1_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "SetRadioAnim"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = RadioConfig

  L2_2 = L2_2.Anims

  L3_2 = A0_2.anim

  L2_2 = L2_2[L3_2]

  if not L2_2 then

    L2_2 = print

    L3_2 = "INVALID RADIO ANIM, CHECK THE AMOUNT OF ANIMS IN RADIO CONFIG"

    L2_2(L3_2)

    return

  end

  L2_2 = SetAnim

  L3_2 = A0_2.anim

  L2_2(L3_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = Radio

  L1_2.Clicks = A0_2

  L1_2 = SetPlayerConfig

  L2_2 = "radio_police.clicks"

  L3_2 = Radio

  L3_2 = L3_2.Clicks

  L1_2(L2_2, L3_2)

end

ToggleClicks = L1_1

function L1_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = RegisterKeyMapping

  L4_2 = "+r_police_keybind "

  L5_2 = A1_2

  L4_2 = L4_2 .. L5_2

  L5_2 = ""

  L6_2 = A0_2

  L7_2 = A1_2

  L3_2(L4_2, L5_2, L6_2, L7_2)

  L3_2 = pairs

  L4_2 = Radio

  L4_2 = L4_2.Binds

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    if A2_2 == L8_2 then

      L9_2 = Radio

      L9_2 = L9_2.Binds

      L9_2[L7_2] = nil

      break

    end

  end

  L3_2 = Radio

  L3_2 = L3_2.Binds

  L3_2[A1_2] = A2_2

  L3_2 = SetPlayerConfig

  L4_2 = "radio_police.binds"

  L5_2 = Radio

  L5_2 = L5_2.Binds

  L3_2(L4_2, L5_2)

end

RadioAddKeyBind = L1_1

function L1_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = Radio

  L1_2 = L1_2.Binds

  L1_2[A0_2] = nil

  L1_2 = SetPlayerConfig

  L2_2 = "radio_police.binds"

  L3_2 = Radio

  L3_2 = L3_2.Binds

  L1_2(L2_2, L3_2)

end

RadioRemoveKeyBind = L1_1

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:Toggle"

L3_1 = Toggle

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetFreq"

L3_1 = SetFreq

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetTargets"

L3_1 = SetTargets

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:AddPlayerTarget"

L3_1 = AddPlayerTarget

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:RemovePlayerTarget"

L3_1 = RemovePlayerTarget

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetMultiFrec"

L3_1 = SetMultiFrec

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetMultiFrecTargets"

L3_1 = SetMultiFrecTargets

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:AddPlayerMultiFrec"

L3_1 = AddPlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:RemovePlayerMultiFrec"

L3_1 = RemovePlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:MovePlayerMultiFrec"

L3_1 = MovePlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetMuted"

L3_1 = SetMuted

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:SetAnim"

L3_1 = SetAnim

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:ToggleClicks"

L3_1 = ToggleClicks

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:RadioAddKeyBind"

L3_1 = RadioAddKeyBind

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:RadioRemoveKeyBind"

L3_1 = RadioRemoveKeyBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "Toggle"

L3_1 = Toggle

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetFreq"

L3_1 = SetFreq

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetTargets"

L3_1 = SetTargets

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "AddPlayerTarget"

L3_1 = AddPlayerTarget

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "RemovePlayerTarget"

L3_1 = RemovePlayerTarget

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetMultiFrec"

L3_1 = SetMultiFrec

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetMultiFrecTargets"

L3_1 = SetMultiFrecTargets

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "AddPlayerMultiFrec"

L3_1 = AddPlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "RemovePlayerMultiFrec"

L3_1 = RemovePlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "MovePlayerMultiFrec"

L3_1 = MovePlayerMultiFrec

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetMuted"

L3_1 = SetMuted

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetAnim"

L3_1 = SetAnim

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "ToggleClicks"

L3_1 = ToggleClicks

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "RadioAddKeyBind"

L3_1 = RadioAddKeyBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "RadioRemoveKeyBind"

L3_1 = RadioRemoveKeyBind

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "GetCurrentFrequencyName"

function L3_1()

  local L0_2, L1_2

  L0_2 = CurrentFrec

  if not L0_2 then

    L0_2 = "none"

  end

  return L0_2

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "Toggle"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = Toggle

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

L2_1 = "SetFreq"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetFreq

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

L2_1 = "SetTargets"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetTargets

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

L2_1 = "AddPlayerTarget"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = AddPlayerTarget

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

L2_1 = "RemovePlayerTarget"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RemovePlayerTarget

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

L2_1 = "SetMultiFrec"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetMultiFrec

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

L2_1 = "SetMultiFrecTargets"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetMultiFrecTargets

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

L2_1 = "AddPlayerMultiFrec"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = AddPlayerMultiFrec

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

L2_1 = "RemovePlayerMultiFrec"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RemovePlayerMultiFrec

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

L2_1 = "MovePlayerMultiFrec"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = MovePlayerMultiFrec

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

L2_1 = "SetMuted"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetMuted

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

L2_1 = "SetAnim"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetAnim

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

L2_1 = "ToggleClicks"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = ToggleClicks

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

L2_1 = "RadioAddKeyBind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RadioAddKeyBind

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

L2_1 = "RadioRemoveKeyBind"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = RadioRemoveKeyBind

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

L1_1 = exports

L2_1 = "GetMultiFrec"

function L3_1()

  local L0_2, L1_2

  L0_2 = Radio

  L0_2 = L0_2.MultiFrec

  return L0_2

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "GetBinds"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = Radio

  L3_2 = L3_2.Binds

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

