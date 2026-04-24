local L0_1, L1_1, L2_1, L3_1, L4_1

L0_1 = Config

L0_1 = L0_1.HeliCam

if not L0_1 then

  return

end

L0_1 = false

L1_1 = false

L2_1 = false

L3_1 = Config

L3_1 = L3_1.Camara

L3_1 = L3_1.fov_max

L4_1 = Config

L4_1 = L4_1.Camara

L4_1 = L4_1.fov_min

L3_1 = L3_1 + L4_1

L3_1 = L3_1 * 0.5

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = L0_1

  if not L2_2 then

    L2_2 = GetPedInVehicleSeat

    L3_2 = A0_2

    L4_2 = -1

    L2_2 = L2_2(L3_2, L4_2)

    if L2_2 ~= L1_2 then

      L2_2 = GetPedInVehicleSeat

      L3_2 = A0_2

      L4_2 = 0

      L2_2 = L2_2(L3_2, L4_2)

      if L2_2 ~= L1_2 then

        goto lbl_23

      end

    end

    L2_2 = Citizen

    L2_2 = L2_2.CreateThread

    function L3_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3

      L0_3 = RequestScaleformMovie

      L1_3 = "HELI_CAM"

      L0_3 = L0_3(L1_3)

      while true do

        L1_3 = HasScaleformMovieLoaded

        L2_3 = L0_3

        L1_3 = L1_3(L2_3)

        if L1_3 then

          break

        end

        L1_3 = Citizen

        L1_3 = L1_3.Wait

        L2_3 = 0

        L1_3(L2_3)

      end

      L1_3 = CreateCam

      L2_3 = "DEFAULT_SCRIPTED_FLY_CAMERA"

      L3_3 = true

      L1_3 = L1_3(L2_3, L3_3)

      L2_3 = AttachCamToEntity

      L3_3 = L1_3

      L4_3 = A0_2

      L5_3 = 0.0

      L6_3 = 0.0

      L7_3 = -1.5

      L8_3 = true

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3)

      L2_3 = SetCamRot

      L3_3 = L1_3

      L4_3 = 0.0

      L5_3 = 0.0

      L6_3 = GetEntityHeading

      L7_3 = A0_2

      L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)

      L2_3 = SetCamFov

      L3_3 = L1_3

      L4_3 = L3_1

      L2_3(L3_3, L4_3)

      L2_3 = RenderScriptCams

      L3_3 = true

      L4_3 = false

      L5_3 = 0

      L6_3 = 1

      L7_3 = 0

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

      L2_3 = PopScaleformMovieFunctionVoid

      L2_3()

      L2_3 = true

      L0_1 = L2_3

      while true do

        L2_3 = L0_1

        if not L2_3 then

          break

        end

        L2_3 = IsEntityDead

        L3_3 = L1_2

        L2_3 = L2_3(L3_3)

        if L2_3 then

          break

        end

        L2_3 = GetEntityHeightAboveGround

        L3_3 = A0_2

        L2_3 = L2_3(L3_3)

        L3_3 = 1.5

        if not (L2_3 > L3_3) then

          break

        end

        L2_3 = Citizen

        L2_3 = L2_3.Wait

        L3_3 = 0

        L2_3(L3_3)

        L2_3 = IsControlJustPressed

        L3_3 = 0

        L4_3 = 25

        L2_3 = L2_3(L3_3, L4_3)

        if L2_3 then

          L2_3 = PlaySoundFrontend

          L3_3 = -1

          L4_3 = "SELECT"

          L5_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"

          L6_3 = false

          L2_3(L3_3, L4_3, L5_3, L6_3)

          L2_3 = L1_1

          if L2_3 then

            L2_3 = SetNightvision

            L3_3 = false

            L2_3(L3_3)

            L2_3 = SetSeethrough

            L3_3 = false

            L2_3(L3_3)

            L2_3 = false

            L1_1 = L2_3

            L2_3 = false

            L2_1 = L2_3

          else

            L2_3 = SetNightvision

            L3_3 = true

            L2_3(L3_3)

            L2_3 = SetSeethrough

            L3_3 = false

            L2_3(L3_3)

            L2_3 = true

            L1_1 = L2_3

            L2_3 = false

            L2_1 = L2_3

          end

        else

          L2_3 = IsControlJustPressed

          L3_3 = 0

          L4_3 = 24

          L2_3 = L2_3(L3_3, L4_3)

          if L2_3 then

            L2_3 = PlaySoundFrontend

            L3_3 = -1

            L4_3 = "SELECT"

            L5_3 = "HUD_FRONTEND_DEFAULT_SOUNDSET"

            L6_3 = false

            L2_3(L3_3, L4_3, L5_3, L6_3)

            L2_3 = L2_1

            if L2_3 then

              L2_3 = SetNightvision

              L3_3 = false

              L2_3(L3_3)

              L2_3 = SetSeethrough

              L3_3 = false

              L2_3(L3_3)

              L2_3 = false

              L1_1 = L2_3

              L2_3 = false

              L2_1 = L2_3

            else

              L2_3 = SetNightvision

              L3_3 = true

              L2_3(L3_3)

              L2_3 = SetSeethrough

              L3_3 = true

              L2_3(L3_3)

              L2_3 = false

              L1_1 = L2_3

              L2_3 = true

              L2_1 = L2_3

            end

          end

        end

        L2_3 = Config

        L2_3 = L2_3.Camara

        L2_3 = L2_3.fov_max

        L3_3 = Config

        L3_3 = L3_3.Camara

        L3_3 = L3_3.fov_min

        L2_3 = L2_3 - L3_3

        L3_3 = 1.0

        L2_3 = L3_3 / L2_3

        L3_3 = L3_1

        L4_3 = Config

        L4_3 = L4_3.Camara

        L4_3 = L4_3.fov_min

        L3_3 = L3_3 - L4_3

        L2_3 = L2_3 * L3_3

        L3_3 = CheckInputRotation_h

        L4_3 = L1_3

        L5_3 = L2_3

        L3_3(L4_3, L5_3)

        L3_3 = GetVehicleInView

        L4_3 = L1_3

        L3_3 = L3_3(L4_3)

        L4_3 = DoesEntityExist

        L5_3 = L3_3

        L4_3 = L4_3(L5_3)

        if L4_3 then

          L4_3 = RenderVehicleInfo

          L5_3 = L3_3

          L4_3(L5_3)

        end

        L4_3 = HandleZoom_h

        L5_3 = L1_3

        L4_3(L5_3)

        L4_3 = PushScaleformMovieFunction

        L5_3 = L0_3

        L6_3 = "SET_ALT_FOV_HEADING"

        L4_3(L5_3, L6_3)

        L4_3 = PushScaleformMovieFunctionParameterFloat

        L5_3 = GetEntityCoords

        L6_3 = A0_2

        L5_3 = L5_3(L6_3)

        L5_3 = L5_3.z

        L4_3(L5_3)

        L4_3 = PushScaleformMovieFunctionParameterFloat

        L5_3 = L2_3

        L4_3(L5_3)

        L4_3 = PushScaleformMovieFunctionParameterFloat

        L5_3 = GetCamRot

        L6_3 = L1_3

        L7_3 = 2

        L5_3 = L5_3(L6_3, L7_3)

        L5_3 = L5_3.z

        L4_3(L5_3)

        L4_3 = PopScaleformMovieFunctionVoid

        L4_3()

        L4_3 = DrawScaleformMovieFullscreen

        L5_3 = L0_3

        L6_3 = 255

        L7_3 = 255

        L8_3 = 255

        L9_3 = 255

        L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)

      end

      L2_3 = false

      L0_1 = L2_3

      L2_3 = false

      L1_1 = L2_3

      L2_3 = RenderScriptCams

      L3_3 = false

      L4_3 = false

      L5_3 = 0

      L6_3 = 1

      L7_3 = 0

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

      L2_3 = SetScaleformMovieAsNoLongerNeeded

      L3_3 = L0_3

      L2_3(L3_3)

      L2_3 = DestroyCam

      L3_3 = L1_3

      L4_3 = false

      L2_3(L3_3, L4_3)

      L2_3 = SetNightvision

      L3_3 = false

      L2_3(L3_3)

      L2_3 = SetSeethrough

      L3_3 = false

      L2_3(L3_3)

    end

    L2_2(L3_2)

    goto lbl_46

    ::lbl_23::

    L2_2 = GetEntityHeightAboveGround

    L3_2 = A0_2

    L2_2 = L2_2(L3_2)

    if L2_2 > 5 then

      L2_2 = PlaySoundFrontend

      L3_2 = -1

      L4_2 = "SELECT"

      L5_2 = "HUD_FRONTEND_DEFAULT_SOUNDSET"

      L6_2 = false

      L2_2(L3_2, L4_2, L5_2, L6_2)

      L2_2 = TaskRappelFromHeli

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = 1092616192

      L2_2(L3_2, L4_2)

      L2_2 = Citizen

      L2_2 = L2_2.CreateThread

      function L3_2()

        local L0_3, L1_3

        while true do

          L0_3 = GetEntityHeightAboveGround

          L1_3 = PlayerPedId

          L1_3 = L1_3()

          L0_3 = L0_3(L1_3)

          if not (L0_3 > 2) then

            break

          end

          L0_3 = Citizen

          L0_3 = L0_3.Wait

          L1_3 = 0

          L0_3(L1_3)

        end

        L0_3 = ClearPedTasks

        L1_3 = PlayerPedId

        L1_3 = L1_3()

        L0_3(L1_3)

      end

      L2_2(L3_2)

    end

  else

    L2_2 = false

    L0_1 = L2_2

  end

  ::lbl_46::

