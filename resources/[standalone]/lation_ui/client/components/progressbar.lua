local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1

L0_1 = nil

L1_1 = DisableControlAction

L2_1 = DisablePlayerFiring

L3_1 = LocalPlayer

L3_1 = L3_1.state

L4_1 = {}

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L2_2 = RequestModel

  L3_2 = A1_2.model

  L2_2(L3_2)

  while true do

    L2_2 = HasModelLoaded

    L3_2 = A1_2.model

    L2_2 = L2_2(L3_2)

    if L2_2 then

      break

    end

    L2_2 = Wait

    L3_2 = 1

    L2_2(L3_2)

  end

  L2_2 = GetEntityCoords

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L3_2 = CreateObject

  L4_2 = A1_2.model

  L5_2 = L2_2.x

  L6_2 = L2_2.y

  L7_2 = L2_2.z

  L8_2 = false

  L9_2 = false

  L10_2 = false

  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

  L4_2 = AttachEntityToEntity

  L5_2 = L3_2

  L6_2 = A0_2

  L7_2 = GetPedBoneIndex

  L8_2 = A0_2

  L9_2 = A1_2.bone

  if not L9_2 then

    L9_2 = 60309

  end

  L7_2 = L7_2(L8_2, L9_2)

  L8_2 = A1_2.pos

  L8_2 = L8_2.x

  L9_2 = A1_2.pos

  L9_2 = L9_2.y

  L10_2 = A1_2.pos

  L10_2 = L10_2.z

  L11_2 = A1_2.rot

  L11_2 = L11_2.x

  L12_2 = A1_2.rot

  L12_2 = L12_2.y

  L13_2 = A1_2.rot

  L13_2 = L13_2.z

  L14_2 = true

  L15_2 = true

  L16_2 = false

  L17_2 = true

  L18_2 = A1_2.rotOrder

  if not L18_2 then

    L18_2 = 0

  end

  L19_2 = true

  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

  L4_2 = SetModelAsNoLongerNeeded

  L5_2 = A1_2.model

  L4_2(L5_2)

  return L3_2

end

function L6_1(A0_2)

  local L1_2, L2_2

  L1_2 = A0_2.useWhileDead

  if not L1_2 then

    L1_2 = IsEntityDead

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L1_2 = true

      return L1_2

    end

  end

  L1_2 = A0_2.allowRagdoll

  if not L1_2 then

    L1_2 = IsPedRagdoll

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L1_2 = true

      return L1_2

    end

  end

  L1_2 = A0_2.allowCuffed

  if not L1_2 then

    L1_2 = IsPedCuffed

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L1_2 = true

      return L1_2

    end

  end

  L1_2 = A0_2.allowFalling

  if not L1_2 then

    L1_2 = IsPedFalling

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L1_2 = true

      return L1_2

    end

  end

  L1_2 = A0_2.allowSwimming

  if not L1_2 then

    L1_2 = IsPedSwimming

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L1_2 = true

      return L1_2

    end

  end

  L1_2 = false

  return L1_2

end

