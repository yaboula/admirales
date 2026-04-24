local L0_1, L1_1, L2_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = A0_2.x

  if nil == L1_2 then

    L1_2 = vector3

    L2_2 = A0_2[1]

    L3_2 = A0_2[2]

    L4_2 = A0_2[3]

    L1_2 = L1_2(L2_2, L3_2, L4_2)

    A0_2 = L1_2

  end

  L1_2 = GetStreetNameAtCoord

  L2_2 = A0_2.x

  L3_2 = A0_2.y

  L4_2 = A0_2.z

  L1_2, L2_2 = L1_2(L2_2, L3_2, L4_2)

  L3_2 = GetStreetNameFromHashKey

  L4_2 = L1_2

  L3_2 = L3_2(L4_2)

  L1_2 = L3_2

  L3_2 = GetStreetNameFromHashKey

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  L2_2 = L3_2

  if "" == L2_2 then

    return L1_2

  else

    L3_2 = L1_2

    L4_2 = " & "

    L5_2 = L2_2

    L3_2 = L3_2 .. L4_2 .. L5_2

    return L3_2

  end

end

GetStreetName = L0_1

function L0_1(A0_2)

  local L1_2

  L1_2 = 22.5

  if A0_2 < L1_2 then

    L1_2 = "N"

    return L1_2

  else

    L1_2 = 67.5

    if A0_2 < L1_2 then

      L1_2 = "NO"

      return L1_2

    else

      L1_2 = 112.5

      if A0_2 < L1_2 then

        L1_2 = "O"

        return L1_2

      else

        L1_2 = 157.5

        if A0_2 < L1_2 then

          L1_2 = "SO"

          return L1_2

        else

          L1_2 = 202.5

          if A0_2 < L1_2 then

            L1_2 = "S"

            return L1_2

          else

            L1_2 = 247.5

            if A0_2 < L1_2 then

              L1_2 = "SE"

              return L1_2

            else

              L1_2 = 292.5

              if A0_2 < L1_2 then

                L1_2 = "E"

                return L1_2

              else

                L1_2 = 337.5

                if A0_2 < L1_2 then

                  L1_2 = "NE"

                  return L1_2

                else

                  L1_2 = "N"

                  return L1_2

                end

              end

            end

          end

        end

      end

    end

  end

end

GetCardinalFromHeading = L0_1

function L0_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L0_2 = PlayerPedId

  L0_2 = L0_2()

  L1_2 = IsPedInAnyVehicle

  L2_2 = L0_2

  L3_2 = false

  L1_2 = L1_2(L2_2, L3_2)

  if L1_2 then

    L1_2 = GetVehiclePedIsIn

    L2_2 = L0_2

    L3_2 = false

    L1_2 = L1_2(L2_2, L3_2)

    if L1_2 then

      goto lbl_16

    end

  end

  L1_2 = L0_2

  ::lbl_16::

  L2_2 = GetShapeTestResult

  L3_2 = StartShapeTestCapsule

  L4_2 = GetOffsetFromEntityInWorldCoords

  L5_2 = L1_2

  L6_2 = 0.0

  L7_2 = 1.0

  L8_2 = 1.0

  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

  L5_2 = GetOffsetFromEntityInWorldCoords

  L6_2 = L1_2

  L7_2 = 0.0

  L8_2 = 105.0

  L9_2 = 0.0

  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)

  L6_2 = 3.0

  L7_2 = 10

  L8_2 = L1_2

  L9_2 = 7

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)

  L7_2 = GetVehiclePlate

  L8_2 = L6_2

  L7_2 = L7_2(L8_2)

  L8_2 = GetLabelText

  L9_2 = GetDisplayNameFromVehicleModel

  L10_2 = GetEntityModel

  L11_2 = L6_2

  L10_2, L11_2 = L10_2(L11_2)

  L9_2, L10_2, L11_2 = L9_2(L10_2, L11_2)

  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2, L11_2)

  return L7_2, L8_2, L9_2, L10_2, L11_2

end

GetRadarVehicle = L0_1