end

DoCamOrRappel = L4_1

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = DisableControlAction

  L2_2 = 0

  L3_2 = 14

  L1_2(L2_2, L3_2)

  L1_2 = DisableControlAction

  L2_2 = 0

  L3_2 = 15

  L1_2(L2_2, L3_2)

  L1_2 = DisableControlAction

  L2_2 = 0

  L3_2 = 241

  L1_2(L2_2, L3_2)

  L1_2 = DisableControlAction

  L2_2 = 0

  L3_2 = 242

  L1_2(L2_2, L3_2)

  L1_2 = IsDisabledControlJustPressed

  L2_2 = 0

  L3_2 = 241

  L1_2 = L1_2(L2_2, L3_2)

  if L1_2 then

    L1_2 = math

    L1_2 = L1_2.max

    L2_2 = L3_1

    L3_2 = Config

    L3_2 = L3_2.Camara

    L3_2 = L3_2.zoomspeed

    L2_2 = L2_2 - L3_2

    L3_2 = Config

    L3_2 = L3_2.Camara

    L3_2 = L3_2.fov_min

    L1_2 = L1_2(L2_2, L3_2)

    L3_1 = L1_2

  end

  L1_2 = IsDisabledControlJustPressed

  L2_2 = 0

  L3_2 = 242

  L1_2 = L1_2(L2_2, L3_2)

  if L1_2 then

    L1_2 = math

    L1_2 = L1_2.min

    L2_2 = L3_1

    L3_2 = Config

    L3_2 = L3_2.Camara

    L3_2 = L3_2.zoomspeed

    L2_2 = L2_2 + L3_2

    L3_2 = Config

    L3_2 = L3_2.Camara

    L3_2 = L3_2.fov_max

    L1_2 = L1_2(L2_2, L3_2)

    L3_1 = L1_2

  end

  L1_2 = GetCamFov

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = math

  L2_2 = L2_2.abs

  L3_2 = L3_1

  L3_2 = L3_2 - L1_2

  L2_2 = L2_2(L3_2)

  L3_2 = 0.1

  if L2_2 < L3_2 then

    L3_1 = L1_2

  end

  L2_2 = SetCamFov

  L3_2 = A0_2

  L4_2 = L3_1

  L4_2 = L4_2 - L1_2

  L4_2 = L4_2 * 0.05

  L4_2 = L1_2 + L4_2

  L2_2(L3_2, L4_2)