function L7_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L3_1.invBusy = true

  L3_1.inv_busy = true

  L0_1 = A0_2

  L1_2 = A0_2.anim

  if L1_2 then

    L2_2 = L1_2.dict

    if L2_2 then

      L2_2 = RequestAnimDict

      L3_2 = L1_2.dict

      L2_2(L3_2)

      while true do

        L2_2 = HasAnimDictLoaded

        L3_2 = L1_2.dict

        L2_2 = L2_2(L3_2)

        if L2_2 then

          break

        end

        L2_2 = Wait

        L3_2 = 1

        L2_2(L3_2)

      end

      L2_2 = TaskPlayAnim

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = L1_2.dict

      L5_2 = L1_2.clip

      L6_2 = L1_2.blendIn

      if not L6_2 then

        L6_2 = 3.0

      end

      L7_2 = L1_2.blendOut

      if not L7_2 then

        L7_2 = 1.0

      end

      L8_2 = L1_2.duration

      if not L8_2 then

        L8_2 = -1

      end

      L9_2 = L1_2.flag

      if not L9_2 then

        L9_2 = 49

      end

      L10_2 = L1_2.playbackRate

      if not L10_2 then

        L10_2 = 0

      end

      L11_2 = L1_2.lockX

      L12_2 = L1_2.lockY

      L13_2 = L1_2.lockZ

      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

      L2_2 = RemoveAnimDict

      L3_2 = L1_2.dict

      L2_2(L3_2)

    else

      L2_2 = L1_2.scenario

      if L2_2 then

        L2_2 = TaskStartScenarioInPlace

        L3_2 = PlayerPedId

        L3_2 = L3_2()

        L4_2 = L1_2.scenario

        L5_2 = 0

        L6_2 = L1_2.playEnter

        L6_2 = nil == L6_2 or L6_2

        L2_2(L3_2, L4_2, L5_2, L6_2)

      end

    end

  end

  L2_2 = A0_2.prop

  if L2_2 then

    L2_2 = L3_1

    L3_2 = L2_2

    L2_2 = L2_2.set

    L4_2 = "lation_ui:progressProps"

    L5_2 = A0_2.prop

    L6_2 = true

    L2_2(L3_2, L4_2, L5_2, L6_2)

  end

  L2_2 = A0_2.disable

  L3_2 = GetGameTimer

  L3_2 = L3_2()

  while true do

    L4_2 = L0_1

    if not L4_2 then

      break

    end

    L4_2 = L0_1

    if false == L4_2 then

      break

    end

    L4_2 = GetGameTimer

    L4_2 = L4_2()

    L4_2 = L4_2 - L3_2

    L5_2 = A0_2.duration

    if L4_2 >= L5_2 then

      break

    end

    L5_2 = L0_1

    if false == L5_2 then

      break

    end

    if L2_2 then

      L5_2 = L2_2.mouse

      if L5_2 then

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 1

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 2

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 106

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

      end

      L5_2 = L2_2.move

      if L5_2 then

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 21

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 30

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 31

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 36

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

      end

      L5_2 = L2_2.sprint

      if L5_2 then

        L5_2 = L2_2.move

        if not L5_2 then

          L5_2 = L1_1

          L6_2 = 0

          L7_2 = 21

          L8_2 = true

          L5_2(L6_2, L7_2, L8_2)

        end

      end

      L5_2 = L2_2.car

      if L5_2 then

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 63

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 64

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 71

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 72

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 75

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

      end

      L5_2 = L2_2.combat

      if L5_2 then

        L5_2 = L1_1

        L6_2 = 0

        L7_2 = 25

        L8_2 = true

        L5_2(L6_2, L7_2, L8_2)

        L5_2 = L2_1

        L6_2 = PlayerId

        L6_2 = L6_2()

        L7_2 = true

        L5_2(L6_2, L7_2)

      end

    end

    L5_2 = L6_1

    L6_2 = L0_1

    L5_2 = L5_2(L6_2)

    if L5_2 then

      L5_2 = false

      L0_1 = L5_2

      break

    end

    L5_2 = Wait

    L6_2 = 0

    L5_2(L6_2)

  end

  L4_2 = A0_2.prop

  if L4_2 then

    L4_2 = L3_1

    L5_2 = L4_2

    L4_2 = L4_2.set

    L6_2 = "lation_ui:progressProps"

    L7_2 = nil

    L8_2 = true

    L4_2(L5_2, L6_2, L7_2, L8_2)

  end

  if L1_2 then

    L4_2 = L1_2.dict

    if L4_2 then

      L4_2 = StopAnimTask

      L5_2 = PlayerPedId

      L5_2 = L5_2()

      L6_2 = L1_2.dict

      L7_2 = L1_2.clip

      L8_2 = 1.0

      L4_2(L5_2, L6_2, L7_2, L8_2)

      L4_2 = Wait

      L5_2 = 0

      L4_2(L5_2)

    else

      L4_2 = ClearPedTasks

      L5_2 = PlayerPedId

      L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2()

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    end

  end

  L3_1.invBusy = false

  L3_1.inv_busy = false

  L4_2 = L0_1

  L4_2 = false == L4_2

  L5_2 = nil

  L0_1 = L5_2

  if L4_2 then

    L5_2 = SendNUIMessage

    L6_2 = {}

    L6_2.action = "progressCancel"

    L5_2(L6_2)

    L5_2 = false

    return L5_2

  end

  L5_2 = true

  return L5_2

end

L8_1 = {}

L8_1["194"] = "ARROW UP"

L8_1["195"] = "ARROW DOWN"

L8_1["196"] = "ARROW LEFT"

L8_1["197"] = "ARROW RIGHT"

L8_1["198"] = "DELETE"

L8_1["199"] = "ESCAPE"

L8_1["200"] = "INSERT"

L8_1["170"] = "F1"

L8_1["171"] = "F2"

L8_1["172"] = "F3"

L8_1["173"] = "F4"

L8_1["174"] = "F5"

L8_1["175"] = "F6"

L8_1["176"] = "F7"

L8_1["177"] = "F8"

L8_1["178"] = "F9"

L8_1["179"] = "F10"

L8_1["180"] = "F11"

L8_1["181"] = "F12"

