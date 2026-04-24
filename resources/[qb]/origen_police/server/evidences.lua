local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

L0_1 = false

L1_1 = {}

L2_1 = {}

L3_1 = {}

L4_1 = RegisterServerEvent

L5_1 = "origen_police:server:AddNewEvidence"

function L6_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = FW_GetPlayer

  L2_2 = source

  L1_2 = L1_2(L2_2)

  if L1_2 then

    L2_2 = #A0_2

    if 0 == L2_2 then

      L2_2 = AddNewEvidence

      L3_2 = A0_2

      L4_2 = L1_2

      L2_2(L3_2, L4_2)

    else

      L2_2 = 1

      L3_2 = #A0_2

      L4_2 = 1

      for L5_2 = L2_2, L3_2, L4_2 do

        L6_2 = AddNewEvidence

        L7_2 = A0_2[L5_2]

        L8_2 = L1_2

        L6_2(L7_2, L8_2)

      end

    end

  end

end

L4_1(L5_1, L6_1)

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  if A1_2 then

    L2_2 = A1_2.PlayerData

    if L2_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L2_2 = os

  L2_2 = L2_2.time

  L2_2 = L2_2()

  A0_2.time = L2_2

  L2_2 = A0_2.adn

  if L2_2 then

    L2_2 = A0_2.adn

    if true == L2_2 then

      L2_2 = A1_2.PlayerData

      L2_2 = L2_2.charinfo

      L2_2 = L2_2.firstname

      L3_2 = " "

      L4_2 = A1_2.PlayerData

      L4_2 = L4_2.charinfo

      L4_2 = L4_2.lastname

      L2_2 = L2_2 .. L3_2 .. L4_2

      A0_2.adn = L2_2

    else

      L2_2 = A0_2.adn

      if "Generate" == L2_2 then

        L2_2 = GetRandomName

        L3_2 = math

        L3_2 = L3_2.random

        L4_2 = 1

        L5_2 = 2

        L3_2 = L3_2(L4_2, L5_2)

        if 1 == L3_2 then

          L3_2 = "male"

          if L3_2 then

            goto lbl_42

          end

        end

        L3_2 = "female"

        ::lbl_42::

        L2_2 = L2_2(L3_2)

        A0_2.adn = L2_2

      end

    end

  end

  L2_2 = A0_2.wp

  if L2_2 then

    L2_2 = GetItemFromSlot

    L3_2 = A1_2.PlayerData

    L4_2 = A0_2.wp

    L2_2 = L2_2(L3_2, L4_2)

    L3_2 = GetItemMetadata

    L4_2 = L2_2

    L3_2 = L3_2(L4_2)

    L3_2 = L3_2.serie

    if not L3_2 then

      L3_2 = GetItemMetadata

      L4_2 = L2_2

      L3_2 = L3_2(L4_2)

      L3_2 = L3_2.serial

      if not L3_2 then

        L3_2 = "UNKNOW"

      end

    end

    L4_2 = A0_2.type

    if "Shoot" == L4_2 then

      L4_2 = L2_1

      L5_2 = {}

      L6_2 = A1_2.PlayerData

      L6_2 = L6_2.charinfo

      L6_2 = L6_2.firstname

      L7_2 = " "

      L8_2 = A1_2.PlayerData

      L8_2 = L8_2.charinfo

      L8_2 = L8_2.lastname

      L6_2 = L6_2 .. L7_2 .. L8_2

      L5_2.adn = L6_2

      L6_2 = os

      L6_2 = L6_2.time

      L6_2 = L6_2()

      L5_2.time = L6_2

      L4_2[L3_2] = L5_2

    end

    L4_2 = Config

    L4_2 = L4_2.AmmoTypes

    L5_2 = L2_2.name

    L6_2 = L5_2

    L5_2 = L5_2.lower

    L5_2 = L5_2(L6_2)

    L4_2 = L4_2[L5_2]

    if L4_2 then

      L4_2 = Config

      L4_2 = L4_2.Ammos

      L5_2 = Config

      L5_2 = L5_2.AmmoTypes

      L6_2 = L2_2.name

      L7_2 = L6_2

      L6_2 = L6_2.lower

      L6_2 = L6_2(L7_2)

      L5_2 = L5_2[L6_2]

      L4_2 = L4_2[L5_2]

      if L4_2 then

        goto lbl_104

      end

    end

    L4_2 = "Sin Clasificar"

    ::lbl_104::

    A0_2.ammo = L4_2

    if nil ~= L2_2 then

      L4_2 = GetItemMetadata

      L5_2 = L2_2

      L4_2 = L4_2(L5_2)

      if nil ~= L4_2 then

        A0_2.fkserie = L3_2

      end

    end

    A0_2.wp = nil

  end

  L2_2 = A0_2.type

  if "FinguerPrint" == L2_2 then

    L3_2 = A0_2.fkserie

    L2_2 = L1_1

    L4_2 = {}

    L5_2 = A1_2.PlayerData

    L5_2 = L5_2.charinfo

    L5_2 = L5_2.firstname

    L6_2 = " "

    L7_2 = A1_2.PlayerData

    L7_2 = L7_2.charinfo

    L7_2 = L7_2.lastname

    L5_2 = L5_2 .. L6_2 .. L7_2

    L4_2.adn = L5_2

    L5_2 = os

    L5_2 = L5_2.time

    L5_2 = L5_2()

    L4_2.time = L5_2

    L5_2 = A0_2.fkserie

    L4_2.fkserie = L5_2

    L5_2 = A0_2.model

    L4_2.model = L5_2

    L4_2.type = "FinguerPrint"

    L2_2[L3_2] = L4_2

  else

    L2_2 = table

    L2_2 = L2_2.insert

    L3_2 = L3_1

    L4_2 = A0_2

    L2_2(L3_2, L4_2)

    L2_2 = true

    L0_1 = L2_2

  end

