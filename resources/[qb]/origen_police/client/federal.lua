local L0_1, L1_1, L2_1, L3_1

L0_1 = false

L1_1 = Config

L1_1 = L1_1.Federal

L1_1 = L1_1.Exits

if not L1_1 then

  L1_1 = print

  L2_1 = "You have a syntax error in config/federal.lua or you're missing the Exits table, we don't give support for this, just revert your changed or redownload the file from keymaster."

  L1_1(L2_1)

end

function L1_1()

  local L0_2, L1_2

  L0_2 = L0_1

  return L0_2

end

isInPrision = L1_1

L1_1 = exports

L2_1 = "IsInPrision"

L3_1 = isInPrision

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:OnPlayerLoaded"

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = GetResourceState

  L1_2 = "origen_titlemenu"

  L0_2 = L0_2(L1_2)

  if "started" == L0_2 then

    return

  end

  L0_2 = Wait

  L1_2 = 2000

  L0_2(L1_2)

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  L1_2 = L0_2.metadata

  if L1_2 then

    L1_2 = L0_2.metadata

    L1_2 = L1_2.federal

    if 1 == L1_2 then

      L1_2 = Citizen

      L1_2 = L1_2.Wait

      L2_2 = 2000

      L1_2(L2_2)

      L1_2 = SpawnInFederal

      L2_2 = L0_2

      L1_2(L2_2)

    end

  end

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = Config

  L1_2 = L1_2.OwnPrisionSystem

  if L1_2 then

    L1_2 = SpawnInJail

    L2_2 = A0_2

    L1_2(L2_2)

  else

    L1_2 = SetEntityCoords

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = A0_2.position

    L3_2 = L3_2.x

    L4_2 = A0_2.position

    L4_2 = L4_2.y

    L5_2 = A0_2.position

    L5_2 = L5_2.z

    L1_2(L2_2, L3_2, L4_2, L5_2)

    L1_2 = SetEntityHeading

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = A0_2.position

    L3_2 = L3_2.w

    L1_2(L2_2, L3_2)

    L1_2 = FreezeEntityPosition

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = false

    L1_2(L2_2, L3_2)

    L1_2 = FW_TriggerCallback

    L2_2 = "origen_police:callback:GetFederal"

    function L3_2(A0_3)

      local L1_3, L2_3

      L1_3 = A0_3.time

      if L1_3 then

        L1_3 = A0_3.time

        if L1_3 > 0 then

          L1_3 = SetFederal

          L2_3 = A0_3.time

          L1_3(L2_3)

      end

      else

        L1_3 = SetFederal

        L2_3 = false

        L1_3(L2_3)

      end

    end

    L4_2 = A0_2.citizenid

    L1_2(L2_2, L3_2, L4_2)

  end

end

