local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = 0

L1_1 = GetGameTimer

L1_1 = L1_1()

L2_1 = {}

L3_1 = RegisterCommand

L4_1 = "plceobj"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L2_2 = FW_GetPlayerData

  L3_2 = false

  L2_2 = L2_2(L3_2)

  L3_2 = CanOpenTablet

  L4_2 = L2_2.job

  L4_2 = L4_2.name

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[1]

  if L3_2 then

    L3_2 = L2_2.job

    L3_2 = L3_2.onduty

    if L3_2 then

      L3_2 = GetGameTimer

      L3_2 = L3_2()

      L4_2 = L1_1

      L3_2 = L3_2 - L4_2

      L4_2 = 1500

      if L3_2 > L4_2 then

        L3_2 = GetGameTimer

        L3_2 = L3_2()

        L1_1 = L3_2

        L3_2 = table

        L3_2 = L3_2.concat

        L4_2 = A1_2

        L5_2 = " "

        L3_2 = L3_2(L4_2, L5_2)

        L4_2 = Config

        L4_2 = L4_2.Props

        L4_2 = L4_2[L3_2]

        if L4_2 then

          L4_2 = SlectPropAndPos

          L5_2 = Config

          L5_2 = L5_2.Props

          L5_2 = L5_2[L3_2]

          L6_2 = Config

          L6_2 = L6_2.Props

          L6_2 = L6_2[L3_2]

          L6_2 = L6_2.Text

          L7_2 = Config

          L7_2 = L7_2.Props

          L7_2 = L7_2[L3_2]

          L7_2 = L7_2.Animations

          L4_2(L5_2, L6_2, L7_2)

        end

      end

    end

  end

end

L3_1(L4_1, L5_1)

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2

  L0_2 = 2.0

  L1_2 = nil

  L2_2 = nil

  L3_2 = nil

  L4_2 = GetEntityCoords

  L5_2 = PlayerPedId

  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L5_2()

  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

  L5_2 = pairs

  L6_2 = L2_1

  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

    L11_2 = pairs

    L12_2 = L10_2

    L11_2, L12_2, L13_2, L14_2 = L11_2(L12_2)

    for L15_2, L16_2 in L11_2, L12_2, L13_2, L14_2 do

      L17_2 = DoesEntityExist

      L18_2 = L16_2

      L17_2 = L17_2(L18_2)

      if L17_2 then

        L17_2 = GetEntityCoords

        L18_2 = L16_2

        L17_2 = L17_2(L18_2)

        L18_2 = GetEntityModel

        L19_2 = L16_2

        L18_2 = L18_2(L19_2)

        if 1927491455 == L18_2 then

          L18_2 = vector3

          L19_2 = L17_2.x

          L20_2 = L17_2.y

          L21_2 = L17_2.z

          L21_2 = L21_2 + 7.0

          L18_2 = L18_2(L19_2, L20_2, L21_2)

          L17_2 = L18_2

        end

        L18_2 = L4_2 - L17_2

        L18_2 = #L18_2

        if L0_2 > L18_2 then

          L0_2 = L18_2

          L19_2 = L9_2

          L20_2 = L15_2

          L3_2 = L16_2

          L2_2 = L20_2

          L1_2 = L19_2

        end

      end

    end

  end

  L5_2 = L1_2

  L6_2 = L2_2

  L7_2 = L3_2

  return L5_2, L6_2, L7_2

end

FindNearPlacedObject = L3_1

L3_1 = RegisterCommand

L4_1 = "rmveobj"

