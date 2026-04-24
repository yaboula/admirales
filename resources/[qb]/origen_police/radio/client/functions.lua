local L0_1, L1_1, L2_1, L3_1, L4_1

L0_1 = nil

function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2, A6_2, A7_2, A8_2)

  local L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2

  L9_2 = PlayerPedId

  L9_2 = L9_2()

  L10_2 = table

  L10_2 = L10_2.unpack

  L11_2 = GetEntityCoords

  L12_2 = L9_2

  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L11_2(L12_2)

  L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)

  L13_2 = IsModelValid

  L14_2 = A0_2

  L13_2 = L13_2(L14_2)

  if not L13_2 then

    L13_2 = Debuger

    L14_2 = tostring

    L15_2 = A0_2

    L14_2 = L14_2(L15_2)

    L15_2 = " is not a valid model!"

    L14_2 = L14_2 .. L15_2

    L13_2(L14_2)

    L13_2 = false

    return L13_2

  end

  L13_2 = HasModelLoaded

  L14_2 = A0_2

  L13_2 = L13_2(L14_2)

  if not L13_2 then

    while true do

      L13_2 = HasModelLoaded

      L14_2 = A0_2

      L13_2 = L13_2(L14_2)

      if L13_2 then

        break

      end

      L13_2 = RequestModel

      L14_2 = A0_2

      L13_2(L14_2)

      L13_2 = Wait

      L14_2 = 100

      L13_2(L14_2)

    end

  end

  L13_2 = CreateObject

  L14_2 = joaat

  L15_2 = A0_2

  L14_2 = L14_2(L15_2)

  L15_2 = L10_2

  L16_2 = L11_2

  L17_2 = L12_2 + 0.2

  L18_2 = true

  L19_2 = true

  L20_2 = true

  L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)

  L0_1 = L13_2

  if nil ~= A8_2 then

    L13_2 = SetObjectTextureVariation

    L14_2 = L0_1

    L15_2 = A8_2

    L13_2(L14_2, L15_2)

  end

  L13_2 = AttachEntityToEntity

  L14_2 = L0_1

  L15_2 = L9_2

  L16_2 = GetPedBoneIndex

  L17_2 = L9_2

  L18_2 = A1_2

  L16_2 = L16_2(L17_2, L18_2)

  L17_2 = A2_2

  L18_2 = A3_2

  L19_2 = A4_2

  L20_2 = A5_2

  L21_2 = A6_2

  L22_2 = A7_2

  L23_2 = true

  L24_2 = true

  L25_2 = false

  L26_2 = true

  L27_2 = 1

  L28_2 = true

  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)

  PlayerHasProp = true

  L13_2 = SetModelAsNoLongerNeeded

  L14_2 = A0_2

  L13_2(L14_2)

  L13_2 = true

  return L13_2

end