end

AddNewEvidence = L4_1

L4_1 = RegisterServerEvent

L5_1 = "origen_police:server:RemoveEvidence"

function L6_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2

  L1_2 = L3_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = TriggerClientEvent

    L2_2 = "origen_police:client:rmevidence"

    L3_2 = -1

    L4_2 = A0_2

    L1_2(L2_2, L3_2, L4_2)

    L1_2 = L3_1

    L1_2[A0_2] = nil

  end

end

L4_1(L5_1, L6_1)

L4_1 = {}

L5_1 = vector3

L6_1 = 0

L7_1 = 0

L8_1 = 0

L5_1 = L5_1(L6_1, L7_1, L8_1)

L6_1 = FW_CreateCallback

L7_1 = "origen_police:callback:GetEvidences"

function L8_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L3_2 = L5_1

  L3_2 = L3_2 - A2_2

  L3_2 = #L3_2

  if L3_2 < 50 then

    L3_2 = L0_1

    if not L3_2 then

      L3_2 = A1_2

      L4_2 = L4_1

      L3_2(L4_2)

  end

  else

    L3_2 = {}

    L4_2 = 1

    L5_2 = L3_1

    L5_2 = #L5_2

    L6_2 = 1

    for L7_2 = L4_2, L5_2, L6_2 do

      L8_2 = L3_1

      L8_2 = L8_2[L7_2]

      if L8_2 then

        L8_2 = L3_1

        L8_2 = L8_2[L7_2]

        L8_2 = L8_2.coords

        L8_2 = L8_2 - A2_2

        L8_2 = #L8_2

        L9_2 = 300

        if L8_2 < L9_2 then

          L8_2 = table

          L8_2 = L8_2.insert

          L9_2 = L3_2

          L10_2 = L3_1

          L10_2 = L10_2[L7_2]

          L8_2(L9_2, L10_2)

        end

      end

    end

    L4_1 = L3_2

    L5_1 = A2_2

    L4_2 = false

    L0_1 = L4_2

    L4_2 = A1_2

    L5_2 = L3_2

    L4_2(L5_2)

  end

end

L6_1(L7_1, L8_1)

L6_1 = FW_CreateUseableItem

L7_1 = "instant_camera"