L8_1["1000"] = "LEFT SHIFT"

L8_1["1001"] = "RIGHT SHIFT"

L8_1["1013"] = "LEFT CTRL"

L8_1["1014"] = "RIGHT CTRL"

L8_1["1015"] = "LEFT ALT"

L8_1["1016"] = "RIGHT ALT"

L8_1["1002"] = "TAB"

L8_1["1003"] = "ENTER"

L8_1["1004"] = "BACKSPACE"

L8_1["1008"] = "HOME"

L8_1["1010"] = "PAGE DOWN"

L8_1["2000"] = "SPACE"

function L9_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2

  L0_2 = GetControlInstructionalButton

  L1_2 = 2

  L2_2 = -1424072895

  L3_2 = true

  L0_2 = L0_2(L1_2, L2_2, L3_2)

  if L0_2 then

    L1_2 = type

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    if "string" == L1_2 then

      goto lbl_15

    end

  end

  L1_2 = "X"

  do return L1_2 end

  ::lbl_15::

  L2_2 = L0_2

  L1_2 = L0_2.sub

  L3_2 = 1

  L4_2 = 2

  L1_2 = L1_2(L2_2, L3_2, L4_2)

  if "t_" == L1_2 then

    L2_2 = L0_2

    L1_2 = L0_2.sub

    L3_2 = 3

    L1_2 = L1_2(L2_2, L3_2)

    L3_2 = L1_2

    L2_2 = L1_2.upper

    return L2_2(L3_2)

  end

  L2_2 = L0_2

  L1_2 = L0_2.sub

  L3_2 = 1

  L4_2 = 2

  L1_2 = L1_2(L2_2, L3_2, L4_2)

  if "b_" == L1_2 then

    L2_2 = L0_2

    L1_2 = L0_2.sub

    L3_2 = 3

    L1_2 = L1_2(L2_2, L3_2)

    L2_2 = L8_1

    L2_2 = L2_2[L1_2]

    if not L2_2 then

      L2_2 = L1_2

    end

    return L2_2

  end

  L1_2 = "X"

  return L1_2

end

function L10_1(A0_2)

  local L1_2, L2_2

  if A0_2 then

    L1_2 = type

    L2_2 = A0_2

    L1_2 = L1_2(L2_2)

    if "table" == L1_2 then

      goto lbl_10

    end

  end

  L1_2 = false

  do return L1_2 end

  ::lbl_10::

  L1_2 = A0_2.duration

  if L1_2 then

    L1_2 = type

    L2_2 = A0_2.duration

    L1_2 = L1_2(L2_2)

    if "number" == L1_2 then

      L1_2 = A0_2.duration

      if not (L1_2 <= 0) then

        goto lbl_23

      end

    end

  end

  L1_2 = false

  do return L1_2 end

  ::lbl_23::

  L1_2 = L0_1

  if nil ~= L1_2 then

    L1_2 = false

    return L1_2

  end

  L1_2 = A0_2.useWhileDead

  if not L1_2 then

    L1_2 = false

  end

  A0_2.useWhileDead = L1_2

  L1_2 = A0_2.allowRagdoll

  if not L1_2 then

    L1_2 = false

  end

  A0_2.allowRagdoll = L1_2

  L1_2 = A0_2.allowCuffed

  if not L1_2 then

    L1_2 = false

  end

  A0_2.allowCuffed = L1_2

  L1_2 = A0_2.allowFalling

  if not L1_2 then

    L1_2 = false

  end

  A0_2.allowFalling = L1_2

  L1_2 = A0_2.allowSwimming

  if not L1_2 then

    L1_2 = false

  end

  A0_2.allowSwimming = L1_2

  L1_2 = A0_2.canCancel

  L1_2 = false ~= L1_2

  A0_2.canCancel = L1_2

  L1_2 = L6_1

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if L1_2 then

    L1_2 = false

    return L1_2

  end

  L1_2 = L9_1

  L1_2 = L1_2()

  A0_2.cancelKey = L1_2

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "showProgressBar"

  L2_2.data = A0_2

  L1_2(L2_2)

  L1_2 = L7_1

  L2_2 = A0_2

  return L1_2(L2_2)

end

function L11_1()

  local L0_2, L1_2

  L0_2 = L0_1

  if L0_2 then

    L0_2 = L0_1

    if false ~= L0_2 then

      goto lbl_9

    end

  end

  L0_2 = false

  do return L0_2 end

  ::lbl_9::

  L0_2 = false

  L0_1 = L0_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.action = "progressCancel"

  L0_2(L1_2)

  L0_2 = true

  return L0_2

end

