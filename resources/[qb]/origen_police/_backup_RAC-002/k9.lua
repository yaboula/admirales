local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = 0

L1_1 = vector3

L2_1 = 0

L3_1 = 0

L4_1 = 0

L1_1 = L1_1(L2_1, L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:CallK9"

function L4_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L0_2 = L0_1

  if 0 == L0_2 then

    L0_2 = FW_GetVehicles

    L0_2 = L0_2()

    L1_2 = 0

    L2_2 = GetEntityCoords

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L3_2 = 1

    L4_2 = #L0_2

    L5_2 = 1

    for L6_2 = L3_2, L4_2, L5_2 do

      L7_2 = Config

      L7_2 = L7_2.K9

      L7_2 = L7_2.Vehicles

      L8_2 = GetEntityModel

      L9_2 = L0_2[L6_2]

      L8_2 = L8_2(L9_2)

      L7_2 = L7_2[L8_2]

      if L7_2 then

        L7_2 = GetEntityCoords

        L8_2 = L0_2[L6_2]

        L7_2 = L7_2(L8_2)

        L7_2 = L7_2 - L2_2

        L7_2 = #L7_2

        if L7_2 < 40 then

          L1_2 = L0_2[L6_2]

          L7_2 = NetworkRequestControlOfEntity

          L8_2 = L1_2

          L7_2(L8_2)

          L7_2 = Citizen

          L7_2 = L7_2.Wait

          L8_2 = 50

          L7_2(L8_2)

          L7_2 = NetworkHasControlOfEntity

          L8_2 = L1_2

          L7_2 = L7_2(L8_2)

          if L7_2 then

            break

          end

        end

      end

    end

    if 0 ~= L1_2 then

      L3_2 = RequestAnimDict

      L4_2 = "swat"

      L3_2(L4_2)

      L3_2 = RequestAnimDict

      L4_2 = "taxi_hail"

      L3_2(L4_2)

      L3_2 = RequestAnimDict

      L4_2 = "gestures@f@standing@casual"

      L3_2(L4_2)

      L3_2 = RequestAnimDict

      L4_2 = "creatures@rottweiler@amb@world_dog_sitting@idle_a"

      L3_2(L4_2)

      L3_2 = RequestAnimDict

      L4_2 = "creatures@rottweiler@amb@sleep_in_kennel@"

      L3_2(L4_2)

      L3_2 = RequestAnimDict

      L4_2 = "creatures@rottweiler@amb@world_dog_barking@idle_a"

      L3_2(L4_2)

      L3_2 = GetOffsetFromEntityInWorldCoords

      L4_2 = L1_2

      L5_2 = Config

      L5_2 = L5_2.K9

      L5_2 = L5_2.SpawnCarOffset

      L5_2 = L5_2.x

      L6_2 = Config

      L6_2 = L6_2.K9

      L6_2 = L6_2.SpawnCarOffset

      L6_2 = L6_2.y

      L7_2 = Config

      L7_2 = L7_2.K9

      L7_2 = L7_2.SpawnCarOffset

      L7_2 = L7_2.z

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)

      L1_1 = L3_2

      L3_2 = SetVehicleDoorOpen

      L4_2 = L1_2

      L5_2 = Config

      L5_2 = L5_2.K9

      L5_2 = L5_2.SpawnOpenDoor

      L3_2(L4_2, L5_2)

      L3_2 = GetHashKey

      L4_2 = Config

      L4_2 = L4_2.K9

      L4_2 = L4_2.Model

      L3_2 = L3_2(L4_2)

      L4_2 = RequestModel

      L5_2 = L3_2

      L4_2(L5_2)

      while true do

        L4_2 = HasModelLoaded

        L5_2 = L3_2

        L4_2 = L4_2(L5_2)

        if L4_2 then

          break

        end

        L4_2 = Citizen

        L4_2 = L4_2.Wait

        L5_2 = 1

        L4_2(L5_2)

      end

      while true do

        L4_2 = HasAnimDictLoaded

        L5_2 = "taxi_hail"

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

      L6_2 = "taxi_hail"

      L7_2 = "hail_taxi"

      L8_2 = 8.0

      L9_2 = -8.0

      L10_2 = -1

      L11_2 = 48

      L12_2 = 0

      L13_2 = 0

      L14_2 = 0

      L15_2 = 0

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = Citizen

      L4_2 = L4_2.Wait

      L5_2 = 1000

      L4_2(L5_2)

      L4_2 = CreatePed

      L5_2 = 4

      L6_2 = L3_2

      L7_2 = L1_1.x

      L8_2 = L1_1.y

      L9_2 = L1_1.z

      L10_2 = true

      L11_2 = true

      L12_2 = true

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

      L0_1 = L4_2

      L4_2 = SetPedRelationshipGroupHash

      L5_2 = L0_1

      L6_2 = GetHashKey

      L7_2 = "k9"

      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2)

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = SetBlockingOfNonTemporaryEvents

      L5_2 = L0_1

      L6_2 = true

      L4_2(L5_2, L6_2)

      L4_2 = SetPedFleeAttributes

      L5_2 = L0_1

      L6_2 = 0

      L7_2 = 0

      L4_2(L5_2, L6_2, L7_2)

      L4_2 = AddBlipForEntity

      L5_2 = L0_1

      L4_2 = L4_2(L5_2)

      L5_2 = SetBlipAsFriendly

      L6_2 = L4_2

      L7_2 = true

      L5_2(L6_2, L7_2)

      L5_2 = SetBlipSprite

      L6_2 = L4_2

      L7_2 = 442

      L5_2(L6_2, L7_2)

      L5_2 = SetEntityHeading

      L6_2 = L0_1

      L7_2 = GetEntityHeading

      L8_2 = L1_2

      L7_2 = L7_2(L8_2)

      L7_2 = L7_2 - 180

      L5_2(L6_2, L7_2)

      L5_2 = TaskFollowToOffsetOfEntity

      L6_2 = L0_1

      L7_2 = PlayerPedId

      L7_2 = L7_2()

      L8_2 = 0.5

      L9_2 = -1.0

      L10_2 = 0.0

      L11_2 = 5.0

      L12_2 = -1

      L13_2 = 1.0

      L14_2 = true

      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

      L5_2 = Citizen

      L5_2 = L5_2.Wait

      L6_2 = 2000

      L5_2(L6_2)

      L5_2 = SetVehicleDoorShut

      L6_2 = L1_2

      L7_2 = 5

      L5_2(L6_2, L7_2)

      L5_2 = SetVehicleDoorShut

      L6_2 = L1_2

      L7_2 = 6

      L5_2(L6_2, L7_2)

      L5_2 = DogThread

      L5_2()

    else

      L3_2 = ShowNotification

      L4_2 = Config

      L4_2 = L4_2.Translations

      L4_2 = L4_2.InvalidK9Veh

      L3_2(L4_2)

    end

  else

    L0_2 = ShowNotification

    L1_2 = Config

    L1_2 = L1_2.Translations

    L1_2 = L1_2.AlreadyCallK9

    L0_2(L1_2)

  end

