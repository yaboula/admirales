local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1

L0_1 = false

L1_1 = false

L2_1 = ""

L3_1 = ""

L4_1 = false

L5_1 = false

L6_1 = false

L7_1 = {}

L8_1 = GetGameTimer

L8_1 = L8_1()

L7_1.time = L8_1

L7_1.name = nil

L7_1.duty = nil

function L8_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = L7_1.name

  if nil ~= L2_2 then

    L2_2 = L7_1.time

    L3_2 = GetGameTimer

    L3_2 = L3_2()

    L3_2 = L3_2 + 7000

    if not (L2_2 <= L3_2) then

      goto lbl_26

    end

  end

  L2_2 = FW_GetPlayerData

  L3_2 = false

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2.job

  L2_2 = L2_2.name

  L7_1.name = L2_2

  L2_2 = FW_GetPlayerData

  L3_2 = false

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2.job

  L2_2 = L2_2.onduty

  L7_1.duty = L2_2

  L2_2 = GetGameTimer

  L2_2 = L2_2()

  L7_1.time = L2_2

  ::lbl_26::

  L2_2 = L7_1.name

  L3_2 = CanOpenTablet

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[1]

  if false ~= L3_2 then

    L3_2 = L7_1.duty

    if L3_2 then

      goto lbl_38

    end

  end

  L3_2 = nil

  do return L3_2 end

  ::lbl_38::

  if "any" == A0_2 then

    L3_2 = Config

    L3_2 = L3_2.Vehicles

    if not L3_2 then

      return

    end

    L3_2 = false

    L4_2 = pairs

    L5_2 = Config

    L5_2 = L5_2.Vehicles

    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

    for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

      L10_2 = Config

      L10_2 = L10_2.Vehicles

      L10_2 = L10_2[L8_2]

      L10_2 = L10_2[L2_2]

      L11_2 = GetEntityModel

      L12_2 = A1_2

      L11_2 = L11_2(L12_2)

      L10_2 = L10_2[L11_2]

      if L10_2 then

        L3_2 = true

      end

    end

    return L3_2

  end

  L3_2 = Config

  L3_2 = L3_2.Vehicles

  L3_2 = L3_2[A0_2]

  L3_2 = L3_2[L2_2]

  if not L3_2 then

    L3_2 = false

    return L3_2

  end

  L3_2 = Config

  L3_2 = L3_2.Vehicles

  L3_2 = L3_2[A0_2]

  L3_2 = L3_2[L2_2]

  L4_2 = GetEntityModel

  L5_2 = A1_2

  L4_2 = L4_2(L5_2)

  L3_2 = L3_2[L4_2]

  L3_2 = nil ~= L3_2

  return L3_2

end

IsVehicleValid = L8_1

L8_1 = RegisterCommand

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.VehicleRadar

L9_1 = L9_1.cmd

