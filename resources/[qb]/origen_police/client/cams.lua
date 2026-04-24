local L0_1, L1_1, L2_1, L3_1

L0_1 = nil

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:ShowBodycam"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L2_2 = L0_1

  if not L2_2 then

    L2_2 = HideHUD

    L2_2()

    L2_2 = SendNUIMessage

    L3_2 = {}

    L3_2.action = "SetBodyCamEnabled"

    L2_2(L3_2)

    L2_2 = DoScreenFadeOut

    L3_2 = 300

    L2_2(L3_2)

    L2_2 = CreateCamWithParams

    L3_2 = "DEFAULT_SCRIPTED_CAMERA"

    L4_2 = A0_2

    L5_2 = 0

    L6_2 = 0

    L7_2 = 0

    L8_2 = GetGameplayCamFov

    L8_2, L9_2, L10_2 = L8_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

    L0_1 = L2_2

    L2_2 = SetCamActive

    L3_2 = L0_1

    L4_2 = true

    L2_2(L3_2, L4_2)

    L2_2 = RenderScriptCams

    L3_2 = true

    L4_2 = true

    L5_2 = 1

    L6_2 = true

    L7_2 = true

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

    L2_2 = SetFocusPosAndVel

    L3_2 = A0_2

    L4_2 = 0.0

    L5_2 = 0.0

    L6_2 = 0.0

    L2_2(L3_2, L4_2, L5_2, L6_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 1000

    L2_2(L3_2)

    L2_2 = GetPlayerPed

    L3_2 = GetPlayerFromServerId

    L4_2 = A1_2

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2)

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

    L3_2 = AttachCamToPedBone

    L4_2 = L0_1

    L5_2 = L2_2

    L6_2 = 31086

    L7_2 = 0

    L8_2 = 0

    L9_2 = -0.1

    L10_2 = true

    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

    L3_2 = Citizen

    L3_2 = L3_2.CreateThread

    function L4_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

      L0_3 = SetTimecycleModifier

      L1_3 = "helicamfirst"

      L0_3(L1_3)

      L0_3 = SetTimecycleModifierStrength

      L1_3 = 0.75

      L0_3(L1_3)

      L0_3 = DoScreenFadeIn

      L1_3 = 300

      L0_3(L1_3)

      while true do

        L0_3 = L0_1

        if not L0_3 then

          break

        end

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 0

        L0_3(L1_3)

        L0_3 = SetCamRot

        L1_3 = L0_1

        L2_3 = GetEntityRotation

        L3_3 = L2_2

        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)

        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)

        L0_3 = SetFocusPosAndVel

        L1_3 = GetEntityCoords

        L2_3 = L2_2

        L1_3 = L1_3(L2_3)

        L2_3 = 0.0

        L3_3 = 0.0

        L4_3 = 0.0

        L0_3(L1_3, L2_3, L3_3, L4_3)

        L0_3 = IsControlJustPressed

        L1_3 = 0

        L2_3 = 177

        L0_3 = L0_3(L1_3, L2_3)

        if L0_3 then

          L0_3 = DoScreenFadeOut

          L1_3 = 300

          L0_3(L1_3)

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 500

          L0_3(L1_3)

          L0_3 = SetCamActive

          L1_3 = L0_1

          L2_3 = false

          L0_3(L1_3, L2_3)

          L0_3 = DestroyCam

          L1_3 = L0_1

          L2_3 = true

          L0_3(L1_3, L2_3)

          L0_3 = RenderScriptCams

          L1_3 = false

          L2_3 = false

          L3_3 = 0

          L4_3 = true

          L5_3 = false

          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)

          L0_3 = nil

          L0_1 = L0_3

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 250

          L0_3(L1_3)

          L0_3 = DoScreenFadeIn

          L1_3 = 300

          L0_3(L1_3)

          L0_3 = TriggerEvent

          L1_3 = "origen_police:client:HideCamHud"

          L0_3(L1_3)

        end

      end

      L0_3 = ClearTimecycleModifier

      L0_3()

      L0_3 = ClearFocus

      L0_3()

      L0_3 = ShowHUD

      L0_3()

    end

    L3_2(L4_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:ShowCarcam"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = L0_1

  if not L2_2 then

    L2_2 = DoScreenFadeOut

    L3_2 = 300

    L2_2(L3_2)

    L2_2 = HideHUD

    L2_2()

    L2_2 = CreateCamWithParams

    L3_2 = "DEFAULT_SCRIPTED_CAMERA"

    L4_2 = A0_2

    L5_2 = 0

    L6_2 = 0

    L7_2 = 0

    L8_2 = GetGameplayCamFov

    L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L0_1 = L2_2

    L2_2 = SetCamActive

    L3_2 = L0_1

    L4_2 = true

    L2_2(L3_2, L4_2)

    L2_2 = RenderScriptCams

    L3_2 = true

    L4_2 = true

    L5_2 = 1

    L6_2 = true

    L7_2 = true

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

    L2_2 = SetFocusPosAndVel

    L3_2 = A0_2

    L4_2 = 0.0

    L5_2 = 0.0

    L6_2 = 0.0

    L2_2(L3_2, L4_2, L5_2, L6_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 1000

    L2_2(L3_2)

    L2_2 = NetworkGetEntityFromNetworkId

    L3_2 = A1_2

    L2_2 = L2_2(L3_2)

    L3_2 = nil

    L4_2 = type

    L5_2 = Config

    L5_2 = L5_2.CustomCarOffsets

    L4_2 = L4_2(L5_2)

    if "table" ~= L4_2 then

      L4_2 = Config

      L5_2 = {}

      L4_2.CustomCarOffsets = L5_2

    end

    L4_2 = pairs

    L5_2 = Config

    L5_2 = L5_2.CustomCarOffsets

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = GetHashKey

      L11_2 = L8_2

      L10_2 = L10_2(L11_2)

      L11_2 = GetEntityModel

      L12_2 = L2_2

      L11_2 = L11_2(L12_2)

      if L10_2 == L11_2 then

        L3_2 = L9_2

      end

    end

    if nil == L3_2 then

      L4_2 = Config

      L3_2 = L4_2.DefaultCarCamOffset

    end

    L4_2 = AttachCamToEntity

    L5_2 = L0_1

    L6_2 = L2_2

    L7_2 = L3_2.x

    L8_2 = L3_2.y

    L9_2 = L3_2.z

    L10_2 = true

    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

    L4_2 = Citizen

    L4_2 = L4_2.CreateThread

    function L5_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

      L0_3 = SetTimecycleModifier

      L1_3 = "helicamfirst"

      L0_3(L1_3)

      L0_3 = SetTimecycleModifierStrength

      L1_3 = 0.75

      L0_3(L1_3)

      L0_3 = DoScreenFadeIn

      L1_3 = 300

      L0_3(L1_3)

      while true do

        L0_3 = L0_1

        if not L0_3 then

          break

        end

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 0

        L0_3(L1_3)

        L0_3 = SetCamRot

        L1_3 = L0_1

        L2_3 = GetEntityRotation

        L3_3 = L2_2

        L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)

        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)

        L0_3 = SetFocusPosAndVel

        L1_3 = GetEntityCoords

        L2_3 = L2_2

        L1_3 = L1_3(L2_3)

        L2_3 = 0.0

        L3_3 = 0.0

        L4_3 = 0.0

        L0_3(L1_3, L2_3, L3_3, L4_3)

        L0_3 = IsControlJustPressed

        L1_3 = 0

        L2_3 = 177

        L0_3 = L0_3(L1_3, L2_3)

        if L0_3 then

          L0_3 = DoScreenFadeOut

          L1_3 = 300

          L0_3(L1_3)

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 500

          L0_3(L1_3)

          L0_3 = SetCamActive

          L1_3 = L0_1

          L2_3 = false

          L0_3(L1_3, L2_3)

          L0_3 = DestroyCam

          L1_3 = L0_1

          L2_3 = true

          L0_3(L1_3, L2_3)

          L0_3 = RenderScriptCams

          L1_3 = false

          L2_3 = false

          L3_3 = 0

          L4_3 = true

          L5_3 = false

          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)

          L0_3 = nil

          L0_1 = L0_3

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 250

          L0_3(L1_3)

          L0_3 = DoScreenFadeIn

          L1_3 = 300

          L0_3(L1_3)

          L0_3 = TriggerEvent

          L1_3 = "origen_police:client:HideCamHud"

          L0_3(L1_3)

        end

      end

      L0_3 = ClearTimecycleModifier

      L0_3()

      L0_3 = ClearFocus

      L0_3()

      L0_3 = ShowHUD

      L0_3()

    end

    L4_2(L5_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "GetCamsInArea"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = A1_2

  L3_2 = GetCamsInArea

  L3_2 = L3_2()

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

L1_1 = Config

L1_1 = L1_1.cameraProps

cameraProps = L1_1

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2

  L0_2 = {}

  L1_2 = GetEntityCoords

  L2_2 = PlayerPedId

  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2 = L2_2()

  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)

  L2_2 = FW_GetObjects

  L2_2 = L2_2()

  L3_2 = type

  L4_2 = cameraProps

  L3_2 = L3_2(L4_2)

  if "table" ~= L3_2 then

    L3_2 = {}

    cameraProps = L3_2

  end

  L3_2 = pairs

  L4_2 = cameraProps

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = GetHashKey

    L10_2 = L8_2

    L9_2 = L9_2(L10_2)

    L10_2 = 1

    L11_2 = #L2_2

    L12_2 = 1

    for L13_2 = L10_2, L11_2, L12_2 do

      L14_2 = GetEntityModel

      L15_2 = L2_2[L13_2]

      L14_2 = L14_2(L15_2)

      if L14_2 == L9_2 then

        L14_2 = GetEntityCoords

        L15_2 = L2_2[L13_2]

        L14_2 = L14_2(L15_2)

        L14_2 = L1_2 - L14_2

        L14_2 = #L14_2

        if L14_2 < 50 then

          L15_2 = table

          L15_2 = L15_2.insert

          L16_2 = L0_2

          L17_2 = {}

          L18_2 = L2_2[L13_2]

          L17_2.obj = L18_2

          L17_2.dist = L14_2

          L15_2(L16_2, L17_2)

        end

      end

    end

  end

  L3_2 = table

  L3_2 = L3_2.sort

  L4_2 = L0_2

  function L5_2(A0_3, A1_3)

    local L2_3, L3_3

    L2_3 = A0_3.dist

    L3_3 = A1_3.dist

    L2_3 = L2_3 < L3_3

    return L2_3

  end

  L3_2(L4_2, L5_2)

  return L0_2

