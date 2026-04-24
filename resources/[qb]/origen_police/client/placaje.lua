local L0_1, L1_1, L2_1, L3_1, L4_1

L0_1 = false

L1_1 = false

L2_1 = RegisterCommand

L3_1 = "placaje"

function L4_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L3_2 = IsPedInAnyVehicle

  L4_2 = PlayerPedId

  L4_2 = L4_2()

  L5_2 = false

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    return

  end

  L3_2 = FW_GetPlayerData

  L4_2 = false

  L3_2 = L3_2(L4_2)

  if nil ~= L3_2 then

    L4_2 = L3_2.job

    if nil ~= L4_2 then

      L4_2 = L3_2.job

      L4_2 = L4_2.name

      if nil ~= L4_2 then

        goto lbl_23

      end

    end

  end

  L4_2 = false

  do return L4_2 end

  ::lbl_23::

  L4_2 = GetMinimunGrade

  L5_2 = L3_2.job

  L5_2 = L5_2.name

  L6_2 = "CanTackle"

  L4_2 = L4_2(L5_2, L6_2)

  L5_2 = L3_2.job

  L5_2 = L5_2.grade

  L5_2 = L5_2.level

  L4_2 = L4_2 <= L5_2

  if not L4_2 then

    L5_2 = FW_Notify

    L6_2 = Config

    L6_2 = L6_2.Translations

    L6_2 = L6_2.CantDoThis

    return L5_2(L6_2)

  end

  L5_2 = CanOpenTablet

  L6_2 = L3_2.job

  L6_2 = L6_2.name

  L5_2 = L5_2(L6_2)

  L5_2 = L5_2[1]

  if L5_2 then

    L5_2 = L3_2.job

    L5_2 = L5_2.onduty

    if L5_2 then

      L5_2 = FW_GetClosestPlayer

      L5_2, L6_2 = L5_2()

      L7_2 = GetPlayerPed

      L8_2 = L5_2

      L7_2 = L7_2(L8_2)

      if -1 ~= L5_2 then

        L8_2 = 1.5

        if L6_2 <= L8_2 and L6_2 > 0 then

          L8_2 = IsPedInAnyVehicle

          L9_2 = L7_2

          L10_2 = false

          L8_2 = L8_2(L9_2, L10_2)

          if not L8_2 then

            L8_2 = IsPedInAnyVehicle

            L9_2 = PlayerPedId

            L9_2 = L9_2()

            L10_2 = false

            L8_2 = L8_2(L9_2, L10_2)

            if not L8_2 then

              L8_2 = IsEntityDead

              L9_2 = L7_2

              L8_2 = L8_2(L9_2)

              if not L8_2 then

                L8_2 = IsEntityDead

                L9_2 = PlayerPedId

                L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L9_2()

                L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                if not L8_2 then

                  L8_2 = L0_1

                  if not L8_2 then

                    L8_2 = TriggerServerEvent

                    L9_2 = "origen_police:placaje_sv"

                    L10_2 = GetPlayerServerId

                    L11_2 = L5_2

                    L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L10_2(L11_2)

                    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                    L8_2 = true

                    L0_1 = L8_2

                    L8_2 = RequestAnimDict

                    L9_2 = "missmic2ig_11"

                    L8_2(L9_2)

                    while true do

                      L8_2 = HasAnimDictLoaded

                      L9_2 = "missmic2ig_11"

                      L8_2 = L8_2(L9_2)

                      if L8_2 then

                        break

                      end

                      L8_2 = Citizen

                      L8_2 = L8_2.Wait

                      L9_2 = 10

                      L8_2(L9_2)

                    end

                    L8_2 = TaskPlayAnim

                    L9_2 = PlayerPedId

                    L9_2 = L9_2()

                    L10_2 = "missmic2ig_11"

                    L11_2 = "mic_2_ig_11_intro_goon"

                    L12_2 = 8.0

                    L13_2 = -8.0

                    L14_2 = 3000

                    L15_2 = 0

                    L16_2 = 0

                    L17_2 = false

                    L18_2 = false

                    L19_2 = false

                    L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

                    L8_2 = Citizen

                    L8_2 = L8_2.Wait

                    L9_2 = 3000

                    L8_2(L9_2)

                    L8_2 = false

                    L0_1 = L8_2

                  end

                  return

              end

            end

          end

        end

      end

      else

        L8_2 = Config

        L8_2 = L8_2.Actions

        L8_2 = L8_2.RagdollInTackleFail

        if L8_2 then

          L8_2 = ShowNotification

          L9_2 = Config

          L9_2 = L9_2.Translations

          L9_2 = L9_2.PersonFar

          L8_2(L9_2)

          L8_2 = RequestAnimDict

          L9_2 = "missmic2ig_11"

          L8_2(L9_2)

          while true do

            L8_2 = HasAnimDictLoaded

            L9_2 = "missmic2ig_11"

            L8_2 = L8_2(L9_2)

            if L8_2 then

              break

            end

            L8_2 = Citizen

            L8_2 = L8_2.Wait

            L9_2 = 10

            L8_2(L9_2)

          end

          L8_2 = TaskPlayAnim

          L9_2 = PlayerPedId

          L9_2 = L9_2()

          L10_2 = "missmic2ig_11"

          L11_2 = "mic_2_ig_11_intro_goon"

          L12_2 = 8.0

          L13_2 = -8.0

          L14_2 = 3000

          L15_2 = 0

          L16_2 = 0

          L17_2 = false

          L18_2 = false

          L19_2 = false

          L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)

          L8_2 = Citizen

          L8_2 = L8_2.Wait

          L9_2 = 2200

          L8_2(L9_2)

          L8_2 = true

          L1_1 = L8_2

          L8_2 = Citizen

          L8_2 = L8_2.CreateThread

          function L9_2()

            local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3

            while true do

              L0_3 = Citizen

              L0_3 = L0_3.Wait

              L1_3 = 5

              L0_3(L1_3)

              L0_3 = L1_1

              if L0_3 then

                L0_3 = SetPedToRagdoll

                L1_3 = GetPlayerPed

                L2_3 = -1

                L1_3 = L1_3(L2_3)

                L2_3 = 1000

                L3_3 = 1000

                L4_3 = 0

                L5_3 = 0

                L6_3 = 0

                L7_3 = 0

                L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)

              else

                break

              end

            end

          end

          L8_2(L9_2)

          L8_2 = Citizen

          L8_2 = L8_2.Wait

          L9_2 = 3000

          L8_2(L9_2)

          L8_2 = false

          L1_1 = L8_2

        end

      end

      L8_2 = Debuger

      L9_2 = "Tackle failed data, targetped: "

      L10_2 = L7_2

      L11_2 = ", player: "

      L12_2 = L5_2

      L13_2 = ", distance(max 1.5 min 0.01): "

      L14_2 = L6_2

      L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2

      L8_2(L9_2)

    end

  end

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:placaje_cl"