function L5_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L0_2 = FW_GetPlayerData

  L1_2 = false

  L0_2 = L0_2(L1_2)

  L1_2 = CanOpenTablet

  L2_2 = L0_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  if L1_2 then

    L1_2 = L0_2.job

    L1_2 = L1_2.onduty

    if L1_2 then

      L1_2 = GetGameTimer

      L1_2 = L1_2()

      L2_2 = L1_1

      L1_2 = L1_2 - L2_2

      L2_2 = 1500

      if L1_2 > L2_2 then

        L1_2 = GetGameTimer

        L1_2 = L1_2()

        L1_1 = L1_2

        L1_2 = FindNearPlacedObject

        L1_2, L2_2, L3_2 = L1_2()

        if L3_2 then

          L4_2 = RequestAnimDict

          L5_2 = "pickup_object"

          L4_2(L5_2)

          while true do

            L4_2 = HasAnimDictLoaded

            L5_2 = "pickup_object"

            L4_2 = L4_2(L5_2)

            if L4_2 then

              break

            end

            L4_2 = Citizen

            L4_2 = L4_2.Wait

            L5_2 = 7

            L4_2(L5_2)

          end

          L4_2 = TaskPlayAnim

          L5_2 = PlayerPedId

          L5_2 = L5_2()

          L6_2 = "pickup_object"

          L7_2 = "pickup_low"

          L8_2 = 8.0

          L9_2 = -8.0

          L10_2 = -1

          L11_2 = 1

          L12_2 = 0

          L13_2 = false

          L14_2 = false

          L15_2 = false

          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

          L4_2 = Citizen

          L4_2 = L4_2.SetTimeout

          L5_2 = 700

          function L6_2()

            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

            L0_3 = TriggerServerEvent

            L1_3 = "origen_police:callback:rmveobj"

            L2_3 = L1_2

            L3_3 = L2_2

            L4_3 = GetEntityCoords

            L5_3 = L3_2

            L4_3, L5_3 = L4_3(L5_3)

            L0_3(L1_3, L2_3, L3_3, L4_3, L5_3)

          end

          L4_2(L5_2, L6_2)

          L4_2 = Citizen

          L4_2 = L4_2.Wait

          L5_2 = 1000

          L4_2(L5_2)

          L4_2 = ClearPedTasks

          L5_2 = PlayerPedId

          L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2()

          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

        end

      else

        L1_2 = ShowNotification

        L2_2 = Config

        L2_2 = L2_2.Translations

        L2_2 = L2_2.CantFast

        L1_2(L2_2)

      end

    end

  end

end

