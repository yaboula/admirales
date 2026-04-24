local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:GetBodyCams"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2

  L2_2 = CanOpenTablet

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = {}

  L4_2 = {}

  L5_2 = Config

  L5_2 = L5_2.Framework

  if "qbcore" == L5_2 then

    L5_2 = Config

    L5_2 = L5_2.JobCategory

    L5_2 = L5_2[L2_2]

    if nil == L5_2 then

      L5_2 = print

      L6_2 = "origen_police: ERROR: You are trying to send an alert with a job category that doesn't exist in the Config.JobCategory table in config/permissions.lua"

      L5_2(L6_2)

      return

    end

    L5_2 = pairs

    L6_2 = Config

    L6_2 = L6_2.JobCategory

    L6_2 = L6_2[L2_2]

    L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

    for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

      L11_2 = Framework

      L11_2 = L11_2.Functions

      L11_2 = L11_2.GetPlayersOnDuty

      L12_2 = L10_2.name

      L11_2, L12_2 = L11_2(L12_2)

      L13_2 = 1

      L14_2 = #L11_2

      L15_2 = 1

      for L16_2 = L13_2, L14_2, L15_2 do

        L17_2 = table

        L17_2 = L17_2.insert

        L18_2 = L3_2

        L19_2 = L11_2[L16_2]

        L17_2(L18_2, L19_2)

      end

    end

  else

    L5_2 = Config

    L5_2 = L5_2.Framework

    if "esx" == L5_2 then

      L5_2 = GetPlayersInDuty

      L6_2 = L2_2

      L5_2 = L5_2(L6_2)

      L3_2 = L5_2

    else

      L5_2 = {}

      L3_2 = L5_2

      L5_2 = print

      L6_2 = "Can't find supported framework: "

      L7_2 = Config

      L7_2 = L7_2.Framework

      L5_2(L6_2, L7_2)

    end

  end

  L5_2 = 1

  L6_2 = #L3_2

  L7_2 = 1

  for L8_2 = L5_2, L6_2, L7_2 do

    L9_2 = FW_GetPlayer

    L10_2 = L3_2[L8_2]

    L9_2 = L9_2(L10_2)

    if L9_2 then

      L10_2 = L9_2.PlayerData

      if L10_2 then

        L11_2 = L3_2[L8_2]

        L10_2 = L0_1

        L10_2 = L10_2[L11_2]

        if not L10_2 then

          L10_2 = MySQL

          L10_2 = L10_2.awaitQuery

          L11_2 = "SELECT image FROM "

          L12_2 = Config

          L12_2 = L12_2.Framework

          if "qbcore" == L12_2 then

            L12_2 = "players"

            if L12_2 then

              goto lbl_92

            end

          end

          L12_2 = "users"

          ::lbl_92::

          L13_2 = " WHERE "

          L14_2 = Config

          L14_2 = L14_2.Framework

          if "qbcore" == L14_2 then

            L14_2 = "citizenid"

            if L14_2 then

              goto lbl_101

            end

          end

          L14_2 = "identifier"

          ::lbl_101::

          L15_2 = " = ?"

          L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2

          L12_2 = {}

          L13_2 = L9_2.PlayerData

          L13_2 = L13_2.citizenid

          L12_2[1] = L13_2

          L10_2 = L10_2(L11_2, L12_2)

          L11_2 = L10_2[1]

          if L11_2 then

            L11_2 = L10_2[1]

            L10_2 = L11_2.image

          else

            L10_2 = nil

          end

          L11_2 = table

          L11_2 = L11_2.insert

          L12_2 = L4_2

          L13_2 = {}

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.charinfo

          L14_2 = L14_2.firstname

          L15_2 = " "

          L16_2 = L9_2.PlayerData

          L16_2 = L16_2.charinfo

          L16_2 = L16_2.lastname

          L14_2 = L14_2 .. L15_2 .. L16_2

          L13_2.name = L14_2

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.metadata

          L14_2 = L14_2.police_badge

          if not L14_2 then

            L14_2 = "0000"

          end

          L13_2.badge = L14_2

          L14_2 = L9_2.PlayerData

          L14_2 = L14_2.job

          L14_2 = L14_2.grade

          L14_2 = L14_2.name

          L13_2.grade = L14_2

          L13_2.image = L10_2

          L14_2 = L3_2[L8_2]

          L13_2.source = L14_2

          L11_2(L12_2, L13_2)

        end

      end

    end

  end

  L5_2 = A1_2

  L6_2 = L4_2

  L5_2(L6_2)