L2_1(L3_1)

L2_1 = AddEventHandler

L3_1 = "origen_police:placaje_cl"

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L1_2 = L0_1

  if not L1_2 then

    L1_2 = true

    L0_1 = L1_2

    L1_2 = GetPlayerPed

    L2_2 = GetPlayerFromServerId

    L3_2 = A0_2

    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L2_2(L3_2)

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

    L2_2 = RequestAnimDict

    L3_2 = "missmic2ig_11"

    L2_2(L3_2)

    while true do

      L2_2 = HasAnimDictLoaded

      L3_2 = "missmic2ig_11"

      L2_2 = L2_2(L3_2)

      if L2_2 then

        break

      end

      L2_2 = Citizen

      L2_2 = L2_2.Wait

      L3_2 = 10

      L2_2(L3_2)

    end

    L2_2 = AttachEntityToEntity

    L3_2 = GetPlayerPed

    L4_2 = -1

    L3_2 = L3_2(L4_2)

    L4_2 = L1_2

    L5_2 = 11816

    L6_2 = 0.25

    L7_2 = 0.5

    L8_2 = 0.0

    L9_2 = 0.5

    L10_2 = 0.5

    L11_2 = 180.0

    L12_2 = false

    L13_2 = false

    L14_2 = false

    L15_2 = false

    L16_2 = 2

    L17_2 = false

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

    L2_2 = TaskPlayAnim

    L3_2 = GetPlayerPed

    L4_2 = -1

    L3_2 = L3_2(L4_2)

    L4_2 = "missmic2ig_11"

    L5_2 = "mic_2_ig_11_intro_p_one"

    L6_2 = 8.0

    L7_2 = -8.0

    L8_2 = 3000

    L9_2 = 0

    L10_2 = 0

    L11_2 = false

    L12_2 = false

    L13_2 = false

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 2200

    L2_2(L3_2)

    L2_2 = DetachEntity

    L3_2 = GetPlayerPed

    L4_2 = -1

    L3_2 = L3_2(L4_2)

    L4_2 = true

    L5_2 = false

    L2_2(L3_2, L4_2, L5_2)

    L2_2 = true

    L1_1 = L2_2

    L2_2 = Citizen

    L2_2 = L2_2.CreateThread

    function L3_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3

      while true do

        L0_3 = Citizen

        L0_3 = L0_3.Wait

        L1_3 = 5

        L0_3(L1_3)

        L0_3 = L1_1

        if L0_3 then

          L0_3 = SetPedToRagdoll

          L1_3 = GetPlayerPed

          L2_3 = -1

          L1_3 = L1_3(L2_3)

          L2_3 = 1000

          L3_3 = 1000

          L4_3 = 0

          L5_3 = 0

          L6_3 = 0

          L7_3 = 0

          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)

        else

          break

        end

      end

    end

    L2_2(L3_2)

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 3000

    L2_2(L3_2)

    L2_2 = false

    L1_1 = L2_2

    L2_2 = false

    L0_1 = L2_2

  end

end

L2_1(L3_1, L4_1)