function L12_1()

  local L0_2, L1_2

  L0_2 = L0_1

  if L0_2 then

    L0_2 = true

    if L0_2 then

      goto lbl_8

    end

  end

  L0_2 = false

  ::lbl_8::

  return L0_2

end

L13_1 = RegisterNUICallback

L14_1 = "progressComplete"

function L15_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = nil

  L0_1 = L2_2

end

L13_1(L14_1, L15_1)

L13_1 = RegisterNUICallback

L14_1 = "progressCancel"

function L15_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = 1

  L2_2(L3_2)

  L2_2 = L0_1

  if L2_2 then

    L2_2 = L0_1

    if false ~= L2_2 then

      L2_2 = false

      L0_1 = L2_2

    end

  end

end

L13_1(L14_1, L15_1)

L13_1 = RegisterCommand

L14_1 = "lation_ui:cancelprogress"

function L15_1()

  local L0_2, L1_2

  L0_2 = L0_1

  if L0_2 then

    L0_2 = L0_1

    if false ~= L0_2 then

      L0_2 = L0_1.canCancel

      if L0_2 then

        L0_2 = false

        L0_1 = L0_2

        L0_2 = SendNUIMessage

        L1_2 = {}

        L1_2.action = "progressCancel"

        L0_2(L1_2)

      end

    end

  end

end

L16_1 = false

L13_1(L14_1, L15_1, L16_1)

L13_1 = RegisterKeyMapping

L14_1 = "lation_ui:cancelprogress"

L15_1 = "Cancel Progress"

L16_1 = "keyboard"

L17_1 = "x"

L13_1(L14_1, L15_1, L16_1, L17_1)

function L13_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = L4_1

  L1_2 = L1_2[A0_2]

  if not L1_2 then

    return

  end

  L2_2 = 1

  L3_2 = #L1_2

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = L1_2[L5_2]

    L7_2 = DoesEntityExist

    L8_2 = L6_2

    L7_2 = L7_2(L8_2)

    if L7_2 then

      L7_2 = DeleteEntity

      L8_2 = L6_2

      L7_2(L8_2)

    end

  end

  L2_2 = L4_1

  L2_2[A0_2] = nil

end

L14_1 = RegisterNetEvent

L15_1 = "onPlayerDropped"

function L16_1(A0_2)

  local L1_2, L2_2

  L1_2 = L13_1

  L2_2 = A0_2

  L1_2(L2_2)

end

L14_1(L15_1, L16_1)

L14_1 = AddStateBagChangeHandler

L15_1 = "lation_ui:progressProps"

L16_1 = ""

function L17_1(A0_2, A1_2, A2_2, A3_2, A4_2)

  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  if A4_2 then

    return

  end

  L5_2 = GetPlayerFromStateBagName

  L6_2 = A0_2

  L5_2 = L5_2(L6_2)

  if 0 == L5_2 then

    return

  end

  L6_2 = GetPlayerPed

  L7_2 = L5_2

  L6_2 = L6_2(L7_2)

  L7_2 = GetPlayerServerId

  L8_2 = L5_2

  L7_2 = L7_2(L8_2)

  if not A2_2 then

    L8_2 = L13_1

    L9_2 = L7_2

    return L8_2(L9_2)

  end

  L8_2 = L4_1

  L9_2 = {}

  L8_2[L7_2] = L9_2

  L8_2 = L4_1

  L8_2 = L8_2[L7_2]

  L9_2 = A2_2.model

  if L9_2 then

    L9_2 = #L8_2

    L9_2 = L9_2 + 1

    L10_2 = L5_1

    L11_2 = L6_2

    L12_2 = A2_2

    L10_2 = L10_2(L11_2, L12_2)

    L8_2[L9_2] = L10_2

  else

    L9_2 = 1

    L10_2 = #A2_2

    L11_2 = 1

    for L12_2 = L9_2, L10_2, L11_2 do

      L13_2 = A2_2[L12_2]

      if L13_2 then

        L14_2 = #L8_2

        L14_2 = L14_2 + 1

        L15_2 = L5_1

        L16_2 = L6_2

        L17_2 = L13_2

        L15_2 = L15_2(L16_2, L17_2)

        L8_2[L14_2] = L15_2

      end

    end

  end

end

L14_1(L15_1, L16_1, L17_1)

L14_1 = exports

L15_1 = "progressBar"

L16_1 = L10_1

L14_1(L15_1, L16_1)

L14_1 = exports

L15_1 = "cancelProgress"

L16_1 = L11_1

L14_1(L15_1, L16_1)

L14_1 = exports

L15_1 = "progressActive"

L16_1 = L12_1

L14_1(L15_1, L16_1)