L3_1(L4_1, L5_1)

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2

  L3_2 = PlayerPedId

  L3_2 = L3_2()

  L4_2 = GetEntityCoords

  L4_2 = L4_2()

  L5_2 = 1

  L6_2 = A0_2.Props

  L6_2 = L6_2[L5_2]

  L7_2 = DeleteEntity

  L8_2 = L0_1

  L7_2(L8_2)

  L7_2 = 0

  L0_1 = L7_2

  L7_2 = HideHelpNotification

  L7_2()

  L7_2 = Wait

  L8_2 = 500

  L7_2(L8_2)

  L7_2 = GenerateObject

  L8_2 = L6_2.model

  L9_2 = L4_2

  L10_2 = A2_2.dict

  L7_2 = L7_2(L8_2, L9_2, L10_2)

  L0_1 = L7_2

  L7_2 = AttachEntityToEntity

  L8_2 = L0_1

  L9_2 = L3_2

  L10_2 = L6_2.bone

  L11_2 = L6_2.x

  L11_2 = L11_2 + 0.0

  L12_2 = L6_2.y

  L12_2 = L12_2 + 0.0

  L13_2 = L6_2.z

  L13_2 = L13_2 + 0.0

  L14_2 = L6_2.xr

  L14_2 = L14_2 + 0.0

  L15_2 = L6_2.yr

  L15_2 = L15_2 + 0.0

  L16_2 = L6_2.zr

  L16_2 = L16_2 + 0.0

  L17_2 = true

  L18_2 = true

  L19_2 = false

  L20_2 = true

  L21_2 = 1

  L22_2 = true

  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)

  L7_2 = Citizen

  L7_2 = L7_2.CreateThread

  function L8_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3

    L0_3 = false

    while true do

      L1_3 = L0_1

      if 0 == L1_3 then

        goto lbl_454

      end

      L1_3 = Citizen

      L1_3 = L1_3.Wait

      L2_3 = 5

      L1_3(L2_3)

      L1_3 = GetEntityCoords

      L2_3 = L3_2

      L1_3 = L1_3(L2_3)

      L4_2 = L1_3

      L1_3 = Config

      L1_3 = L1_3.CustomNotify

      if L1_3 then

        if L0_3 then

        else

          L1_3 = GetResourceState

          L2_3 = "origen_notify"

          L1_3 = L1_3(L2_3)

          if "started" == L1_3 then

            L1_3 = ShowHelpNotification

            L2_3 = "E"

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.objects

            L3_3 = L3_3.place

            L1_3(L2_3, L3_3)

            L1_3 = ShowHelpNotification

            L2_3 = "left"

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.objects

            L3_3 = L3_3.prev

            L1_3(L2_3, L3_3)

            L1_3 = ShowHelpNotification

            L2_3 = "right"

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.objects

            L3_3 = L3_3.next

            L1_3(L2_3, L3_3)

            L1_3 = ShowHelpNotification

            L2_3 = "backspace"

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.objects

            L3_3 = L3_3.cancel

            L1_3(L2_3, L3_3)

            L1_3 = Config

            L1_3 = L1_3.Framework

            if "esx" == L1_3 then

              L1_3 = CreateThread

              function L2_3()

                local L0_4, L1_4

                L0_4 = Wait

                L1_4 = 0

                L0_4(L1_4)

                L0_4 = false

                L0_3 = L0_4

              end

              L1_3(L2_3)

            end

          else

            L1_3 = ShowHelpNotification

            L2_3 = "E"

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.objects

            L3_3 = L3_3.fullText

            L4_3 = L3_3

            L3_3 = L3_3.format

            L5_3 = "[E]"

            L6_3 = "[LEFT]"

            L7_3 = "[RIGHT]"

            L8_3 = "[BACKSPACE]"

            L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)

            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          end

          L0_3 = true

        end

      else

        L1_3 = Config

        L1_3 = L1_3.Framework

        if "qbcore" == L1_3 and not L0_3 then

          L0_3 = true

          L1_3 = exports

          L1_3 = L1_3["qb-core"]

          L2_3 = L1_3

          L1_3 = L1_3.DrawText

          L3_3 = Config

          L3_3 = L3_3.Translations

          L3_3 = L3_3.objects

          L3_3 = L3_3.fullText

          L4_3 = L3_3

          L3_3 = L3_3.format

          L5_3 = "[E]"

          L6_3 = "[LEFT]"

          L7_3 = "[RIGHT]"

          L8_3 = "[BACKSPACE]"

          L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)

          L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

        else

          L1_3 = Config

          L1_3 = L1_3.Framework

          if "esx" == L1_3 then

            L1_3 = Framework

            L1_3 = L1_3.ShowHelpNotification

            L2_3 = Config

            L2_3 = L2_3.Translations

            L2_3 = L2_3.objects

            L2_3 = L2_3.fullText

            L3_3 = L2_3

            L2_3 = L2_3.format

            L4_3 = "~INPUT_CONTEXT~"

            L5_3 = "~INPUT_CELLPHONE_LEFT~"

            L6_3 = "~INPUT_CELLPHONE_RIGHT~"

            L7_3 = "~INPUT_FRONTEND_RRIGHT~"

            L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          end

        end

      end

      L1_3 = A2_2.dict

      if L1_3 then

        L1_3 = A2_2.anim

        if L1_3 then

          L1_3 = IsEntityPlayingAnim

          L2_3 = L3_2

          L3_3 = A2_2.dict

          L4_3 = A2_2.anim

          L5_3 = 3

          L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)

          if not L1_3 then

            L1_3 = TaskPlayAnim

            L2_3 = L3_2

            L3_3 = A2_2.dict

            L4_3 = A2_2.anim

            L5_3 = 8.0

            L6_3 = 8.0

            L7_3 = -1

            L8_3 = 51

            L9_3 = false

            L10_3 = false

            L11_3 = false

            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)

          end

        end

      end

      L1_3 = IsControlJustPressed

      L2_3 = 0

      L3_3 = 38

      L1_3 = L1_3(L2_3, L3_3)

      if L1_3 then

        L1_3 = nil

        L2_3 = nil

        L3_3 = A2_2.dictponer

        if L3_3 then

          L3_3 = A2_2.animponer

          if L3_3 then

            L3_3 = RequestAnimDict

            L4_3 = A2_2.dictponer

            L3_3(L4_3)

            while true do

              L3_3 = HasAnimDictLoaded

              L4_3 = A2_2.dictponer

              L3_3 = L3_3(L4_3)

              if L3_3 then

                break

              end

              L3_3 = Wait

              L4_3 = 1

              L3_3(L4_3)

            end

            L3_3 = TaskPlayAnim

            L4_3 = L3_2

            L5_3 = A2_2.dictponer

            L6_3 = A2_2.animponer

            L7_3 = 8.0

            L8_3 = 8.0

            L9_3 = -1

            L10_3 = 0

            L11_3 = false

            L12_3 = false

            L13_3 = false

            L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)

            L3_3 = Citizen

            L3_3 = L3_3.Wait

            L4_3 = 1000

            L3_3(L4_3)

            L3_3 = GetEntityForwardVector

            L4_3 = L3_2

            L3_3 = L3_3(L4_3)

            L4_3 = vector3

            L5_3 = L4_2.x

            L6_3 = L4_2.y

            L7_3 = L4_2.z

            L7_3 = L7_3 - 1

            L4_3 = L4_3(L5_3, L6_3, L7_3)

            L5_3 = L3_3 * 1.0

            L1_3 = L4_3 + L5_3

            L4_3 = GetEntityHeading

            L5_3 = L3_2

            L4_3 = L4_3(L5_3)

            L2_3 = L4_3

            L4_3 = L6_2.model

            if "prop_air_conelight" == L4_3 then

              L4_3 = vector3

              L5_3 = 0

              L6_3 = 0

              L7_3 = 0.15

              L4_3 = L4_3(L5_3, L6_3, L7_3)

              L1_3 = L1_3 - L4_3

            end

        end

        else

          L3_3 = GetEntityCoords

          L4_3 = L0_1

          L3_3 = L3_3(L4_3)

          L1_3 = L3_3

          L3_3 = GetEntityHeading

          L4_3 = L0_1

          L3_3 = L3_3(L4_3)

          L2_3 = L3_3

        end

        L3_3 = L6_2.type

        if "speed" ~= L3_3 then

          L3_3 = L6_2.type

          if "plate" ~= L3_3 then

            goto lbl_312

          end

        end

        L3_3 = GetEntityCoords

        L4_3 = L0_1

        L3_3 = L3_3(L4_3)

        L4_3 = GetEntityForwardVector

        L5_3 = L0_1

        L4_3 = L4_3(L5_3)

        L5_3 = L6_2.type

        if "speed" == L5_3 then

          L5_3 = vector3

          L6_3 = 0

          L7_3 = 0

          L8_3 = 1

          L5_3 = L5_3(L6_3, L7_3, L8_3)

          L1_3 = L1_3 - L5_3

          L5_3 = OpenMenu

          L6_3 = "dialog"

          L7_3 = GetCurrentResourceName

          L7_3 = L7_3()

          L8_3 = "radarmaxspeed"

          L9_3 = {}

          L10_3 = Config

          L10_3 = L10_3.Translations

          L10_3 = L10_3.EnterMaxSpeed

          L9_3.title = L10_3

          function L10_3(A0_4, A1_4)

            local L2_4, L3_4, L4_4, L5_4, L6_4

            if A0_4 then

              L2_4 = A0_4.value

              if L2_4 then

                L2_4 = tonumber

                L3_4 = A0_4.value

                L2_4 = L2_4(L3_4)

                if L2_4 then

                  L2_4 = TriggerServerEvent

                  L3_4 = "origen_police:server:placeradar"

                  L4_4 = {}

                  L5_4 = L1_3

                  L4_4.objectCoords = L5_4

                  L5_4 = L1_3

                  L6_4 = L4_3

                  L6_4 = L6_4 * 22.5

                  L5_4 = L5_4 - L6_4

                  L4_4.coords = L5_4

                  L5_4 = tonumber

                  L6_4 = A0_4.value

                  L5_4 = L5_4(L6_4)

                  L4_4.value = L5_4

                  L4_4.type = 1

                  L2_4(L3_4, L4_4)

                  L2_4 = A1_4.close

                  L2_4()

              end

            end

            else

              L2_4 = ShowNotification

              L3_4 = Config

              L3_4 = L3_4.Translations

              L3_4 = L3_4.MustEnterNumber

              L2_4(L3_4)

            end

          end

          function L11_3(A0_4, A1_4)

            local L2_4

            L2_4 = A1_4.close

            L2_4()

          end

          L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)

        else

          L5_3 = GenerateObject

          L6_3 = L6_2.model

          L7_3 = L3_3

          L5_3 = L5_3(L6_3, L7_3)

          L6_3 = SetEntityHeading

          L7_3 = L5_3

          L8_3 = GetEntityHeading

          L9_3 = PlayerPedId

          L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L9_3()

          L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          L6_3(L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          L6_3 = GetEntityForwardVector

          L7_3 = L5_3

          L6_3 = L6_3(L7_3)

          L7_3 = DeleteEntity

          L8_3 = L5_3

          L7_3(L8_3)

          L7_3 = OpenMenu

          L8_3 = "dialog"

          L9_3 = GetCurrentResourceName

          L9_3 = L9_3()

          L10_3 = "radarplate"

          L11_3 = {}

          L12_3 = Config

          L12_3 = L12_3.Translations

          L12_3 = L12_3.EnterPlate

          L11_3.title = L12_3

          function L12_3(A0_4, A1_4)

            local L2_4, L3_4, L4_4, L5_4, L6_4

            if A0_4 then

              L2_4 = A0_4.value

              if L2_4 then

                L2_4 = TriggerServerEvent

                L3_4 = "origen_police:server:placeradar"

                L4_4 = {}

                L5_4 = L1_3

                L4_4.objectCoords = L5_4

                L5_4 = L1_3

                L6_4 = L6_3

                L6_4 = L6_4 * 22.5

                L5_4 = L5_4 - L6_4

                L4_4.coords = L5_4

                L5_4 = A0_4.value

                L4_4.value = L5_4

                L4_4.type = 2

                L2_4(L3_4, L4_4)

                L2_4 = A1_4.close

                L2_4()

            end

            else

              L2_4 = ShowNotification

              L3_4 = Config

              L3_4 = L3_4.Translations

              L3_4 = L3_4.MustEnterNumber

              L2_4(L3_4)

            end

          end

          function L13_3(A0_4, A1_4)

            local L2_4

            L2_4 = A1_4.close

            L2_4()

          end

          L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)

        end

        L5_3 = TriggerServerEvent

        L6_3 = "origen_police:server:placeobj"

        L7_3 = L6_2.model

        L8_3 = L1_3

        L9_3 = L2_3

        L10_3 = L6_2.physics

        L10_3 = not L10_3

        L5_3(L6_3, L7_3, L8_3, L9_3, L10_3)

        L5_3 = DeleteEntity

        L6_3 = L0_1

        L5_3(L6_3)

        L5_3 = A2_2.dict

        if L5_3 then

          L5_3 = A2_2.anim

          if L5_3 then

            L5_3 = ClearPedTasks

            L6_3 = GetPlayerPed

            L7_3 = -1

            L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L6_3(L7_3)

            L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          end

        end

        do break end

        ::lbl_312::

        L3_3 = TriggerServerEvent

        L4_3 = "origen_police:server:placeobj"

        L5_3 = L6_2.model

        L6_3 = L1_3

        L7_3 = L2_3

        L8_3 = L6_2.physics

        L8_3 = not L8_3

        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3)

      end

      L1_3 = IsControlJustPressed

      L2_3 = 0

      L3_3 = 174

      L1_3 = L1_3(L2_3, L3_3)

      if L1_3 then

        L1_3 = L5_2

        L1_3 = L1_3 - 1

        L2_3 = A0_2.Props

        L2_3 = L2_3[L1_3]

        if L2_3 then

          L2_3 = DeleteEntity

          L3_3 = L0_1

          L2_3(L3_3)

          L5_2 = L1_3

          L2_3 = A0_2.Props

          L3_3 = L5_2

          L2_3 = L2_3[L3_3]

          L6_2 = L2_3

          L2_3 = GenerateObject

          L3_3 = L6_2.model

          L4_3 = L4_2

          L2_3 = L2_3(L3_3, L4_3)

          L0_1 = L2_3

          L2_3 = AttachEntityToEntity

          L3_3 = L0_1

          L4_3 = L3_2

          L5_3 = L6_2.bone

          L6_3 = L6_2.x

          L6_3 = L6_3 + 0.0

          L7_3 = L6_2.y

          L7_3 = L7_3 + 0.0

          L8_3 = L6_2.z

          L8_3 = L8_3 + 0.0

          L9_3 = L6_2.xr

          L9_3 = L9_3 + 0.0

          L10_3 = L6_2.yr

          L10_3 = L10_3 + 0.0

          L11_3 = L6_2.zr

          L11_3 = L11_3 + 0.0

          L12_3 = true

          L13_3 = true

          L14_3 = false

          L15_3 = true

          L16_3 = 1

          L17_3 = true

          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

        end

      end

      L1_3 = IsControlJustPressed

      L2_3 = 0

      L3_3 = 175

      L1_3 = L1_3(L2_3, L3_3)

      if L1_3 then

        L1_3 = L5_2

        L1_3 = L1_3 + 1

        L2_3 = A0_2.Props

        L2_3 = L2_3[L1_3]

        if L2_3 then

          L2_3 = DeleteEntity

          L3_3 = L0_1

          L2_3(L3_3)

          L5_2 = L1_3

          L2_3 = A0_2.Props

          L3_3 = L5_2

          L2_3 = L2_3[L3_3]

          L6_2 = L2_3

          L2_3 = GenerateObject

          L3_3 = L6_2.model

          L4_3 = L4_2

          L2_3 = L2_3(L3_3, L4_3)

          L0_1 = L2_3

          L2_3 = AttachEntityToEntity

          L3_3 = L0_1

          L4_3 = L3_2

          L5_3 = L6_2.bone

          L6_3 = L6_2.x

          L6_3 = L6_3 + 0.0

          L7_3 = L6_2.y

          L7_3 = L7_3 + 0.0

          L8_3 = L6_2.z

          L8_3 = L8_3 + 0.0

          L9_3 = L6_2.xr

          L9_3 = L9_3 + 0.0

          L10_3 = L6_2.yr

          L10_3 = L10_3 + 0.0

          L11_3 = L6_2.zr

          L11_3 = L11_3 + 0.0

          L12_3 = true

          L13_3 = true

          L14_3 = false

          L15_3 = true

          L16_3 = 1

          L17_3 = true

          L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

        end

      end

      L1_3 = IsControlJustPressed

      L2_3 = 0

      L3_3 = 202

      L1_3 = L1_3(L2_3, L3_3)

      if L1_3 then

        L1_3 = DeleteEntity

        L2_3 = L0_1

        L1_3(L2_3)

        L1_3 = A2_2.dict

        if L1_3 then

          L1_3 = A2_2.anim

          if L1_3 then

            L1_3 = ClearPedTasks

            L2_3 = GetPlayerPed

            L3_3 = -1

            L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L2_3(L3_3)

            L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

          end

        end

        break

      end

    end

    ::lbl_454::

    L1_3 = ClearPedTasks

    L2_3 = PlayerPedId

    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3 = L2_3()

    L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3)

    L1_3 = HideHelpNotification

    L1_3()

  end

  L7_2(L8_2)