SpawnInFederal = L1_1

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L2_2 = Config

  L2_2 = L2_2.OwnPrisionSystem

  if L2_2 then

    L2_2 = setPrision

    L3_2 = A0_2

    L4_2 = A1_2

    L2_2(L3_2, L4_2)

  else

    L2_2 = DoScreenFadeOut

    L3_2 = 300

    L2_2(L3_2)

    if A0_2 then

      L2_2 = nil

      if A1_2 then

        L3_2 = GetEntityCoords

        L4_2 = PlayerPedId

        L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L4_2()

        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

        L4_2 = nil

        L5_2 = pairs

        L6_2 = Config

        L6_2 = L6_2.Federal

        L6_2 = L6_2.Exits

        L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

        for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

          L11_2 = L10_2.xyz

          L11_2 = L3_2 - L11_2

          L11_2 = #L11_2

          if not L4_2 or L4_2 > L11_2 then

            L4_2 = L11_2

            L2_2 = L9_2

          end

        end

      end

      L3_2 = TriggerServerEvent

      L4_2 = "origen_police:server:setfederal"

      L5_2 = A0_2

      L6_2 = A1_2

      L7_2 = L2_2

      L3_2(L4_2, L5_2, L6_2, L7_2)

      L3_2 = Citizen

      L3_2 = L3_2.Wait

      L4_2 = 1000

      L3_2(L4_2)

      L3_2 = SetEntityCoords

      L4_2 = PlayerPedId

      L4_2 = L4_2()

      L5_2 = Config

      L5_2 = L5_2.Federal

      L5_2 = L5_2.Exits

      L6_2 = Config

      L6_2 = L6_2.DefaultExit

      L5_2 = L5_2[L6_2]

      L5_2 = L5_2.xyz

      L3_2(L4_2, L5_2)

      L3_2 = StartAnimation

      L4_2 = "join"

      L3_2(L4_2)

      L3_2 = Citizen

      L3_2 = L3_2.CreateThread

      function L4_2()

        local L0_3, L1_3, L2_3, L3_3, L4_3

        L0_3 = Config

        L0_3 = L0_3.TimePerMonth

        L1_3 = true

        L0_1 = L1_3

        L1_3 = SendNUIMessage

        L2_3 = {}

        L2_3.action = "Federal"

        L3_3 = A0_2

        L2_3.mins = L3_3

        L1_3(L2_3)

        while true do

          L1_3 = A0_2

          if not (L1_3 > 0) then

            break

          end

          L1_3 = L0_1

          if not L1_3 then

            break

          end

          L1_3 = Citizen

          L1_3 = L1_3.Wait

          L2_3 = 1000

          L1_3(L2_3)

          L1_3 = GetEntityCoords

          L2_3 = PlayerPedId

          L2_3, L3_3, L4_3 = L2_3()

          L1_3 = L1_3(L2_3, L3_3, L4_3)

          L2_3 = Config

          L2_3 = L2_3.Federal

          L2_3 = L2_3.Center

          L2_3 = L1_3 - L2_3

          L2_3 = #L2_3

          L3_3 = 150

          if L2_3 > L3_3 then

            L2_3 = SetEntityCoords

            L3_3 = PlayerPedId

            L3_3 = L3_3()

            L4_3 = Config

            L4_3 = L4_3.Federal

            L4_3 = L4_3.Spawn

            L4_3 = L4_3.xyz

            L2_3(L3_3, L4_3)

            L2_3 = SetEntityHeading

            L3_3 = PlayerPedId

            L3_3 = L3_3()

            L4_3 = Config

            L4_3 = L4_3.Federal

            L4_3 = L4_3.Spawn

            L4_3 = L4_3.w

            L2_3(L3_3, L4_3)

            L2_3 = ShowNotification

            L3_3 = Config

            L3_3 = L3_3.Translations

            L3_3 = L3_3.RespectRol

            L2_3(L3_3)

          end

          L0_3 = L0_3 - 1

          if 0 == L0_3 then

            L2_3 = Config

            L0_3 = L2_3.TimePerMonth

            L2_3 = A0_2

            L2_3 = L2_3 - 1

            A0_2 = L2_3

            L2_3 = A0_2

            if L2_3 > 0 then

              L2_3 = TriggerServerEvent

              L3_3 = "origen_police:server:updatemins"

              L4_3 = A0_2

              L2_3(L3_3, L4_3)

              L2_3 = SendNUIMessage

              L3_3 = {}

              L3_3.action = "Federal"

              L4_3 = A0_2

              L3_3.mins = L4_3

              L2_3(L3_3)

            else

              L2_3 = FW_TriggerCallback

              L3_3 = "origen_police:callback:GetFederal"

              function L4_3(A0_4)

                local L1_4, L2_4, L3_4, L4_4

                L1_4 = false

                L0_1 = L1_4

                L1_4 = DoScreenFadeOut

                L2_4 = 300

                L1_4(L2_4)

                L1_4 = TriggerServerEvent

                L2_4 = "origen_police:server:setfederal"

                L3_4 = false

                L1_4(L2_4, L3_4)

                L1_4 = SendNUIMessage

                L2_4 = {}

                L2_4.action = "Federal"

                L1_4(L2_4)

                L1_4 = Citizen

                L1_4 = L1_4.Wait

                L2_4 = 500

                L1_4(L2_4)

                L1_4 = Config

                L1_4 = L1_4.Federal

                L1_4 = L1_4.Exits

                L2_4 = A0_4.joinedfrom

                L1_4 = L1_4[L2_4]

                if not L1_4 then

                  L1_4 = Config

                  L1_4 = L1_4.Federal

                  L1_4 = L1_4.Exits

                  L2_4 = Config

                  L2_4 = L2_4.DefaultExit

                  L1_4 = L1_4[L2_4]

                end

                L2_4 = Config

                L2_4 = L2_4.ForcedExit

                L2_4 = L2_4.enabled

                if L2_4 then

                  L2_4 = Config

                  L2_4 = L2_4.ForcedExit

                  L1_4 = L2_4.coords

                end

                L2_4 = SetEntityCoords

                L3_4 = PlayerPedId

                L3_4 = L3_4()

                L4_4 = L1_4.xyz

                L2_4(L3_4, L4_4)

                L2_4 = SetEntityHeading

                L3_4 = PlayerPedId

                L3_4 = L3_4()

                L4_4 = L1_4.w

                L2_4(L3_4, L4_4)

                L2_4 = Citizen

                L2_4 = L2_4.Wait

                L3_4 = 1000

                L2_4(L3_4)

                L2_4 = StartAnimation

                L3_4 = "leave"

                L2_4(L3_4)

              end

              L2_3(L3_3, L4_3)

            end

          end

        end

      end

      L3_2(L4_2)

    else

      L2_2 = false

      L0_1 = L2_2

      L2_2 = Citizen

      L2_2 = L2_2.Wait

      L3_2 = 1000

      L2_2(L3_2)

      L2_2 = FW_TriggerCallback

      L3_2 = "origen_police:callback:GetFederal"

      function L4_2(A0_3)

        local L1_3, L2_3, L3_3, L4_3

        L1_3 = DoScreenFadeOut

        L2_3 = 300

        L1_3(L2_3)

        L1_3 = TriggerServerEvent

        L2_3 = "origen_police:server:setfederal"

        L3_3 = false

        L1_3(L2_3, L3_3)

        L1_3 = SendNUIMessage

        L2_3 = {}

        L2_3.action = "Federal"

        L1_3(L2_3)

        L1_3 = Citizen

        L1_3 = L1_3.Wait

        L2_3 = 500

        L1_3(L2_3)

        L1_3 = Config

        L1_3 = L1_3.Federal

        L1_3 = L1_3.Exits

        L2_3 = A0_3.joinedfrom

        L1_3 = L1_3[L2_3]

        if not L1_3 then

          L1_3 = Config

          L1_3 = L1_3.Federal

          L1_3 = L1_3.Exits

          L2_3 = Config

          L2_3 = L2_3.DefaultExit

          L1_3 = L1_3[L2_3]

        end

        L2_3 = Config

        L2_3 = L2_3.ForcedExit

        L2_3 = L2_3.enabled

        if L2_3 then

          L2_3 = Config

          L2_3 = L2_3.ForcedExit

          L1_3 = L2_3.coords

        end

        L2_3 = SetEntityCoords

        L3_3 = PlayerPedId

        L3_3 = L3_3()

        L4_3 = L1_3.xyz

        L2_3(L3_3, L4_3)

        L2_3 = SetEntityHeading

        L3_3 = PlayerPedId

        L3_3 = L3_3()

        L4_3 = L1_3.w

        L2_3(L3_3, L4_3)

        L2_3 = Citizen

        L2_3 = L2_3.Wait

        L3_3 = 1000

        L2_3(L3_3)

        L2_3 = StartAnimation

        L3_3 = "leave"

        L2_3(L3_3)

      end

      L2_2(L3_2, L4_2)

    end

  end