function L0_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L0_2 = GetEntityCoords

  L1_2 = PlayerPedId

  L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L1_2()

  L0_2 = L0_2(L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

  L1_2 = GetClosestObjectOfType

  L2_2 = L0_2.x

  L3_2 = L0_2.y

  L4_2 = L0_2.z

  L5_2 = 50.0

  L6_2 = GetHashKey

  L7_2 = "prop_cctv_cam_06a"

  L6_2 = L6_2(L7_2)

  L7_2 = false

  L8_2 = false

  L9_2 = false

  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)

  L2_2 = Fw_GetPeds

  L2_2 = L2_2()

  L3_2 = false

  L4_2 = 1

  L5_2 = #L2_2

  L6_2 = 1

  for L7_2 = L4_2, L5_2, L6_2 do

    L8_2 = IsPedAPlayer

    L9_2 = L2_2[L7_2]

    L8_2 = L8_2(L9_2)

    if not L8_2 then

      L8_2 = GetEntityCoords

      L9_2 = L2_2[L7_2]

      L8_2 = L8_2(L9_2)

      L8_2 = L8_2 - L0_2

      L8_2 = #L8_2

      L9_2 = 200

      if L8_2 < L9_2 then

        L8_2 = GetPedType

        L9_2 = L2_2[L7_2]

        L8_2 = L8_2(L9_2)

        if 28 ~= L8_2 then

          L8_2 = GetPedConfigFlag

          L9_2 = L2_2[L7_2]

          L10_2 = 79

          L8_2 = L8_2(L9_2, L10_2)

          if not L8_2 then

            L3_2 = true

            break

          end

        end

      end

    end

  end

  L4_2 = L1_2 > 0 or L4_2

  return L4_2

end

IsBeingSeen = L0_1

function L0_1(A0_2)

  local L1_2, L2_2

  L1_2 = tonumber

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  A0_2 = L1_2

  if not A0_2 then

    return

  end

  L1_2 = Citizen

  L1_2 = L1_2.CreateThread

  function L2_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    L0_3 = SetPoliceRadarBlips

    L1_3 = false

    L0_3(L1_3)

    L0_3 = SetMaxWantedLevel

    L1_3 = 5

    L0_3(L1_3)

    L0_3 = SetPlayerWantedLevel

    L1_3 = PlayerId

    L1_3 = L1_3()

    L2_3 = A0_2

    L3_3 = false

    L0_3(L1_3, L2_3, L3_3)

    L0_3 = SetPlayerWantedLevelNow

    L1_3 = PlayerId

    L1_3 = L1_3()

    L2_3 = true

    L0_3(L1_3, L2_3)

    while true do

      L0_3 = GetPlayerWantedLevel

      L1_3 = PlayerId

      L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L1_3()

      L0_3 = L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

      if not (L0_3 > 0) then

        break

      end

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 1000

      L0_3(L1_3)

      L0_3 = SendNUIMessage

      L1_3 = {}

      L1_3.action = "WantedLevel"

      L2_3 = GetPlayerWantedLevel

      L3_3 = PlayerId

      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3 = L3_3()

      L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3)

      L1_3.value = L2_3

      L0_3(L1_3)

      L0_3 = IsPedInAnyVehicle

      L1_3 = PlayerPedId

      L1_3 = L1_3()

      L2_3 = false

      L0_3 = L0_3(L1_3, L2_3)

      if L0_3 then

        L0_3 = GetVehiclePedIsIn

        L1_3 = PlayerPedId

        L1_3 = L1_3()

        L2_3 = false

        L0_3 = L0_3(L1_3, L2_3)

        L1_3 = -1

        L2_3 = GetVehicleMaxNumberOfPassengers

        L3_3 = L0_3

        L2_3 = L2_3(L3_3)

        L3_3 = 1

        for L4_3 = L1_3, L2_3, L3_3 do

          L5_3 = GetPedInVehicleSeat

          L6_3 = L0_3

          L7_3 = L4_3

          L5_3 = L5_3(L6_3, L7_3)

          if 0 ~= L5_3 then

            L6_3 = PlayerPedId

            L6_3 = L6_3()

            if L5_3 ~= L6_3 then

              L6_3 = GetPlayerWantedLevel

              L7_3 = PlayerId

              L7_3, L8_3, L9_3, L10_3 = L7_3()

              L6_3 = L6_3(L7_3, L8_3, L9_3, L10_3)

              L7_3 = GetPlayerWantedLevel

              L8_3 = NetworkGetPlayerIndexFromPed

              L9_3 = L5_3

              L8_3, L9_3, L10_3 = L8_3(L9_3)

              L7_3 = L7_3(L8_3, L9_3, L10_3)

              if L6_3 > L7_3 then

                L6_3 = TriggerServerEvent

                L7_3 = "origen_police:server:SetWantedLevel"

                L8_3 = GetPlayerServerId

                L9_3 = NetworkGetPlayerIndexFromPed

                L10_3 = L5_3

                L9_3, L10_3 = L9_3(L10_3)

                L8_3 = L8_3(L9_3, L10_3)

                L9_3 = GetPlayerWantedLevel

                L10_3 = PlayerId

                L10_3 = L10_3()

                L9_3, L10_3 = L9_3(L10_3)

                L6_3(L7_3, L8_3, L9_3, L10_3)

              end

            end

          end

        end

      end

    end

    L0_3 = SetMaxWantedLevel

    L1_3 = 0

    L0_3(L1_3)

    L0_3 = SendNUIMessage

    L1_3 = {}

    L1_3.action = "WantedLevel"

    L1_3.value = 0

    L0_3(L1_3)

  end

  L1_2(L2_2)