end

SlectPropAndPos = L3_1

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  if A2_2 then

    L3_2 = RequestAnimDict

    L4_2 = A2_2

    L3_2(L4_2)

    while true do

      L3_2 = HasAnimDictLoaded

      L4_2 = A2_2

      L3_2 = L3_2(L4_2)

      if L3_2 then

        break

      end

      L3_2 = Wait

      L4_2 = 1

      L3_2(L4_2)

    end

  end

  L3_2 = RequestModel

  L4_2 = A0_2

  L3_2(L4_2)

  while true do

    L3_2 = HasModelLoaded

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    if L3_2 then

      break

    end

    L3_2 = Citizen

    L3_2 = L3_2.Wait

    L4_2 = 10

    L3_2(L4_2)

  end

  L3_2 = CreateObject

  L4_2 = GetHashKey

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  L5_2 = A1_2.x

  L6_2 = A1_2.y

  L7_2 = A1_2.z

  L8_2 = false

  L9_2 = true

  L10_2 = true

  return L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

end

GenerateObject = L3_1

L3_1 = AddEventHandler

L4_1 = "onResourceStop"

function L5_1(A0_2)

  local L1_2, L2_2

  L1_2 = GetCurrentResourceName

  L1_2 = L1_2()

  if A0_2 == L1_2 then

    L1_2 = DeleteEntity

    L2_2 = L0_1

    L1_2(L2_2)

  end

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:placeradar"

