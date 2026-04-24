local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1

onduty = false

L0_1 = {}

L1_1 = {}

ValidVehicles = L1_1

L1_1 = nil

L2_1 = Config

L2_1 = L2_1.Framework

if "qbcore" == L2_1 then

  L2_1 = Citizen

  L2_1 = L2_1.CreateThread

  function L3_1()

    local L0_2, L1_2, L2_2

    L0_2 = Framework

    L0_2 = L0_2.Functions

    L0_2 = L0_2.GetPlayerData

    L0_2 = L0_2()

    L1_2 = L0_2.job

    if L1_2 then

      L1_2 = L0_2.job

      L1_2 = L1_2.onduty

      if L1_2 then

        L1_2 = SetDuty

        L2_2 = true

        L1_2(L2_2)

      end

    end

  end

  L2_1(L3_1)

  L2_1 = RegisterNetEvent

  L3_1 = "origen_police:client:OnPlayerLoaded"

  function L4_1()

    local L0_2, L1_2, L2_2

    L0_2 = Framework

    L0_2 = L0_2.Functions

    L0_2 = L0_2.GetPlayerData

    L0_2 = L0_2()

    while true do

      L1_2 = L0_2.job

      if L1_2 then

        break

      end

      L1_2 = Citizen

      L1_2 = L1_2.Wait

      L2_2 = 1000

      L1_2(L2_2)

      L1_2 = Framework

      L1_2 = L1_2.Functions

      L1_2 = L1_2.GetPlayerData

      L1_2 = L1_2()

      L0_2 = L1_2

    end

    L1_2 = L0_2.job

    L1_2 = L1_2.onduty

    if L1_2 then

      L1_2 = SetDuty

      L2_2 = true

      L1_2(L2_2)

    end

  end

  L2_1(L3_1, L4_1)

end

function L2_1(A0_2)

  local L1_2, L2_2

  if not A0_2 then

    L1_2 = FW_GetPlayerData

    L2_2 = false

    L1_2 = L1_2(L2_2)

    if L1_2 then

      L2_2 = L1_2.job

      if L2_2 then

        L2_2 = L1_2.job

        L2_2 = L2_2.name

        if L2_2 then

          L2_2 = L1_2.job

          A0_2 = L2_2.name

        end

      end

    end

  end

  if not A0_2 then

    return

  end

  L1_2 = CanOpenTablet

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2[2]

  L1_1 = L1_2

end

UpdatePlayerCategory = L2_1

function L2_1()

  local L0_2, L1_2

  L0_2 = L1_1

  if L0_2 then

    L0_2 = L1_1

    return L0_2

  end

  L0_2 = UpdatePlayerCategory

  L0_2()

  L0_2 = L1_1

  return L0_2

end

GetPlayerJobCategory = L2_1

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:OnJobUpdate"