AddPropToPlayer = L1_1

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L1_2 = Radio

  L1_2 = L1_2.Talking

  if not L1_2 then

    L1_2 = Radio

    L1_2 = L1_2.Enabled

    if L1_2 then

      L1_2 = Radio

      L1_2 = L1_2.MultiFrec

      if "none" ~= L1_2 then

        L1_2 = exports

        L1_2 = L1_2.origen_police

        L2_2 = L1_2

        L1_2 = L1_2.IsHandcuffed

        L1_2 = L1_2(L2_2)

        if not L1_2 then

          goto lbl_20

        end

      end

    end

  end

  do return end

  ::lbl_20::

  if A0_2 then

    L1_2 = Radio

    L1_2 = L1_2.MultiFrec

    if "none" ~= L1_2 then

      L1_2 = Radio

      L1_2 = L1_2.Muted

      if not L1_2 then

        L1_2 = Radio

        L2_2 = {}

        L1_2.Talking = L2_2

        L1_2 = 1

        L2_2 = #A0_2

        L3_2 = 1

        for L4_2 = L1_2, L2_2, L3_2 do

          L5_2 = ParseFrecID

          L6_2 = A0_2[L4_2]

          L5_2 = L5_2(L6_2)

          A0_2[L4_2] = L5_2

          L5_2 = Radio

          L5_2 = L5_2.MultiFrecTargets

          L6_2 = A0_2[L4_2]

          L5_2 = L5_2[L6_2]

          if L5_2 then

            L5_2 = pairs

            L6_2 = Radio

            L6_2 = L6_2.MultiFrecTargets

            L7_2 = A0_2[L4_2]

            L6_2 = L6_2[L7_2]

            L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

            for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

              L11_2 = Radio

              L11_2 = L11_2.Talking

              L11_2[L9_2] = true

            end

          end

        end

    end

  end

  else

    L1_2 = Radio

    L1_2 = L1_2.Frec

    if L1_2 > 0 then

      L1_2 = Radio

      L1_2 = L1_2.Enabled

      if L1_2 then

        L1_2 = Radio

        L1_2 = L1_2.Muted

        if not L1_2 then

          L1_2 = Radio

          L2_2 = Radio

          L2_2 = L2_2.Targets

          L1_2.Talking = L2_2

      end

    end

    else

      L1_2 = Radio

      L1_2 = L1_2.MultiFrec

      if "none" ~= L1_2 then

        L1_2 = Radio

        L1_2 = L1_2.Muted

        if not L1_2 then

          L1_2 = Radio

          L2_2 = Radio

          L2_2 = L2_2.MultiFrecTargets

          L3_2 = Radio

          L3_2 = L3_2.MultiFrec

          L2_2 = L2_2[L3_2]

          L1_2.Talking = L2_2

          L1_2 = pairs

          L2_2 = Radio

          L2_2 = L2_2.Talking

          L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

          for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

            L7_2 = Radio

            L7_2 = L7_2.Talking

            L7_2[L5_2] = true

          end

        end

      end

    end

  end

  L1_2 = CanTalk

  L1_2 = L1_2()

  if not L1_2 then

    return

  end

  L1_2 = Radio

  L1_2 = L1_2.Talking

  if L1_2 then

    L1_2 = Citizen

    L1_2 = L1_2.CreateThread

    function L2_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3

      L0_3 = PlayerTargets

      L1_3 = Radio

      L1_3 = L1_3.Talking

      L2_3 = CurrentFrec

      L0_3(L1_3, L2_3)

      L0_3 = TriggerEvent

      L1_3 = "origen_hud:mostrarRadio"

      L0_3(L1_3)

      L0_3 = TriggerServerEvent

      L1_3 = "origen_police:server:talking"

      L2_3 = Radio

      L2_3 = L2_3.Talking

      L3_3 = true

      L0_3(L1_3, L2_3, L3_3)

      L0_3 = PlayerPedId

      L0_3 = L0_3()

      L1_3 = RadioConfig

      L1_3 = L1_3.Anims

      L2_3 = Radio

      L2_3 = L2_3.Anim

      L1_3 = L1_3[L2_3]

      L1_3 = L1_3.Prop

      if L1_3 then

        L1_3 = RadioConfig

        L1_3 = L1_3.Anims

        L2_3 = Radio

        L2_3 = L2_3.Anim

        L1_3 = L1_3[L2_3]

        L1_3 = L1_3.Prop

        L2_3 = RadioConfig

        L2_3 = L2_3.Anims

        L3_3 = Radio

        L3_3 = L3_3.Anim

        L2_3 = L2_3[L3_3]

        L2_3 = L2_3.PropBone

        L3_3 = table

        L3_3 = L3_3.unpack

        L4_3 = RadioConfig

        L4_3 = L4_3.Anims

        L5_3 = Radio

        L5_3 = L5_3.Anim

        L4_3 = L4_3[L5_3]

        L4_3 = L4_3.PropPlacement

        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3 = L3_3(L4_3)

        L9_3 = AddPropToPlayer

        L10_3 = L1_3

        L11_3 = L2_3

        L12_3 = L3_3

        L13_3 = L4_3

        L14_3 = L5_3

        L15_3 = L6_3

        L16_3 = L7_3

        L17_3 = L8_3

        L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

        if not L9_3 then

          return

        end

      end

      L1_3 = TaskPlayAnim

      L2_3 = L0_3

      L3_3 = RadioConfig

      L3_3 = L3_3.Anims

      L4_3 = Radio

      L4_3 = L4_3.Anim

      L3_3 = L3_3[L4_3]

      L3_3 = L3_3.Dict

      L4_3 = RadioConfig

      L4_3 = L4_3.Anims

      L5_3 = Radio

      L5_3 = L5_3.Anim

      L4_3 = L4_3[L5_3]

      L4_3 = L4_3.Anim

      L5_3 = 4.0

      L6_3 = 8.0

      L7_3 = -1

      L8_3 = 49

      L9_3 = 0

      L10_3 = 0

      L11_3 = 0

      L12_3 = 0

      L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

      L1_3 = Radio

      L1_3 = L1_3.Clicks

      if L1_3 then

        L1_3 = SendNUIMessage

        L2_3 = {}

        L2_3.startTalkSound = true

        L1_3(L2_3)

      end

      while true do

        L1_3 = Radio

        L1_3 = L1_3.Talking

        if not L1_3 then

          break

        end

        L1_3 = Wait

        L2_3 = 0

        L1_3(L2_3)

        L1_3 = CanTalk

        L1_3 = L1_3()

        if not L1_3 then

          L1_3 = StopTalkRadio

          L1_3()

          break

        end

        L1_3 = SetControlNormal

        L2_3 = 0

        L3_3 = 249

        L4_3 = 1.0

        L1_3(L2_3, L3_3, L4_3)

        L1_3 = SetControlNormal

        L2_3 = 1

        L3_3 = 249

        L4_3 = 1.0

        L1_3(L2_3, L3_3, L4_3)

        L1_3 = SetControlNormal

        L2_3 = 2

        L3_3 = 249

        L4_3 = 1.0

        L1_3(L2_3, L3_3, L4_3)

      end

    end

    L1_2(L2_2)

  end