end

SetWantedLevel = L0_1

L0_1 = exports

L1_1 = "SetWantedLevel"

L2_1 = SetWantedLevel

L0_1(L1_1, L2_1)

L0_1 = exports

L1_1 = "IsBeingSeen"

L2_1 = IsBeingSeen

L0_1(L1_1, L2_1)

function L0_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2

  L0_2 = RayCastGamePlayCamera

  L1_2 = 1000.0

  L0_2, L1_2, L2_2 = L0_2(L1_2)

  L3_2 = GetEntityCoords

  L4_2 = PlayerPedId

  L4_2, L5_2 = L4_2()

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = GetEntityCoords

  L5_2 = L2_2

  L4_2 = L4_2(L5_2)

  L3_2 = L3_2 - L4_2

  L3_2 = #L3_2

  if L3_2 > 100 then

    L3_2 = FW_GetClosestVehicle

    L3_2 = L3_2()

    L2_2 = L3_2

  end

  L3_2 = GetEntityCoords

  L4_2 = PlayerPedId

  L4_2, L5_2 = L4_2()

  L3_2 = L3_2(L4_2, L5_2)

  L4_2 = GetEntityCoords

  L5_2 = L2_2

  L4_2 = L4_2(L5_2)

  L3_2 = L3_2 - L4_2

  L3_2 = #L3_2

  if L3_2 > 30 then

    L2_2 = false

  end

  L3_2 = IsPedInAnyVehicle

  L4_2 = PlayerPedId

  L4_2, L5_2 = L4_2()

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L3_2 = GetVehiclePedIsIn

    L4_2 = PlayerPedId

    L4_2 = L4_2()

    L5_2 = false

    L3_2 = L3_2(L4_2, L5_2)

    L2_2 = L3_2

  end

  L3_2 = L2_2 or L3_2

  if not L2_2 then

    L3_2 = 0

  end

  return L3_2

end

GetVehicleInCamera = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = RayCastGamePlayCamera

  L2_2 = A0_2 or L2_2

  if not A0_2 then

    L2_2 = 1000.0

  end

  L1_2, L2_2, L3_2 = L1_2(L2_2)

  L4_2 = L1_2

  L5_2 = L2_2

  L6_2 = L3_2

  return L4_2, L5_2, L6_2

end

GetScreenCoords = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2

  L1_2 = {}

  L2_2 = math

  L2_2 = L2_2.pi

  L2_2 = L2_2 / 180

  L3_2 = A0_2.x

  L2_2 = L2_2 * L3_2

  L1_2.x = L2_2

  L2_2 = math

  L2_2 = L2_2.pi

  L2_2 = L2_2 / 180

  L3_2 = A0_2.y

  L2_2 = L2_2 * L3_2

  L1_2.y = L2_2

  L2_2 = math

  L2_2 = L2_2.pi

  L2_2 = L2_2 / 180

  L3_2 = A0_2.z

  L2_2 = L2_2 * L3_2

  L1_2.z = L2_2

  L2_2 = {}

  L3_2 = math

  L3_2 = L3_2.sin

  L4_2 = L1_2.z

  L3_2 = L3_2(L4_2)

  L3_2 = -L3_2

  L4_2 = math

  L4_2 = L4_2.abs

  L5_2 = math

  L5_2 = L5_2.cos

  L6_2 = L1_2.x

  L5_2, L6_2 = L5_2(L6_2)

  L4_2 = L4_2(L5_2, L6_2)

  L3_2 = L3_2 * L4_2

  L2_2.x = L3_2

  L3_2 = math

  L3_2 = L3_2.cos

  L4_2 = L1_2.z

  L3_2 = L3_2(L4_2)

  L4_2 = math

  L4_2 = L4_2.abs

  L5_2 = math

  L5_2 = L5_2.cos

  L6_2 = L1_2.x

  L5_2, L6_2 = L5_2(L6_2)

  L4_2 = L4_2(L5_2, L6_2)

  L3_2 = L3_2 * L4_2

  L2_2.y = L3_2

  L3_2 = math

  L3_2 = L3_2.sin

  L4_2 = L1_2.x

  L3_2 = L3_2(L4_2)

  L2_2.z = L3_2

  return L2_2

end