function L5_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = table

  L1_2 = L1_2.insert

  L2_2 = Public

  L2_2 = L2_2.Radars

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:removeradar"

function L5_1(A0_2)

  local L1_2, L2_2, L3_2

  L1_2 = table

  L1_2 = L1_2.remove

  L2_2 = Public

  L2_2 = L2_2.Radars

  L3_2 = A0_2

  L1_2(L2_2, L3_2)

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:placeobj"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = A0_2.source

  L2_2 = L2_1

  L5_2 = A0_2.source

  L4_2 = L2_1

  L4_2 = L4_2[L5_2]

  if not L4_2 then

    L4_2 = {}

  end

  L2_2[L3_2] = L4_2

  L2_2 = GetHashKey

  L3_2 = A1_2.model

  L2_2 = L2_2(L3_2)

  A1_2.model = L2_2

  L2_2 = LoadModel

  L3_2 = A1_2.model

  L4_2 = 5000

  L2_2 = L2_2(L3_2, L4_2)

  if not L2_2 then

    L2_2 = print

    L3_2 = "Could not load model to place: "

    L4_2 = A1_2.model

    L3_2 = L3_2 .. L4_2

    L2_2(L3_2)

    L3_2 = A0_2.source

    L2_2 = L2_1

    L2_2 = L2_2[L3_2]

    L3_2 = A0_2.objectId

    L2_2[L3_2] = 1

    return

  end

  L2_2 = CreateObject

  L3_2 = A1_2.model

  L4_2 = A1_2.coords

  L5_2 = false

  L6_2 = true

  L7_2 = false

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  L3_2 = SetEntityHeading

  L4_2 = L2_2

  L5_2 = A1_2.heading

  L3_2(L4_2, L5_2)

  L3_2 = FreezeEntityPosition

  L4_2 = L2_2

  L5_2 = A1_2.freeze

  L3_2(L4_2, L5_2)

  L4_2 = A0_2.source

  L3_2 = L2_1

  L3_2 = L3_2[L4_2]

  L4_2 = A0_2.objectId

  L3_2[L4_2] = L2_2

