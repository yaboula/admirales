local L0_1, L1_1, L2_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:buyveh"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L2_2 = L2_2[A0_2]

  L2_2 = L2_2[A1_2]

  L3_2 = FW_GetPlayerData

  L3_2 = L3_2()

  L4_2 = L3_2.job

  L4_2 = L4_2.name

  L5_2 = {}

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.RequestVeh

  L6_2.header = L7_2

  L6_2.isMenuHeader = true

  L5_2[1] = L6_2

  L6_2 = pairs

  L7_2 = Config

  L7_2 = L7_2.Vehicles

  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

    if "car" == L10_2 then

      L12_2 = L11_2[L4_2]

      if L12_2 then

        L12_2 = pairs

        L13_2 = L11_2[L4_2]

        L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)

        for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do

          L18_2 = L3_2.job

          L18_2 = L18_2.grade

          L18_2 = L18_2.level

          L19_2 = L17_2.grade

          if L18_2 < L19_2 then

          else

            L18_2 = table

            L18_2 = L18_2.insert

            L19_2 = L5_2

            L20_2 = {}

            L21_2 = L17_2.label

            L20_2.header = L21_2

            L21_2 = Config

            L21_2 = L21_2.Translations

            L21_2 = L21_2.RequestVeh

            L20_2.txt = L21_2

            L20_2.icon = "fa-solid fa-car"

            L21_2 = {}

            L21_2.isAction = true

            function L22_2()

              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

              L0_3 = FW_GetClosestVehicle

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L0_3 = L0_3(L1_3)

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L2_3 = GetEntityCoords

              L3_3 = L0_3

              L2_3 = L2_3(L3_3)

              L1_3 = L1_3 - L2_3

              L1_3 = #L1_3

              if L1_3 > 4 then

                L1_3 = FW_SpawnVehicle

                L2_3 = L16_2

                function L3_3(A0_4)

                  local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4

                  L1_4 = SetVehicleFuel

                  L2_4 = A0_4

                  L3_4 = 100.0

                  L1_4(L2_4, L3_4)

                  L1_4 = SetEntityHeading

                  L2_4 = A0_4

                  L3_4 = L2_2.spawn

                  L3_4 = L3_4.w

                  L1_4(L2_4, L3_4)

                  L1_4 = TriggerEvent

                  L2_4 = "vehiclekeys:client:SetOwner"

                  L3_4 = GetVehiclePlate

                  L4_4 = A0_4

                  L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)

                  L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)

                  L1_4 = GetResourceState

                  L2_4 = "qs-vehiclekeys"

                  L1_4 = L1_4(L2_4)

                  if "started" == L1_4 then

                    L1_4 = exports

                    L1_4 = L1_4["qs-vehiclekeys"]

                    L2_4 = L1_4

                    L1_4 = L1_4.GiveKeys

                    L3_4 = GetVehiclePlate

                    L4_4 = A0_4

                    L3_4 = L3_4(L4_4)

                    L4_4 = GetDisplayNameFromVehicleModel

                    L5_4 = GetEntityModel

                    L6_4 = A0_4

                    L5_4, L6_4 = L5_4(L6_4)

                    L4_4 = L4_4(L5_4, L6_4)

                    L5_4 = true

                    L1_4(L2_4, L3_4, L4_4, L5_4)

                  end

                  L1_4 = GetEntityModel

                  L2_4 = A0_4

                  L1_4 = L1_4(L2_4)

                  L2_4 = Config

                  L2_4 = L2_4.CustomCarLabels

                  L2_4 = L2_4[L1_4]

                  if L2_4 then

                    L2_4 = Config

                    L2_4 = L2_4.CustomCarLabels

                    L2_4 = L2_4[L1_4]

                    if L2_4 then

                      goto lbl_52

                    end

                  end

                  L2_4 = GetLabelText

                  L3_4 = GetDisplayNameFromVehicleModel

                  L4_4 = L1_4

                  L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)

                  L2_4 = L2_4(L3_4, L4_4, L5_4, L6_4)

                  ::lbl_52::

                  L3_4 = TriggerServerEvent

                  L4_4 = "origen_police:server:TrackVehicle"

                  L5_4 = NetworkGetNetworkIdFromEntity

                  L6_4 = A0_4

                  L5_4 = L5_4(L6_4)

                  L6_4 = L2_4

                  L3_4(L4_4, L5_4, L6_4)

                  L3_4 = GiveKeys

                  L4_4 = "car"

                  L5_4 = A0_4

                  L3_4(L4_4, L5_4)

                  L3_4 = AddVehicleExtras

                  L4_4 = "car"

                  L5_4 = A0_4

                  L6_4 = L16_2

                  L3_4(L4_4, L5_4, L6_4)

                end

                L4_3 = L2_2.spawn

                L4_3 = L4_3.xyz

                L5_3 = true

                L1_3(L2_3, L3_3, L4_3, L5_3)

              else

                L1_3 = ShowNotification

                L2_3 = Config

                L2_3 = L2_3.Translations

                L2_3 = L2_3.ExistVehicleInSpawn

                L1_3(L2_3)

              end

            end

            L21_2.event = L22_2

            L20_2.params = L21_2

            L18_2(L19_2, L20_2)

          end

        end

      end

    end

  end

  L6_2 = OpenMenu

  L7_2 = L5_2

  L6_2(L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:deletevehicle"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = GetVehicleInCamera

  L0_2 = L0_2()

  if 0 ~= L0_2 then

    L1_2 = GetEntityCoords

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    L2_2 = GetEntityCoords

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

    L1_2 = L1_2 - L2_2

    L1_2 = #L1_2

    if L1_2 < 7 then

      L1_2 = GetResourceState

      L2_2 = "qs-vehiclekeys"

      L1_2 = L1_2(L2_2)

      if "started" == L1_2 then

        L1_2 = exports

        L1_2 = L1_2["qs-vehiclekeys"]

        L2_2 = L1_2

        L1_2 = L1_2.RemoveKeys

        L3_2 = GetVehiclePlate

        L4_2 = L0_2

        L3_2 = L3_2(L4_2)

        L4_2 = GetDisplayNameFromVehicleModel

        L5_2 = GetEntityModel

        L6_2 = L0_2

        L5_2, L6_2 = L5_2(L6_2)

        L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)

        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)

      end

      L1_2 = TaskLeaveVehicle

      L2_2 = PlayerPedId

      L2_2 = L2_2()

      L3_2 = L0_2

      L4_2 = 64

      L1_2(L2_2, L3_2, L4_2)

      L1_2 = RemoveKeys

      L2_2 = L0_2

      L1_2(L2_2)

      L1_2 = Citizen

      L1_2 = L1_2.Wait

      L2_2 = 2000

      L1_2(L2_2)

      L1_2 = FW_DeleteVehicle

      L2_2 = L0_2

      L1_2(L2_2)

  end

  else

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.MustLook

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:helicop"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L2_2 = L2_2[A0_2]

  L2_2 = L2_2[A1_2]

  L3_2 = FW_GetPlayerData

  L3_2 = L3_2()

  L4_2 = L3_2.job

  L4_2 = L4_2.name

  L5_2 = {}

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.Heliport

  L6_2.header = L7_2

  L6_2.isMenuHeader = true

  L5_2[1] = L6_2

  L6_2 = pairs

  L7_2 = Config

  L7_2 = L7_2.Vehicles

  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

    if "heli" == L10_2 then

      L12_2 = L11_2[L4_2]

      if L12_2 then

        L12_2 = pairs

        L13_2 = L11_2[L4_2]

        L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)

        for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do

          L18_2 = L3_2.job

          L18_2 = L18_2.grade

          L18_2 = L18_2.level

          L19_2 = L17_2.grade

          if L18_2 < L19_2 then

          else

            L18_2 = table

            L18_2 = L18_2.insert

            L19_2 = L5_2

            L20_2 = {}

            L21_2 = L17_2.label

            L20_2.header = L21_2

            L21_2 = Config

            L21_2 = L21_2.Translations

            L21_2 = L21_2.TakeOutHeli

            L20_2.txt = L21_2

            L20_2.icon = "fa-solid fa-helicopter"

            L21_2 = {}

            L21_2.isAction = true

            function L22_2()

              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

              L0_3 = FW_GetClosestVehicle

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L0_3 = L0_3(L1_3)

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L2_3 = GetEntityCoords

              L3_3 = L0_3

              L2_3 = L2_3(L3_3)

              L1_3 = L1_3 - L2_3

              L1_3 = #L1_3

              if L1_3 > 4 then

                L1_3 = FW_SpawnVehicle

                L2_3 = L16_2

                function L3_3(A0_4)

                  local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4

                  L1_4 = SetVehicleFuel

                  L2_4 = A0_4

                  L3_4 = 100.0

                  L1_4(L2_4, L3_4)

                  L1_4 = SetEntityHeading

                  L2_4 = A0_4

                  L3_4 = L2_2.spawn

                  L3_4 = L3_4.w

                  L1_4(L2_4, L3_4)

                  L1_4 = TriggerEvent

                  L2_4 = "vehiclekeys:client:SetOwner"

                  L3_4 = GetVehiclePlate

                  L4_4 = A0_4

                  L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)

                  L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)

                  L1_4 = GetResourceState

                  L2_4 = "qs-vehiclekeys"

                  L1_4 = L1_4(L2_4)

                  if "started" == L1_4 then

                    L1_4 = exports

                    L1_4 = L1_4["qs-vehiclekeys"]

                    L2_4 = L1_4

                    L1_4 = L1_4.GiveKeys

                    L3_4 = GetVehiclePlate

                    L4_4 = A0_4

                    L3_4 = L3_4(L4_4)

                    L4_4 = GetDisplayNameFromVehicleModel

                    L5_4 = GetEntityModel

                    L6_4 = A0_4

                    L5_4, L6_4 = L5_4(L6_4)

                    L4_4 = L4_4(L5_4, L6_4)

                    L5_4 = true

                    L1_4(L2_4, L3_4, L4_4, L5_4)

                  end

                  L1_4 = GiveKeys

                  L2_4 = "helicopter"

                  L3_4 = A0_4

                  L1_4(L2_4, L3_4)

                  L1_4 = AddVehicleExtras

                  L2_4 = "helicopter"

                  L3_4 = A0_4

                  L4_4 = L16_2

                  L1_4(L2_4, L3_4, L4_4)

                end

                L4_3 = L2_2.spawn

                L4_3 = L4_3.xyz

                L5_3 = true

                L1_3(L2_3, L3_3, L4_3, L5_3)

              else

                L1_3 = ShowNotification

                L2_3 = Config

                L2_3 = L2_3.Translations

                L2_3 = L2_3.ExistHelicopterInSpawn

                L1_3(L2_3)

              end

            end

            L21_2.event = L22_2

            L20_2.params = L21_2

            L18_2(L19_2, L20_2)

          end

        end

      end

    end

  end

  L6_2 = OpenMenu

  L7_2 = L5_2

  L6_2(L7_2)

  L5_2 = nil

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:boat"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L2_2 = L2_2[A0_2]

  L2_2 = L2_2[A1_2]

  L3_2 = FW_GetPlayerData

  L3_2 = L3_2()

  L4_2 = L3_2.job

  L4_2 = L4_2.name

  L5_2 = {}

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.Pier

  L6_2.header = L7_2

  L6_2.isMenuHeader = true

  L5_2[1] = L6_2

  L6_2 = pairs

  L7_2 = Config

  L7_2 = L7_2.Vehicles

  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

  for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

    if "boat" == L10_2 then

      L12_2 = L11_2[L4_2]

      if L12_2 then

        L12_2 = pairs

        L13_2 = L11_2[L4_2]

        L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)

        for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do

          L18_2 = L3_2.job

          L18_2 = L18_2.grade

          L18_2 = L18_2.level

          L19_2 = L17_2.grade

          if L18_2 < L19_2 then

          else

            L18_2 = table

            L18_2 = L18_2.insert

            L19_2 = L5_2

            L20_2 = {}

            L21_2 = L17_2.label

            L20_2.header = L21_2

            L21_2 = Config

            L21_2 = L21_2.Translations

            L21_2 = L21_2.TakeOutBoat

            L20_2.txt = L21_2

            L20_2.icon = "fa-solid fa-ship"

            L21_2 = {}

            L21_2.isAction = true

            function L22_2()

              local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3

              L0_3 = FW_GetClosestVehicle

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L0_3 = L0_3(L1_3)

              L1_3 = L2_2.spawn

              L1_3 = L1_3.xyz

              L2_3 = GetEntityCoords

              L3_3 = L0_3

              L2_3 = L2_3(L3_3)

              L1_3 = L1_3 - L2_3

              L1_3 = #L1_3

              if L1_3 > 4 then

                L1_3 = FW_SpawnVehicle

                L2_3 = L16_2

                function L3_3(A0_4)

                  local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4

                  L1_4 = SetVehicleFuel

                  L2_4 = A0_4

                  L3_4 = 100.0

                  L1_4(L2_4, L3_4)

                  L1_4 = SetEntityHeading

                  L2_4 = A0_4

                  L3_4 = L2_2.spawn

                  L3_4 = L3_4.w

                  L1_4(L2_4, L3_4)

                  L1_4 = TriggerEvent

                  L2_4 = "vehiclekeys:client:SetOwner"

                  L3_4 = GetVehiclePlate

                  L4_4 = A0_4

                  L3_4, L4_4, L5_4, L6_4 = L3_4(L4_4)

                  L1_4(L2_4, L3_4, L4_4, L5_4, L6_4)

                  L1_4 = GetResourceState

                  L2_4 = "qs-vehiclekeys"

                  L1_4 = L1_4(L2_4)

                  if "started" == L1_4 then

                    L1_4 = exports

                    L1_4 = L1_4["qs-vehiclekeys"]

                    L2_4 = L1_4

                    L1_4 = L1_4.GiveKeys

                    L3_4 = GetVehiclePlate

                    L4_4 = A0_4

                    L3_4 = L3_4(L4_4)

                    L4_4 = GetDisplayNameFromVehicleModel

                    L5_4 = GetEntityModel

                    L6_4 = A0_4

                    L5_4, L6_4 = L5_4(L6_4)

                    L4_4 = L4_4(L5_4, L6_4)

                    L5_4 = true

                    L1_4(L2_4, L3_4, L4_4, L5_4)

                  end

                  L1_4 = GiveKeys

                  L2_4 = "boat"

                  L3_4 = A0_4

                  L1_4(L2_4, L3_4)

                  L1_4 = AddVehicleExtras

                  L2_4 = "boat"

                  L3_4 = A0_4

                  L4_4 = L16_2

                  L1_4(L2_4, L3_4, L4_4)

                end

                L4_3 = L2_2.spawn

                L4_3 = L4_3.xyz

                L5_3 = true

                L1_3(L2_3, L3_3, L4_3, L5_3)

              else

                L1_3 = ShowNotification

                L2_3 = Config

                L2_3 = L2_3.Translations

                L2_3 = L2_3.ExistBoatInSpawn

                L1_3(L2_3)

              end

            end

            L21_2.event = L22_2

            L20_2.params = L21_2

            L18_2(L19_2, L20_2)

          end

        end

      end

    end

  end

  L6_2 = OpenMenu

  L7_2 = L5_2

  L6_2(L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:inventory"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L2_2 = L2_2[A0_2]

  L2_2 = L2_2[A1_2]

  L3_2 = OpenMenu

  L4_2 = {}

  L5_2 = {}

  L6_2 = Config

  L6_2 = L6_2.Translations

  L6_2 = L6_2.PoliceEquipment

  L5_2.header = L6_2

  L5_2.isMenuHeader = true

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.Equipment

  L6_2.header = L7_2

  L7_2 = Config

  L7_2 = L7_2.Translations

  L7_2 = L7_2.EquipmentDesc

  L6_2.txt = L7_2

  L6_2.icon = "fa-solid fa-gun"

  L7_2 = {}

  L7_2.isAction = true

  function L8_2()

    local L0_3, L1_3

    L0_3 = OpenArmoury

    L0_3()

  end

  L7_2.event = L8_2

  L6_2.params = L7_2

  L7_2 = {}

  L8_2 = Config

  L8_2 = L8_2.Translations

  L8_2 = L8_2.LeaveEquipment

  L7_2.header = L8_2

  L8_2 = Config

  L8_2 = L8_2.Translations

  L8_2 = L8_2.LeaveEquipmentDesc

  L7_2.txt = L8_2

  L7_2.icon = "fa-solid fa-shield"

  L8_2 = {}

  L8_2.isAction = true

  function L9_2()

    local L0_3, L1_3

    L0_3 = LeavePoliceEquipment

    L1_3 = L2_2

    L0_3(L1_3)

  end

  L8_2.event = L9_2

  L7_2.params = L8_2

  L8_2 = {}

  L9_2 = Config

  L9_2 = L9_2.Translations

  L9_2 = L9_2.PoliceInventory

  L8_2.header = L9_2

  L9_2 = Config

  L9_2 = L9_2.Translations

  L9_2 = L9_2.PoliceInventoryDesc

  L8_2.txt = L9_2

  L8_2.icon = "fa-solid fa-box"

  L9_2 = {}

  L9_2.isAction = true

  function L10_2()

    local L0_3, L1_3

    L0_3 = PoliceInventory

    L1_3 = L2_2

    L0_3(L1_3)

  end

  L9_2.event = L10_2

  L8_2.params = L9_2

  L9_2 = {}

  L10_2 = Config

  L10_2 = L10_2.Translations

  L10_2 = L10_2.EvidenceProof

  L9_2.header = L10_2

  L10_2 = Config

  L10_2 = L10_2.Translations

  L10_2 = L10_2.EvidenceProofDesc

  L9_2.txt = L10_2

  L9_2.icon = "fa-solid fa-receipt"

  L10_2 = {}

  L10_2.isAction = true

  function L11_2()

    local L0_3, L1_3

    L0_3 = OpenEvidenceInventory

    L1_3 = L2_2

    L0_3(L1_3)

  end

  L10_2.event = L11_2

  L9_2.params = L10_2

  L4_2[1] = L5_2

  L4_2[2] = L6_2

  L4_2[3] = L7_2

  L4_2[4] = L8_2

  L4_2[5] = L9_2

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:vehicledata"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = GetVehicleInCamera

  L0_2 = L0_2()

  if 0 ~= L0_2 then

    L1_2 = GetEntityCoords

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    L2_2 = GetEntityCoords

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2)

    L1_2 = L1_2 - L2_2

    L1_2 = #L1_2

    L2_2 = Config

    L2_2 = L2_2.VehicleDataDist

    if L1_2 < L2_2 then

      L1_2 = FW_TriggerCallback

      L2_2 = "origen_police:callback:vehicledata"

      function L3_2(A0_3)

        local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3

        L1_3 = OpenMenu

        L2_3 = {}

        L3_3 = {}

        L4_3 = Config

        L4_3 = L4_3.Translations

        L4_3 = L4_3.VehicleInformation

        L3_3.header = L4_3

        L3_3.isMenuHeader = true

        L4_3 = {}

        L5_3 = Config

        L5_3 = L5_3.Translations

        L5_3 = L5_3.Model

        L4_3.header = L5_3

        L5_3 = GetLabelText

        L6_3 = GetDisplayNameFromVehicleModel

        L7_3 = GetEntityModel

        L8_3 = L0_2

        L7_3, L8_3 = L7_3(L8_3)

        L6_3, L7_3, L8_3 = L6_3(L7_3, L8_3)

        L5_3 = L5_3(L6_3, L7_3, L8_3)

        L4_3.txt = L5_3

        L4_3.icon = "fa-solid fa-car"

        L5_3 = {}

        L5_3.isAction = true

        function L6_3()

          local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4

          L0_4 = SendNUIMessage

          L1_4 = {}

          L1_4.action = "copy"

          L2_4 = GetLabelText

          L3_4 = GetDisplayNameFromVehicleModel

          L4_4 = GetEntityModel

          L5_4 = L0_2

          L4_4, L5_4 = L4_4(L5_4)

          L3_4, L4_4, L5_4 = L3_4(L4_4, L5_4)

          L2_4 = L2_4(L3_4, L4_4, L5_4)

          L1_4.value = L2_4

          L0_4(L1_4)

        end

        L5_3.event = L6_3

        L4_3.params = L5_3

        L5_3 = {}

        L6_3 = Config

        L6_3 = L6_3.Translations

        L6_3 = L6_3.LicensePlate

        L5_3.header = L6_3

        L6_3 = GetVehiclePlate

        L7_3 = L0_2

        L6_3 = L6_3(L7_3)

        L5_3.txt = L6_3

        L5_3.icon = "fa-solid fa-id-card"

        L6_3 = {}

        L6_3.isAction = true

        function L7_3()

          local L0_4, L1_4, L2_4, L3_4

          L0_4 = SendNUIMessage

          L1_4 = {}

          L1_4.action = "copy"

          L2_4 = GetVehiclePlate

          L3_4 = L0_2

          L2_4 = L2_4(L3_4)

          L1_4.value = L2_4

          L0_4(L1_4)

        end

        L6_3.event = L7_3

        L5_3.params = L6_3

        L6_3 = {}

        L7_3 = Config

        L7_3 = L7_3.Translations

        L7_3 = L7_3.Owner

        L6_3.header = L7_3

        L6_3.txt = A0_3

        L6_3.icon = "fa-solid fa-user"

        L7_3 = {}

        L7_3.isAction = true

        function L8_3()

          local L0_4, L1_4, L2_4

          L0_4 = SendNUIMessage

          L1_4 = {}

          L1_4.action = "copy"

          L2_4 = A0_3

          L1_4.value = L2_4

          L0_4(L1_4)

        end

        L7_3.event = L8_3

        L6_3.params = L7_3

        L2_3[1] = L3_3

        L2_3[2] = L4_3

        L2_3[3] = L5_3

        L2_3[4] = L6_3

        L1_3(L2_3)

      end

      L4_2 = GetVehiclePlate

      L5_2 = L0_2

      L4_2, L5_2 = L4_2(L5_2)

      L1_2(L2_2, L3_2, L4_2, L5_2)

  end

  else

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.MustLook

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:dvpolice"