end

L1_1(L2_1, L3_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:ShowBodycam"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L1_2 = source

  L2_2 = L0_1

  L2_2 = L2_2[L1_2]

  if L2_2 then

    return

  end

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if L2_2 then

    L3_2 = TriggerClientEvent

    L4_2 = "origen_police:client:ShowBodycam"

    L5_2 = L1_2

    L6_2 = GetEntityCoords

    L7_2 = GetPlayerPed

    L8_2 = A0_2

    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)

    L7_2 = A0_2

    L3_2(L4_2, L5_2, L6_2, L7_2)

    L3_2 = CreateLog

    L4_2 = {}

    L4_2.type = "Cams"

    L5_2 = {}

    L6_2 = Config

    L6_2 = L6_2.LogsTranslations

    L6_2 = L6_2.UseBodyCam

    L6_2 = L6_2.title

    L5_2.title = L6_2

    L6_2 = Config

    L6_2 = L6_2.LogsTranslations

    L6_2 = L6_2.UseBodyCam

    L6_2 = L6_2.message

    L7_2 = L6_2

    L6_2 = L6_2.format

    L8_2 = L2_2.PlayerData

    L8_2 = L8_2.charinfo

    L8_2 = L8_2.firstname

    L9_2 = " "

    L10_2 = L2_2.PlayerData

    L10_2 = L10_2.charinfo

    L10_2 = L10_2.lastname

    L8_2 = L8_2 .. L9_2 .. L10_2

    L6_2 = L6_2(L7_2, L8_2)

    L5_2.description = L6_2

    L5_2.color = 1791423

    L4_2.embed = L5_2

    L4_2.source = L1_2

    L3_2(L4_2)

  else

    L3_2 = print

    L4_2 = "Cant get target: "

    L5_2 = A0_2

    L4_2 = L4_2 .. L5_2

    L3_2(L4_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:ShowCarcam"

function L3_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L1_2 = source

  L2_2 = CanOpenTablet

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  L2_2 = L2_2[2]

  L3_2 = GetVehiclesTrackeds

  L3_2 = L3_2()

  L3_2 = L3_2[L2_2]

  L3_2 = L3_2[A0_2]

  L4_2 = NetworkGetEntityFromNetworkId

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  if L4_2 then

    L5_2 = DoesEntityExist

    L6_2 = L4_2

    L5_2 = L5_2(L6_2)

    if L5_2 then

      L5_2 = TriggerClientEvent

      L6_2 = "origen_police:client:ShowCarcam"

      L7_2 = L1_2

      L8_2 = GetEntityCoords

      L9_2 = L4_2

      L8_2 = L8_2(L9_2)

      L9_2 = A0_2

      L5_2(L6_2, L7_2, L8_2, L9_2)

      L5_2 = CreateLog

      L6_2 = {}

      L6_2.type = "Cams"

      L7_2 = {}

      L8_2 = Config

      L8_2 = L8_2.LogsTranslations

      L8_2 = L8_2.UseCarCam

      L8_2 = L8_2.title

      L7_2.title = L8_2

      L8_2 = Config

      L8_2 = L8_2.LogsTranslations

      L8_2 = L8_2.UseCarCam

      L8_2 = L8_2.message

      L9_2 = L8_2

      L8_2 = L8_2.format

      if L3_2 then

        L10_2 = L3_2.plate

        if L10_2 then

          goto lbl_50

        end

      end

      L10_2 = "Unknown"

      ::lbl_50::

      L8_2 = L8_2(L9_2, L10_2)

      L7_2.description = L8_2

      L7_2.color = 1791423

      L6_2.embed = L7_2

      L6_2.source = L1_2

      L5_2(L6_2)

    end

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterNetEvent

L2_1 = "origen_police:server:DisableBodyCam"

function L3_1(A0_2)

  local L1_2, L2_2

  L1_2 = source

  if A0_2 then

    L2_2 = L0_1

    L2_2[L1_2] = nil

    return

  end

  L2_2 = L0_1

  L2_2[L1_2] = true

end

L1_1(L2_1, L3_1)

