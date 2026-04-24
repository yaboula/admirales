local L0_1, L1_1, L2_1, L3_1

L0_1 = false

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:usecamera"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2

  L3_2 = IsPedInAnyVehicle

  L4_2 = PlayerPedId

  L4_2 = L4_2()

  L5_2 = false

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    return

  end

  L3_2 = L0_1

  if not L3_2 then

    L3_2 = true

    L0_1 = L3_2

    L3_2 = Citizen

    L3_2 = L3_2.CreateThread

    function L4_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3

      L0_3 = GetGameplayCamFov

      L0_3 = L0_3()

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = GetEntityCoords

      L3_3 = L1_3

      L2_3 = L2_3(L3_3)

      L3_3 = vector3

      L4_3 = 0

      L5_3 = 0

      L6_3 = 0.6

      L3_3 = L3_3(L4_3, L5_3, L6_3)

      L2_3 = L2_3 + L3_3

      L3_3 = GetEntityForwardVector

      L4_3 = L1_3

      L3_3 = L3_3(L4_3)

      L3_3 = L3_3 * 0.7

      L2_3 = L2_3 + L3_3

      L3_3 = CreateCamWithParams

      L4_3 = "DEFAULT_SCRIPTED_CAMERA"

      L5_3 = L2_3

      L6_3 = GetEntityRotation

      L7_3 = L1_3

      L8_3 = 2

      L6_3 = L6_3(L7_3, L8_3)

      L7_3 = L0_3

      L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)

      L4_3 = L0_3

      L5_3 = IsMinimapRendering

      L5_3 = L5_3()

      L6_3 = SetCamActive

      L7_3 = L3_3

      L8_3 = true

      L6_3(L7_3, L8_3)

      L6_3 = RenderScriptCams

      L7_3 = true

      L8_3 = true

      L9_3 = 2000

      L10_3 = true

      L11_3 = false

      L6_3(L7_3, L8_3, L9_3, L10_3, L11_3)

      L6_3 = TaskStartScenarioInPlace

      L7_3 = L1_3

      L8_3 = "WORLD_HUMAN_PAPARAZZI"

      L9_3 = 0

      L10_3 = 1

      L6_3(L7_3, L8_3, L9_3, L10_3)

      L6_3 = DisplayRadar

      L7_3 = false

      L6_3(L7_3)

      L6_3 = GetGameTimer

      L6_3 = L6_3()

      L7_3 = Citizen

      L7_3 = L7_3.Wait

      L8_3 = 2000

      L7_3(L8_3)

      L7_3 = SetTimecycleModifier

      L8_3 = "helicamfirst"

      L7_3(L8_3)

      L7_3 = SetTimecycleModifierStrength

      L8_3 = 0.85

      L7_3(L8_3)

      L7_3 = GetStreetNameFromHashKey

      L8_3 = GetStreetNameAtCoord

      L9_3 = L2_3.x

      L10_3 = L2_3.y

      L11_3 = L2_3.z

      L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3 = L8_3(L9_3, L10_3, L11_3)

      L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

      L8_3 = false

      while true do

        L9_3 = L0_1

        if not L9_3 then

          break

        end

        L9_3 = Config

        L9_3 = L9_3.CustomNotify

        if L9_3 then

          if L8_3 then

          else

            L9_3 = GetResourceState

            L10_3 = "origen_notify"

            L9_3 = L9_3(L10_3)

            if "started" == L9_3 then

              L9_3 = ShowHelpNotification

              L10_3 = "E"

              L11_3 = Config

              L11_3 = L11_3.Translations

              L11_3 = L11_3.camera

              L11_3 = L11_3.takepick

              L9_3(L10_3, L11_3)

              L9_3 = ShowHelpNotification

              L10_3 = "scroll"

              L11_3 = Config

              L11_3 = L11_3.Translations

              L11_3 = L11_3.camera

              L11_3 = L11_3.zoom

              L9_3(L10_3, L11_3)

              L9_3 = ShowHelpNotification

              L10_3 = "backspace"

              L11_3 = Config

              L11_3 = L11_3.Translations

              L11_3 = L11_3.camera

              L11_3 = L11_3.cancel

              L9_3(L10_3, L11_3)

              L9_3 = Config

              L9_3 = L9_3.Framework

              if "esx" == L9_3 then

                L9_3 = CreateThread

                function L10_3()

                  local L0_4, L1_4

                  L0_4 = Wait

                  L1_4 = 0

                  L0_4(L1_4)

                  L0_4 = false

                  L8_3 = L0_4

                end

                L9_3(L10_3)

              end

            else

              L9_3 = ShowHelpNotification

              L10_3 = "E"

              L11_3 = Config

              L11_3 = L11_3.Translations

              L11_3 = L11_3.camera

              L11_3 = L11_3.fullText

              L12_3 = L11_3

              L11_3 = L11_3.format

              L13_3 = "[E]"

              L14_3 = "[SCROLL]"

              L15_3 = "[BACKSPACE]"

              L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3 = L11_3(L12_3, L13_3, L14_3, L15_3)

              L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

            end

            L8_3 = true

          end

        else

          L9_3 = Config

          L9_3 = L9_3.Framework

          if "qbcore" == L9_3 and not L8_3 then

            L9_3 = exports

            L9_3 = L9_3["qb-core"]

            L10_3 = L9_3

            L9_3 = L9_3.DrawText

            L11_3 = Config

            L11_3 = L11_3.Translations

            L11_3 = L11_3.camera

            L11_3 = L11_3.fullText

            L12_3 = L11_3

            L11_3 = L11_3.format

            L13_3 = "[E]"

            L14_3 = "[SCROLL]"

            L15_3 = "[BACKSPACE]"

            L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3 = L11_3(L12_3, L13_3, L14_3, L15_3)

            L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

            L8_3 = true

          else

            L9_3 = Config

            L9_3 = L9_3.Framework

            if "esx" == L9_3 then

              L9_3 = Framework

              L9_3 = L9_3.ShowHelpNotification

              L10_3 = Config

              L10_3 = L10_3.Translations

              L10_3 = L10_3.camera

              L10_3 = L10_3.fullText

              L11_3 = L10_3

              L10_3 = L10_3.format

              L12_3 = "~INPUT_CONTEXT~"

              L13_3 = "~INPUT_WEAPON_WHEEL_PREV~"

              L14_3 = "~INPUT_FRONTEND_RRIGHT~"

              L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3 = L10_3(L11_3, L12_3, L13_3, L14_3)

              L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

            end

          end

        end

        L9_3 = Citizen

        L9_3 = L9_3.Wait

        L10_3 = 0

        L9_3(L10_3)

        L9_3 = GetEntityCoords

        L10_3 = L1_3

        L9_3 = L9_3(L10_3)

        L10_3 = A0_2

        if L10_3 then

          L10_3 = 1

          L11_3 = A0_2

          L11_3 = #L11_3

          L12_3 = 1

          for L13_3 = L10_3, L11_3, L12_3 do

            L14_3 = A0_2

            L14_3 = L14_3[L13_3]

            L14_3 = L14_3.coords

            L14_3 = L9_3 - L14_3

            L14_3 = #L14_3

            L15_3 = Config

            L15_3 = L15_3.EvidenceDrawDistance

            if L14_3 < L15_3 then

              L14_3 = DrawMarker

              L15_3 = Config

              L15_3 = L15_3.Evidences

              L16_3 = A0_2

              L16_3 = L16_3[L13_3]

              L16_3 = L16_3.type

              L15_3 = L15_3[L16_3]

              L15_3 = L15_3.sprite

              L16_3 = A0_2

              L16_3 = L16_3[L13_3]

              L16_3 = L16_3.coords

              L17_3 = 0.0

              L18_3 = 0.0

              L19_3 = 0.0

              L20_3 = 0.0

              L21_3 = 0.0

              L22_3 = 0.0

              L23_3 = 0.2

              L24_3 = 0.2

              L25_3 = 0.2

              L26_3 = Config

              L26_3 = L26_3.Evidences

              L27_3 = A0_2

              L27_3 = L27_3[L13_3]

              L27_3 = L27_3.type

              L26_3 = L26_3[L27_3]

              L26_3 = L26_3.color

              L26_3 = L26_3.r

              if not L26_3 then

                L26_3 = A0_2

                L26_3 = L26_3[L13_3]

                L26_3 = L26_3.color

                L26_3 = L26_3[1]

              end

              L27_3 = Config

              L27_3 = L27_3.Evidences

              L28_3 = A0_2

              L28_3 = L28_3[L13_3]

              L28_3 = L28_3.type

              L27_3 = L27_3[L28_3]

              L27_3 = L27_3.color

              L27_3 = L27_3.g

              if not L27_3 then

                L27_3 = A0_2

                L27_3 = L27_3[L13_3]

                L27_3 = L27_3.color

                L27_3 = L27_3[2]

              end

              L28_3 = Config

              L28_3 = L28_3.Evidences

              L29_3 = A0_2

              L29_3 = L29_3[L13_3]

              L29_3 = L29_3.type

              L28_3 = L28_3[L29_3]

              L28_3 = L28_3.color

              L28_3 = L28_3.b

              if not L28_3 then

                L28_3 = A0_2

                L28_3 = L28_3[L13_3]

                L28_3 = L28_3.color

                L28_3 = L28_3[3]

              end

              L29_3 = 255

              L30_3 = false

              L31_3 = false

              L32_3 = 0

              L33_3 = true

              L14_3(L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

              L14_3 = A0_2

              L14_3 = L14_3[L13_3]

              L14_3 = L14_3.count

              if L14_3 then

                L14_3 = DrawText3D

                L15_3 = A0_2

                L15_3 = L15_3[L13_3]

                L15_3 = L15_3.coords

                L15_3 = L15_3.x

                L16_3 = A0_2

                L16_3 = L16_3[L13_3]

                L16_3 = L16_3.coords

                L16_3 = L16_3.y

                L17_3 = A0_2

                L17_3 = L17_3[L13_3]

                L17_3 = L17_3.coords

                L17_3 = L17_3.z

                L17_3 = L17_3 + 0.2

                L18_3 = "x"

                L19_3 = A0_2

                L19_3 = L19_3[L13_3]

                L19_3 = L19_3.count

                L18_3 = L18_3 .. L19_3

                L14_3(L15_3, L16_3, L17_3, L18_3)

              end

            end

          end

        end

        L10_3 = HandleZoom

        L11_3 = L3_3

        L12_3 = L0_3

        L13_3 = L4_3

        L10_3 = L10_3(L11_3, L12_3, L13_3)

        L0_3 = L10_3

        L10_3 = CheckInputRotation

        L11_3 = L3_3

        L12_3 = L0_3

        L10_3(L11_3, L12_3)

        L10_3 = DisableAllControlActions

        L11_3 = 0

        L10_3(L11_3)

        L10_3 = A1_2

        if L10_3 then

          L10_3 = Draw2DText

          L11_3 = 0.5

          L12_3 = 0.95

          L13_3 = L7_3

          L14_3 = " \194\183 "

          L15_3 = A1_2

          L13_3 = L13_3 .. L14_3 .. L15_3

          L14_3 = 0.7

          L10_3(L11_3, L12_3, L13_3, L14_3)

        end

        L10_3 = IsDisabledControlJustPressed

        L11_3 = 0

        L12_3 = 38

        L10_3 = L10_3(L11_3, L12_3)

        if L10_3 then

          L10_3 = GetGameTimer

          L10_3 = L10_3()

          L10_3 = L10_3 - L6_3

          L11_3 = 2000

          if L10_3 > L11_3 then

            L10_3 = TriggerServerEvent

            L11_3 = "origen_police:server:savephoto"

            L12_3 = TakePhoto

            L13_3 = A2_2

            L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3 = L12_3(L13_3)

            L10_3(L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3)

            L10_3 = GetGameTimer

            L10_3 = L10_3()

            L6_3 = L10_3

            L10_3 = false

            L0_1 = L10_3

          end

        end

        L10_3 = IsDisabledControlJustPressed

        L11_3 = 0

        L12_3 = 177

        L10_3 = L10_3(L11_3, L12_3)

        if L10_3 then

          L10_3 = false

          L0_1 = L10_3

        end

      end

      L9_3 = HideHelpNotification

      L9_3()

      L9_3 = ClearTimecycleModifier

      L9_3()

      L9_3 = DisplayRadar

      L10_3 = L5_3

      L9_3(L10_3)

      L9_3 = ClearPedTasks

      L10_3 = L1_3

      L9_3(L10_3)

      L9_3 = SetCamActive

      L10_3 = L3_3

      L11_3 = false

      L9_3(L10_3, L11_3)

      L9_3 = DestroyCam

      L10_3 = L3_3

      L11_3 = true

      L9_3(L10_3, L11_3)

      L9_3 = RenderScriptCams

      L10_3 = false

      L11_3 = true

      L12_3 = 2000

      L13_3 = true

      L14_3 = false

      L9_3(L10_3, L11_3, L12_3, L13_3, L14_3)

    end

    L3_2(L4_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:showphoto"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2

  if not A0_2 then

    L1_2 = print

    L2_2 = "No photo url received"

    L1_2(L2_2)

    return

  end

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "showphoto"

  L2_2.url = A0_2

  L1_2(L2_2)

  L1_2 = SetNuiFocus

  L2_2 = true

  L3_2 = true

  L1_2(L2_2, L3_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2, A1_2)

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

    L6_2 = L6_2 * 0.1

    L7_2 = A1_2 + 0.1

    L6_2 = L6_2 * L7_2

    L5_2 = L5_2 + L6_2

    L6_2 = math

    L6_2 = L6_2.max

    L7_2 = math

    L7_2 = L7_2.min

    L8_2 = 65.0

    L9_2 = L4_2.x

    L10_2 = L3_2 * -1.0

    L10_2 = L10_2 * 0.1

    L11_2 = A1_2 + 0.1

    L10_2 = L10_2 * L11_2

    L9_2 = L9_2 + L10_2

    L7_2 = L7_2(L8_2, L9_2)

    L8_2 = -65.0

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

CheckInputRotation = L1_1

function L1_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = IsDisabledControlJustPressed

  L4_2 = 0

  L5_2 = 241

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L3_2 = math

    L3_2 = L3_2.max

    L4_2 = A1_2 - 3.0

    L5_2 = 5.0

    L3_2 = L3_2(L4_2, L5_2)

    A1_2 = L3_2

  end

  L3_2 = IsDisabledControlJustPressed

  L4_2 = 0

  L5_2 = 242

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L3_2 = math

    L3_2 = L3_2.min

    L4_2 = A1_2 + 3.0

    L5_2 = A2_2

    L3_2 = L3_2(L4_2, L5_2)

    A1_2 = L3_2

  end

  L3_2 = GetCamFov

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  L4_2 = math

  L4_2 = L4_2.abs

  L5_2 = A1_2 - L3_2

  L4_2 = L4_2(L5_2)

  L5_2 = 0.1

  if L4_2 < L5_2 then

    A1_2 = L3_2

  end

  L4_2 = SetCamFov

  L5_2 = A0_2

  L6_2 = A1_2 - L3_2

  L6_2 = L6_2 * 0.05

  L6_2 = L3_2 + L6_2

  L4_2(L5_2, L6_2)

  return A1_2

end

HandleZoom = L1_1

function L1_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L4_2 = SetTextFont

  L5_2 = 4

  L4_2(L5_2)

  L4_2 = SetTextProportional

  L5_2 = 7

  L4_2(L5_2)

  L4_2 = SetTextScale

  L5_2 = A3_2

  L6_2 = A3_2

  L4_2(L5_2, L6_2)

  L4_2 = SetTextColour

  L5_2 = 255

  L6_2 = 255

  L7_2 = 255

  L8_2 = 255

  L4_2(L5_2, L6_2, L7_2, L8_2)

  L4_2 = SetTextEdge

  L5_2 = 4

  L6_2 = 0

  L7_2 = 0

  L8_2 = 0

  L9_2 = 255

  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)

  L4_2 = SetTextCentre

  L5_2 = true

  L4_2(L5_2)

  L4_2 = SetTextEntry

  L5_2 = "STRING"

  L4_2(L5_2)

  L4_2 = AddTextComponentString

  L5_2 = A2_2

  L4_2(L5_2)

  L4_2 = DrawText

  L5_2 = A0_2

  L6_2 = A1_2

  L4_2(L5_2, L6_2)

  L4_2 = string

  L4_2 = L4_2.len

  L5_2 = A2_2

  L4_2 = L4_2(L5_2)

  L4_2 = L4_2 / 270

  L5_2 = DrawRect

  L6_2 = A0_2

  L7_2 = A1_2 + 0.025

  L8_2 = 0.095 + L4_2

  L9_2 = 0.05

  L10_2 = 0

  L11_2 = 0

  L12_2 = 0

  L13_2 = 155

  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

end

Draw2DText = L1_1

L1_1 = Config

L1_1 = L1_1.DebugRestrictZones

if L1_1 then

  L1_1 = Citizen

  L1_1 = L1_1.CreateThread

  function L2_1()

    local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2

    while true do

      L0_2 = GetEntityCoords

      L1_2 = PlayerPedId

      L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L1_2()

      L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)

      L1_2 = 1

      L2_2 = Config

      L2_2 = L2_2.RestrictedAlertZones

      L2_2 = #L2_2

      L3_2 = 1

      for L4_2 = L1_2, L2_2, L3_2 do

        L5_2 = isInside

        L6_2 = Config

        L6_2 = L6_2.RestrictedAlertZones

        L6_2 = L6_2[L4_2]

        L7_2 = L0_2.x

        L8_2 = L0_2.y

        L5_2 = L5_2(L6_2, L7_2, L8_2)

        L6_2 = 1

        L7_2 = Config

        L7_2 = L7_2.RestrictedAlertZones

        L7_2 = L7_2[L4_2]

        L7_2 = #L7_2

        L8_2 = 1

        for L9_2 = L6_2, L7_2, L8_2 do

          L10_2 = Config

          L10_2 = L10_2.RestrictedAlertZones

          L10_2 = L10_2[L4_2]

          L10_2 = L10_2[L9_2]

          L11_2 = Config

          L11_2 = L11_2.RestrictedAlertZones

          L11_2 = L11_2[L4_2]

          L12_2 = L9_2 - 1

          L11_2 = L11_2[L12_2]

          L12_2 = Draw3DText

          L13_2 = L10_2[1]

          L14_2 = L10_2[2]

          L15_2 = L0_2.z

          L16_2 = 0.7

          L17_2 = L9_2

          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

          L12_2 = DrawLine

          L13_2 = L10_2[1]

          L14_2 = L10_2[2]

          L15_2 = -10.0

          L16_2 = L10_2[1]

          L17_2 = L10_2[2]

          L18_2 = 100.0

          L19_2 = 255.0

          L20_2 = 0.0

          L21_2 = 0.0

          L22_2 = 255

          L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)

          if L5_2 then

            L12_2 = {}

            L13_2 = 0

            L14_2 = 255

            L15_2 = 0

            L16_2 = 100

            L12_2[1] = L13_2

            L12_2[2] = L14_2

            L12_2[3] = L15_2

            L12_2[4] = L16_2

            if L12_2 then

              goto lbl_72

            end

          end

          L12_2 = {}

          L13_2 = 255

          L14_2 = 0

          L15_2 = 0

          L16_2 = 100

          L12_2[1] = L13_2

          L12_2[2] = L14_2

          L12_2[3] = L15_2

          L12_2[4] = L16_2

          ::lbl_72::

          if L11_2 then

            L13_2 = DrawLine

            L14_2 = L10_2[1]

            L15_2 = L10_2[2]

            L16_2 = 100.0

            L17_2 = L11_2[1]

            L18_2 = L11_2[2]

            L19_2 = 100.0

            L20_2 = 255.0

            L21_2 = 0.0

            L22_2 = 0.0

            L23_2 = 255

            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)

            L13_2 = DrawWall

            L14_2 = vector3

            L15_2 = L10_2[1]

            L16_2 = L10_2[2]

            L17_2 = 0.0

            L14_2 = L14_2(L15_2, L16_2, L17_2)

            L15_2 = vector3

            L16_2 = L11_2[1]

            L17_2 = L11_2[2]

            L18_2 = 0.0

            L15_2 = L15_2(L16_2, L17_2, L18_2)

            L16_2 = -10.0

            L17_2 = 100.0

            L18_2 = table

            L18_2 = L18_2.unpack

            L19_2 = L12_2

            L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)

            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)

          else

            L13_2 = DrawLine

            L14_2 = L10_2[1]

            L15_2 = L10_2[2]

            L16_2 = 100.0

            L17_2 = Config

            L17_2 = L17_2.RestrictedAlertZones

            L17_2 = L17_2[L4_2]

            L18_2 = Config

            L18_2 = L18_2.RestrictedAlertZones

            L18_2 = L18_2[L4_2]

            L18_2 = #L18_2

            L17_2 = L17_2[L18_2]

            L17_2 = L17_2[1]

            L18_2 = Config

            L18_2 = L18_2.RestrictedAlertZones

            L18_2 = L18_2[L4_2]

            L19_2 = Config

            L19_2 = L19_2.RestrictedAlertZones

            L19_2 = L19_2[L4_2]

            L19_2 = #L19_2

            L18_2 = L18_2[L19_2]

            L18_2 = L18_2[2]

            L19_2 = 100.0

            L20_2 = 255.0

            L21_2 = 0.0

            L22_2 = 0.0

            L23_2 = 255

            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)

            L13_2 = DrawWall

            L14_2 = vector3

            L15_2 = L10_2[1]

            L16_2 = L10_2[2]

            L17_2 = 0.0

            L14_2 = L14_2(L15_2, L16_2, L17_2)

            L15_2 = vector3

            L16_2 = Config

            L16_2 = L16_2.RestrictedAlertZones

            L16_2 = L16_2[L4_2]

            L17_2 = Config

            L17_2 = L17_2.RestrictedAlertZones

            L17_2 = L17_2[L4_2]

            L17_2 = #L17_2

            L16_2 = L16_2[L17_2]

            L16_2 = L16_2[1]

            L17_2 = Config

            L17_2 = L17_2.RestrictedAlertZones

            L17_2 = L17_2[L4_2]

            L18_2 = Config

            L18_2 = L18_2.RestrictedAlertZones

            L18_2 = L18_2[L4_2]

            L18_2 = #L18_2

            L17_2 = L17_2[L18_2]

            L17_2 = L17_2[2]

            L18_2 = 0.0

            L15_2 = L15_2(L16_2, L17_2, L18_2)

            L16_2 = -10.0

            L17_2 = 100.0

            L18_2 = table

            L18_2 = L18_2.unpack

            L19_2 = L12_2

            L18_2, L19_2, L20_2, L21_2, L22_2, L23_2 = L18_2(L19_2)

            L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2)

          end

        end

      end

      L1_2 = Wait

      L2_2 = 0

      L1_2(L2_2)

    end

  end

  L1_1(L2_1)

end