end

HandleZoom_h = L4_1

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = GetDisabledControlNormal

  L3_2 = 0

  L4_2 = 220

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = GetDisabledControlNormal

  L4_2 = 0

  L5_2 = 221

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = GetCamRot

  L5_2 = A0_2

  L6_2 = 2

  L4_2 = L4_2(L5_2, L6_2)

  if 0.0 ~= L2_2 or 0.0 ~= L3_2 then

    L5_2 = L4_2.z

    L6_2 = L2_2 * -1.0

    L7_2 = Config

    L7_2 = L7_2.Camara

    L7_2 = L7_2.speed_ud

    L6_2 = L6_2 * L7_2

    L7_2 = A1_2 + 0.1

    L6_2 = L6_2 * L7_2

    L5_2 = L5_2 + L6_2

    L6_2 = math

    L6_2 = L6_2.max

    L7_2 = math

    L7_2 = L7_2.min

    L8_2 = 20.0

    L9_2 = L4_2.x

    L10_2 = L3_2 * -1.0

    L11_2 = Config

    L11_2 = L11_2.Camara

    L11_2 = L11_2.speed_lr

    L10_2 = L10_2 * L11_2

    L11_2 = A1_2 + 0.1

    L10_2 = L10_2 * L11_2

    L9_2 = L9_2 + L10_2

    L7_2 = L7_2(L8_2, L9_2)

    L8_2 = -89.5

    L6_2 = L6_2(L7_2, L8_2)

    L7_2 = SetCamRot

    L8_2 = A0_2

    L9_2 = L6_2

    L10_2 = 0.0

    L11_2 = L5_2

    L12_2 = 2

    L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)

  end

end