function L10_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = GetVehiclePedIsIn

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = false

  L0_2 = L0_2(L1_2, L2_2)

  L1_2 = Config

  L1_2 = L1_2.SpeedType

  if "kmh" == L1_2 then

    L1_2 = 3.6

    if L1_2 then

      goto lbl_19

    end

  end

  L1_2 = 2.23694

  ::lbl_19::

  if 0 ~= L0_2 then

    L2_2 = IsVehicleValid

    L3_2 = "car"

    L4_2 = L0_2

    L5_2 = true

    L2_2 = L2_2(L3_2, L4_2, L5_2)

    if L2_2 then

      L2_2 = L0_1

      L2_2 = not L2_2

      L0_1 = L2_2

      L2_2 = true

      L6_1 = L2_2

      L2_2 = L0_1

      if L2_2 then

        L2_2 = Citizen

        L2_2 = L2_2.CreateThread

        function L3_2()

          local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3

          L0_3 = SendNUIMessage

          L1_3 = {}

          L1_3.action = "showalpr"

          L2_3 = Config

          L2_3 = L2_3.SpeedType

          L1_3.metric = L2_3

          L0_3(L1_3)

          while true do

            L0_3 = L0_1

            if not L0_3 then

              break

            end

            L0_3 = Citizen

            L0_3 = L0_3.Wait

            L1_3 = 100

            L0_3(L1_3)

            L0_3 = GetVehiclePedIsIn

            L1_3 = PlayerPedId

            L1_3 = L1_3()

            L2_3 = false

            L0_3 = L0_3(L1_3, L2_3)

            L0_2 = L0_3

            L0_3 = L0_2

            if 0 ~= L0_3 then

              L0_3 = L6_1

              if not L0_3 then

                L0_3 = IsVehicleValid

                L1_3 = "car"

                L2_3 = L0_2

                L0_3 = L0_3(L1_3, L2_3)

                if L0_3 then

                  L0_3 = true

                  L6_1 = L0_3

                  L0_3 = SendNUIMessage

                  L1_3 = {}

                  L1_3.action = "showalpr"

                  L0_3(L1_3)

                end

              end

              L0_3 = GetOffsetFromEntityInWorldCoords

              L1_3 = L0_2

              L2_3 = 0.0

              L3_3 = 1.0

              L4_3 = 1.0

              L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3)

              L1_3 = GetOffsetFromEntityInWorldCoords

              L2_3 = L0_2

              L3_3 = 0.0

              L4_3 = 105.0

              L5_3 = 0.0

              L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)

              L2_3 = GetOffsetFromEntityInWorldCoords

              L3_3 = L0_2

              L4_3 = 0.0

              L5_3 = -105.0

              L6_3 = 0.0

              L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3)

              L3_3 = GetShapeTestResult

              L4_3 = StartShapeTestCapsule

              L5_3 = L0_3

              L6_3 = L1_3

              L7_3 = 3.0

              L8_3 = 10

              L9_3 = L0_2

              L10_3 = 7

              L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L4_3(L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

              L3_3, L4_3, L5_3, L6_3, L7_3 = L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)

              L8_3 = GetShapeTestResult

              L9_3 = StartShapeTestCapsule

              L10_3 = L0_3

              L11_3 = L2_3

              L12_3 = 3.0

              L13_3 = 10

              L14_3 = L0_2

              L15_3 = 7

              L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3)

              L8_3, L9_3, L10_3, L11_3, L12_3 = L8_3(L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3)

              L13_3 = IsEntityAVehicle

              L14_3 = L7_3

              L13_3 = L13_3(L14_3)

              if L13_3 then

                L13_3 = GetEntityModel

                L14_3 = L7_3

                L13_3 = L13_3(L14_3)

                L14_3 = Config

                L14_3 = L14_3.CustomCarLabels

                L14_3 = L14_3[L13_3]

                if L14_3 then

                  L14_3 = Config

                  L14_3 = L14_3.CustomCarLabels

                  L14_3 = L14_3[L13_3]

                  if L14_3 then

                    goto lbl_102

                  end

                end

                L14_3 = GetLabelText

                L15_3 = GetDisplayNameFromVehicleModel

                L16_3 = L13_3

                L15_3, L16_3, L17_3, L18_3 = L15_3(L16_3)

                L14_3 = L14_3(L15_3, L16_3, L17_3, L18_3)

                ::lbl_102::

                L15_3 = {}

                L15_3.name = L14_3

                L16_3 = GetVehiclePlate

                L17_3 = L7_3

                L16_3 = L16_3(L17_3)

                L15_3.plate = L16_3

                L16_3 = math

                L16_3 = L16_3.floor

                L17_3 = GetEntitySpeed

                L18_3 = L7_3

                L17_3 = L17_3(L18_3)

                L18_3 = L1_2

                L17_3 = L17_3 * L18_3

                L16_3 = L16_3(L17_3)

                L15_3.kmh = L16_3

                L4_1 = L15_3

              else

                L13_3 = false

                L4_1 = L13_3

              end

              L13_3 = IsEntityAVehicle

              L14_3 = L12_3

              L13_3 = L13_3(L14_3)

              if L13_3 then

                L13_3 = GetEntityModel

                L14_3 = L12_3

                L13_3 = L13_3(L14_3)

                L14_3 = Config

                L14_3 = L14_3.CustomCarLabels

                L14_3 = L14_3[L13_3]

                if L14_3 then

                  L14_3 = Config

                  L14_3 = L14_3.CustomCarLabels

                  L14_3 = L14_3[L13_3]

                  if L14_3 then

                    goto lbl_146

                  end

                end

                L14_3 = GetLabelText

                L15_3 = GetDisplayNameFromVehicleModel

                L16_3 = L13_3

                L15_3, L16_3, L17_3, L18_3 = L15_3(L16_3)

                L14_3 = L14_3(L15_3, L16_3, L17_3, L18_3)

                ::lbl_146::

                L15_3 = {}

                L15_3.name = L14_3

                L16_3 = GetVehiclePlate

                L17_3 = L12_3

                L16_3 = L16_3(L17_3)

                L15_3.plate = L16_3

                L16_3 = math

                L16_3 = L16_3.floor

                L17_3 = GetEntitySpeed

                L18_3 = L12_3

                L17_3 = L17_3(L18_3)

                L18_3 = L1_2

                L17_3 = L17_3 * L18_3

                L16_3 = L16_3(L17_3)

                L15_3.kmh = L16_3

                L5_1 = L15_3

              else

                L13_3 = false

                L5_1 = L13_3

              end

              L13_3 = L1_1

              if not L13_3 then

                L13_3 = SendNUIMessage

                L14_3 = {}

                L14_3.action = "alpr"

                L15_3 = L4_1

                L14_3.finfo = L15_3

                L15_3 = L5_1

                L14_3.rinfo = L15_3

                L13_3(L14_3)

              else

                L13_3 = L4_1

                if L13_3 then

                  L13_3 = L4_1.plate

                  L14_3 = L2_1

                  if L13_3 == L14_3 then

                    L13_3 = SendNUIMessage

                    L14_3 = {}

                    L14_3.action = "alpr"

                    L15_3 = L4_1

                    L14_3.finfo = L15_3

                    L13_3(L14_3)

                end

                else

                  L13_3 = L5_1

                  if L13_3 then

                    L13_3 = L5_1.plate

                    L14_3 = L3_1

                    if L13_3 == L14_3 then

                      L13_3 = SendNUIMessage

                      L14_3 = {}

                      L14_3.action = "alpr"

                      L15_3 = L5_1

                      L14_3.finfo = L15_3

                      L13_3(L14_3)

                    end

                  end

                end

              end

            else

              L0_3 = L6_1

              if L0_3 then

                L0_3 = false

                L6_1 = L0_3

                L0_3 = SendNUIMessage

                L1_3 = {}

                L1_3.action = "hidealpr"

                L0_3(L1_3)

              end

              break

            end

          end

          L0_3 = SendNUIMessage

          L1_3 = {}

          L1_3.action = "hidealpr"

          L0_3(L1_3)

        end

        L2_2(L3_2)

      end

    end

  end