function L8_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L1_2 = FW_GetPlayer

  L2_2 = A0_2

  L1_2 = L1_2(L2_2)

  if L1_2 then

    L2_2 = L1_2.PlayerData

    if L2_2 then

      L2_2 = L1_2.PlayerData

      L2_2 = L2_2.job

      if L2_2 then

        goto lbl_14

      end

    end

  end

  do return end

  ::lbl_14::

  L2_2 = Config

  L2_2 = L2_2.Framework

  if "esx" == L2_2 then

    L2_2 = L1_2.PlayerData

    L2_2 = L2_2.job

    L3_2 = IsPlayerOnDuty

    L4_2 = A0_2

    L3_2 = L3_2(L4_2)

    L2_2.onduty = L3_2

  end

  L2_2 = GetEntityCoords

  L3_2 = GetPlayerPed

  L4_2 = A0_2

  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2(L4_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

  L3_2 = ServerConfig

  L3_2 = L3_2.Logs

  L3_2 = L3_2.Camera

  L4_2 = isValidURL

  L5_2 = L3_2

  L4_2 = L4_2(L5_2)

  if not L4_2 then

    L4_2 = TriggerClientEvent

    L5_2 = "origen_police:ShowNotification"

    L6_2 = A0_2

    L7_2 = "The camera logs are not configured correctly"

    L4_2(L5_2, L6_2, L7_2)

    L4_2 = Debuger

    L5_2 = "^2PLEASE READ!!^1You need to set your discord webhook in config/logs/logs.lua^0We don't give support for this error, just set the webhook and the error will be fixed^0"

    return L4_2(L5_2)

  end

  L4_2 = os

  L4_2 = L4_2.date

  L5_2 = "%H:%M - %d/%m/%Y"

  L4_2 = L4_2(L5_2)

  L5_2 = CanOpenTablet

  L6_2 = L1_2.PlayerData

  L6_2 = L6_2.job

  L6_2 = L6_2.name

  L5_2 = L5_2(L6_2)

  L5_2 = L5_2[1]

  if L5_2 then

    L5_2 = L1_2.PlayerData

    L5_2 = L5_2.job

    L5_2 = L5_2.onduty

    if L5_2 then

      L5_2 = L5_1

      L5_2 = L5_2 - L2_2

      L5_2 = #L5_2

      if L5_2 < 50 then

        L5_2 = L0_1

        if not L5_2 then

          L5_2 = TriggerClientEvent

          L6_2 = "origen_police:client:usecamera"

          L7_2 = A0_2

          L8_2 = L4_1

          L9_2 = L4_2

          L10_2 = L3_2

          L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

      end

      else

        L5_2 = {}

        L6_2 = 1

        L7_2 = L3_1

        L7_2 = #L7_2

        L8_2 = 1

        for L9_2 = L6_2, L7_2, L8_2 do

          L10_2 = L3_1

          L10_2 = L10_2[L9_2]

          if L10_2 then

            L10_2 = L3_1

            L10_2 = L10_2[L9_2]

            L10_2 = L10_2.coords

            if L10_2 then

              L10_2 = L3_1

              L10_2 = L10_2[L9_2]

              L10_2 = L10_2.coords

              L10_2 = L10_2 - L2_2

              L10_2 = #L10_2

              L11_2 = 300

              if L10_2 < L11_2 then

                L10_2 = table

                L10_2 = L10_2.insert

                L11_2 = L5_2

                L12_2 = L3_1

                L12_2 = L12_2[L9_2]

                L10_2(L11_2, L12_2)

              end

            end

          end

        end

        L4_1 = L5_2

        L5_1 = L2_2

        L6_2 = false

        L0_1 = L6_2

        L6_2 = TriggerClientEvent

        L7_2 = "origen_police:client:usecamera"

        L8_2 = A0_2

        L9_2 = L5_2

        L10_2 = L4_2

        L11_2 = L3_2

        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)

      end

  end

  else

    L5_2 = GetResourceState

    L6_2 = "origen_ilegal"

    L5_2 = L5_2(L6_2)

    if "started" == L5_2 then

      L5_2 = exports

      L5_2 = L5_2.origen_ilegal

      L6_2 = L5_2

      L5_2 = L5_2.OpenCamera

      L7_2 = A0_2

      return L5_2(L6_2, L7_2)

    end

    L5_2 = TriggerClientEvent

    L6_2 = "origen_police:client:usecamera"

    L7_2 = A0_2

    L8_2 = false

    L9_2 = false

    L10_2 = L3_2

    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)

  end

end

L6_1(L7_1, L8_1)

L6_1 = FW_CreateUseableItem

L7_1 = "photo"

function L8_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = Debuger

  L4_2 = "Photo item data: "

  L5_2 = json

  L5_2 = L5_2.encode

  L6_2 = A1_2

  L5_2 = L5_2(L6_2)

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = A2_2

  L6_2, L7_2 = L6_2(L7_2)

  L3_2(L4_2, L5_2, L6_2, L7_2)

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:showphoto"

  L5_2 = A0_2

  L6_2 = GetItemMetadata

  L7_2 = A2_2 or L7_2

  if not A2_2 then

    L7_2 = A1_2

  end

  L6_2 = L6_2(L7_2)

  L6_2 = L6_2.url

  L3_2(L4_2, L5_2, L6_2)

end

L6_1(L7_1, L8_1)

L6_1 = FW_CreateUseableItem

L7_1 = "report_evidence"