function L4_1(A0_2)

  local L1_2, L2_2

  L1_2 = UpdatePlayerCategory

  L2_2 = A0_2.name

  L1_2(L2_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:enterOnDuty"

function L4_1()

  local L0_2, L1_2, L2_2

  L0_2 = CanOpenTablet

  L1_2 = FW_GetPlayerData

  L2_2 = false

  L1_2 = L1_2(L2_2)

  L1_2 = L1_2.job

  L1_2 = L1_2.name

  L0_2 = L0_2(L1_2)

  L0_2 = L0_2[1]

  if not L0_2 then

    return

  end

  L0_2 = TriggerEvent

  L1_2 = "origen_police:toggleDuty"

  L0_2(L1_2)

  L0_2 = SendNUIMessage

  L1_2 = {}

  L1_2.setDuty = true

  L2_2 = onduty

  L2_2 = not L2_2

  L1_2.duty = L2_2

  L0_2(L1_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:client:OnPlayerUnload"

function L4_1()

  local L0_2, L1_2

  onduty = false

  L0_2 = ToggleAlerts

  L1_2 = false

  L0_2(L1_2)

  L0_2 = TriggerServerEvent

  L1_2 = "origen_police:server_esx:ForceDropDuty"

  L0_2(L1_2)

end

L2_1(L3_1, L4_1)

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = FW_GetPlayerData

  L2_2 = false

  L1_2 = L1_2(L2_2)

  L2_2 = CanOpenTablet

  L3_2 = L1_2.job

  L3_2 = L3_2.name

  L2_2 = L2_2(L3_2)

  L3_2 = L2_2[2]

  if not A0_2 then

    L4_2 = ToggleAlerts

    L5_2 = false

    L4_2(L5_2)

  end

  L4_2 = onduty

  if A0_2 ~= L4_2 then

    L4_2 = L2_2[1]

    if false ~= L4_2 then

      goto lbl_21

    end

  end

  do return end

  ::lbl_21::

  onduty = A0_2

  L4_2 = onduty

  if L4_2 then

    L4_2 = StartAlerts

    L4_2()

  end

  L4_2 = Citizen

  L4_2 = L4_2.CreateThread

  function L5_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3

    L0_3 = StartReferences

    L0_3()

    L0_3 = AddRelationshipGroup

    L1_3 = "POLICEDOG"

    L0_3, L1_3 = L0_3(L1_3)

    L2_3 = AddRelationshipGroup

    L3_3 = "COP"

    L2_3, L3_3 = L2_3(L3_3)

    L4_3 = SetRelationshipBetweenGroups

    L5_3 = 0

    L6_3 = L1_3

    L7_3 = L3_3

    L4_3(L5_3, L6_3, L7_3)

    L4_3 = SetRelationshipBetweenGroups

    L5_3 = 0

    L6_3 = L3_3

    L7_3 = L1_3

    L4_3(L5_3, L6_3, L7_3)

    L4_3 = SetPedRelationshipGroupHash

    L5_3 = PlayerPedId

    L5_3 = L5_3()

    L6_3 = L3_3

    L4_3(L5_3, L6_3)

    L4_3 = Citizen

    L4_3 = L4_3.CreateThread

    function L5_3()

      local L0_4, L1_4, L2_4

      L0_4 = Citizen

      L0_4 = L0_4.Wait

      L1_4 = 60000

      L0_4(L1_4)

      L0_4 = FW_GetPlayerData

      L1_4 = false

      L0_4 = L0_4(L1_4)

      L1_4 = L0_4.job

      L1_4 = L1_4.onduty

      if L1_4 then

        L1_4 = TriggerServerEvent

        L2_4 = "origen_police:server:ClockIn"

        L1_4(L2_4)

      end

    end

    L4_3(L5_3)

    while true do

      L4_3 = onduty

      if not L4_3 then

        break

      end

      L4_3 = 500

      L5_3 = PlayerPedId

      L5_3 = L5_3()

      L6_3 = GetEntityCoords

      L7_3 = L5_3

      L6_3 = L6_3(L7_3)

      L7_3 = Tables

      L7_3 = L7_3.Markers

      if L7_3 then

        L7_3 = 1

        L8_3 = Tables

        L8_3 = L8_3.Markers

        L8_3 = #L8_3

        L9_3 = 1

        for L10_3 = L7_3, L8_3, L9_3 do

          L11_3 = Config

          L11_3 = L11_3.IgnoreSettings

          if not L11_3 then

            L11_3 = MapOptions

            L11_3 = L11_3[L10_3]

            L11_3 = L11_3.AllowedJobCat

            if L11_3 then

              L11_3 = IsJobAllowed

              L12_3 = MapOptions

              L12_3 = L12_3[L10_3]

              L13_3 = L3_2

              L11_3 = L11_3(L12_3, L13_3)

              if not L11_3 then

            end

          end

          else

            L11_3 = 1

            L12_3 = Tables

            L12_3 = L12_3.Markers

            L12_3 = L12_3[L10_3]

            L12_3 = #L12_3

            L13_3 = 1

            for L14_3 = L11_3, L12_3, L13_3 do

              L15_3 = Tables

              L15_3 = L15_3.Markers

              L15_3 = L15_3[L10_3]

              L15_3 = L15_3[L14_3]

              L16_3 = L15_3.coords

              L16_3 = L16_3.xyz

              L16_3 = L6_3 - L16_3

              L16_3 = #L16_3

              if L16_3 < 30 then

                L4_3 = 0

                L17_3 = Config

                L17_3 = L17_3.MarkersDraw

                if L17_3 then

                  L17_3 = DrawMarker

                  L18_3 = L15_3.sprite

                  L19_3 = L15_3.coords

                  L19_3 = L19_3.x

                  L20_3 = L15_3.coords

                  L20_3 = L20_3.y

                  L21_3 = L15_3.coords

                  L21_3 = L21_3.z

                  L22_3 = 0.0

                  L23_3 = 0.0

                  L24_3 = 0.0

                  L25_3 = 0.0

                  L26_3 = 0.0

                  L27_3 = 0.0

                  L28_3 = 0.3

                  L29_3 = 0.3

                  L30_3 = 0.3

                  L31_3 = L15_3.rgba

                  L31_3 = L31_3.r

                  L32_3 = L15_3.rgba

                  L32_3 = L32_3.g

                  L33_3 = L15_3.rgba

                  L33_3 = L33_3.b

                  L34_3 = L15_3.rgba

                  L34_3 = L34_3.a

                  L35_3 = false

                  L36_3 = false

                  L37_3 = 0

                  L38_3 = true

                  L17_3(L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3)

                end

                L17_3 = L15_3.radius

                if not L17_3 then

                  L17_3 = 1

                end

                if L16_3 < L17_3 then

                  L17_3 = Config

                  L17_3 = L17_3.CustomNotify

                  if L17_3 then

                    L17_3 = ShowHelpNotification

                    L18_3 = "E"

                    L19_3 = L15_3.text

                    L17_3(L18_3, L19_3)

                    L15_3.noty = true

                  else

                    L17_3 = Config

                    L17_3 = L17_3.Framework

                    if "qbcore" == L17_3 then

                      L17_3 = L15_3.noty

                      if not L17_3 then

                        L17_3 = exports

                        L17_3 = L17_3["qb-core"]

                        L18_3 = L17_3

                        L17_3 = L17_3.DrawText

                        L19_3 = "[E] "

                        L20_3 = L15_3.text

                        L19_3 = L19_3 .. L20_3

                        L20_3 = "left"

                        L17_3(L18_3, L19_3, L20_3)

                        L15_3.noty = true

                      end

                    else

                      L17_3 = Config

                      L17_3 = L17_3.Framework

                      if "esx" == L17_3 then

                        L17_3 = Framework

                        L17_3 = L17_3.ShowHelpNotification

                        L18_3 = "~INPUT_PICKUP~ "

                        L19_3 = L15_3.text

                        L18_3 = L18_3 .. L19_3

                        L19_3 = true

                        L17_3(L18_3, L19_3)

                      end

                    end

                  end

                  L17_3 = IsControlJustPressed

                  L18_3 = 0

                  L19_3 = 38

                  L17_3 = L17_3(L18_3, L19_3)

                  if L17_3 then

                    L17_3 = Debuger

                    L18_3 = "Marker interact: "

                    L19_3 = L10_3

                    L20_3 = L14_3

                    L21_3 = json

                    L21_3 = L21_3.encode

                    L22_3 = L15_3

                    L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3 = L21_3(L22_3)

                    L17_3(L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3)

                    L17_3 = TriggerEvent

                    L18_3 = L15_3.event

                    L19_3 = L10_3

                    L20_3 = L14_3

                    L21_3 = L15_3.stationName

                    L17_3(L18_3, L19_3, L20_3, L21_3)

                  end

                else

                  L17_3 = L15_3.noty

                  if L17_3 then

                    L17_3 = HideHelpNotification

                    L17_3()

                    L15_3.noty = nil

                  end

                end

              else

                L17_3 = L15_3.noty

                if L17_3 then

                  L17_3 = HideHelpNotification

                  L17_3()

                  L15_3.noty = nil

                end

              end

            end

          end

        end

      end

      L7_3 = GetVehiclePedIsIn

      L8_3 = L5_3

      L9_3 = false

      L7_3 = L7_3(L8_3, L9_3)

      if 0 ~= L7_3 then

        L8_3 = Config

        L8_3 = L8_3.ShowCurrentStreet

        if L8_3 then

          L8_3 = L0_1.enabled

          if L8_3 then

            L8_3 = GetGameTimer

            L8_3 = L8_3()

            L9_3 = L0_1.enabled

            L8_3 = L8_3 - L9_3

            L9_3 = 500

          end

          if L8_3 > L9_3 then

            L8_3 = GetStreetName

            L9_3 = L6_3

            L8_3 = L8_3(L9_3)

            L9_3 = GetCardinalFromHeading

            L10_3 = GetEntityHeading

            L11_3 = L7_3

            L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3 = L10_3(L11_3)

            L9_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3, L25_3, L26_3, L27_3, L28_3, L29_3, L30_3, L31_3, L32_3, L33_3, L34_3, L35_3, L36_3, L37_3, L38_3)

            L10_3 = GetGameTimer

            L10_3 = L10_3()

            L0_1.enabled = L10_3

            L10_3 = L0_1.street

            if L10_3 then

              L10_3 = L0_1.cardinal

              if L10_3 then

                L10_3 = L0_1.street

                if L10_3 == L8_3 then

                  L10_3 = L0_1.cardinal

                end

              end

            end

            if L10_3 ~= L9_3 then

              L0_1.street = L8_3

              L0_1.cardinal = L9_3

              L10_3 = SendNUIMessage

              L11_3 = {}

              L11_3.action = "Location"

              L11_3.street = L8_3

              L11_3.cardinal = L9_3

              L10_3(L11_3)

            end

          end

      end

      else

        L8_3 = L0_1.enabled

        if L8_3 then

          L8_3 = SendNUIMessage

          L9_3 = {}

          L9_3.action = "HideLocation"

          L8_3(L9_3)

          L8_3 = {}

          L0_1 = L8_3

        end

      end

      L8_3 = Citizen

      L8_3 = L8_3.Wait

      L9_3 = L4_3

      L8_3(L9_3)

    end

    L4_3 = SendNUIMessage

    L5_3 = {}

    L5_3.action = "HideLocation"

    L4_3(L5_3)

    L4_3 = {}

    L0_1 = L4_3

    L4_3 = Tables

    L4_3 = L4_3.Markers

    if L4_3 then

      L4_3 = 1

      L5_3 = Tables

      L5_3 = L5_3.Markers

      L5_3 = #L5_3

      L6_3 = 1

      for L7_3 = L4_3, L5_3, L6_3 do

        L8_3 = 1

        L9_3 = Tables

        L9_3 = L9_3.Markers

        L9_3 = L9_3[L7_3]

        L9_3 = #L9_3

        L10_3 = 1

        for L11_3 = L8_3, L9_3, L10_3 do

          L12_3 = Tables

          L12_3 = L12_3.Markers

          L12_3 = L12_3[L7_3]

          L12_3 = L12_3[L11_3]

          L12_3 = L12_3.noty

          if L12_3 then

            L12_3 = HideHelpNotification

            L12_3()

            break

          end

        end

      end

    end

    L4_3 = TriggerServerEvent

    L5_3 = "origen_police:server:ClockOut"

    L4_3(L5_3)

  end

  L4_2(L5_2)

  L4_2 = onduty

  return L4_2

end

SetDuty = L2_1

L2_1 = HandlerManager

L3_1 = L2_1

L2_1 = L2_1.AddCallback

L4_1 = "vehicle_sit"

function L5_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  if A0_2 then

    L2_2 = ValidVehicles

    L3_2 = IsVehicleValid

    L4_2 = "any"

    L5_2 = A0_2

    L3_2 = L3_2(L4_2, L5_2)

    L2_2[A0_2] = L3_2

    L2_2 = Debuger

    L3_2 = "Is vehicle valid: "

    L4_2 = tostring

    L5_2 = ValidVehicles

    L5_2 = L5_2[A0_2]

    L4_2 = L4_2(L5_2)

    L3_2 = L3_2 .. L4_2

    L2_2(L3_2)

  else

    L2_2 = ValidVehicles

    L2_2[A1_2] = nil

    L2_2 = Debuger

    L3_2 = "Vehicle left: "

    L4_2 = tostring

    L5_2 = A1_2

    L4_2 = L4_2(L5_2)

    L3_2 = L3_2 .. L4_2

    L2_2(L3_2)

  end

end

L2_1(L3_1, L4_1, L5_1)

L2_1 = Citizen

L2_1 = L2_1.CreateThread

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = false

  L1_2 = false

  while true do

    L2_2 = 500

    L3_2 = PlayerPedId

    L3_2 = L3_2()

    L4_2 = GetVehiclePedIsIn

    L5_2 = L3_2

    L6_2 = false

    L4_2 = L4_2(L5_2, L6_2)

    L5_2 = ValidVehicles

    L5_2 = L5_2[L4_2]

    if nil == L5_2 then

    else

      if 0 ~= L4_2 then

        L5_2 = ValidVehicles

        L5_2 = L5_2[L4_2]

        if true == L5_2 then

          L5_2 = Config

          L5_2 = L5_2.SirensSystem

          if L5_2 then

            L5_2 = DisableControlAction

            L6_2 = 0

            L7_2 = 85

            L8_2 = true

            L5_2(L6_2, L7_2, L8_2)

            L5_2 = Config

            L5_2 = L5_2.Commands

            L5_2 = L5_2.HornKey

            L5_2 = L5_2.disabledKey

            if L5_2 then

              L5_2 = DisableControlAction

              L6_2 = 0

              L7_2 = Config

              L7_2 = L7_2.Commands

              L7_2 = L7_2.HornKey

              L7_2 = L7_2.disabledKey

              L8_2 = true

              L5_2(L6_2, L7_2, L8_2)

            end

            L5_2 = SetVehRadioStation

            L6_2 = L4_2

            L7_2 = "OFF"

            L5_2(L6_2, L7_2)

            L5_2 = SetVehicleRadioEnabled

            L6_2 = L4_2

            L7_2 = false

            L5_2(L6_2, L7_2)

            L5_2 = GetPedInVehicleSeat

            L6_2 = L4_2

            L7_2 = -1

            L5_2 = L5_2(L6_2, L7_2)

            if L5_2 == L3_2 then

              L5_2 = IsDisabledControlPressed

              L6_2 = 0

              L7_2 = Config

              L7_2 = L7_2.Commands

              L7_2 = L7_2.HornKey

              L7_2 = L7_2.key

              L5_2 = L5_2(L6_2, L7_2)

              if L5_2 then

                L5_2 = IsVehicleValid

                L6_2 = "heli"

                L7_2 = L4_2

                L5_2 = L5_2(L6_2, L7_2)

                if not L5_2 then

                  if not L1_2 then

                    L1_2 = L4_2

                    L5_2 = TriggerServerEvent

                    L6_2 = "origen_police:server:PoliceHornState"

                    L7_2 = NetworkGetNetworkIdFromEntity

                    L8_2 = L4_2

                    L7_2 = L7_2(L8_2)

                    L8_2 = true

                    L5_2(L6_2, L7_2, L8_2)

                  end

              end

              elseif L1_2 then

                L1_2 = false

                L5_2 = TriggerServerEvent

                L6_2 = "origen_police:server:PoliceHornState"

                L7_2 = NetworkGetNetworkIdFromEntity

                L8_2 = L4_2

                L7_2 = L7_2(L8_2)

                L8_2 = false

                L5_2(L6_2, L7_2, L8_2)

              end

            end

          end

          L5_2 = IsControlJustPressed

          L6_2 = 0

          L7_2 = Config

          L7_2 = L7_2.Commands

          L7_2 = L7_2.CamOrRappel

          L7_2 = L7_2.key

          L5_2 = L5_2(L6_2, L7_2)

          if L5_2 then

            L5_2 = GetVehicleClass

            L6_2 = L4_2

            L5_2 = L5_2(L6_2)

            if 15 == L5_2 then

              L5_2 = DoCamOrRappel

              L6_2 = L4_2

              L5_2(L6_2)

            end

          end

          L5_2 = IsControlJustPressed

          L6_2 = 0

          L7_2 = Config

          L7_2 = L7_2.Commands

          L7_2 = L7_2.TalkMegaphone

          L7_2 = L7_2.key

          L5_2 = L5_2(L6_2, L7_2)

          if L5_2 then

            L5_2 = SendNUIMessage

            L6_2 = {}

            L6_2.action = "ShowCarMegaphone"

            L5_2(L6_2)

            L5_2 = OverrideProximityRange

            L6_2 = Config

            L6_2 = L6_2.MegaphoneVoiceDist

            L7_2 = true

            L5_2(L6_2, L7_2)

            while true do

              L5_2 = IsControlPressed

              L6_2 = 0

              L7_2 = 246

              L5_2 = L5_2(L6_2, L7_2)

              if not L5_2 then

                break

              end

              L5_2 = Citizen

              L5_2 = L5_2.Wait

              L6_2 = 0

              L5_2(L6_2)

              L5_2 = SetControlNormal

              L6_2 = 0

              L7_2 = 249

              L8_2 = 1.0

              L5_2(L6_2, L7_2, L8_2)

              L5_2 = SetControlNormal

              L6_2 = 1

              L7_2 = 249

              L8_2 = 1.0

              L5_2(L6_2, L7_2, L8_2)

              L5_2 = SetControlNormal

              L6_2 = 2

              L7_2 = 249

              L8_2 = 1.0

              L5_2(L6_2, L7_2, L8_2)

            end

            L5_2 = OverrideProximityRange

            L5_2()

            L5_2 = SendNUIMessage

            L6_2 = {}

            L6_2.action = "HideCarMegaphone"

            L5_2(L6_2)

          end

          L2_2 = 0

      end

      else

        if L0_2 and L1_2 then

          L5_2 = TriggerServerEvent

          L6_2 = "origen_police:server:PoliceHornState"

          L7_2 = NetworkGetNetworkIdFromEntity

          L8_2 = L1_2

          L7_2 = L7_2(L8_2)

          L8_2 = false

          L5_2(L6_2, L7_2, L8_2)

        end

        L0_2 = false

        L1_2 = false

        L5_2 = SendNUIMessage

        L6_2 = {}

        L6_2.action = "HideCarMegaphone"

        L5_2(L6_2)

      end

    end

    L5_2 = Citizen

    L5_2 = L5_2.Wait

    L6_2 = L2_2

    L5_2(L6_2)

  end

end

L2_1(L3_1)

L2_1 = RegisterNUICallback

L3_1 = "duty"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = Config

  L2_2 = L2_2.Framework

  if "qbcore" == L2_2 then

    L2_2 = TriggerServerEvent

    L3_2 = "QBCore:ToggleDuty"

    L4_2 = onduty

    L4_2 = not L4_2

    L2_2(L3_2, L4_2)

  else

    L2_2 = Config

    L2_2 = L2_2.Framework

    if "esx" == L2_2 then

      L2_2 = TriggerServerEvent

      L3_2 = "origen_police:server_esx:SetDuty"

      L4_2 = onduty

      L4_2 = not L4_2

      L2_2(L3_2, L4_2)

    end

  end

  L2_2 = A1_2

  L3_2 = onduty

  L3_2 = not L3_2

  L2_2(L3_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNetEvent

L3_1 = "origen_police:ShowNotification"

function L4_1(A0_2)

  local L1_2, L2_2

  L1_2 = ShowNotification

  L2_2 = A0_2

  L1_2(L2_2)

end

L2_1(L3_1, L4_1)

L2_1 = RegisterNUICallback

L3_1 = "GetWebhook"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = GetCameraWebhook

  function L3_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3

    if A0_3 then

      L1_3 = A1_2

      L2_3 = {}

      L2_3.url = A0_3

      L3_3 = Config

      L3_3 = L3_3.Fields

      L4_3 = Config

      L4_3 = L4_3.UploadMethod

      L3_3 = L3_3[L4_3]

      L2_3.fields = L3_3

      L1_3(L2_3)

    else

      L1_3 = A1_2

      L2_3 = false

      L1_3(L2_3)

      L1_3 = ShowNotification

      L2_3 = "Not webhook found in config/logs/logs.lua"

      return L1_3(L2_3)

    end

  end

  L2_2(L3_2)

end

L2_1(L3_1, L4_1)

L2_1 = exports

L3_1 = "GetPoliceDuty"

function L4_1()

  local L0_2, L1_2

  L0_2 = onduty

  return L0_2

end

L2_1(L3_1, L4_1)

L2_1 = exports

L3_1 = "IsOnDuty"

function L4_1()

  local L0_2, L1_2

  L0_2 = onduty

  return L0_2

end

L2_1(L3_1, L4_1)

