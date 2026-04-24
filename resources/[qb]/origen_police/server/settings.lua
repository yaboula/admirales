local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = Config

L0_1 = L0_1.IgnoreSettings

if L0_1 then

  return

end

function L0_1(A0_2)

  local L1_2

  if not A0_2 then

    L1_2 = {}

    return L1_2

  end

  L1_2 = A0_2.Options

  if L1_2 then

    L1_2 = A0_2.Options

    if L1_2 then

      goto lbl_14

    end

  end

  L1_2 = {}

  ::lbl_14::

  return L1_2

end

GetStationOption = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L1_2 = pairs

  L2_2 = A0_2

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    L7_2 = L6_2[1]

    if L7_2 then

      L7_2 = L6_2[1]

      L7_2 = L7_2.coords

      if L7_2 then

        L7_2 = L6_2[1]

        L7_2 = L7_2.coords

        L7_2 = L7_2[1]

        if 0 ~= L7_2 then

          L7_2 = L6_2[1]

          L7_2 = L7_2.coords

          L7_2 = L7_2[2]

          if 0 ~= L7_2 then

            L7_2 = L6_2[1]

            L7_2 = L7_2.coords

            L7_2 = L7_2[3]

            if 0 ~= L7_2 then

              L7_2 = {}

              L8_2 = L6_2[1]

              L8_2 = L8_2.coords

              L8_2 = L8_2[1]

              L9_2 = L6_2[1]

              L9_2 = L9_2.coords

              L9_2 = L9_2[2]

              L10_2 = L6_2[1]

              L10_2 = L10_2.coords

              L10_2 = L10_2[3]

              L7_2[1] = L8_2

              L7_2[2] = L9_2

              L7_2[3] = L10_2

              return L7_2

            end

          end

        end

      end

    end

  end

  L1_2 = {}

  L2_2 = 0

  L3_2 = 0

  L4_2 = 0

  L1_2[1] = L2_2

  L1_2[2] = L3_2

  L1_2[3] = L4_2

  return L1_2

end

GetStationCoords = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = {}

  L2_2 = pairs

  L3_2 = A0_2

  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)

  for L6_2, L7_2 in L2_2, L3_2, L4_2, L5_2 do

    if "Options" ~= L6_2 then

      L1_2[L6_2] = L7_2

    end

  end

  return L1_2

end

GetMarkers = L0_1

L0_1 = {}

function L1_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L0_2 = exports

  L0_2 = L0_2.origen_police

  L1_2 = L0_2

  L0_2 = L0_2.GetFileList

  L2_2 = "/config/police-stations"

  L0_2 = L0_2(L1_2, L2_2)

  L1_2 = 1

  L2_2 = #L0_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = L0_2[L4_2]

    L6_2 = L5_2

    L5_2 = L5_2.find

    L7_2 = ".json"

    L5_2 = L5_2(L6_2, L7_2)

    if not L5_2 then

    else

      L5_2 = json

      L5_2 = L5_2.decode

      L6_2 = exports

      L6_2 = L6_2.origen_police

      L7_2 = L6_2

      L6_2 = L6_2.ReadFile

      L8_2 = "/config/police-stations/"

      L9_2 = L0_2[L4_2]

      L8_2 = L8_2 .. L9_2

      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2, L8_2)

      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)

      L6_2 = GetStationOption

      L7_2 = L5_2

      L6_2 = L6_2(L7_2)

      L7_2 = L6_2.inUse

      if L7_2 then

        L7_2 = L0_1

        L7_2 = #L7_2

        L8_2 = L7_2 + 1

        L7_2 = L0_1

        L9_2 = L0_2[L4_2]

        L10_2 = L9_2

        L9_2 = L9_2.gsub

        L11_2 = ".json"

        L12_2 = ""

        L9_2 = L9_2(L10_2, L11_2, L12_2)

        L7_2[L8_2] = L9_2

      end

    end

  end

end