end

StartTalkRadio = L1_1

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2

  L0_2 = Radio

  L0_2 = L0_2.Talking

  if not L0_2 then

    return

  end

  L0_2 = TriggerServerEvent

  L1_2 = "origen_police:server:talking"

  L2_2 = Radio

  L2_2 = L2_2.Talking

  L3_2 = false

  L0_2(L1_2, L2_2, L3_2)

  L0_2 = Radio

  L0_2.Talking = false

  L0_2 = MumbleClearVoiceTargetPlayers

  L1_2 = 1

  L0_2(L1_2)

  L0_2 = PlayerTargets

  L0_2()

  L0_2 = DoesEntityExist

  L1_2 = L0_1

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L0_2 = DeleteEntity

    L1_2 = L0_1

    L0_2(L1_2)

  end

  L0_2 = StopAnimTask

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = RadioConfig

  L2_2 = L2_2.Anims

  L3_2 = Radio

  L3_2 = L3_2.Anim

  L2_2 = L2_2[L3_2]

  L2_2 = L2_2.Dict

  L3_2 = RadioConfig

  L3_2 = L3_2.Anims

  L4_2 = Radio

  L4_2 = L4_2.Anim

  L3_2 = L3_2[L4_2]

  L3_2 = L3_2.Anim

  L4_2 = 3.0

  L0_2(L1_2, L2_2, L3_2, L4_2)

  L0_2 = TriggerEvent

  L1_2 = "origen_hud:ocultarRadio"

  L0_2(L1_2)

end

StopTalkRadio = L1_1

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  if not A0_2 then

    L2_2 = nil

    return L2_2

  end

  L3_2 = A1_2

  L2_2 = A1_2.match

  L4_2 = "%."

  L2_2 = L2_2(L3_2, L4_2)

  if not L2_2 then

    L2_2 = A0_2[A1_2]

    return L2_2

  end

  L3_2 = A1_2

  L2_2 = A1_2.match

  L4_2 = "([^%.]+)%.(.+)"

  L2_2, L3_2 = L2_2(L3_2, L4_2)

  L4_2 = type

  L5_2 = A0_2[L2_2]

  L4_2 = L4_2(L5_2)

  if "table" == L4_2 then

    L4_2 = A0_2[L2_2]

    L4_2 = L4_2[L3_2]

    if L4_2 then

      goto lbl_25

    end

  end

  L4_2 = A0_2[A1_2]

  ::lbl_25::

  return L4_2

