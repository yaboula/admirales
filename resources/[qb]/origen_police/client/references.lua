local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

L0_1 = {}

L1_1 = {}

L2_1 = RegisterNUICallback

L3_1 = "SetLocation"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  A0_2 = A0_2.value

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:setLocation"

  L4_2 = A0_2

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L2_1(L3_1, L4_1)

L2_1 = AddStateBagChangeHandler

L3_1 = "References"

L4_1 = "global"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2

  L3_2 = GetPlayerJobCategory

  L3_2 = L3_2()

  if not L3_2 then

    return

  end

  L4_2 = A2_2[L3_2]

  if not L4_2 then

    return

  end

  L4_2 = A2_2[L3_2]

  if not L4_2 then

    L4_2 = {}

  end

  L0_1 = L4_2

end

L2_1(L3_1, L4_1, L5_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:removeref"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  if A1_2 then

    L2_2 = pairs

    L3_2 = L1_1

    L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

    for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

      L8_2 = RemoveBlip

      L9_2 = L7_2

      L8_2(L9_2)

      L8_2 = L0_1

      L8_2[L6_2] = nil

    end

    return

  end

  L2_2 = L1_1

  L2_2 = L2_2[A0_2]

  if L2_2 then

    L2_2 = RemoveBlip

    L3_2 = L1_1

    L3_2 = L3_2[A0_2]

    L2_2(L3_2)

    L2_2 = L1_1

    L2_2[A0_2] = nil

    L2_2 = L0_1

    L2_2[A0_2] = nil

  end

end

L2_1(L3_1, L4_1)

function L2_1()

  local L0_2, L1_2

  L0_2 = Citizen

  L0_2 = L0_2.CreateThread

  function L1_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    L0_3 = DisplayPlayerNameTagsOnBlips

    L1_3 = true

    L0_3(L1_3)

    while true do

      L0_3 = onduty

      if not L0_3 then

        break

      end

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 0

      L0_3(L1_3)

      L0_3 = pairs

      L1_3 = L0_1

      L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)

      for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do

        L6_3 = L5_3.hideGPS

        if not L6_3 then

          L6_3 = L1_1

          L6_3 = L6_3[L4_3]

          if L6_3 then

            L6_3 = DoesBlipExist

            L7_3 = L1_1

            L7_3 = L7_3[L4_3]

            L6_3 = L6_3(L7_3)

            if L6_3 then

              L6_3 = L5_3.sync

              if not L6_3 then

                goto lbl_103

              end

            end

          end

          L6_3 = L5_3.sync

          if L6_3 then

            L6_3 = RemoveBlip

            L7_3 = L1_1

            L7_3 = L7_3[L4_3]

            L6_3(L7_3)

            L5_3.sync = nil

          end

          L6_3 = GetPlayerFromServerId

          L7_3 = L4_3

          L6_3 = L6_3(L7_3)

          if -1 ~= L6_3 then

            L6_3 = L1_1

            L7_3 = AddBlipForEntity

            L8_3 = GetPlayerPed

            L9_3 = GetPlayerFromServerId

            L10_3 = L4_3

            L9_3, L10_3 = L9_3(L10_3)

            L8_3, L9_3, L10_3 = L8_3(L9_3, L10_3)

            L7_3 = L7_3(L8_3, L9_3, L10_3)

            L6_3[L4_3] = L7_3

          else

            L6_3 = L1_1

            L7_3 = AddBlipForCoord

            L8_3 = L5_3.coords

            L7_3 = L7_3(L8_3)

            L6_3[L4_3] = L7_3

          end

          L6_3 = SetBlipSprite

          L7_3 = L1_1

          L7_3 = L7_3[L4_3]

          L8_3 = L5_3.sprite

          if not L8_3 then

            L8_3 = Config

            L8_3 = L8_3.References

            L8_3 = L8_3.DefaultSprite

          end

          L6_3(L7_3, L8_3)

          L6_3 = SetBlipDisplay

          L7_3 = L1_1

          L7_3 = L7_3[L4_3]

          L8_3 = 2

          L6_3(L7_3, L8_3)

          L6_3 = SetBlipColour

          L7_3 = L1_1

          L7_3 = L7_3[L4_3]

          L8_3 = L5_3.color

          if not L8_3 then

            L8_3 = Config

            L8_3 = L8_3.References

            L8_3 = L8_3.DefaultColor

          end

          L6_3(L7_3, L8_3)

          L6_3 = SetBlipCategory

          L7_3 = L1_1

          L7_3 = L7_3[L4_3]

          L8_3 = 7

          L6_3(L7_3, L8_3)

          L6_3 = BeginTextCommandSetBlipName

          L7_3 = "STRING"

          L6_3(L7_3)

          L6_3 = AddTextComponentSubstringPlayerName

          L7_3 = L5_3.unit

          L8_3 = " - "

          L9_3 = L5_3.lastname

          L7_3 = L7_3 .. L8_3 .. L9_3

          L6_3(L7_3)

          L6_3 = EndTextCommandSetBlipName

          L7_3 = L1_1

          L7_3 = L7_3[L4_3]

          L6_3(L7_3)

        ::lbl_103::

        else

          L6_3 = L5_3.hideGPS

          if not L6_3 then

            L6_3 = SetBlipSprite

            L7_3 = L1_1

            L7_3 = L7_3[L4_3]

            L8_3 = L5_3.sprite

            if not L8_3 then

              L8_3 = Config

              L8_3 = L8_3.References

              L8_3 = L8_3.DefaultSprite

            end

            L6_3(L7_3, L8_3)

            L6_3 = SetBlipColour

            L7_3 = L1_1

            L7_3 = L7_3[L4_3]

            L8_3 = L5_3.color

            if not L8_3 then

              L8_3 = Config

              L8_3 = L8_3.References

              L8_3 = L8_3.DefaultColor

            end

            L6_3(L7_3, L8_3)

            L6_3 = BeginTextCommandSetBlipName

            L7_3 = "STRING"

            L6_3(L7_3)

            L6_3 = AddTextComponentSubstringPlayerName

            L7_3 = L5_3.unit

            L8_3 = " - "

            L9_3 = L5_3.lastname

            L7_3 = L7_3 .. L8_3 .. L9_3

            L6_3(L7_3)

            L6_3 = EndTextCommandSetBlipName

            L7_3 = L1_1

            L7_3 = L7_3[L4_3]

            L6_3(L7_3)

            L6_3 = GetPlayerFromServerId

            L7_3 = L4_3

            L6_3 = L6_3(L7_3)

            if -1 == L6_3 then

              L6_3 = SetBlipCoords

              L7_3 = L1_1

              L7_3 = L7_3[L4_3]

              L8_3 = L5_3.coords

              L6_3(L7_3, L8_3)

            else

              L6_3 = GetBlipInfoIdType

              L7_3 = L1_1

              L7_3 = L7_3[L4_3]

              L6_3 = L6_3(L7_3)

              if 4 == L6_3 then

                L5_3.sync = true

              end

            end

          else

            L6_3 = L5_3.hideGPS

            if L6_3 then

              L6_3 = L1_1

              L6_3 = L6_3[L4_3]

              if L6_3 then

                L6_3 = RemoveBlip

                L7_3 = L1_1

                L7_3 = L7_3[L4_3]

                L6_3(L7_3)

                L6_3 = L1_1

                L6_3[L4_3] = nil

              end

            end

          end

        end

      end

    end

    L0_3 = pairs

    L1_3 = L1_1

    L0_3, L1_3, L2_3, L3_3 = L0_3(L1_3)

    for L4_3, L5_3 in L0_3, L1_3, L2_3, L3_3 do

      L6_3 = RemoveBlip

      L7_3 = L5_3

      L6_3(L7_3)

    end

    L0_3 = DisplayPlayerNameTagsOnBlips

    L1_3 = false

    L0_3(L1_3)

  end

  L0_2(L1_2)

end

StartReferences = L2_1