InitMaps = L1_1

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:GetStationsList"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L2_2 = exports

  L2_2 = L2_2.origen_police

  L3_2 = L2_2

  L2_2 = L2_2.GetFileList

  L4_2 = "/config/police-stations"

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = {}

  L4_2 = 1

  L5_2 = #L2_2

  L6_2 = 1

  for L7_2 = L4_2, L5_2, L6_2 do

    L8_2 = L2_2[L7_2]

    L9_2 = L8_2

    L8_2 = L8_2.find

    L10_2 = ".json"

    L8_2 = L8_2(L9_2, L10_2)

    if not L8_2 then

    else

      L8_2 = json

      L8_2 = L8_2.decode

      L9_2 = exports

      L9_2 = L9_2.origen_police

      L10_2 = L9_2

      L9_2 = L9_2.ReadFile

      L11_2 = "/config/police-stations/"

      L12_2 = L2_2[L7_2]

      L11_2 = L11_2 .. L12_2

      L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2, L11_2)

      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)

      L9_2 = GetStationOption

      L10_2 = L8_2

      L9_2 = L9_2(L10_2)

      L10_2 = {}

      L11_2 = L2_2[L7_2]

      L12_2 = L11_2

      L11_2 = L11_2.gsub

      L13_2 = ".json"

      L14_2 = ""

      L11_2 = L11_2(L12_2, L13_2, L14_2)

      L10_2.name = L11_2

      L11_2 = L9_2.label

      if not L11_2 then

        L11_2 = L2_2[L7_2]

        L12_2 = L11_2

        L11_2 = L11_2.gsub

        L13_2 = ".json"

        L14_2 = ""

        L11_2 = L11_2(L12_2, L13_2, L14_2)

      end

      L10_2.label = L11_2

      L11_2 = L9_2.LastUserModified

      if not L11_2 then

        L11_2 = "NONE"

      end

      L10_2.author = L11_2

      L11_2 = L9_2.LastDateModified

      if not L11_2 then

        L11_2 = os

        L11_2 = L11_2.date

        L12_2 = "%d/%m/%Y - %H:%M"

        L11_2 = L11_2(L12_2)

      end

      L10_2.modified = L11_2

      L11_2 = GetStationCoords

      L12_2 = L8_2

      L11_2 = L11_2(L12_2)

      L10_2.coords = L11_2

      L11_2 = L9_2.inUse

      if not L11_2 then

        L11_2 = false

      end

      L10_2.active = L11_2

      L3_2[L7_2] = L10_2

    end

  end

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L4_1 = AdminMDW

L1_1(L2_1, L3_1, L4_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:GetStation"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2

  L3_2 = json

  L3_2 = L3_2.decode

  L4_2 = exports

  L4_2 = L4_2.origen_police

  L5_2 = L4_2

  L4_2 = L4_2.ReadFile

  L6_2 = "/config/police-stations/"

  L7_2 = A2_2.station

  L8_2 = ".json"

  L6_2 = L6_2 .. L7_2 .. L8_2

  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L4_2(L5_2, L6_2)

  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2)

  L4_2 = GetStationOption

  L5_2 = L3_2

  L4_2 = L4_2(L5_2)

  L5_2 = L4_2.AllowedJobCat

  if not L5_2 then

    L5_2 = {}

  end

  L6_2 = {}

  L7_2 = pairs

  L8_2 = L5_2

  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

  for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

    L13_2 = pairs

    L14_2 = Config

    L14_2 = L14_2.JobCategory

    L14_2 = L14_2[L12_2]

    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)

    for L17_2, L18_2 in L13_2, L14_2, L15_2, L16_2 do

      L19_2 = L6_2[L12_2]

      if not L19_2 then

        L19_2 = {}

      end

      L6_2[L12_2] = L19_2

      L19_2 = L6_2[L12_2]

      L20_2 = L6_2[L12_2]

      L20_2 = #L20_2

      L20_2 = L20_2 + 1

      L21_2 = L18_2.name

      L19_2[L20_2] = L21_2

    end

  end

  L7_2 = A1_2

  L8_2 = {}

  L9_2 = A2_2.station

  L8_2.name = L9_2

  L9_2 = L4_2.label

  if not L9_2 then

    L9_2 = A2_2.station

  end

  L8_2.label = L9_2

  L9_2 = L4_2.LastUserModified

  if not L9_2 then

    L9_2 = "NONE"

  end

  L8_2.author = L9_2

  L9_2 = L4_2.LastDateModified

  if not L9_2 then

    L9_2 = os

    L9_2 = L9_2.date

    L10_2 = "%d/%m/%Y - %H:%M"

    L9_2 = L9_2(L10_2)

  end

  L8_2.modified = L9_2

  L9_2 = L4_2.inUse

  if not L9_2 then

    L9_2 = false

  end

  L8_2.active = L9_2

  L9_2 = GetMarkers

  L10_2 = L3_2

  L9_2 = L9_2(L10_2)

  L8_2.markers = L9_2

  L8_2.jobs = L6_2

  L7_2(L8_2)