end

L3_1(L4_1, L5_1)

L3_1 = RegisterNetEvent

L4_1 = "origen_police:client:rmveobj"

function L5_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = Debuger

  L2_2 = "Remove object, placer data: "

  L3_2 = json

  L3_2 = L3_2.encode

  L4_2 = A0_2

  L3_2, L4_2 = L3_2(L4_2)

  L1_2(L2_2, L3_2, L4_2)

  L2_2 = A0_2.source

  L1_2 = L2_1

  L1_2 = L1_2[L2_2]

  if L1_2 then

    L2_2 = A0_2.source

    L1_2 = L2_1

    L1_2 = L1_2[L2_2]

    L2_2 = A0_2.objectId

    L1_2 = L1_2[L2_2]

    if L1_2 then

      L2_2 = A0_2.source

      L1_2 = L2_1

      L1_2 = L1_2[L2_2]

      L2_2 = A0_2.objectId

      L1_2 = L1_2[L2_2]

      L2_2 = DoesEntityExist

      L3_2 = L1_2

      L2_2 = L2_2(L3_2)

      if L2_2 then

        L2_2 = DeleteEntity

        L3_2 = L1_2

        L2_2(L3_2)

      end

      L3_2 = A0_2.source

      L2_2 = L2_1

      L2_2 = L2_2[L3_2]

      L3_2 = A0_2.objectId

      L2_2[L3_2] = nil

      L2_2 = next

      L4_2 = A0_2.source

      L3_2 = L2_1

      L3_2 = L3_2[L4_2]

      L2_2 = L2_2(L3_2)

      if not L2_2 then

        L3_2 = A0_2.source

        L2_2 = L2_1

        L2_2[L3_2] = nil

      end

    end

  end

end

L3_1(L4_1, L5_1)