RotationToDirection = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L1_2 = GetGameplayCamRot

  L1_2 = L1_2()

  L2_2 = GetGameplayCamCoord

  L2_2 = L2_2()

  L3_2 = RotationToDirection

  L4_2 = L1_2

  L3_2 = L3_2(L4_2)

  L4_2 = {}

  L5_2 = L2_2.x

  L6_2 = L3_2.x

  L6_2 = L6_2 * A0_2

  L5_2 = L5_2 + L6_2

  L4_2.x = L5_2

  L5_2 = L2_2.y

  L6_2 = L3_2.y

  L6_2 = L6_2 * A0_2

  L5_2 = L5_2 + L6_2

  L4_2.y = L5_2

  L5_2 = L2_2.z

  L6_2 = L3_2.z

  L6_2 = L6_2 * A0_2

  L5_2 = L5_2 + L6_2

  L4_2.z = L5_2

  L5_2 = GetShapeTestResult

  L6_2 = StartShapeTestRay

  L7_2 = L2_2.x

  L8_2 = L2_2.y

  L9_2 = L2_2.z

  L10_2 = L4_2.x

  L11_2 = L4_2.y

  L12_2 = L4_2.z

  L13_2 = -1

  L14_2 = PlayerPedId

  L14_2 = L14_2()

  L15_2 = 0

  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)

  L10_2 = L6_2

  L11_2 = L7_2

  L12_2 = L9_2

  return L10_2, L11_2, L12_2

end

RayCastGamePlayCamera = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L1_2 = nil

  L2_2 = SendNUIMessage

  L3_2 = {}

  L3_2.action = "playsound"

  L3_2.soundid = "take-photo.mp3"

  L2_2(L3_2)

  L2_2 = Config

  L2_2 = L2_2.Fields

  L3_2 = Config

  L3_2 = L3_2.UploadMethod

  L2_2 = L2_2[L3_2]

  L3_2 = exports

  L3_2 = L3_2["screenshot-basic"]

  L4_2 = L3_2

  L3_2 = L3_2.requestScreenshotUpload

  L5_2 = A0_2

  L6_2 = L2_2

  function L7_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3

    L1_3 = Debuger

    L2_3 = "Data from screenshot-basic: "

    L3_3 = A0_3

    L4_3 = type

    L5_3 = A0_3

    L4_3, L5_3 = L4_3(L5_3)

    L1_3(L2_3, L3_3, L4_3, L5_3)

    L1_3 = GetCustomUrlFromResponse

    L2_3 = json

    L2_3 = L2_3.decode

    L3_3 = A0_3

    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)

    L1_3 = L1_3(L2_3, L3_3, L4_3, L5_3)

    L1_2 = L1_3

  end

  L3_2(L4_2, L5_2, L6_2, L7_2)

  while nil == L1_2 do

    L3_2 = Wait

    L4_2 = 0

    L3_2(L4_2)

  end

  return L1_2

end

TakePhoto = L0_1

L0_1 = exports

L1_1 = "TakePhoto"

L2_1 = TakePhoto

L0_1(L1_1, L2_1)

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = true

  L2_2 = FW_TriggerCallback

  L3_2 = "origen_police:SetDimension"

  function L4_2()

    local L0_3, L1_3

    L0_3 = false

    L1_2 = L0_3

  end

  L5_2 = A0_2

  L2_2(L3_2, L4_2, L5_2)

  while L1_2 do

    L2_2 = Citizen

    L2_2 = L2_2.Wait

    L3_2 = 1

    L2_2(L3_2)

  end

end

SetDimension = L0_1

function L0_1()

  local L0_2, L1_2, L2_2

  L0_2 = GetEntityModel

  L1_2 = PlayerPedId

  L1_2, L2_2 = L1_2()

  L0_2 = L0_2(L1_2, L2_2)

  L1_2 = GetHashKey

  L2_2 = "mp_m_freemode_01"

  L1_2 = L1_2(L2_2)

  if L0_2 == L1_2 then

    L0_2 = "Male"

    if L0_2 then

      goto lbl_14

    end

  end

  L0_2 = "Female"

  ::lbl_14::

  return L0_2

end

GetGender = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = {}

  L2_2 = 0

  L3_2 = Config

  L3_2 = L3_2.ExtrasMaxCount

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = DoesExtraExist

    L7_2 = A0_2

    L8_2 = L5_2

    L6_2 = L6_2(L7_2, L8_2)

    if L6_2 then

      L6_2 = IsVehicleExtraTurnedOn

      L7_2 = A0_2

      L8_2 = L5_2

      L6_2 = L6_2(L7_2, L8_2)

      L6_2 = 1 == L6_2

      L1_2[L5_2] = L6_2

    end

  end

  return L1_2

end

GetVehicleExtras = L0_1