end

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  if not A0_2 then

    L1_2 = FW_GetPlayerData

    L2_2 = true

    L1_2 = L1_2(L2_2)

    A0_2 = L1_2

  end

  while true do

    L1_2 = A0_2.citizenid

    if L1_2 then

      break

    end

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 500

    L1_2(L2_2)

    L1_2 = FW_GetPlayerData

    L2_2 = true

    L1_2 = L1_2(L2_2)

    A0_2 = L1_2

  end

  L1_2 = A0_2.metadata

  L1_2 = L1_2["radio_police.anim"]

  if L1_2 then

    L1_2 = Radio

    L2_2 = L1_1

    L3_2 = A0_2.metadata

    L4_2 = "radio_police.anim"

    L2_2 = L2_2(L3_2, L4_2)

    L1_2.Anim = L2_2

  end

  L1_2 = A0_2.metadata

  L1_2 = L1_2["radio_police.clicks"]

  if L1_2 then

    L1_2 = Radio

    L2_2 = L1_1

    L3_2 = A0_2.metadata

    L4_2 = "radio_police.clicks"

    L2_2 = L2_2(L3_2, L4_2)

    L1_2.Clicks = L2_2

  end

  L1_2 = A0_2.metadata

  L1_2 = L1_2["radio_police.binds"]

  if L1_2 then

    L1_2 = Radio

    L2_2 = L1_1

    L3_2 = A0_2.metadata

    L4_2 = "radio_police.binds"

    L2_2 = L2_2(L3_2, L4_2)

    L1_2.Binds = L2_2

  end

  L1_2 = RadioConfig

  L1_2 = L1_2.Anims

  L2_2 = Radio

  L2_2 = L2_2.Anim

  L1_2 = L1_2[L2_2]

  if L1_2 then

    L1_2 = RequestAnimDict

    L2_2 = RadioConfig

    L2_2 = L2_2.Anims

    L3_2 = Radio

    L3_2 = L3_2.Anim

    L2_2 = L2_2[L3_2]

    L2_2 = L2_2.Dict

    L1_2(L2_2)

  end

end

LoadPlayer = L2_1

function L2_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = {}

  L0_2.Enabled = false

  L0_2.Frec = 0

  L0_2.Anim = 1

  L1_2 = {}

  L0_2.Targets = L1_2

  L0_2.Talking = false

  L0_2.MultiGroup = "none"

  L0_2.MultiFrec = "none"

  L1_2 = {}

  L0_2.MultiFrecTargets = L1_2

  L0_2.Clicks = true

  L1_2 = {}

  L0_2.Binds = L1_2

  L0_2.Muted = false

  Radio = L0_2

  L0_2 = TriggerServerEvent

  L1_2 = "origen_police:server:SetFreq"

  L2_2 = Radio

  L2_2 = L2_2.Frec

  L0_2(L1_2, L2_2)

  L0_2 = TriggerServerEvent

  L1_2 = "origen_police:server:SetMultiFrec"

  L2_2 = Radio

  L2_2 = L2_2.MultiGroup

  L3_2 = Radio

  L3_2 = L3_2.MultiFrec

  L0_2(L1_2, L2_2, L3_2)

end

UnLoadPlayer = L2_1

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:SetMetaData"

  L4_2 = A0_2

  L5_2 = A1_2

  L2_2(L3_2, L4_2, L5_2)

end

SetPlayerConfig = L2_1

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  if "mute" == A0_2 then

    L1_2 = ToggleMute

    L1_2()

    L1_2 = TriggerServerEvent

    L2_2 = "origen_police:server:Mute"

    L3_2 = Radio

    L3_2 = L3_2.MultiGroup

    L4_2 = Radio

    L4_2 = L4_2.Muted

    L1_2(L2_2, L3_2, L4_2)

  end

end

DoAction = L2_1

L2_1 = RegisterNUICallback

L3_1 = "StartTalkRadio"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = StartTalkRadio

  L3_2 = A0_2

  L2_2(L3_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNUICallback

L3_1 = "StopTalkRadio"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = StopTalkRadio

  L2_2()

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L2_1(L3_1, L4_1)