end

SetFederal = L1_1

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = RemoveHandCuff

  L1_2()

  L1_2 = SetDimension

  L2_2 = GetPlayerServerId

  L3_2 = PlayerId

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2()

  L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  L1_2 = Citizen

  L1_2 = L1_2.Wait

  L2_2 = 100

  L1_2(L2_2)

  if "join" == A0_2 then

    L1_2 = TriggerEvent

    L2_2 = "origen_police:client:OnFederalJoin"

    L1_2(L2_2)

    L1_2 = SetEntityVisible

    L2_2 = PlayerPedId

    L2_2 = L2_2()

    L3_2 = false

    L1_2(L2_2, L3_2)

    L1_2 = RequestModel

    L2_2 = GetHashKey

    L3_2 = "s_m_m_prisguard_01"

    L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2(L3_2)

    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    while true do

      L1_2 = HasModelLoaded

      L2_2 = GetHashKey

      L3_2 = "s_m_m_prisguard_01"

      L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L2_2(L3_2)

      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

      if L1_2 then

        break

      end

      L1_2 = Wait

      L2_2 = 0

      L1_2(L2_2)

    end

    function L1_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3

      L0_3 = SetDimension

      L1_3 = 0

      L0_3(L1_3)

      L0_3 = SetEntityCoords

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = Config

      L2_3 = L2_3.Federal

      L2_3 = L2_3.Spawn

      L2_3 = L2_3.xyz

      L0_3(L1_3, L2_3)

      L0_3 = SetEntityHeading

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = Config

      L2_3 = L2_3.Federal

      L2_3 = L2_3.Spawn

      L2_3 = L2_3.w

      L0_3(L1_3, L2_3)

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 500

      L0_3(L1_3)

      L0_3 = SetEntityVisible

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = true

      L0_3(L1_3, L2_3)

      L0_3 = SetGameplayCamRelativeHeading

      L1_3 = 0

      L0_3(L1_3)

      L0_3 = DoScreenFadeIn

      L1_3 = 300

      L0_3(L1_3)

      L0_3 = Config

      L0_3 = L0_3.PedWalkOnAnim

      if L0_3 then

        L0_3 = TaskGoToCoordAnyMeans

        L1_3 = PlayerPedId

        L1_3 = L1_3()

        L2_3 = GetEntityCoords

        L3_3 = PlayerPedId

        L3_3, L4_3, L5_3, L6_3, L7_3 = L3_3()

        L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3)

        L3_3 = GetEntityForwardVector

        L4_3 = PlayerPedId

        L4_3, L5_3, L6_3, L7_3 = L4_3()

        L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3)

        L3_3 = L3_3 * 3

        L2_3 = L2_3 + L3_3

        L3_3 = 1.0

        L4_3 = 0

        L5_3 = 0

        L6_3 = 786603

        L7_3 = 1.0

        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)

      end

    end

    L2_2 = Config

    L2_2 = L2_2.Federal

    L2_2 = L2_2.JoinCinematic

    if not L2_2 then

      L2_2 = L1_2

      return L2_2()

    end

    L2_2 = FW_SpawnVehicle

    L3_2 = GetHashKey

    L4_2 = Config

    L4_2 = L4_2.BusModel

    L3_2 = L3_2(L4_2)

    function L4_2(A0_3)

      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3

      L1_3 = SetEntityHeading

      L2_3 = A0_3

      L3_3 = Config

      L3_3 = L3_3.Federal

      L3_3 = L3_3.BusCoords

      L3_3 = L3_3.w

      L1_3(L2_3, L3_3)

      L1_3 = CreatePedInsideVehicle

      L2_3 = A0_3

      L3_3 = 6

      L4_3 = GetHashKey

      L5_3 = "s_m_m_prisguard_01"

      L4_3 = L4_3(L5_3)

      L5_3 = -1

      L6_3 = false

      L7_3 = false

      L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3)

      L2_3 = SetVehicleEngineOn

      L3_3 = A0_3

      L4_3 = true

      L5_3 = true

      L2_3(L3_3, L4_3, L5_3)

      L2_3 = SetBlockingOfNonTemporaryEvents

      L3_3 = L1_3

      L4_3 = true

      L2_3(L3_3, L4_3)

      L2_3 = SetDriverAbility

      L3_3 = L1_3

      L4_3 = 1.0

      L2_3(L3_3, L4_3)

      L2_3 = SetDriverAggressiveness

      L3_3 = L1_3

      L4_3 = 0.0

      L2_3(L3_3, L4_3)

      L2_3 = TaskVehicleDriveToCoord

      L3_3 = L1_3

      L4_3 = A0_3

      L5_3 = Config

      L5_3 = L5_3.Federal

      L5_3 = L5_3.Finish

      L5_3 = L5_3.x

      L6_3 = Config

      L6_3 = L6_3.Federal

      L6_3 = L6_3.Finish

      L6_3 = L6_3.y

      L7_3 = Config

      L7_3 = L7_3.Federal

      L7_3 = L7_3.Finish

      L7_3 = L7_3.z

      L8_3 = Config

      L8_3 = L8_3.Federal

      L8_3 = L8_3.Finish

      L8_3 = L8_3.w

      L9_3 = 0

      L10_3 = 1341619767

      L11_3 = 4457279

      L12_3 = 1

      L13_3 = true

      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)

      L2_3 = GetSoundId

      L2_3 = L2_3()

      L3_3 = PlaySoundFromEntity

      L4_3 = L2_3

      L5_3 = "VEHICLES_HORNS_SIREN_1"

      L6_3 = A0_3

      L7_3 = 0

      L8_3 = 0

      L9_3 = 0

      L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3)

      L3_3 = DoScreenFadeIn

      L4_3 = 300

      L3_3(L4_3)

      L3_3 = Config

      L3_3 = L3_3.AutoSetCriminalClothe

      if L3_3 then

        L3_3 = FW_GetPlayerData

        L4_3 = true

        L3_3 = L3_3(L4_3)

        L4_3 = PlayerPedId

        L4_3 = L4_3()

        L5_3 = GetEntityModel

        L6_3 = L4_3

        L5_3 = L5_3(L6_3)

        L6_3 = GetHashKey

        L7_3 = "mp_m_freemode_01"

        L6_3 = L6_3(L7_3)

        if L5_3 == L6_3 then

          L5_3 = "male"

          if L5_3 then

            goto lbl_105

          end

        end

        L5_3 = GetEntityModel

        L6_3 = L4_3

        L5_3 = L5_3(L6_3)

        L6_3 = GetHashKey

        L7_3 = "mp_f_freemode_01"

        L6_3 = L6_3(L7_3)

        if L5_3 == L6_3 then

          L5_3 = "female"

          if L5_3 then

            goto lbl_105

          end

        end

        L5_3 = false

        ::lbl_105::

        L6_3 = SetCriminalClothes

        L7_3 = L5_3

        L8_3 = L3_3

        L6_3(L7_3, L8_3)

      end

      L3_3 = CreateCamWithParams

      L4_3 = "DEFAULT_SCRIPTED_CAMERA"

      L5_3 = Config

      L5_3 = L5_3.Federal

      L5_3 = L5_3.CamCoords

      L5_3 = L5_3.xyz

      L6_3 = vector3

      L7_3 = -30

      L8_3 = 0

      L9_3 = Config

      L9_3 = L9_3.Federal

      L9_3 = L9_3.CamCoords

      L9_3 = L9_3.w

      L6_3 = L6_3(L7_3, L8_3, L9_3)

      L7_3 = GetGameplayCamFov

      L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3 = L7_3()

      L3_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)

      L4_3 = SetCamActive

      L5_3 = L3_3

      L6_3 = true

      L4_3(L5_3, L6_3)

      L4_3 = RenderScriptCams

      L5_3 = true

      L6_3 = false

      L7_3 = 0

      L8_3 = true

      L9_3 = false

      L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)

      L4_3 = Citizen

      L4_3 = L4_3.Wait

      L5_3 = 10000

      L4_3(L5_3)

      L4_3 = DoScreenFadeOut

      L5_3 = 300

      L4_3(L5_3)

      L4_3 = Citizen

      L4_3 = L4_3.Wait

      L5_3 = 300

      L4_3(L5_3)

      L4_3 = SetCamActive

      L5_3 = L3_3

      L6_3 = false

      L4_3(L5_3, L6_3)

      L4_3 = DestroyCam

      L5_3 = L3_3

      L6_3 = true

      L4_3(L5_3, L6_3)

      L4_3 = RenderScriptCams

      L5_3 = false

      L6_3 = false

      L7_3 = 0

      L8_3 = true

      L9_3 = false

      L4_3(L5_3, L6_3, L7_3, L8_3, L9_3)

      L4_3 = DeleteEntity

      L5_3 = L1_3

      L4_3(L5_3)

      L4_3 = StopSound

      L5_3 = L2_3

      L4_3(L5_3)

      L4_3 = ReleaseSoundId

      L5_3 = L2_3

      L4_3(L5_3)

      L4_3 = FW_DeleteVehicle

      L5_3 = A0_3

      L4_3(L5_3)

      L4_3 = L1_2

      L4_3()

    end

    L5_2 = Config

    L5_2 = L5_2.Federal

    L5_2 = L5_2.BusCoords

    L5_2 = L5_2.xyz

    L6_2 = false

    L2_2(L3_2, L4_2, L5_2, L6_2)

  elseif "leave" == A0_2 then

    L1_2 = TriggerEvent

    L2_2 = "origen_police:client:OnFederalLeave"

    L1_2(L2_2)

    L1_2 = Config

    L1_2 = L1_2.AutoSetCriminalClothe

    if L1_2 then

      L1_2 = FW_GetPlayerData

      L2_2 = true

      L1_2 = L1_2(L2_2)

      L2_2 = SetCriminalClothes

      L3_2 = "none"

      L4_2 = L1_2

      L2_2(L3_2, L4_2)

    end

    L1_2 = TriggerServerEvent

    L2_2 = "origen_police:server:getanypertenences"

    L1_2(L2_2)

    L1_2 = CreateCamWithParams

    L2_2 = "DEFAULT_SCRIPTED_CAMERA"

    L3_2 = GetEntityCoords

    L4_2 = PlayerPedId

    L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L4_2()

    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    L4_2 = GetEntityForwardVector

    L5_2 = PlayerPedId

    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()

    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)

    L4_2 = L4_2 * 5

    L3_2 = L3_2 + L4_2

    L4_2 = vector3

    L5_2 = 0

    L6_2 = 0

    L7_2 = 2.1

    L4_2 = L4_2(L5_2, L6_2, L7_2)

    L3_2 = L3_2 + L4_2

    L4_2 = vector3

    L5_2 = -20

    L6_2 = 0

    L7_2 = GetEntityHeading

    L8_2 = PlayerPedId

    L8_2, L9_2 = L8_2()

    L7_2 = L7_2(L8_2, L9_2)

    L7_2 = L7_2 - 180

    L4_2 = L4_2(L5_2, L6_2, L7_2)

    L5_2 = GetGameplayCamFov

    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()

    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    L2_2 = SetCamActive

    L3_2 = L1_2

    L4_2 = true

    L2_2(L3_2, L4_2)

    L2_2 = RenderScriptCams

    L3_2 = true

    L4_2 = false

    L5_2 = 0

    L6_2 = true

    L7_2 = false

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

    L2_2 = DoScreenFadeIn

    L3_2 = 300

    L2_2(L3_2)

    L2_2 = Config

    L2_2 = L2_2.PedWalkOnAnim

    if L2_2 then

      L2_2 = TaskGoToCoordAnyMeans

      L3_2 = PlayerPedId

      L3_2 = L3_2()

      L4_2 = GetEntityCoords

      L5_2 = PlayerPedId

      L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()

      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)

      L5_2 = GetEntityForwardVector

      L6_2 = PlayerPedId

      L6_2, L7_2, L8_2, L9_2 = L6_2()

      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)

      L5_2 = L5_2 * 7

      L4_2 = L4_2 + L5_2

      L5_2 = 1.0

      L6_2 = 0

      L7_2 = 0

      L8_2 = 786603

      L9_2 = 1.0

      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

    end

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 2000

    L2_2(L3_2)

    L2_2 = SetDimension

    L3_2 = 0

    L2_2(L3_2)

    L2_2 = SetCamActive

    L3_2 = L1_2

    L4_2 = false

    L2_2(L3_2, L4_2)

    L2_2 = DestroyCam

    L3_2 = L1_2

    L4_2 = true

    L2_2(L3_2, L4_2)

    L2_2 = RenderScriptCams

    L3_2 = false

    L4_2 = true

    L5_2 = 2000

    L6_2 = true

    L7_2 = false

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  end

end

StartAnimation = L1_1

L1_1 = exports

L2_1 = "SpawnInFederal"

L3_1 = SpawnInFederal

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "SetFederal"

L3_1 = SetFederal

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "SpawnInFederal"

L3_1 = SpawnInFederal

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "SetFederal"

L3_1 = SetFederal

L1_1(L2_1, L3_1)

L1_1 = RegisterNUICallback

L2_1 = "SpawnInFederal"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SpawnInFederal

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

L2_1 = "SetFederal"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetFederal

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