function L8_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = Debuger

  L4_2 = "Report item data: "

  L5_2 = json

  L5_2 = L5_2.encode

  L6_2 = A1_2

  L5_2 = L5_2(L6_2)

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = A2_2

  L6_2, L7_2 = L6_2(L7_2)

  L3_2(L4_2, L5_2, L6_2, L7_2)

  L3_2 = TriggerClientEvent

  L4_2 = "origen_police:client:showphoto"

  L5_2 = A0_2

  L6_2 = GetItemMetadata

  L7_2 = A2_2 or L7_2

  if not A2_2 then

    L7_2 = A1_2

  end

  L6_2 = L6_2(L7_2)

  L6_2 = L6_2.url

  L3_2(L4_2, L5_2, L6_2)

end

L6_1(L7_1, L8_1)

L6_1 = RegisterServerEvent

L7_1 = "origen_police:server:savephoto"

function L8_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L1_2 = source

  L2_2 = FW_GetPlayer

  L3_2 = L1_2

  L2_2 = L2_2(L3_2)

  if not L2_2 then

    return

  end

  L3_2 = L2_2.Functions

  L3_2 = L3_2.AddItem

  L4_2 = "photo"

  L5_2 = 1

  L6_2 = false

  L7_2 = {}

  L7_2.url = A0_2

  L8_2 = L2_2.PlayerData

  L8_2 = L8_2.citizenid

  L9_2 = os

  L9_2 = L9_2.time

  L9_2 = L9_2()

  L8_2 = L8_2 .. L9_2

  L7_2.serie = L8_2

  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)

  if not L3_2 then

    L3_2 = TriggerClientEvent

    L4_2 = "origen_police:ShowNotification"

    L5_2 = L1_2

    L6_2 = Config

    L6_2 = L6_2.Translations

    L6_2 = L6_2.NoPhotoSpace

    L3_2(L4_2, L5_2, L6_2)

  else

    L3_2 = CreateLog

    L4_2 = {}

    L4_2.type = "Camera"

    L5_2 = {}

    L6_2 = Config

    L6_2 = L6_2.LogsTranslations

    L6_2 = L6_2.NewPhoto

    L6_2 = L6_2.title

    L5_2.title = L6_2

    L6_2 = Config

    L6_2 = L6_2.LogsTranslations

    L6_2 = L6_2.NewPhoto

    L6_2 = L6_2.message

    L5_2.description = L6_2

    L5_2.color = 1791423

    L6_2 = {}

    L6_2.url = A0_2

    L5_2.image = L6_2

    L4_2.embed = L5_2

    L4_2.source = L1_2

    L3_2(L4_2)

  end

end

L6_1(L7_1, L8_1)

L6_1 = RegisterServerEvent

L7_1 = "origen_police:server:savereportevidence"

function L8_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = FW_GetPlayer

  L2_2 = source

  L1_2 = L1_2(L2_2)

  if not L1_2 then

    return

  end

  L2_2 = L1_2.Functions

  L2_2 = L2_2.AddItem

  L3_2 = "report_evidence"

  L4_2 = 1

  L5_2 = false

  L6_2 = {}

  L6_2.url = A0_2

  L7_2 = L1_2.PlayerData

  L7_2 = L7_2.citizenid

  L8_2 = os

  L8_2 = L8_2.time

  L8_2 = L8_2()

  L7_2 = L7_2 .. L8_2

  L6_2.serie = L7_2

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

  if not L2_2 then

    L2_2 = TriggerClientEvent

    L3_2 = "origen_police:ShowNotification"

    L4_2 = source

    L5_2 = Config

    L5_2 = L5_2.Translations

    L5_2 = L5_2.NoSpaceInInv

    L2_2(L3_2, L4_2, L5_2)

  end

end

L6_1(L7_1, L8_1)

L6_1 = RegisterServerEvent

L7_1 = "origen_police:server:GetEvidence"