CheckInputRotation_h = L4_1

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L1_2 = GetCamCoord

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = RotAnglesToVec

  L3_2 = GetCamRot

  L4_2 = A0_2

  L5_2 = 2

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2(L4_2, L5_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

  L3_2 = CastRayPointToPoint

  L4_2 = L1_2

  L5_2 = L2_2 * 200.0

  L5_2 = L1_2 + L5_2

  L6_2 = 10

  L7_2 = GetVehiclePedIsIn

  L8_2 = GetPlayerPed

  L9_2 = -1

  L8_2, L9_2, L10_2 = L8_2(L9_2)

  L7_2 = L7_2(L8_2, L9_2, L10_2)

  L8_2 = 0

  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

  L4_2 = GetRaycastResult

  L5_2 = L3_2

  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)

  if L8_2 > 0 then

    L9_2 = IsEntityAVehicle

    L10_2 = L8_2

    L9_2 = L9_2(L10_2)

    if L9_2 then

      return L8_2

  end

  else

    L9_2 = nil

    return L9_2

  end

end

GetVehicleInView = L4_1

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = math

  L1_2 = L1_2.rad

  L2_2 = A0_2.z

  L1_2 = L1_2(L2_2)

  L2_2 = math

  L2_2 = L2_2.rad

  L3_2 = A0_2.x

  L2_2 = L2_2(L3_2)

  L3_2 = math

  L3_2 = L3_2.abs

  L4_2 = math

  L4_2 = L4_2.cos

  L5_2 = L2_2

  L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)

  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

  L4_2 = vector3

  L5_2 = math

  L5_2 = L5_2.sin

  L6_2 = L1_2

  L5_2 = L5_2(L6_2)

  L5_2 = -L5_2

  L5_2 = L5_2 * L3_2

  L6_2 = math

  L6_2 = L6_2.cos

  L7_2 = L1_2

  L6_2 = L6_2(L7_2)

  L6_2 = L6_2 * L3_2

  L7_2 = math

  L7_2 = L7_2.sin

  L8_2 = L2_2

  L7_2, L8_2 = L7_2(L8_2)

  return L4_2(L5_2, L6_2, L7_2, L8_2)

end

RotAnglesToVec = L4_1

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L1_2 = GetEntityModel

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L2_2 = Config

  L2_2 = L2_2.CustomCarLabels

  L2_2 = L2_2[L1_2]

  if L2_2 then

    L2_2 = Config

    L2_2 = L2_2.CustomCarLabels

    L2_2 = L2_2[L1_2]

    if L2_2 then

      goto lbl_19

    end

  end

  L2_2 = GetLabelText

  L3_2 = GetDisplayNameFromVehicleModel

  L4_2 = L1_2

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2(L4_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

  ::lbl_19::

  L3_2 = L2_2

  L4_2 = GetLabelText

  L5_2 = GetDisplayNameFromVehicleModel

  L6_2 = L3_2

  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)

  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

  L5_2 = GetVehiclePlate

  L6_2 = A0_2

  L5_2 = L5_2(L6_2)

  L6_2 = SetTextFont

  L7_2 = 0

  L6_2(L7_2)

  L6_2 = SetTextProportional

  L7_2 = 1

  L6_2(L7_2)

  L6_2 = SetTextScale

  L7_2 = 0.0

  L8_2 = 0.4

  L6_2(L7_2, L8_2)

  L6_2 = SetTextColour

  L7_2 = 255

  L8_2 = 255

  L9_2 = 255

  L10_2 = 255

  L6_2(L7_2, L8_2, L9_2, L10_2)

  L6_2 = SetTextDropshadow

  L7_2 = 0

  L8_2 = 0

  L9_2 = 0

  L10_2 = 0

  L11_2 = 255

  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)

  L6_2 = SetTextEdge

  L7_2 = 1

  L8_2 = 0

  L9_2 = 0

  L10_2 = 0

  L11_2 = 255

  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)

  L6_2 = SetTextDropShadow

  L6_2()

  L6_2 = SetTextOutline

  L6_2()

  L6_2 = SetTextEntry

  L7_2 = "STRING"

  L6_2(L7_2)

  L6_2 = AddTextComponentString

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.Model

  L8_2 = ": "

  L9_2 = L4_2

  L10_2 = "\n"

  L11_2 = Config

  L11_2 = L11_2.Translations

  L11_2 = L11_2.LicensePlate

  L12_2 = ": "

  L13_2 = L5_2

  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2

  L6_2(L7_2)

  L6_2 = DrawText

  L7_2 = 0.505

  L8_2 = 0.505

  L6_2(L7_2, L8_2)

end

RenderVehicleInfo = L4_1