end

L1_1(L2_1, L3_1)

function L1_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2

  L1_2 = "/config/police-stations/"

  L2_2 = A0_2

  L3_2 = ".json"

  L1_2 = L1_2 .. L2_2 .. L3_2

  L2_2 = exports

  L2_2 = L2_2.origen_police

  L3_2 = L2_2

  L2_2 = L2_2.ReadFile

  L4_2 = L1_2

  L2_2 = L2_2(L3_2, L4_2)

  L3_2 = json

  L3_2 = L3_2.decode

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    L3_2 = {}

  end

  L4_2 = L3_2.Options

  if not L4_2 then

    L4_2 = {}

  end

  L3_2.Options = L4_2

  L4_2 = L3_2

  L5_2 = L1_2

  return L4_2, L5_2

end

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = A1_2.Options

  L4_2 = GetPlayerName

  L5_2 = A2_2

  L4_2 = L4_2(L5_2)

  L3_2.LastUserModified = L4_2

  L3_2 = A1_2.Options

  L4_2 = os

  L4_2 = L4_2.date

  L5_2 = "%d/%m/%Y - %H:%M"

  L4_2 = L4_2(L5_2)

  L3_2.LastDateModified = L4_2

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.WriteFile

  L5_2 = A0_2

  L6_2 = json

  L6_2 = L6_2.encode

  L7_2 = A1_2

  L8_2 = {}

  L8_2.indent = true

  L6_2, L7_2, L8_2 = L6_2(L7_2, L8_2)

  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)