end

L2_1(L3_1, L4_1)

function L2_1()

  local L0_2, L1_2

  L0_2 = Citizen

  L0_2 = L0_2.CreateThread

  function L1_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3

    L0_3 = nil

    while true do

      L1_3 = DoesEntityExist

      L2_3 = L0_1

      L1_3 = L1_3(L2_3)

      if not L1_3 then

        break

      end

      L1_3 = 500

      L2_3 = IsPlayerFreeAiming

      L3_3 = PlayerId

      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3 = L3_3()

      L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)

      if not L2_3 then

        L2_3 = GetPedConfigFlag

        L3_3 = ped

        L4_3 = 78

        L2_3 = L2_3(L3_3, L4_3)

        if not L2_3 then

          goto lbl_118

        end

      end

      L1_3 = 5

      L2_3 = GetScreenCoords

      L3_3 = 100

      L2_3, L3_3, L4_3 = L2_3(L3_3)

      if L2_3 then

        if L4_3 then

          L5_3 = IsEntityAPed

          L6_3 = L4_3

          L5_3 = L5_3(L6_3)

          if L5_3 then

            L5_3 = L0_1

            if L4_3 ~= L5_3 then

              L5_3 = Config

              L5_3 = L5_3.CustomNotify

              if L5_3 then

                L5_3 = ShowHelpNotification

                L6_3 = "E"

                L7_3 = Config

                L7_3 = L7_3.Translations

                L7_3 = L7_3.k9Attack

                L5_3(L6_3, L7_3)

                L0_3 = true

              else

                L5_3 = Config

                L5_3 = L5_3.Framework

                if "qbcore" == L5_3 then

                  if not L0_3 then

                    L5_3 = exports

                    L5_3 = L5_3["qb-core"]

                    L6_3 = L5_3

                    L5_3 = L5_3.DrawText

                    L7_3 = "[E] "

                    L8_3 = Config

                    L8_3 = L8_3.Translations

                    L8_3 = L8_3.k9Attack

                    L7_3 = L7_3 .. L8_3

                    L8_3 = "left"

                    L5_3(L6_3, L7_3, L8_3)

                    L0_3 = true

                  end

                else

                  L5_3 = Config

                  L5_3 = L5_3.Framework

                  if "esx" == L5_3 then

                    L5_3 = Framework

                    L5_3 = L5_3.ShowHelpNotification

                    L6_3 = "~INPUT_PICKUP~ "

                    L7_3 = Config

                    L7_3 = L7_3.Translations

                    L7_3 = L7_3.k9Attack

                    L6_3 = L6_3 .. L7_3

                    L7_3 = true

                    L5_3(L6_3, L7_3)

                  end

                end

              end

              L5_3 = IsControlJustPressed

              L6_3 = 0

              L7_3 = 38

              L5_3 = L5_3(L6_3, L7_3)

              if L5_3 then

                L5_3 = TaskPlayAnim

                L6_3 = PlayerPedId

                L6_3 = L6_3()

                L7_3 = "swat"

                L8_3 = "you_fwd"

                L9_3 = 1.0

                L10_3 = 4.0

                L11_3 = -1

                L12_3 = 48

                L13_3 = 0

                L14_3 = 0

                L15_3 = 0

                L16_3 = 0

                L5_3(L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3)

                L5_3 = TaskCombatPed

                L6_3 = L0_1

                L7_3 = L4_3

                L8_3 = 0

                L9_3 = 16

                L5_3(L6_3, L7_3, L8_3, L9_3)

              end

          end

        end

        elseif L0_3 then

          L5_3 = HideHelpNotification

          L5_3()

          L0_3 = nil

        end

      elseif L0_3 then

        L5_3 = HideHelpNotification

        L5_3()

        L0_3 = nil

        goto lbl_123

        ::lbl_118::

        if L0_3 then

          L2_3 = HideHelpNotification

          L2_3()

          L0_3 = nil

        end

      end

      ::lbl_123::

      L2_3 = Citizen

      L2_3 = L2_3.Wait

      L3_3 = L1_3

      L2_3(L3_3)

    end

    L1_3 = 0

    L0_1 = L1_3

  end

  L0_2(L1_2)