function L2_1()

  local L0_2, L1_2

  L0_2 = ConfiscateVeh

  L0_2()

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:openveh"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L0_2 = GetVehicleInCamera

  L0_2 = L0_2()

  if 0 ~= L0_2 then

    L1_2 = GetEntityCoords

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    L2_2 = GetEntityCoords

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

    L1_2 = L1_2 - L2_2

    L1_2 = #L1_2

    if L1_2 < 2 then

      L1_2 = 0

      while true do

        L2_2 = NetworkHasControlOfEntity

        L3_2 = L0_2

        L2_2 = L2_2(L3_2)

        if not (not L2_2 and L1_2 < 100) then

          break

        end

        L2_2 = DoesEntityExist

        L3_2 = L0_2

        L2_2 = L2_2(L3_2)

        if not L2_2 then

          break

        end

        L2_2 = Citizen

        L2_2 = L2_2.Wait

        L3_2 = 100

        L2_2(L3_2)

        L2_2 = NetworkRequestControlOfEntity

        L3_2 = L0_2

        L2_2(L3_2)

        L1_2 = L1_2 + 1

      end

      L2_2 = DoesEntityExist

      L3_2 = L0_2

      L2_2 = L2_2(L3_2)

      if L2_2 then

        L2_2 = NetworkHasControlOfEntity

        L3_2 = L0_2

        L2_2 = L2_2(L3_2)

        if L2_2 then

          L2_2 = RequestAnimDict

          L3_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

          L2_2(L3_2)

          while true do

            L2_2 = HasAnimDictLoaded

            L3_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

            L2_2 = L2_2(L3_2)

            if L2_2 then

              break

            end

            L2_2 = Citizen

            L2_2 = L2_2.Wait

            L3_2 = 7

            L2_2(L3_2)

          end

          L2_2 = TaskPlayAnim

          L3_2 = PlayerPedId

          L3_2 = L3_2()

          L4_2 = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"

          L5_2 = "machinic_loop_mechandplayer"

          L6_2 = 8.0

          L7_2 = -8.0

          L8_2 = -1

          L9_2 = 1

          L10_2 = 0

          L11_2 = false

          L12_2 = false

          L13_2 = false

          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

          L2_2 = Citizen

          L2_2 = L2_2.Wait

          L3_2 = 3000

          L2_2(L3_2)

          L2_2 = ClearPedTasks

          L3_2 = PlayerPedId

          L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2()

          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

          L2_2 = SetVehicleDoorsLocked

          L3_2 = L0_2

          L4_2 = 0

          L2_2(L3_2, L4_2)

          L2_2 = SetVehicleDoorsLockedForAllPlayers

          L3_2 = L0_2

          L4_2 = false

          L2_2(L3_2, L4_2)

          L2_2 = GiveVehicleKeys

          L3_2 = L0_2

          L2_2(L3_2)

      end

      else

        L2_2 = ShowNotification

        L3_2 = Config

        L3_2 = L3_2.Translations

        L3_2 = L3_2.CouldntOpenLock

        L2_2(L3_2)

      end

  end

  else

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.MustLook

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:vehevidences"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = GetVehicleInCamera

  L0_2 = L0_2()

  if 0 ~= L0_2 then

    L1_2 = GetEntityCoords

    L2_2 = L0_2

    L1_2 = L1_2(L2_2)

    L2_2 = GetEntityCoords

    L3_2 = PlayerPedId

    L3_2, L4_2, L5_2, L6_2 = L3_2()

    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

    L1_2 = L1_2 - L2_2

    L1_2 = #L1_2

    if L1_2 < 2 then

      L1_2 = TriggerServerEvent

      L2_2 = "origen_police:server:GetEvidence"

      L3_2 = false

      L4_2 = {}

      L4_2.type = "FinguerPrint"

      L5_2 = GetVehiclePlate

      L6_2 = L0_2

      L5_2 = L5_2(L6_2)

      L4_2.fkserie = L5_2

      L1_2(L2_2, L3_2, L4_2)

  end

  else

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.MustLook

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:makereport"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L0_2 = {}

  L1_2 = pairs

  L2_2 = FW_GetPlayerData

  L3_2 = true

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2.items

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = #L0_2

    if L7_2 >= 4 then

      break

    end

    L7_2 = string

    L7_2 = L7_2.find

    L8_2 = L6_2.name

    L9_2 = "^evidence_"

    L7_2 = L7_2(L8_2, L9_2)

    if nil ~= L7_2 then

      L7_2 = table

      L7_2 = L7_2.insert

      L8_2 = L0_2

      L9_2 = GetItemMetadata

      L10_2 = L6_2

      L9_2, L10_2 = L9_2(L10_2)

      L7_2(L8_2, L9_2, L10_2)

    end

  end

  L1_2 = #L0_2

  if L1_2 > 0 then

    L1_2 = TriggerServerEvent

    L2_2 = "origen_police:client:removeevidences"

    L1_2(L2_2)

    L1_2 = FW_TriggerCallback

    L2_2 = "OsTime"

    function L3_2(A0_3)

      local L1_3, L2_3, L3_3

      L1_3 = SendNUIMessage

      L2_3 = {}

      L2_3.action = "AnalizeEvidences"

      L3_3 = L0_2

      L2_3.list = L3_3

      L2_3.date = A0_3

      L1_3(L2_3)

    end

    L1_2(L2_2, L3_2)

    L1_2 = SetNuiFocus

    L2_2 = true

    L3_2 = true

    L1_2(L2_2, L3_2)

  else

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.NoEvidence

    L1_2(L2_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "focus"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = SetNuiFocus

  L3_2 = false

  L4_2 = false

  L2_2(L3_2, L4_2)

  L2_2 = ClearPedTasks

  L3_2 = PlayerPedId

  L3_2, L4_2 = L3_2()

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "savereportevidence"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:savereportevidence"

  L4_2 = A0_2.url

  L2_2(L3_2, L4_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:showbadge"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2

  L1_2 = CanOpenTablet

  L2_2 = FW_GetPlayerData

  L2_2 = L2_2()

  L2_2 = L2_2.job

  L2_2 = L2_2.name

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[1]

  L2_2 = Config

  L2_2 = L2_2.ShowBadgePreview

  if L2_2 then

    L2_2 = TriggerEvent

    L3_2 = "origen_police:client:viewbadge"

    L4_2 = A0_2

    L2_2(L3_2, L4_2)

  end

  if not L1_2 then

    L2_2 = Config

    L2_2 = L2_2.NotPoliceCanShowBadge

    if not L2_2 then

      return

    end

  end

  L2_2 = FW_GetClosestPlayer

  L2_2, L3_2 = L2_2()

  if -1 ~= L2_2 and L3_2 <= 3.0 and L3_2 > 0 then

    L4_2 = RequestAnimDict

    L5_2 = "paper_1_rcm_alt1-8"

    L4_2(L5_2)

    while true do

      L4_2 = HasAnimDictLoaded

      L5_2 = "paper_1_rcm_alt1-8"

      L4_2 = L4_2(L5_2)

      if L4_2 then

        break

      end

      L4_2 = Citizen

      L4_2 = L4_2.Wait

      L5_2 = 0

      L4_2(L5_2)

    end

    L4_2 = "prop_lspd_badge"

    L5_2 = A0_2.type

    if "BCSD" == L5_2 then

      L4_2 = "prop_bcso_badge"

    else

      L5_2 = A0_2.type

      if "FIB" == L5_2 then

        L4_2 = "prop_fib_badge"

      end

    end

    L5_2 = RequestModel

    L6_2 = L4_2

    L5_2(L6_2)

    while true do

      L5_2 = HasModelLoaded

      L6_2 = GetHashKey

      L7_2 = L4_2

      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L6_2(L7_2)

      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

      if L5_2 then

        break

      end

      L5_2 = Citizen

      L5_2 = L5_2.Wait

      L6_2 = 0

      L5_2(L6_2)

    end

    L5_2 = CreateObject

    L6_2 = GetHashKey

    L7_2 = L4_2

    L6_2 = L6_2(L7_2)

    L7_2 = GetEntityCoords

    L8_2 = PlayerPedId

    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L8_2()

    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

    L8_2 = true

    L9_2 = true

    L10_2 = true

    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

    L6_2 = TaskPlayAnim

    L7_2 = PlayerPedId

    L7_2 = L7_2()

    L8_2 = "paper_1_rcm_alt1-8"

    L9_2 = "player_one_dual-8"

    L10_2 = 8.0

    L11_2 = 8.0

    L12_2 = -1

    L13_2 = 50

    L14_2 = 0

    L15_2 = false

    L16_2 = false

    L17_2 = false

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

    L6_2 = AttachEntityToEntity

    L7_2 = L5_2

    L8_2 = PlayerPedId

    L8_2 = L8_2()

    L9_2 = GetPedBoneIndex

    L10_2 = PlayerPedId

    L10_2 = L10_2()

    L11_2 = 28422

    L9_2 = L9_2(L10_2, L11_2)

    L10_2 = 0.09

    L11_2 = 0.0

    L12_2 = -0.05

    L13_2 = -90.0

    L14_2 = -180.0

    L15_2 = 70.9

    L16_2 = true

    L17_2 = true

    L18_2 = false

    L19_2 = true

    L20_2 = 1

    L21_2 = true

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

    L6_2 = TriggerServerEvent

    L7_2 = "origen_police:server:showbadge"

    L8_2 = GetPlayerServerId

    L9_2 = L2_2

    L8_2 = L8_2(L9_2)

    L9_2 = A0_2

    L6_2(L7_2, L8_2, L9_2)

    L6_2 = Citizen

    L6_2 = L6_2.Wait

    L7_2 = 5000

    L6_2(L7_2)

    L6_2 = ClearPedTasks

    L7_2 = PlayerPedId

    L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L7_2()

    L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

    L6_2 = DeleteObject

    L7_2 = L5_2

    L6_2(L7_2)

  else

    L4_2 = ShowNotification

    L5_2 = Config

    L5_2 = L5_2.Translations

    L5_2 = L5_2.NoPersonNear

    L6_2 = "error"

    L4_2(L5_2, L6_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:viewbadge"

function L2_1(A0_2)

  local L1_2, L2_2

  A0_2.action = "ViewBadge"

  L1_2 = SendNUIMessage

  L2_2 = A0_2

  L1_2(L2_2)

  L1_2 = Citizen

  L1_2 = L1_2.CreateThread

  function L2_2()

    local L0_3, L1_3, L2_3

    while true do

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 0

      L0_3(L1_3)

      L0_3 = IsControlJustPressed

      L1_3 = 0

      L2_3 = 177

      L0_3 = L0_3(L1_3, L2_3)

      if L0_3 then

        L0_3 = SendNUIMessage

        L1_3 = {}

        L1_3.action = "ViewBadge"

        L0_3(L1_3)

        break

      end

    end

  end

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "LoadRadio"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = FW_GetPlayerData

  L3_2 = false

  L2_2 = L2_2(L3_2)

  L3_2 = Config

  L3_2 = L3_2.NeedRadioForDispatch

  if not L3_2 then

    L3_2 = exports

    L3_2 = L3_2.origen_police

    L4_2 = L3_2

    L3_2 = L3_2.Toggle

    L5_2 = true

    L3_2(L4_2, L5_2)

    L3_2 = A1_2

    L4_2 = {}

    L5_2 = Config

    L5_2 = L5_2.Multifrec

    L4_2.freclist = L5_2

    L5_2 = exports

    L5_2 = L5_2.origen_police

    L6_2 = L5_2

    L5_2 = L5_2.GetMultiFrec

    L5_2 = L5_2(L6_2)

    if not L5_2 then

      L5_2 = "none"

    end

    L4_2.myfrec = L5_2

    return L3_2(L4_2)

  end

  L3_2 = pairs

  L4_2 = L2_2.items

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = L8_2.name

    if "radio" == L9_2 then

      L9_2 = exports

      L9_2 = L9_2.origen_police

      L10_2 = L9_2

      L9_2 = L9_2.Toggle

      L11_2 = true

      L9_2(L10_2, L11_2)

      L9_2 = A1_2

      L10_2 = {}

      L11_2 = Config

      L11_2 = L11_2.Multifrec

      L10_2.freclist = L11_2

      L11_2 = exports

      L11_2 = L11_2.origen_police

      L12_2 = L11_2

      L11_2 = L11_2.GetMultiFrec

      L11_2 = L11_2(L12_2)

      if not L11_2 then

        L11_2 = "none"

      end

      L10_2.myfrec = L11_2

      return L9_2(L10_2)

    end

  end

  L3_2 = A1_2

  L4_2 = false

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:AddPlayerMultiFrec"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = SendNUIMessage

  L4_2 = {}

  L4_2.radio = "AddPlayerMultiFrec"

  L4_2.id = A0_2

  L4_2.frec = A1_2

  L4_2.data = A2_2

  L5_2 = GetPlayerServerId

  L6_2 = PlayerId

  L6_2 = L6_2()

  L5_2 = L5_2(L6_2)

  L5_2 = A0_2 == L5_2

  L4_2.i = L5_2

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:Disconnected"

function L2_1()

  local L0_2, L1_2

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.radio = "Disconnected"

  L0_2(L1_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:talking"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radio = "Talking"

  L3_2.target = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:RemovePlayerMultiFrec"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radio = "RemovePlayerMultiFrec"

  L3_2.id = A0_2

  L3_2.frec = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SetMuted"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radio = "SetMuted"

  L3_2.id = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SetReady"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.radio = "SetReady"

  L3_2.id = A0_2

  L3_2.value = A1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "TriggerCallback"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = A0_2.name

  L3_2 = L2_2

  L2_2 = L2_2.find

  L4_2 = "^origen_police"

  L2_2 = L2_2(L3_2, L4_2)

  if not L2_2 then

    L2_2 = A1_2

    L3_2 = false

    return L2_2(L3_2)

  end

  L2_2 = FW_TriggerCallback

  L3_2 = A0_2.name

  function L4_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    L1_3 = A0_2.name

    if "origen_police:police:GetCitizen" == L1_3 then

      L1_3 = 1

      L2_3 = A0_3.vehicles

      L2_3 = #L2_3

      L3_3 = 1

      for L4_3 = L1_3, L2_3, L3_3 do

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L5_3 = L5_3.garage

        if not L5_3 then

          L5_3 = A0_3.vehicles

          L5_3 = L5_3[L4_3]

          L5_3.garage = "No"

        end

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L6_3 = GetLabelText

        L7_3 = GetDisplayNameFromVehicleModel

        L8_3 = tonumber

        L9_3 = A0_3.vehicles

        L9_3 = L9_3[L4_3]

        L9_3 = L9_3.hash

        L8_3, L9_3, L10_3 = L8_3(L9_3)

        L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3, L9_3, L10_3)

        L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3)

        L5_3.label = L6_3

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L5_3 = L5_3.label

        if "NULL" == L5_3 then

          L5_3 = A0_3.vehicles

          L5_3 = L5_3[L4_3]

          L6_3 = Config

          L6_3 = L6_3.CustomCarLabels

          L7_3 = tonumber

          L8_3 = A0_3.vehicles

          L8_3 = L8_3[L4_3]

          L8_3 = L8_3.hash

          L7_3 = L7_3(L8_3)

          L6_3 = L6_3[L7_3]

          if not L6_3 then

            L6_3 = "UNKNOWN"

          end

          L5_3.label = L6_3

        end

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L5_3 = L5_3.garage

        L6_3 = L5_3

        L5_3 = L5_3.find

        L7_3 = "police_confiscate_veh"

        L5_3 = L5_3(L6_3, L7_3)

        if L5_3 then

          L5_3 = A0_3.vehicles

          L5_3 = L5_3[L4_3]

          L6_3 = Config

          L6_3 = L6_3.Translations

          L6_3 = L6_3.Confiscated

          L5_3.status = L6_3

        else

          L5_3 = A0_3.vehicles

          L5_3 = L5_3[L4_3]

          L5_3 = L5_3.garage

          L6_3 = L5_3

          L5_3 = L5_3.find

          L7_3 = "police_"

          L5_3 = L5_3(L6_3, L7_3)

          if L5_3 then

            L5_3 = A0_3.vehicles

            L5_3 = L5_3[L4_3]

            L6_3 = Config

            L6_3 = L6_3.Translations

            L6_3 = L6_3.PoliceFacilities

            L5_3.status = L6_3

          else

            L5_3 = A0_3.vehicles

            L5_3 = L5_3[L4_3]

            L5_3.status = ""

          end

        end

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L5_3.garage = nil

        L5_3 = A0_3.vehicles

        L5_3 = L5_3[L4_3]

        L5_3.hash = nil

      end

    else

      L1_3 = A0_2.name

      if "origen_police:police:SearchVehicle" == L1_3 then

        L1_3 = 1

        L2_3 = #A0_3

        L3_3 = 1

        for L4_3 = L1_3, L2_3, L3_3 do

          L5_3 = A0_3[L4_3]

          L6_3 = GetLabelText

          L7_3 = GetDisplayNameFromVehicleModel

          L8_3 = tonumber

          L9_3 = A0_3[L4_3]

          L9_3 = L9_3.hash

          L8_3, L9_3, L10_3 = L8_3(L9_3)

          L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3, L9_3, L10_3)

          L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3)

          L5_3.label = L6_3

          L5_3 = A0_3[L4_3]

          L5_3 = L5_3.label

          if "NULL" == L5_3 then

            L5_3 = A0_3[L4_3]

            L6_3 = Config

            L6_3 = L6_3.CustomCarLabels

            L7_3 = A0_3[L4_3]

            L7_3 = L7_3.hash

            L6_3 = L6_3[L7_3]

            if not L6_3 then

              L6_3 = "UNKNOWN"

            end

            L5_3.label = L6_3

          end

          L5_3 = A0_3[L4_3]

          L5_3 = L5_3.garage

          L6_3 = L5_3

          L5_3 = L5_3.find

          L7_3 = "police_confiscate_veh"

          L5_3 = L5_3(L6_3, L7_3)

          if L5_3 then

            L5_3 = A0_3[L4_3]

            L6_3 = Config

            L6_3 = L6_3.Translations

            L6_3 = L6_3.Confiscated

            L5_3.status = L6_3

          else

            L5_3 = A0_3[L4_3]

            L5_3 = L5_3.garage

            L6_3 = L5_3

            L5_3 = L5_3.find

            L7_3 = "police_"

            L5_3 = L5_3(L6_3, L7_3)

            if L5_3 then

              L5_3 = A0_3[L4_3]

              L6_3 = Config

              L6_3 = L6_3.Translations

              L6_3 = L6_3.PoliceFacilities

              L5_3.status = L6_3

            else

              L5_3 = A0_3[L4_3]

              L6_3 = A0_3[L4_3]

              L6_3 = L6_3.garage

              L5_3.status = L6_3

            end

          end

          L5_3 = A0_3[L4_3]

          L5_3.garage = nil

          L5_3 = A0_3[L4_3]

          L5_3.hash = nil

        end

      else

        L1_3 = A0_2.name

        if "origen_police:police:GetVehicle" == L1_3 then

          L1_3 = GetLabelText

          L2_3 = GetDisplayNameFromVehicleModel

          L3_3 = tonumber

          L4_3 = A0_3.hash

          L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L3_3(L4_3)

          L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

          L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

          A0_3.label = L1_3

          L1_3 = A0_3.garage

          L2_3 = L1_3

          L1_3 = L1_3.find

          L3_3 = "police_confiscate_veh"

          L1_3 = L1_3(L2_3, L3_3)

          if L1_3 then

            L1_3 = Config

            L1_3 = L1_3.Translations

            L1_3 = L1_3.Confiscated

            A0_3.status = L1_3

          else

            L1_3 = A0_3.garage

            L2_3 = L1_3

            L1_3 = L1_3.find

            L3_3 = "police_"

            L1_3 = L1_3(L2_3, L3_3)

            if L1_3 then

              L1_3 = Config

              L1_3 = L1_3.Translations

              L1_3 = L1_3.PoliceFacilities

              A0_3.status = L1_3

            else

              A0_3.status = ""

            end

          end

          A0_3.garage = nil

          A0_3.hash = nil

        else

          L1_3 = A0_2.name

          if "origen_police:callback:GetStationsList" == L1_3 then

            L1_3 = pairs

            L2_3 = A0_3

            L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)

            for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do

              L7_3 = L6_3.coords

              if not L7_3 then

                L7_3 = {}

                L8_3 = 0

                L9_3 = 0

                L10_3 = 0

                L7_3[1] = L8_3

                L7_3[2] = L9_3

                L7_3[3] = L10_3

                L6_3.coords = L7_3

              end

              L7_3 = GetStreetName

              L8_3 = L6_3.coords

              L7_3 = L7_3(L8_3)

              L6_3.street = L7_3

            end

          end

        end

      end

    end

    L1_3 = A1_2

    L2_3 = A0_3

    L1_3(L2_3)

  end

  L5_2 = A0_2

  L2_2(L3_2, L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SyncQuick"

function L2_1(A0_2)

  local L1_2, L2_2

  A0_2.action = "SyncQuick"

  L1_2 = SendNUIMessage

  L2_2 = A0_2

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:SetWantedLevel"

function L2_1(A0_2)

  local L1_2, L2_2

  L1_2 = SetWantedLevel

  L2_2 = A0_2

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:clothing"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2

  L3_2 = OpenClothing

  L4_2 = A2_2

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:CriminalClothes"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = FW_GetPlayerData

  L1_2 = true

  L0_2 = L0_2(L1_2)

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = GetEntityModel

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L3_2 = GetHashKey

  L4_2 = "mp_m_freemode_01"

  L3_2 = L3_2(L4_2)

  if L2_2 == L3_2 then

    L2_2 = "male"

    if L2_2 then

      goto lbl_29

    end

  end

  L2_2 = GetEntityModel

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L3_2 = GetHashKey

  L4_2 = "mp_f_freemode_01"

  L3_2 = L3_2(L4_2)

  if L2_2 == L3_2 then

    L2_2 = "female"

    if L2_2 then

      goto lbl_29

    end

  end

  L2_2 = false

  ::lbl_29::

  L3_2 = SetCriminalClothes

  L4_2 = L2_2

  L5_2 = L0_2

  L3_2(L4_2, L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:pertenences"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = Public

  L1_2 = L1_2.Markers

  L1_2 = L1_2[A0_2]

  L2_2 = TriggerServerEvent

  L3_2 = "origen_police:server:pertenences"

  L4_2 = L1_2.station

  if not L4_2 then

    L4_2 = 0

  end

  L2_2(L3_2, L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:modifyveh"

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L0_2 = GetVehiclePedIsIn

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = false

  L0_2 = L0_2(L1_2, L2_2)

  if 0 == L0_2 then

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.VehicleCannotBeFound

    return L1_2(L2_2)

  end

  L1_2 = IsVehicleValid

  L2_2 = "car"

  L3_2 = L0_2

  L1_2 = L1_2(L2_2, L3_2)

  if not L1_2 then

    L1_2 = ShowNotification

    L2_2 = Config

    L2_2 = L2_2.Translations

    L2_2 = L2_2.InvalidVeh

    return L1_2(L2_2)

  end

  L1_2 = {}

  L2_2 = {}

  L3_2 = Config

  L3_2 = L3_2.Translations

  L3_2 = L3_2.VehicleMods

  L2_2.header = L3_2

  L2_2.isMenuHeader = true

  L3_2 = {}

  L3_2.header = "EXTRAS"

  L3_2.icon = "fa-solid fa-gear"

  L4_2 = {}

  L4_2.isAction = true

  function L5_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3

    L0_3 = {}

    L1_3 = {}

    L2_3 = Config

    L2_3 = L2_3.Translations

    L2_3 = L2_3.VehicleMods

    L1_3.header = L2_3

    L1_3.isMenuHeader = true

    L0_3[1] = L1_3

    L1_3 = pairs

    L2_3 = GetVehicleExtras

    L3_3 = L0_2

    L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3 = L2_3(L3_3)

    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3)

    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do

      L7_3 = table

      L7_3 = L7_3.insert

      L8_3 = L0_3

      L9_3 = {}

      L10_3 = "EXTRA "

      L11_3 = tostring

      L12_3 = L5_3

      L11_3 = L11_3(L12_3)

      L10_3 = L10_3 .. L11_3

      L9_3.header = L10_3

      if L6_3 then

        L10_3 = Config

        L10_3 = L10_3.Translations

        L10_3 = L10_3.Enabled

        if L10_3 then

          goto lbl_38

        end

      end

      L10_3 = Config

      L10_3 = L10_3.Translations

      L10_3 = L10_3.Disabled

      ::lbl_38::

      L9_3.txt = L10_3

      L9_3.icon = "fa-solid fa-gear"

      L10_3 = {}

      L10_3.isAction = true

      function L11_3()

        local L0_4, L1_4, L2_4, L3_4

        L0_4 = SetVehicleExtra

        L1_4 = L0_2

        L2_4 = L5_3

        L3_4 = L6_3

        L0_4(L1_4, L2_4, L3_4)

      end

      L10_3.event = L11_3

      L9_3.params = L10_3

      L7_3(L8_3, L9_3)

    end

    L1_3 = table

    L1_3 = L1_3.insert

    L2_3 = L0_3

    L3_3 = {}

    L4_3 = Config

    L4_3 = L4_3.Translations

    L4_3 = L4_3.Back

    L3_3.header = L4_3

    L3_3.icon = "fa-solid fa-arrow-left"

    L4_3 = {}

    L4_3.isAction = true

    function L5_3()

      local L0_4, L1_4

      L0_4 = TriggerEvent

      L1_4 = "origen_police:client:modifyveh"

      L0_4(L1_4)

    end

    L4_3.event = L5_3

    L3_3.params = L4_3

    L1_3(L2_3, L3_3)

    L1_3 = OpenMenu

    L2_3 = L0_3

    L1_3(L2_3)

  end

  L4_2.event = L5_2

  L3_2.params = L4_2

  L4_2 = {}

  L4_2.header = "LIVERIES"

  L4_2.icon = "fa-solid fa-paint-brush"

  L5_2 = {}

  L5_2.isAction = true

  function L6_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    L0_3 = {}

    L1_3 = {}

    L2_3 = Config

    L2_3 = L2_3.Translations

    L2_3 = L2_3.VehicleMods

    L1_3.header = L2_3

    L1_3.isMenuHeader = true

    L0_3[1] = L1_3

    L1_3 = 0

    L2_3 = GetVehicleLiveryCount

    L3_3 = L0_2

    L2_3 = L2_3(L3_3)

    L2_3 = L2_3 - 1

    L3_3 = 1

    for L4_3 = L1_3, L2_3, L3_3 do

      L5_3 = table

      L5_3 = L5_3.insert

      L6_3 = L0_3

      L7_3 = {}

      L8_3 = "LIVERY "

      L9_3 = tostring

      L10_3 = L4_3

      L9_3 = L9_3(L10_3)

      L8_3 = L8_3 .. L9_3

      L7_3.header = L8_3

      L7_3.icon = "fa-solid fa-paint-brush"

      L8_3 = {}

      L8_3.isAction = true

      function L9_3()

        local L0_4, L1_4, L2_4, L3_4

        L0_4 = SetVehicleLivery

        L1_4 = L0_2

        L2_4 = L4_3

        L0_4(L1_4, L2_4)

        L0_4 = SetVehicleMod

        L1_4 = L0_2

        L2_4 = 48

        L3_4 = L4_3

        L0_4(L1_4, L2_4, L3_4)

      end

      L8_3.event = L9_3

      L7_3.params = L8_3

      L5_3(L6_3, L7_3)

    end

    L1_3 = table

    L1_3 = L1_3.insert

    L2_3 = L0_3

    L3_3 = {}

    L4_3 = Config

    L4_3 = L4_3.Translations

    L4_3 = L4_3.Back

    L3_3.header = L4_3

    L3_3.icon = "fa-solid fa-arrow-left"

    L4_3 = {}

    L4_3.isAction = true

    function L5_3()

      local L0_4, L1_4

      L0_4 = TriggerEvent

      L1_4 = "origen_police:client:modifyveh"

      L0_4(L1_4)

    end

    L4_3.event = L5_3

    L3_3.params = L4_3

    L1_3(L2_3, L3_3)

    L1_3 = OpenMenu

    L2_3 = L0_3

    L1_3(L2_3)

  end

  L5_2.event = L6_2

  L4_2.params = L5_2

  L1_2[1] = L2_2

  L1_2[2] = L3_2

  L1_2[3] = L4_2

  L2_2 = OpenMenu

  L3_2 = L1_2

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "SetVolume"

function L2_1(A0_2)

  local L1_2, L2_2

  L1_2 = type

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if "number" ~= L1_2 then

    return

  end

  if A0_2 < 0 then

    A0_2 = 0

  end

  if A0_2 > 100 then

    A0_2 = 100

  end

  L1_2 = SetRadioVolume

  L2_2 = A0_2

  L1_2(L2_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:GenerateMugshotBadge"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = GetMugShotBase64

  L4_2 = PlayerPedId

  L4_2 = L4_2()

  L5_2 = false

  L6_2 = A2_2

  L3_2 = L3_2(L4_2, L5_2, L6_2)

  L4_2 = TriggerServerEvent

  L5_2 = "origen_police:server:SaveMugshot"

  L6_2 = L3_2

  L7_2 = A0_2

  L8_2 = A1_2

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