end

L8_1(L9_1, L10_1)

L8_1 = RegisterCommand

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.LockRadar

L9_1 = L9_1.cmd

function L10_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = IsNuiFocused

  L0_2 = L0_2()

  if L0_2 then

    return

  end

  L0_2 = GetVehiclePedIsIn

  L1_2 = PlayerPedId

  L1_2 = L1_2()

  L2_2 = false

  L0_2 = L0_2(L1_2, L2_2)

  if 0 ~= L0_2 then

    L1_2 = L0_1

    if L1_2 then

      L1_2 = L1_1

      L1_2 = not L1_2

      L1_1 = L1_2

      L1_2 = SendNUIMessage

      L2_2 = {}

      L2_2.action = "balpr"

      L3_2 = L1_1

      L2_2.block = L3_2

      L1_2(L2_2)

      L1_2 = L4_1

      if L1_2 then

        L1_2 = L4_1.plate

        if L1_2 then

          goto lbl_33

        end

      end

      L1_2 = ""

      ::lbl_33::

      L2_1 = L1_2

      L1_2 = L5_1

      if L1_2 then

        L1_2 = L5_1.plate

        if L1_2 then

          goto lbl_41

        end

      end

      L1_2 = ""

      ::lbl_41::

      L3_1 = L1_2

    end

  end

end

L8_1(L9_1, L10_1)

L8_1 = RegisterCommand

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.MoveRadar

L9_1 = L9_1.cmd

function L10_1()

  local L0_2, L1_2, L2_2

  L0_2 = L0_1

  if not L0_2 then

    return

  end

  L0_2 = SetNuiFocus

  L1_2 = true

  L2_2 = true

  L0_2(L1_2, L2_2)

end

L8_1(L9_1, L10_1)

L8_1 = RegisterKeyMapping

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.VehicleRadar

L9_1 = L9_1.cmd

L10_1 = Config

L10_1 = L10_1.Commands

L10_1 = L10_1.VehicleRadar

L10_1 = L10_1.description

L11_1 = "keyboard"

L12_1 = Config

L12_1 = L12_1.Commands

L12_1 = L12_1.VehicleRadar

L12_1 = L12_1.key

L8_1(L9_1, L10_1, L11_1, L12_1)

L8_1 = RegisterKeyMapping

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.LockRadar

L9_1 = L9_1.cmd

L10_1 = Config

L10_1 = L10_1.Commands

L10_1 = L10_1.LockRadar

L10_1 = L10_1.description

L11_1 = "keyboard"

L12_1 = Config

L12_1 = L12_1.Commands

L12_1 = L12_1.LockRadar

L12_1 = L12_1.key

L8_1(L9_1, L10_1, L11_1, L12_1)

L8_1 = RegisterKeyMapping

L9_1 = Config

L9_1 = L9_1.Commands

L9_1 = L9_1.MoveRadar

L9_1 = L9_1.cmd

L10_1 = Config

L10_1 = L10_1.Commands

L10_1 = L10_1.MoveRadar

L10_1 = L10_1.description

L11_1 = "keyboard"

L12_1 = Config

L12_1 = L12_1.Commands

L12_1 = L12_1.MoveRadar

L12_1 = L12_1.key

L8_1(L9_1, L10_1, L11_1, L12_1)