end

GetCamsInArea = L1_1

L1_1 = RegisterNUICallback

L2_1 = "ShowCam"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

  L2_2 = ShowCam

  L3_2 = tonumber

  L4_2 = A0_2.obj

  L3_2, L4_2 = L3_2(L4_2)

  L2_2(L3_2, L4_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L1_2 = L0_1

  if not L1_2 then

    L1_2 = DoScreenFadeOut

    L2_2 = 300

    L1_2(L2_2)

    L1_2 = HideHUD

    L1_2()

    L1_2 = CreateCamWithParams

    L2_2 = "DEFAULT_SCRIPTED_CAMERA"

    L3_2 = GetEntityCoords

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    L4_2 = 0

    L5_2 = 0

    L6_2 = 0

    L7_2 = GetGameplayCamFov

    L7_2 = L7_2()

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)

    L0_1 = L1_2

    L1_2 = SetCamActive

    L2_2 = L0_1

    L3_2 = true

    L1_2(L2_2, L3_2)

    L1_2 = RenderScriptCams

    L2_2 = true

    L3_2 = true

    L4_2 = 1

    L5_2 = true

    L6_2 = true

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = AttachCamToEntity

    L2_2 = L0_1

    L3_2 = A0_2

    L4_2 = 0.0

    L5_2 = 0.0

    L6_2 = 0.0

    L7_2 = true

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2)

    L1_2 = Citizen

    L1_2 = L1_2.CreateThread

    function L2_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3

      L0_3 = SetTimecycleModifier

      L1_3 = "helicamfirst"

      L0_3(L1_3)

      L0_3 = SetTimecycleModifierStrength

      L1_3 = 0.75

      L0_3(L1_3)

      L0_3 = DoScreenFadeIn

      L1_3 = 300

      L0_3(L1_3)

      L0_3 = SetCamRot

      L1_3 = L0_1

      L2_3 = GetEntityRotation

      L3_3 = A0_2

      L2_3 = L2_3(L3_3)

      L3_3 = vector3

      L4_3 = 35

      L5_3 = 0

      L6_3 = 180

      L3_3 = L3_3(L4_3, L5_3, L6_3)

      L2_3 = L2_3 - L3_3

      L0_3(L1_3, L2_3)

      L0_3 = true

      L1_3 = FreezeEntityPosition

      L2_3 = PlayerPedId

      L2_3 = L2_3()

      L3_3 = true

      L1_3(L2_3, L3_3)

      L1_3 = IsRadarHidden

      L1_3 = L1_3()

      while true do

        L2_3 = L0_1

        if not L2_3 then

          break

        end

        L2_3 = DisplayRadar

        L3_3 = false

        L2_3(L3_3)

        L2_3 = Citizen

        L2_3 = L2_3.Wait

        L3_3 = 0

        L2_3(L3_3)

        if L0_3 then

          L2_3 = DoesEntityExist

          L3_3 = A0_2

          L2_3 = L2_3(L3_3)

          if L2_3 then

            L2_3 = GetEntityHealth

            L3_3 = A0_2

            L2_3 = L2_3(L3_3)

            L3_3 = 900

            if not (L2_3 < L3_3) then

              goto lbl_61

            end

          end

          L0_3 = false

          L2_3 = SendNUIMessage

          L3_3 = {}

          L3_3.action = "nosignal"

          L3_3.toggle = true

          L2_3(L3_3)

        end

        ::lbl_61::

        L2_3 = IsControlJustPressed

        L3_3 = 0

        L4_3 = 177

        L2_3 = L2_3(L3_3, L4_3)

        if L2_3 then

          L2_3 = DoScreenFadeOut

          L3_3 = 300

          L2_3(L3_3)

          L2_3 = Citizen

          L2_3 = L2_3.Wait

          L3_3 = 500

          L2_3(L3_3)

          L2_3 = SetCamActive

          L3_3 = L0_1

          L4_3 = false

          L2_3(L3_3, L4_3)

          L2_3 = DestroyCam

          L3_3 = L0_1

          L4_3 = true

          L2_3(L3_3, L4_3)

          L2_3 = RenderScriptCams

          L3_3 = false

          L4_3 = false

          L5_3 = 0

          L6_3 = true

          L7_3 = false

          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

          L2_3 = nil

          L0_1 = L2_3

          L2_3 = Citizen

          L2_3 = L2_3.Wait

          L3_3 = 250

          L2_3(L3_3)

          L2_3 = DoScreenFadeIn

          L3_3 = 300

          L2_3(L3_3)

          L2_3 = TriggerEvent

          L3_3 = "origen_police:client:HideCamHud"

          L2_3(L3_3)

        end

      end

      L2_3 = DisplayRadar

      L3_3 = not L1_3

      L2_3(L3_3)

      L2_3 = FreezeEntityPosition

      L3_3 = PlayerPedId

      L3_3 = L3_3()

      L4_3 = false

      L2_3(L3_3, L4_3)

      L2_3 = ClearTimecycleModifier

      L2_3()

      L2_3 = SendNUIMessage

      L3_3 = {}

      L3_3.action = "nosignal"

      L3_3.toggle = false

      L2_3(L3_3)

      L2_3 = ShowHUD

      L2_3()

    end

    L1_2(L2_2)

  end

end

ShowCam = L1_1

L1_1 = RegisterNUICallback

L2_1 = "SetBodyCamEnabled"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  A0_2 = A0_2.value

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:DisableBodyCam"

  L4_2 = A0_2

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