end

DogThread = L2_1

L2_1 = RegisterKeyMapping

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.K9Menu

L3_1 = L3_1.cmd

L4_1 = Config

L4_1 = L4_1.Commands

L4_1 = L4_1.K9Menu

L4_1 = L4_1.description

L5_1 = "keyboard"

L6_1 = Config

L6_1 = L6_1.Commands

L6_1 = L6_1.K9Menu

L6_1 = L6_1.key

L2_1(L3_1, L4_1, L5_1, L6_1)

L2_1 = RegisterCommand

L3_1 = Config

L3_1 = L3_1.Commands

L3_1 = L3_1.K9Menu

L3_1 = L3_1.cmd

function L4_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = L0_1

  if 0 ~= L0_2 then

    L0_2 = OpenMenu

    L1_2 = {}

    L2_2 = {}

    L3_2 = Config

    L3_2 = L3_2.Translations

    L3_2 = L3_2.K9Title

    L2_2.header = L3_2

    L2_2.isMenuHeader = true

    L3_2 = {}

    L4_2 = Config

    L4_2 = L4_2.Translations

    L4_2 = L4_2.K9Follow

    L3_2.header = L4_2

    L4_2 = Config

    L4_2 = L4_2.Translations

    L4_2 = L4_2.K9FollowDesc

    L3_2.txt = L4_2

    L3_2.icon = "fa-solid fa-paw"

    L4_2 = {}

    L4_2.event = "origen_police:client:HandleK9"

    L4_2.args = "followme"

    L3_2.params = L4_2

    L4_2 = {}

    L5_2 = Config

    L5_2 = L5_2.Translations

    L5_2 = L5_2.K9DontMove

    L4_2.header = L5_2

    L5_2 = Config

    L5_2 = L5_2.Translations

    L5_2 = L5_2.K9DontMoveDesc

    L4_2.txt = L5_2

    L4_2.icon = "fa-solid fa-hand"

    L5_2 = {}

    L5_2.event = "origen_police:client:HandleK9"

    L5_2.args = "stop"

    L4_2.params = L5_2

    L5_2 = {}

    L6_2 = Config

    L6_2 = L6_2.Translations

    L6_2 = L6_2.K9Sit

    L5_2.header = L6_2

    L6_2 = Config

    L6_2 = L6_2.Translations

    L6_2 = L6_2.K9SitDesc

    L5_2.txt = L6_2

    L5_2.icon = "fa-solid fa-chair"

    L6_2 = {}

    L6_2.event = "origen_police:client:HandleK9"

    L6_2.args = "sit"

    L5_2.params = L6_2

    L6_2 = {}

    L7_2 = Config

    L7_2 = L7_2.Translations

    L7_2 = L7_2.K9LieDown

    L6_2.header = L7_2

    L7_2 = Config

    L7_2 = L7_2.Translations

    L7_2 = L7_2.K9LieDownDesc

    L6_2.txt = L7_2

    L6_2.icon = "fa-solid fa-water"

    L7_2 = {}

    L7_2.event = "origen_police:client:HandleK9"

    L7_2.args = "lay"

    L6_2.params = L7_2

    L7_2 = {}

    L8_2 = Config

    L8_2 = L8_2.Translations

    L8_2 = L8_2.K9SearhArea

    L7_2.header = L8_2

    L8_2 = Config

    L8_2 = L8_2.Translations

    L8_2 = L8_2.K9SearhAreaDesc

    L7_2.txt = L8_2

    L7_2.icon = "fa-solid fa-magnifying-glass"

    L8_2 = {}

    L8_2.event = "origen_police:client:HandleK9"

    L8_2.args = "search"

    L7_2.params = L8_2

    L8_2 = {}

    L9_2 = Config

    L9_2 = L9_2.Translations

    L9_2 = L9_2.K9ReturnCar

    L8_2.header = L9_2

    L9_2 = Config

    L9_2 = L9_2.Translations

    L9_2 = L9_2.K9ReturnCarDesc

    L8_2.txt = L9_2

    L8_2.icon = "fa-solid fa-truck"

    L9_2 = {}

    L9_2.event = "origen_police:client:HandleK9"

    L9_2.args = "gohome"

    L8_2.params = L9_2

    L1_2[1] = L2_2

    L1_2[2] = L3_2

    L1_2[3] = L4_2

    L1_2[4] = L5_2

    L1_2[5] = L6_2

    L1_2[6] = L7_2

    L1_2[7] = L8_2

    L0_2(L1_2)

  end

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:HandleK9"

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  if "followme" == A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "swat"

    L4_2 = "come"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = TaskFollowToOffsetOfEntity

    L2_2 = L0_1

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = 0.5

    L5_2 = -1.0

    L6_2 = 0.0

    L7_2 = 5.0

    L8_2 = -1

    L9_2 = 1.0

    L10_2 = true

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

  elseif "stop" == A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "swat"

    L4_2 = "freeze"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = ClearPedTasks

    L2_2 = L0_1

    L1_2(L2_2)

  elseif "sit" == A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "gestures@f@standing@casual"

    L4_2 = "gesture_hand_down"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = ClearPedTasks

    L2_2 = L0_1

    L1_2(L2_2)

    L1_2 = TaskPlayAnim

    L2_2 = L0_1

    L3_2 = "creatures@rottweiler@amb@world_dog_sitting@idle_a"

    L4_2 = "idle_b"

    L5_2 = 2.0

    L6_2 = -2.0

    L7_2 = -1

    L8_2 = 2

    L9_2 = 0.0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

  elseif "lay" == A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "gestures@f@standing@casual"

    L4_2 = "gesture_hand_down"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 500

    L1_2(L2_2)

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "gestures@f@standing@casual"

    L4_2 = "gesture_hand_down"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 500

    L1_2(L2_2)

    L1_2 = ClearPedTasks

    L2_2 = L0_1

    L1_2(L2_2)

    L1_2 = TaskPlayAnim

    L2_2 = L0_1

    L3_2 = "creatures@rottweiler@amb@sleep_in_kennel@"

    L4_2 = "sleep_in_kennel"

    L5_2 = 2.0

    L6_2 = -2.0

    L7_2 = -1

    L8_2 = 2

    L9_2 = 0.0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

  elseif "search" == A0_2 then

    L1_2 = TaskPlayAnim

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = "swat"

    L4_2 = "rally_point"

    L5_2 = 8.0

    L6_2 = -8.0

    L7_2 = -1

    L8_2 = 48

    L9_2 = 0

    L10_2 = 0

    L11_2 = 0

    L12_2 = 0

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

    L1_2 = Citizen

    L1_2 = L1_2.Wait

    L2_2 = 1000

    L1_2(L2_2)

    L1_2 = SetBlockingOfNonTemporaryEvents

    L2_2 = L0_1

    L3_2 = true

    L1_2(L2_2, L3_2)

    L1_2 = GetEntityCoords

    L2_2 = PlayerPedId

    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L2_2()

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L2_2 = TaskWanderInArea

    L3_2 = L0_1

    L4_2 = L1_2.x

    L5_2 = L1_2.y

    L6_2 = L1_2.z

    L7_2 = Config

    L7_2 = L7_2.K9

    L7_2 = L7_2.SearchRadious

    L8_2 = 1

    L9_2 = 1.0

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    L2_2 = Debuger

    L3_2 = "K9 Search started at: "

    L4_2 = L1_2

    L5_2 = "Radius: "

    L6_2 = Config

    L6_2 = L6_2.K9

    L6_2 = L6_2.SearchRadious

    L7_2 = "Time: "

    L8_2 = GetGameTimer

    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L8_2()

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = Config

    L3_2 = L3_2.Debug

    if L3_2 then

      L3_2 = 1000

      if L3_2 then

        goto lbl_210

      end

    end

    L3_2 = 30000

    ::lbl_210::

    L2_2(L3_2)

    L2_2 = SetBlockingOfNonTemporaryEvents

    L3_2 = L0_1

    L4_2 = false

    L2_2(L3_2, L4_2)

    L2_2 = {}

    L3_2 = pairs

    L4_2 = FW_GetPlayersFromCoords

    L5_2 = GetEntityCoords

    L6_2 = PlayerPedId

    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2()

    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L6_2 = Config

    L6_2 = L6_2.K9

    L6_2 = L6_2.SearchRadious

    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2(L5_2, L6_2)

    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

      L9_2 = GetPlayerServerId

      L10_2 = L8_2

      L9_2 = L9_2(L10_2)

      L10_2 = GetPlayerPed

      L11_2 = L8_2

      L10_2 = L10_2(L11_2)

      L2_2[L9_2] = L10_2

    end

    L3_2 = GetEntityCoords

    L4_2 = PlayerPedId

    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2()

    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L4_2 = pairs

    L5_2 = FW_GetVehicles

    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2()

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = GetEntityCoords

      L11_2 = L9_2

      L10_2 = L10_2(L11_2)

      L10_2 = L10_2 - L3_2

      L10_2 = #L10_2

      L11_2 = Config

      L11_2 = L11_2.K9

      L11_2 = L11_2.SearchRadious

      if L10_2 < L11_2 then

        L10_2 = GetVehiclePlate

        L11_2 = L9_2

        L10_2 = L10_2(L11_2)

        L2_2[L10_2] = L9_2

      end

    end

    L4_2 = Debuger

    L5_2 = "K9 Search targets: "

    L6_2 = json

    L6_2 = L6_2.encode

    L7_2 = L2_2

    L8_2 = {}

    L8_2.indent = true

    L6_2 = L6_2(L7_2, L8_2)

    L7_2 = "Time: "

    L8_2 = GetGameTimer

    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L8_2()

    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

    L4_2 = FW_TriggerCallback

    L5_2 = "origen_police:server:K9Search"

    function L6_2(A0_3)

      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3

      L1_3 = Debuger

      L2_3 = "K9 Search result: "

      L3_3 = A0_3

      L1_3(L2_3, L3_3)

      if A0_3 then

        L1_3 = ShowNotification

        L2_3 = Config

        L2_3 = L2_3.Translations

        L2_3 = L2_3.K9Found

        L1_3(L2_3)

        L1_3 = TaskFollowToOffsetOfEntity

        L2_3 = L0_1

        L3_3 = L2_2

        L3_3 = L3_3[A0_3]

        L4_3 = 0.5

        L5_3 = -1.0

        L6_3 = 0.0

        L7_3 = 5.0

        L8_3 = -1

        L9_3 = 1.0

        L10_3 = true

        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

        while true do

          L1_3 = GetEntityCoords

          L2_3 = L0_1

          L1_3 = L1_3(L2_3)

          L2_3 = GetEntityCoords

          L3_3 = L2_2

          L3_3 = L3_3[A0_3]

          L2_3 = L2_3(L3_3)

          L1_3 = L1_3 - L2_3

          L1_3 = #L1_3

          if not (L1_3 > 5) then

            break

          end

          L1_3 = Citizen

          L1_3 = L1_3.Wait

          L2_3 = 200

          L1_3(L2_3)

        end

        L1_3 = TaskPlayAnim

        L2_3 = L0_1

        L3_3 = "creatures@rottweiler@amb@world_dog_barking@idle_a"

        L4_3 = "idle_a"

        L5_3 = 8.0

        L6_3 = -8.0

        L7_3 = -1

        L8_3 = 2

        L9_3 = 0.0

        L10_3 = 0

        L11_3 = 0

        L12_3 = 0

        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

      else

        L1_3 = TaskFollowToOffsetOfEntity

        L2_3 = L0_1

        L3_3 = PlayerPedId

        L3_3 = L3_3()

        L4_3 = 0.5

        L5_3 = -1.0

        L6_3 = 0.0

        L7_3 = 5.0

        L8_3 = -1

        L9_3 = 1.0

        L10_3 = true

        L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

        L1_3 = ShowNotification

        L2_3 = Config

        L2_3 = L2_3.Translations

        L2_3 = L2_3.K9NotFound

        L1_3(L2_3)

      end

    end

    L7_2 = L2_2

    L4_2(L5_2, L6_2, L7_2)

  elseif "gohome" == A0_2 then

    L1_2 = IsEntityDead

    L2_2 = L0_1

    L1_2 = L1_2(L2_2)

    if not L1_2 then

      L1_2 = FW_GetVehicles

      L1_2 = L1_2()

      L2_2 = 0

      L3_2 = GetEntityCoords

      L4_2 = PlayerPedId

      L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2()

      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = 1

      L5_2 = #L1_2

      L6_2 = 1

      for L7_2 = L4_2, L5_2, L6_2 do

        L8_2 = Config

        L8_2 = L8_2.K9

        L8_2 = L8_2.Vehicles

        L9_2 = GetEntityModel

        L10_2 = L1_2[L7_2]

        L9_2 = L9_2(L10_2)

        L8_2 = L8_2[L9_2]

        if L8_2 then

          L8_2 = GetEntityCoords

          L9_2 = L1_2[L7_2]

          L8_2 = L8_2(L9_2)

          L8_2 = L8_2 - L3_2

          L8_2 = #L8_2

          if L8_2 < 40 then

            L2_2 = L1_2[L7_2]

            L8_2 = NetworkRequestControlOfEntity

            L9_2 = L2_2

            L8_2(L9_2)

            L8_2 = Citizen

            L8_2 = L8_2.Wait

            L9_2 = 50

            L8_2(L9_2)

            L8_2 = NetworkHasControlOfEntity

            L9_2 = L2_2

            L8_2 = L8_2(L9_2)

            if L8_2 then

              break

            end

          end

        end

      end

      L4_2 = TaskPlayAnim

      L5_2 = PlayerPedId

      L5_2 = L5_2()

      L6_2 = "swat"

      L7_2 = "rally_point"

      L8_2 = 8.0

      L9_2 = -8.0

      L10_2 = -1

      L11_2 = 48

      L12_2 = 0

      L13_2 = 0

      L14_2 = 0

      L15_2 = 0

      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

      L4_2 = Citizen

      L4_2 = L4_2.Wait

      L5_2 = 1000

      L4_2(L5_2)

      if 0 ~= L2_2 then

        L4_2 = TaskFollowToOffsetOfEntity

        L5_2 = L0_1

        L6_2 = L2_2

        L7_2 = 0.5

        L8_2 = -1.0

        L9_2 = 0.0

        L10_2 = 5.0

        L11_2 = -1

        L12_2 = 1.0

        L13_2 = true

        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

        L4_2 = Citizen

        L4_2 = L4_2.CreateThread

        function L5_2()

          local L0_3, L1_3, L2_3

          while true do

            L0_3 = GetEntityCoords

            L1_3 = L0_1

            L0_3 = L0_3(L1_3)

            L1_3 = GetEntityCoords

            L2_3 = L2_2

            L1_3 = L1_3(L2_3)

            L0_3 = L0_3 - L1_3

            L0_3 = #L0_3

            if not (L0_3 > 5) then

              break

            end

            L0_3 = Citizen

            L0_3 = L0_3.Wait

            L1_3 = 200

            L0_3(L1_3)

          end

          L0_3 = DeleteEntity

          L1_3 = L0_1

          L0_3(L1_3)

        end

        L4_2(L5_2)

      else

        L4_2 = DeleteEntity

        L5_2 = L0_1

        L4_2(L5_2)

      end

    else

      L1_2 = DeleteEntity

      L2_2 = L0_1

      L1_2(L2_2)

    end

  end

end

L2_1(L3_1, L4_1)

