local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

CentralSuscribeds = L0_1

L0_1 = {}

Cops = L0_1

L0_1 = {}

L1_1 = {}

VehicleTrackeds = L1_1

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:PlayerReady"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = A0_2

  L3_2 = CanOpenTablet

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  if nil == L3_2 then

    return

  end

  L4_2 = L0_1

  L4_2[L2_2] = A1_2

  L4_2 = Cops

  L4_2 = L4_2[L3_2]

  L4_2 = L4_2[L2_2]

  if L4_2 then

    L4_2 = Cops

    L4_2 = L4_2[L3_2]

    L4_2 = L4_2[L2_2]

    L4_2.ready = A1_2

  end

end

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "GetCentralSuscribeds"

function L3_1()

  local L0_2, L1_2

  L0_2 = CentralSuscribeds

  return L0_2

end

L1_1(L2_1, L3_1)

function L1_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = Wait

  L4_2 = 1000

  L3_2(L4_2)

  L3_2 = NetworkGetEntityFromNetworkId

  L4_2 = A1_2

  L3_2 = L3_2(L4_2)

  L4_2 = VehicleTrackeds

  L4_2 = L4_2[A0_2]

  if nil == L4_2 then

    L4_2 = VehicleTrackeds

    L5_2 = {}

    L4_2[A0_2] = L5_2

  end

  L4_2 = VehicleTrackeds

  L4_2 = L4_2[A0_2]

  L5_2 = {}

  L5_2.model = A2_2

  L6_2 = GetVehicleNumberPlateText

  L7_2 = L3_2

  L6_2 = L6_2(L7_2)

  L5_2.plate = L6_2

  L6_2 = GetEntityCoords

  L7_2 = L3_2

  L6_2 = L6_2(L7_2)

  L5_2.coords = L6_2

  L5_2.entity = L3_2

  L4_2[A1_2] = L5_2

end