function L8_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L2_2 = source

  L3_2 = FW_GetPlayer

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  A1_2.coords = nil

  L4_2 = Config

  L4_2 = L4_2.Evidences

  L5_2 = A1_2.type

  L4_2 = L4_2[L5_2]

  if L4_2 then

    L4_2 = L3_2.Functions

    L4_2 = L4_2.AddItem

    L5_2 = Config

    L5_2 = L5_2.Evidences

    L6_2 = A1_2.type

    L5_2 = L5_2[L6_2]

    L5_2 = L5_2.item

    L6_2 = 1

    L7_2 = false

    L8_2 = A1_2

    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

    if L4_2 then

      L4_2 = TriggerClientEvent

      L5_2 = "origen_police:client:rmevidence"

      L6_2 = -1

      L7_2 = A0_2

      L4_2(L5_2, L6_2, L7_2)

      L4_2 = L3_1

      L4_2 = L4_2[A0_2]

      if L4_2 then

        L4_2 = L3_1

        L4_2[A0_2] = nil

      end

    else

      L4_2 = TriggerClientEvent

      L5_2 = "origen_police:ShowNotification"

      L6_2 = L2_2

      L7_2 = Config

      L7_2 = L7_2.Translations

      L7_2 = L7_2.NoSpaceInInv

      L4_2(L5_2, L6_2, L7_2)

    end

  else

    L4_2 = A1_2.type

    if "FinguerPrint" == L4_2 then

      L5_2 = A1_2.fkserie

      L4_2 = L1_1

      L4_2 = L4_2[L5_2]

      if L4_2 then

        L4_2 = L3_2.Functions

        L4_2 = L4_2.AddItem

        L5_2 = "evidence_ne"

        L6_2 = 1

        L7_2 = false

        L9_2 = A1_2.fkserie

        L8_2 = L1_1

        L8_2 = L8_2[L9_2]

        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)

        if L4_2 then

          L4_2 = TriggerClientEvent

          L5_2 = "origen_police:ShowNotification"

          L6_2 = L2_2

          L7_2 = Config

          L7_2 = L7_2.Translations

          L7_2 = L7_2.ObtainedFingerpritns

          L4_2(L5_2, L6_2, L7_2)

        else

          L4_2 = TriggerClientEvent

          L5_2 = "origen_police:ShowNotification"

          L6_2 = L2_2

          L7_2 = Config

          L7_2 = L7_2.Translations

          L7_2 = L7_2.NoSpaceInInv

          L4_2(L5_2, L6_2, L7_2)

        end

      else

        L4_2 = TriggerClientEvent

        L5_2 = "origen_police:ShowNotification"

        L6_2 = L2_2

        L7_2 = Config

        L7_2 = L7_2.Translations

        L7_2 = L7_2.NoFingerFound

        L4_2(L5_2, L6_2, L7_2)

      end

    else

      L4_2 = TriggerClientEvent

      L5_2 = "origen_police:ShowNotification"

      L6_2 = L2_2

      L7_2 = Config

      L7_2 = L7_2.Translations

      L7_2 = L7_2.EvidenceNotCategorized

      L4_2(L5_2, L6_2, L7_2)

    end

  end

end

L6_1(L7_1, L8_1)

L6_1 = RegisterServerEvent

L7_1 = "origen_police:client:removeevidences"

function L8_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L0_2 = Config

  L0_2 = L0_2.Debug

  if L0_2 then

    L0_2 = Debuger

    L1_2 = "Ignoring evidence removal due to debug mode"

    return L0_2(L1_2)

  end

  L0_2 = FW_GetPlayer

  L1_2 = source

  L0_2 = L0_2(L1_2)

  if not L0_2 then

    return

  end

  L1_2 = 0

  L2_2 = pairs

  L3_2 = L0_2.PlayerData

  L3_2 = L3_2.items

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    L8_2 = string

    L8_2 = L8_2.find

    L9_2 = L7_2.name

    L10_2 = "^evidence_"

    L8_2 = L8_2(L9_2, L10_2)

    if L8_2 then

      L8_2 = L0_2.Functions

      L8_2 = L8_2.RemoveItem

      L9_2 = L7_2.name

      L10_2 = Config

      L10_2 = L10_2.Inventory

      if "ox_inventory" == L10_2 then

        L10_2 = L7_2.count

        if L10_2 then

          goto lbl_39

        end

      end

      L10_2 = L7_2.amount

      ::lbl_39::

      L11_2 = L7_2.slot

      L8_2(L9_2, L10_2, L11_2)

      L1_2 = L1_2 + 1

      if 4 == L1_2 then

        break

      end

    end

  end

end

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "GetFingerPrint"

function L8_1(A0_2)

  local L1_2

  L1_2 = L1_1

  L1_2 = L1_2[A0_2]

  return L1_2

end

L6_1(L7_1, L8_1)

L6_1 = exports

L7_1 = "GetShootedWp"

function L8_1(A0_2)

  local L1_2, L2_2

  L1_2 = L2_1

  L1_2 = L1_2[A0_2]

  if L1_2 then

    L1_2 = os

    L1_2 = L1_2.time

    L1_2 = L1_2()

    L2_2 = L2_1

    L2_2 = L2_2[A0_2]

    L2_2 = L2_2.time

    L1_2 = L1_2 - L2_2

    L2_2 = Config

    L2_2 = L2_2.SecondsToCool

    if L1_2 < L2_2 then

      return L1_2

    else

      L2_2 = L2_1

      L2_2[A0_2] = false

      L2_2 = false

      return L2_2

    end

  end

  L1_2 = false

  return L1_2

end

L6_1(L7_1, L8_1)