end

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:AddJobCatStation"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = L3_2.Options

  L6_2 = L3_2.Options

  L6_2 = L6_2.AllowedJobCat

  if not L6_2 then

    L6_2 = {}

  end

  L5_2.AllowedJobCat = L6_2

  L5_2 = table

  L5_2 = L5_2.insert

  L6_2 = L3_2.Options

  L6_2 = L6_2.AllowedJobCat

  L7_2 = A2_2.cat

  L5_2(L6_2, L7_2)

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:RemoveJobCatStation"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = L3_2.Options

  L6_2 = L3_2.Options

  L6_2 = L6_2.AllowedJobCat

  if not L6_2 then

    L6_2 = {}

  end

  L5_2.AllowedJobCat = L6_2

  L5_2 = ipairs

  L6_2 = L3_2.Options

  L6_2 = L6_2.AllowedJobCat

  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

    L11_2 = A2_2.cat

    if L10_2 == L11_2 then

      L11_2 = table

      L11_2 = L11_2.remove

      L12_2 = L3_2.Options

      L12_2 = L12_2.AllowedJobCat

      L13_2 = L9_2

      L11_2(L12_2, L13_2)

      break

    end

  end

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:SetActiveStation"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = L3_2.Options

  L6_2 = A2_2.active

  L5_2.inUse = L6_2

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = TriggerClientEvent

  L6_2 = "origen_police:client:ActiveStation"

  L7_2 = -1

  L8_2 = {}

  L9_2 = A2_2.station

  L8_2.station = L9_2

  L9_2 = A2_2.active

  L8_2.active = L9_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:UpdateMarkerPos"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = tonumber

  L6_2 = A2_2.markerIndex

  L5_2 = L5_2(L6_2)

  A2_2.markerIndex = L5_2

  L5_2 = A2_2.markerName

  L5_2 = L3_2[L5_2]

  L6_2 = A2_2.markerIndex

  L5_2 = L5_2[L6_2]

  L6_2 = A2_2.isMultiple

  if L6_2 then

    L6_2 = "spawn"

    if L6_2 then

      goto lbl_19

    end

  end

  L6_2 = "coords"

  ::lbl_19::

  L7_2 = {}

  L8_2 = A2_2.x

  L9_2 = A2_2.y

  L10_2 = A2_2.z

  L11_2 = A2_2.w

  L7_2[1] = L8_2

  L7_2[2] = L9_2

  L7_2[3] = L10_2

  L7_2[4] = L11_2

  L5_2[L6_2] = L7_2

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = TriggerClientEvent

  L6_2 = "origen_police:client:UpdateMarkerPos"

  L7_2 = -1

  L8_2 = A2_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:RemoveMarker"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = tonumber

  L6_2 = A2_2.markerIndex

  L5_2 = L5_2(L6_2)

  A2_2.markerIndex = L5_2

  L5_2 = A2_2.markerName

  L5_2 = L3_2[L5_2]

  L6_2 = A2_2.markerIndex

  L5_2 = L5_2[L6_2]

  L5_2 = L5_2.coords

  A2_2.coords = L5_2

  L5_2 = table

  L5_2 = L5_2.remove

  L6_2 = A2_2.markerName

  L6_2 = L3_2[L6_2]

  L7_2 = A2_2.markerIndex

  L5_2(L6_2, L7_2)

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = TriggerClientEvent

  L6_2 = "origen_police:client:RemoveMarker"

  L7_2 = -1

  L8_2 = A2_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:CreateMarker"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = L1_1

  L4_2 = A2_2.station

  L3_2, L4_2 = L3_2(L4_2)

  L5_2 = tonumber

  L6_2 = A2_2.markerIndex

  L5_2 = L5_2(L6_2)

  A2_2.markerIndex = L5_2

  L5_2 = A2_2.markerName

  L6_2 = A2_2.markerName

  L6_2 = L3_2[L6_2]

  if not L6_2 then

    L6_2 = {}

  end

  L3_2[L5_2] = L6_2

  L5_2 = A2_2.markerName

  L5_2 = L3_2[L5_2]

  L6_2 = A2_2.markerName

  L6_2 = L3_2[L6_2]

  L6_2 = #L6_2

  L6_2 = L6_2 + 1

  L7_2 = A2_2.creatingData

  L5_2[L6_2] = L7_2

  L5_2 = L2_1

  L6_2 = L4_2

  L7_2 = L3_2

  L8_2 = A0_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = TriggerClientEvent

  L6_2 = "origen_police:client:CreateMarker"

  L7_2 = -1

  L8_2 = A2_2

  L5_2(L6_2, L7_2, L8_2)

  L5_2 = A1_2

  L6_2 = true

  L5_2(L6_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:DeleteStation"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.DeleteFile

  L5_2 = "/config/police-stations/"

  L6_2 = A2_2.station

  L7_2 = ".json"

  L5_2 = L5_2 .. L6_2 .. L7_2

  L3_2(L4_2, L5_2)

  L3_2 = A1_2

  L4_2 = true

  L3_2(L4_2)

end

L6_1 = AdminMDW

L3_1(L4_1, L5_1, L6_1)

L3_1 = InitMaps

L3_1()

L3_1 = FW_CreateCallback

L4_1 = "origen_police:callback:GetActiveMaps"

function L5_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2

  L3_2 = A1_2

  L4_2 = L0_1

  L3_2(L4_2)

end

L3_1(L4_1, L5_1)