trackVehicle = L1_1

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:TrackVehicle"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = CanOpenTablet

  L3_2 = source

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = trackVehicle

  L4_2 = L2_2

  L5_2 = A0_2

  L6_2 = A1_2

  L3_2(L4_2, L5_2, L6_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L2_2 = VehicleTrackeds

  L2_2 = L2_2[A0_2]

  L2_2[A1_2] = nil

  L2_2 = pairs

  L3_2 = CentralSuscribeds

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = TriggerClientEvent

    L9_2 = "origen_police:client:RemoveCentralMark"

    L10_2 = L6_2

    L11_2 = "car-"

    L12_2 = A1_2

    L11_2 = L11_2 .. L12_2

    L8_2(L9_2, L10_2, L11_2)

  end

end

unTrackVehicle = L1_1

function L1_1()

  local L0_2, L1_2

  L0_2 = VehicleTrackeds

  return L0_2

end

GetVehiclesTrackeds = L1_1

L1_1 = exports

L2_1 = "trackVehicle"

L3_1 = trackVehicle

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "unTrackVehicle"

L3_1 = unTrackVehicle

L1_1(L2_1, L3_1)

L1_1 = exports

L2_1 = "GetVehicleTrackeds"

L3_1 = GetVehiclesTrackeds

L1_1(L2_1, L3_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:UnTrackVehicle"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  if nil == A1_2 then

    L2_2 = CanOpenTablet

    L3_2 = source

    L2_2 = L2_2(L3_2)

    L2_2 = L2_2[2]

    if L2_2 then

      goto lbl_10

    end

  end

  L2_2 = A1_2

  ::lbl_10::

  L3_2 = unTrackVehicle

  L4_2 = L2_2

  L5_2 = A0_2

  L3_2(L4_2, L5_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:GetVehiclesTracked"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = CanOpenTablet

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = A1_2

  L4_2 = VehicleTrackeds

  L4_2 = L4_2[L2_2]

  L3_2(L4_2)

end

L1_1(L2_1, L3_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L0_2 = exports

  L0_2 = L0_2.origen_police

  L1_2 = L0_2

  L0_2 = L0_2.GetPlayersReady

  L2_2 = Config

  L2_2 = L2_2.PoliceJobName

  L0_2 = L0_2(L1_2, L2_2)

  L0_1 = L0_2

  while true do

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 2500

    L0_2(L1_2)

    L0_2 = VehicleTrackeds

    if nil ~= L0_2 then

      L0_2 = pairs

      L1_2 = VehicleTrackeds

      L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

      for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

        L6_2 = pairs

        L7_2 = L5_2

        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

          L12_2 = DoesEntityExist

          L13_2 = L11_2.entity

          L12_2 = L12_2(L13_2)

          if L12_2 then

            L12_2 = GetEntityCoords

            L13_2 = L11_2.entity

            L12_2 = L12_2(L13_2)

            L11_2.coords = L12_2

          else

            L12_2 = TriggerEvent

            L13_2 = "origen_police:server:UnTrackVehicle"

            L14_2 = L10_2

            L15_2 = L4_2

            L12_2(L13_2, L14_2, L15_2)

          end

        end

      end

    end

    L0_2 = pairs

    L1_2 = Config

    L1_2 = L1_2.JobCategory

    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

      L6_2 = Cops

      L6_2 = L6_2[L4_2]

      if nil ~= L6_2 then

        L6_2 = pairs

        L7_2 = Cops

        L7_2 = L7_2[L4_2]

        L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

        for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

          L12_2 = GetPlayerPed

          L13_2 = L10_2

          L12_2 = L12_2(L13_2)

          if L12_2 > 0 then

            L12_2 = References

            L12_2 = L12_2[L4_2]

            if not L12_2 then

              goto lbl_141

            end

            L12_2 = References

            L12_2 = L12_2[L4_2]

            L12_2 = L12_2[L10_2]

            if not L12_2 then

              goto lbl_141

            end

            L12_2 = References

            L12_2 = L12_2[L4_2]

            L12_2 = L12_2[L10_2]

            if L12_2 then

              L12_2 = References

              L12_2 = L12_2[L4_2]

              L12_2 = L12_2[L10_2]

              L12_2 = L12_2.unit

              if L12_2 then

                goto lbl_84

              end

            end

            L12_2 = ""

            ::lbl_84::

            L11_2.unit = L12_2

            L12_2 = {}

            L13_2 = References

            L13_2 = L13_2[L4_2]

            L13_2 = L13_2[L10_2]

            if L13_2 then

              L13_2 = References

              L13_2 = L13_2[L4_2]

              L13_2 = L13_2[L10_2]

              L13_2 = L13_2.coords

              if L13_2 then

                goto lbl_103

              end

            end

            L13_2 = vector3

            L14_2 = 0

            L15_2 = 0

            L16_2 = 0

            L13_2 = L13_2(L14_2, L15_2, L16_2)

            ::lbl_103::

            L12_2.coords = L13_2

            L13_2 = References

            L13_2 = L13_2[L4_2]

            L13_2 = L13_2[L10_2]

            if L13_2 then

              L13_2 = References

              L13_2 = L13_2[L4_2]

              L13_2 = L13_2[L10_2]

              L13_2 = L13_2.sprite

              if L13_2 then

                goto lbl_116

              end

            end

            L13_2 = 1

            ::lbl_116::

            L12_2.sprite = L13_2

            L13_2 = References

            L13_2 = L13_2[L4_2]

            L13_2 = L13_2[L10_2]

            if L13_2 then

              L13_2 = References

              L13_2 = L13_2[L4_2]

              L13_2 = L13_2[L10_2]

              L13_2 = L13_2.color

              if L13_2 then

                goto lbl_129

              end

            end

            L13_2 = 0

            ::lbl_129::

            L12_2.color = L13_2

            L11_2.ref = L12_2

            L12_2 = L0_1

            L12_2 = L12_2[L10_2]

            if not L12_2 then

              L12_2 = false

            end

            L11_2.ready = L12_2

          else

            L12_2 = Cops

            L12_2 = L12_2[L4_2]

            L12_2[L10_2] = nil

          end

          ::lbl_141::

        end

        L6_2 = CentralSuscribeds

        if nil ~= L6_2 then

          L6_2 = pairs

          L7_2 = CentralSuscribeds

          L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

          for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

            L12_2 = CanOpenTablet

            L13_2 = L10_2

            L12_2 = L12_2(L13_2)

            L12_2 = L12_2[2]

            L13_2 = TriggerClientEvent

            L14_2 = "origen_police:client:UpdateCentralPositions"

            L15_2 = L10_2

            L16_2 = VehicleTrackeds

            L16_2 = L16_2[L12_2]

            L17_2 = Cops

            L17_2 = L17_2[L12_2]

            L13_2(L14_2, L15_2, L16_2, L17_2)

          end

        end

      end

    end

  end

end

L1_1(L2_1)

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2, L29_2, L30_2, L31_2, L32_2, L33_2, L34_2, L35_2

  L0_2 = Config

  L0_2 = L0_2.Framework

  if "qbcore" ~= L0_2 then

    L0_2 = Config

    L0_2 = L0_2.Framework

    if "esx" ~= L0_2 then

      L0_2 = print

      L1_2 = "Can't find supported framework: "

      L2_2 = Config

      L2_2 = L2_2.Framework

      return L0_2(L1_2, L2_2)

    end

  end

  while true do

    L0_2 = {}

    Cops = L0_2

    L0_2 = pairs

    L1_2 = Config

    L1_2 = L1_2.JobCategory

    L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

    for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

      L6_2 = Cops

      L7_2 = {}

      L6_2[L4_2] = L7_2

      L6_2 = {}

      L7_2 = pairs

      L8_2 = L5_2

      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

        L13_2 = L12_2.color

        L12_2 = L12_2.name

        L14_2 = Config

        L14_2 = L14_2.Framework

        if "qbcore" == L14_2 then

          L14_2 = Framework

          L14_2 = L14_2.Functions

          L14_2 = L14_2.GetPlayersOnDuty

          L15_2 = L12_2

          L14_2 = L14_2(L15_2)

          if L14_2 then

            goto lbl_49

          end

        end

        L14_2 = GetPlayersInDuty

        L15_2 = L12_2

        L14_2 = L14_2(L15_2)

        ::lbl_49::

        L15_2 = 1

        L16_2 = #L14_2

        L17_2 = 1

        for L18_2 = L15_2, L16_2, L17_2 do

          L19_2 = FW_GetPlayer

          L20_2 = L14_2[L18_2]

          L19_2 = L19_2(L20_2)

          if L19_2 then

            L20_2 = L19_2.PlayerData

            if L20_2 then

              L20_2 = L19_2.PlayerData

              L20_2 = L20_2.job

              L20_2 = L20_2.name

              L21_2 = Framework

              L21_2 = L21_2.Shared

              L21_2 = L21_2.Jobs

              L21_2 = L21_2[L20_2]

              if L21_2 then

                L21_2 = Framework

                L21_2 = L21_2.Shared

                L21_2 = L21_2.Jobs

                L21_2 = L21_2[L20_2]

                L21_2 = L21_2.grades

                L22_2 = tostring

                L23_2 = L19_2.PlayerData

                L23_2 = L23_2.job

                L23_2 = L23_2.grade

                L23_2 = L23_2.level

                L22_2 = L22_2(L23_2)

                L21_2 = L21_2[L22_2]

                if L21_2 then

                  L21_2 = Framework

                  L21_2 = L21_2.Shared

                  L21_2 = L21_2.Jobs

                  L21_2 = L21_2[L20_2]

                  L21_2 = L21_2.grades

                  L22_2 = tostring

                  L23_2 = L19_2.PlayerData

                  L23_2 = L23_2.job

                  L23_2 = L23_2.grade

                  L23_2 = L23_2.level

                  L22_2 = L22_2(L23_2)

                  L21_2 = L21_2[L22_2]

                  L21_2 = L21_2.type

                  if L21_2 then

                    goto lbl_100

                  end

                end

              end

              L21_2 = "lspd"

              ::lbl_100::

              L22_2 = pairs

              L23_2 = Config

              L23_2 = L23_2.JobCategory

              L22_2, L23_2, L24_2, L25_2 = L22_2(L23_2)

              for L26_2, L27_2 in L22_2, L23_2, L24_2, L25_2 do

                L28_2 = pairs

                L29_2 = L27_2

                L28_2, L29_2, L30_2, L31_2 = L28_2(L29_2)

                for L32_2, L33_2 in L28_2, L29_2, L30_2, L31_2 do

                  L34_2 = L33_2.name

                  L35_2 = L19_2.PlayerData

                  L35_2 = L35_2.job

                  L35_2 = L35_2.name

                  if L34_2 == L35_2 then

                    L13_2 = L33_2.color

                    break

                  end

                end

              end

              L22_2 = L14_2[L18_2]

              L23_2 = {}

              L24_2 = L19_2.PlayerData

              L24_2 = L24_2.charinfo

              L24_2 = L24_2.firstname

              L25_2 = " "

              L26_2 = L19_2.PlayerData

              L26_2 = L26_2.charinfo

              L26_2 = L26_2.lastname

              L24_2 = L24_2 .. L25_2 .. L26_2

              L23_2.name = L24_2

              L24_2 = L19_2.PlayerData

              L24_2 = L24_2.metadata

              L24_2 = L24_2.police_badge

              if not L24_2 then

                L24_2 = "0000"

              end

              L23_2.badge = L24_2

              L25_2 = L21_2

              L24_2 = L21_2.upper

              L24_2 = L24_2(L25_2)

              L23_2.dept = L24_2

              L24_2 = L19_2.PlayerData

              L24_2 = L24_2.job

              L24_2 = L24_2.grade

              L24_2 = L24_2.name

              L23_2.grade = L24_2

              L23_2.deptColor = L13_2

              L24_2 = References

              L25_2 = L14_2[L18_2]

              L24_2 = L24_2[L25_2]

              if L24_2 then

                L24_2 = References

                L25_2 = L14_2[L18_2]

                L24_2 = L24_2[L25_2]

                L24_2 = L24_2.unit

                if L24_2 then

                  goto lbl_163

                end

              end

              L24_2 = ""

              ::lbl_163::

              L23_2.unit = L24_2

              L24_2 = {}

              L25_2 = References

              L26_2 = L14_2[L18_2]

              L25_2 = L25_2[L26_2]

              if L25_2 then

                L25_2 = References

                L26_2 = L14_2[L18_2]

                L25_2 = L25_2[L26_2]

                L25_2 = L25_2.coords

                if L25_2 then

                  goto lbl_182

                end

              end

              L25_2 = vector3

              L26_2 = 0

              L27_2 = 0

              L28_2 = 0

              L25_2 = L25_2(L26_2, L27_2, L28_2)

              ::lbl_182::

              L24_2.coords = L25_2

              L25_2 = References

              L26_2 = L14_2[L18_2]

              L25_2 = L25_2[L26_2]

              if L25_2 then

                L25_2 = References

                L26_2 = L14_2[L18_2]

                L25_2 = L25_2[L26_2]

                L25_2 = L25_2.sprite

                if L25_2 then

                  goto lbl_195

                end

              end

              L25_2 = 1

              ::lbl_195::

              L24_2.sprite = L25_2

              L25_2 = References

              L26_2 = L14_2[L18_2]

              L25_2 = L25_2[L26_2]

              if L25_2 then

                L25_2 = References

                L26_2 = L14_2[L18_2]

                L25_2 = L25_2[L26_2]

                L25_2 = L25_2.color

                if L25_2 then

                  goto lbl_208

                end

              end

              L25_2 = 0

              ::lbl_208::

              L24_2.color = L25_2

              L23_2.ref = L24_2

              L25_2 = L14_2[L18_2]

              L24_2 = L0_1

              L24_2 = L24_2[L25_2]

              if not L24_2 then

                L24_2 = false

              end

              L23_2.ready = L24_2

              L24_2 = L14_2[L18_2]

              L23_2.source = L24_2

              L24_2 = HiddenGpsCops

              L25_2 = L14_2[L18_2]

              L24_2 = L24_2[L25_2]

              if not L24_2 then

                L24_2 = nil

              end

              L23_2.hideGPS = L24_2

              L6_2[L22_2] = L23_2

          end

          else

            L20_2 = HiddenGpsCops

            L21_2 = L14_2[L18_2]

            L20_2 = L20_2[L21_2]

            if L20_2 then

              L20_2 = HiddenGpsCops

              L21_2 = L14_2[L18_2]

              L20_2[L21_2] = nil

            end

          end

        end

      end

      L7_2 = Cops

      L7_2[L4_2] = L6_2

    end

    L0_2 = Citizen

    L0_2 = L0_2.Wait

    L1_2 = 60000

    L0_2(L1_2)

  end

end

L1_1(L2_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:OpenCentral"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = A0_2

  L3_2 = CanOpenTablet

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  L3_2 = L3_2[2]

  L4_2 = CentralSuscribeds

  L4_2[L2_2] = true

  L4_2 = A1_2

  L5_2 = json

  L5_2 = L5_2.decode

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = {}

  L8_2 = VehicleTrackeds

  L8_2 = L8_2[L3_2]

  L7_2.VehicleTrackeds = L8_2

  L8_2 = Cops

  L8_2 = L8_2[L3_2]

  L7_2.Cops = L8_2

  L8_2 = Public

  L8_2 = L8_2.Radars

  L7_2.Radars = L8_2

  L8_2 = Public

  L8_2 = L8_2.TrafficZones

  L7_2.TrafficZones = L8_2

  L6_2, L7_2, L8_2 = L6_2(L7_2)

  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2, L8_2)

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:CloseCentral"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2

  L2_2 = CentralSuscribeds

  L2_2[A0_2] = nil

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

L1_1 = AddEventHandler

L2_1 = "playerDropped"

function L3_1()

  local L0_2, L1_2

  L0_2 = source

  if not L0_2 then

    return

  end

  L0_2 = CentralSuscribeds

  L1_2 = source

  L0_2 = L0_2[L1_2]

  if L0_2 then

    L0_2 = CentralSuscribeds

    L1_2 = source

    L0_2[L1_2] = nil

  end

end

L1_1(L2_1, L3_1)

