local L0_1, L1_1, L2_1, L3_1

function L0_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2

  L3_2 = math

  L3_2 = L3_2.abs

  L4_2 = A0_2 - A1_2

  L3_2 = L3_2(L4_2)

  L4_2 = A2_2 or L4_2

  if not A2_2 then

    L4_2 = 0.5

  end

  L3_2 = L3_2 < L4_2

  return L3_2

end

NumberEquals = L0_1

L0_1 = RegisterNUICallback

L1_1 = "GotoMarker"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = vector3

  L3_2 = tonumber

  L4_2 = A0_2.x

  L3_2 = L3_2(L4_2)

  L4_2 = tonumber

  L5_2 = A0_2.y

  L4_2 = L4_2(L5_2)

  L5_2 = tonumber

  L6_2 = A0_2.z

  L5_2, L6_2 = L5_2(L6_2)

  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)

  L3_2 = SetEntityCoords

  L4_2 = PlayerPedId

  L4_2 = L4_2()

  L5_2 = L2_2

  L3_2(L4_2, L5_2)

  L3_2 = A1_2

  L4_2 = true

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "GetJobCategories"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2

  L2_2 = Config

  L2_2 = L2_2.JobCategory

  L3_2 = {}

  L4_2 = pairs

  L5_2 = L2_2

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = {}

    L3_2[L8_2] = L10_2

    L10_2 = pairs

    L11_2 = L9_2

    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)

    for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do

      L16_2 = L3_2[L8_2]

      L17_2 = L3_2[L8_2]

      L17_2 = #L17_2

      L17_2 = L17_2 + 1

      L18_2 = L15_2.name

      L16_2[L17_2] = L18_2

    end

  end

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "SetMarkerPos"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2

  L2_2 = SetNewPos

  L3_2 = A0_2.station

  L4_2 = A0_2.markerName

  L5_2 = A0_2.markerIndex

  L6_2 = A0_2.multiple

  L2_2(L3_2, L4_2, L5_2, L6_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNUICallback

L1_1 = "CreateMarker"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L2_2 = SetNewPos

  L3_2 = A0_2.station

  L4_2 = A0_2.markerName

  L5_2 = nil

  L6_2 = A0_2.multiple

  L7_2 = true

  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)

  L2_2 = A1_2

  L3_2 = true

  L2_2(L3_2)

end

L0_1(L1_1, L2_1)

function L0_1(A0_2, A1_2, A2_2, A3_2, A4_2)

  local L5_2, L6_2, L7_2, L8_2, L9_2

  L5_2 = 20

  L6_2 = MarkersList

  L6_2 = L6_2[A1_2]

  if L6_2 then

    L6_2 = MarkersList

    L6_2 = L6_2[A1_2]

    L5_2 = L6_2.sprite

  else

    L6_2 = PublicMarkerList

    L6_2 = L6_2[A1_2]

    if L6_2 then

      L6_2 = PublicMarkerList

      L6_2 = L6_2[A1_2]

      L5_2 = L6_2.sprite

    end

  end

  L6_2 = 0

  L7_2 = {}

  L8_2 = Citizen

  L8_2 = L8_2.CreateThread

  function L9_2()

    local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3

    while true do

      L0_3 = Citizen

      L0_3 = L0_3.Wait

      L1_3 = 10

      L0_3(L1_3)

      L0_3 = GetScreenCoords

      L1_3 = 100

      L0_3, L1_3 = L0_3(L1_3)

      L2_3 = Config

      L2_3 = L2_3.CustomNotify

      if L2_3 then

        L2_3 = ShowHelpNotification

        L3_3 = "E"

        L4_3 = A3_2

        if L4_3 then

          L4_3 = L6_2

          if L4_3 >= 1 then

            L4_3 = "Place spawn position"

            if L4_3 then

              goto lbl_24

            end

          end

        end

        L4_3 = "Place marker position"

        ::lbl_24::

        L2_3(L3_3, L4_3)

      else

        L2_3 = Config

        L2_3 = L2_3.Framework

        if "qbcore" == L2_3 then

          L2_3 = exports

          L2_3 = L2_3["qb-core"]

          L3_3 = L2_3

          L2_3 = L2_3.DrawText

          L4_3 = "[E] "

          L5_3 = A3_2

          if L5_3 then

            L5_3 = L6_2

            if L5_3 >= 1 then

              L5_3 = "Place spawn position"

              if L5_3 then

                goto lbl_44

              end

            end

          end

          L5_3 = "Place marker position"

          ::lbl_44::

          L4_3 = L4_3 .. L5_3

          L5_3 = "left"

          L2_3(L3_3, L4_3, L5_3)

        else

          L2_3 = Config

          L2_3 = L2_3.Framework

          if "esx" == L2_3 then

            L2_3 = Framework

            L2_3 = L2_3.ShowHelpNotification

            L3_3 = "~INPUT_PICKUP~ "

            L4_3 = A3_2

            if L4_3 then

              L4_3 = L6_2

              if L4_3 >= 1 then

                L4_3 = "Place spawn position"

                if L4_3 then

                  goto lbl_65

                end

              end

            end

            L4_3 = "Place marker position"

            ::lbl_65::

            L3_3 = L3_3 .. L4_3

            L4_3 = true

            L2_3(L3_3, L4_3)

          end

        end

      end

      if L0_3 then

        L2_3 = GetEntityCoords

        L3_3 = PlayerPedId

        L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L3_3()

        L2_3 = L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)

        L3_3 = DrawLine

        L4_3 = L2_3.x

        L5_3 = L2_3.y

        L6_3 = L2_3.z

        L7_3 = L1_3.x

        L8_3 = L1_3.y

        L9_3 = L1_3.z

        L10_3 = 255

        L11_3 = 255

        L12_3 = 255

        L13_3 = 100

        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3)

        L3_3 = DrawMarker

        L4_3 = L5_2

        L5_3 = L1_3.x

        L6_3 = L1_3.y

        L7_3 = L1_3.z

        L7_3 = L7_3 + 1.0

        L8_3 = 0.0

        L9_3 = 0.0

        L10_3 = 0.0

        L11_3 = 0.0

        L12_3 = 0.0

        L13_3 = 0.0

        L14_3 = 0.3

        L15_3 = 0.3

        L16_3 = 0.3

        L17_3 = 0

        L18_3 = 0

        L19_3 = 0

        L20_3 = 100

        L21_3 = false

        L22_3 = false

        L23_3 = 0

        L24_3 = true

        L3_3(L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)

        L3_3 = IsControlJustPressed

        L4_3 = 0

        L5_3 = 38

        L3_3 = L3_3(L4_3, L5_3)

        if L3_3 then

          L3_3 = L6_2

          L3_3 = L3_3 + 1

          L6_2 = L3_3

          L3_3 = L6_2

          if 1 == L3_3 then

            L3_3 = "coords"

            if L3_3 then

              goto lbl_128

            end

          end

          L3_3 = "spawn"

          ::lbl_128::

          L4_3 = L7_2

          L5_3 = {}

          L6_3 = L1_3.x

          L7_3 = L1_3.y

          L8_3 = L1_3.z

          L8_3 = L8_3 + 1.0

          L9_3 = GetEntityHeading

          L10_3 = PlayerPedId

          L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L10_3()

          L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L9_3(L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)

          L5_3[1] = L6_3

          L5_3[2] = L7_3

          L5_3[3] = L8_3

          L5_3[4] = L9_3

          L5_3[5] = L10_3

          L5_3[6] = L11_3

          L5_3[7] = L12_3

          L5_3[8] = L13_3

          L5_3[9] = L14_3

          L5_3[10] = L15_3

          L5_3[11] = L16_3

          L5_3[12] = L17_3

          L5_3[13] = L18_3

          L5_3[14] = L19_3

          L5_3[15] = L20_3

          L5_3[16] = L21_3

          L5_3[17] = L22_3

          L5_3[18] = L23_3

          L5_3[19] = L24_3

          L4_3[L3_3] = L5_3

          L3_3 = HideHelpNotification

          L3_3()

          L3_3 = A4_2

          if not L3_3 then

            L3_3 = FW_TriggerCallback

            L4_3 = "origen_police:callback:UpdateMarkerPos"

            function L5_3(A0_4)

              local L1_4, L2_4, L3_4, L4_4

              L1_4 = Debuger

              L2_4 = "Update marker pos: "

              L3_4 = json

              L3_4 = L3_4.encode

              L4_4 = A0_4

              L3_4, L4_4 = L3_4(L4_4)

              L1_4(L2_4, L3_4, L4_4)

            end

            L6_3 = {}

            L7_3 = A0_2

            L6_3.station = L7_3

            L7_3 = A1_2

            L6_3.markerName = L7_3

            L7_3 = tonumber

            L8_3 = A2_2

            L7_3 = L7_3(L8_3)

            L7_3 = L7_3 + 1

            L6_3.markerIndex = L7_3

            L7_3 = L1_3.x

            L6_3.x = L7_3

            L7_3 = L1_3.y

            L6_3.y = L7_3

            L7_3 = L1_3.z

            L7_3 = L7_3 + 1.0

            L6_3.z = L7_3

            L7_3 = GetEntityHeading

            L8_3 = PlayerPedId

            L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3 = L8_3()

            L7_3 = L7_3(L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3, L16_3, L17_3, L18_3, L19_3, L20_3, L21_3, L22_3, L23_3, L24_3)

            L6_3.w = L7_3

            L7_3 = L6_2

            L7_3 = L7_3 > 1

            L6_3.isMultiple = L7_3

            L3_3(L4_3, L5_3, L6_3)

          else

            L3_3 = A3_2

            if L3_3 then

              L3_3 = L6_2

              if L3_3 > 1 then

                -- [INST INST-028 RAC-002] goto lbl_195 removido — dead code del decompilador.
                -- El salto llevaba a "if 1 == L3_3" con L3_3=L6_2>1 → siempre falso.

              end

            end

            L3_3 = A3_2

            if not L3_3 then

              L3_3 = L6_2

              if 1 == L3_3 then

                L3_3 = FW_TriggerCallback

                L4_3 = "origen_police:callback:CreateMarker"

                function L5_3(A0_4)

                  local L1_4, L2_4, L3_4, L4_4

                  L1_4 = Debuger

                  L2_4 = "Create marker: "

                  L3_4 = json

                  L3_4 = L3_4.encode

                  L4_4 = A0_4

                  L3_4, L4_4 = L3_4(L4_4)

                  L1_4(L2_4, L3_4, L4_4)

                end

                L6_3 = {}

                L7_3 = A0_2

                L6_3.station = L7_3

                L7_3 = A1_2

                L6_3.markerName = L7_3

                L7_3 = L7_2

                L6_3.creatingData = L7_3

                L3_3(L4_3, L5_3, L6_3)

              end

            end

          end

          L3_3 = A3_2

          if L3_3 then

            L3_3 = L6_2

          end

          if L3_3 > 1 then

            L3_3 = TogglePause

            L4_3 = true

            L3_3(L4_3)

            break

          end

        else

          L3_3 = IsControlJustPressed

          L4_3 = 0

          L5_3 = 177

          L3_3 = L3_3(L4_3, L5_3)

          if L3_3 then

            L3_3 = TogglePause

            L4_3 = true

            L3_3(L4_3)

            break

          end

        end

      end

    end

    L0_3 = HideHelpNotification

    L0_3()

  end

  L8_2(L9_2)

end

SetNewPos = L0_1

function L0_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L1_2 = pairs

  L2_2 = Config

  L2_2 = L2_2.Maps

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    if L6_2 == A0_2 then

      L7_2 = tonumber

      L8_2 = L5_2

      return L7_2(L8_2)

    end

  end

end

GetStationIndex = L0_1

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:UpdateMarkerPos"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L1_2 = A0_2.markerName

  if "BillsNPC" == L1_2 then

    L1_2 = ShowNotification

    L2_2 = "The NPC position will be updated after a script restart"

    return L1_2(L2_2)

  end

  L1_2 = PublicMarkerList

  L2_2 = A0_2.markerName

  L1_2 = L1_2[L2_2]

  L1_2 = nil ~= L1_2

  if L1_2 then

    L2_2 = Public

    L2_2 = L2_2.Markers

    if L2_2 then

      goto lbl_27

    end

  end

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L3_2 = GetStationIndex

  L4_2 = A0_2.station

  L3_2 = L3_2(L4_2)

  L2_2 = L2_2[L3_2]

  ::lbl_27::

  if L1_2 then

    L3_2 = PublicMarkerList

    L4_2 = A0_2.markerName

    L3_2 = L3_2[L4_2]

    L3_2 = L3_2.event

    if L3_2 then

      goto lbl_39

    end

  end

  L3_2 = MarkersList

  L4_2 = A0_2.markerName

  L3_2 = L3_2[L4_2]

  L3_2 = L3_2.event

  ::lbl_39::

  L4_2 = pairs

  L5_2 = L2_2

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = L9_2.event

    if L10_2 == L3_2 then

      L10_2 = A0_2.isMultiple

      if L10_2 then

        L10_2 = "spawn"

        if L10_2 then

          goto lbl_53

        end

      end

      L10_2 = "coords"

      ::lbl_53::

      L11_2 = vector4

      L12_2 = A0_2.x

      L13_2 = A0_2.y

      L14_2 = A0_2.z

      L15_2 = A0_2.w

      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)

      L9_2[L10_2] = L11_2

      break

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:RemoveMarker"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2

  L1_2 = A0_2.markerName

  if "BillsNPC" == L1_2 then

    L1_2 = ShowNotification

    L2_2 = "The NPC will be removed after a script restart"

    return L1_2(L2_2)

  end

  L1_2 = PublicMarkerList

  L2_2 = A0_2.markerName

  L1_2 = L1_2[L2_2]

  L1_2 = nil ~= L1_2

  if L1_2 then

    L2_2 = Public

    L2_2 = L2_2.Markers

    if L2_2 then

      goto lbl_27

    end

  end

  L2_2 = Tables

  L2_2 = L2_2.Markers

  L3_2 = GetStationIndex

  L4_2 = A0_2.station

  L3_2 = L3_2(L4_2)

  L2_2 = L2_2[L3_2]

  ::lbl_27::

  if L1_2 then

    L3_2 = PublicMarkerList

    L4_2 = A0_2.markerName

    L3_2 = L3_2[L4_2]

    L3_2 = L3_2.event

    if L3_2 then

      goto lbl_39

    end

  end

  L3_2 = MarkersList

  L4_2 = A0_2.markerName

  L3_2 = L3_2[L4_2]

  L3_2 = L3_2.event

  ::lbl_39::

  L4_2 = pairs

  L5_2 = L2_2

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)

  for L8_2, L9_2 in L4_2, L5_2, L6_2, L7_2 do

    L10_2 = L9_2.event

    if L10_2 == L3_2 then

      L10_2 = NumberEquals

      L11_2 = L9_2.coords

      L11_2 = L11_2.x

      L12_2 = A0_2.coords

      L12_2 = L12_2[1]

      L10_2 = L10_2(L11_2, L12_2)

      if L10_2 then

        L10_2 = NumberEquals

        L11_2 = L9_2.coords

        L11_2 = L11_2.y

        L12_2 = A0_2.coords

        L12_2 = L12_2[2]

        L10_2 = L10_2(L11_2, L12_2)

        if L10_2 then

          L10_2 = NumberEquals

          L11_2 = L9_2.coords

          L11_2 = L11_2.z

          L12_2 = A0_2.coords

          L12_2 = L12_2[3]

          L10_2 = L10_2(L11_2, L12_2)

          if L10_2 then

            L10_2 = print

            L11_2 = "REMOVED MARKER: "

            L12_2 = A0_2.markerName

            L10_2(L11_2, L12_2)

            L10_2 = table

            L10_2 = L10_2.remove

            L11_2 = L2_2

            L12_2 = L8_2

            L10_2(L11_2, L12_2)

            break

          end

        end

      end

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:CreateMarker"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L1_2 = A0_2.markerName

  if "BillsNPC" == L1_2 then

    L1_2 = ShowNotification

    L2_2 = "The NPC will be spawned after a script restart"

    return L1_2(L2_2)

  end

  L1_2 = PublicMarkerList

  L2_2 = A0_2.markerName

  L1_2 = L1_2[L2_2]

  L1_2 = nil ~= L1_2

  if L1_2 then

    L2_2 = PublicMarkerList

    L3_2 = A0_2.markerName

    L2_2 = L2_2[L3_2]

    if L2_2 then

      goto lbl_25

    end

  end

  L2_2 = MarkersList

  L3_2 = A0_2.markerName

  L2_2 = L2_2[L3_2]

  ::lbl_25::

  L3_2 = GetStationIndex

  L4_2 = A0_2.station

  L3_2 = L3_2(L4_2)

  if L1_2 then

    L4_2 = Public

    L4_2 = L4_2.Markers

    if L4_2 then

      goto lbl_37

    end

  end

  L4_2 = Tables

  L4_2 = L4_2.Markers

  L4_2 = L4_2[L3_2]

  ::lbl_37::

  if nil == L4_2 and not L1_2 then

    L5_2 = Tables

    L5_2 = L5_2.Markers

    L6_2 = {}

    L5_2[L3_2] = L6_2

    L5_2 = Tables

    L5_2 = L5_2.Markers

    L4_2 = L5_2[L3_2]

  end

  L5_2 = #L4_2

  L5_2 = L5_2 + 1

  L4_2[L5_2] = L2_2

  L6_2 = L4_2[L5_2]

  L7_2 = vector4

  L8_2 = A0_2.creatingData

  L8_2 = L8_2.coords

  L8_2 = L8_2[1]

  L9_2 = A0_2.creatingData

  L9_2 = L9_2.coords

  L9_2 = L9_2[2]

  L10_2 = A0_2.creatingData

  L10_2 = L10_2.coords

  L10_2 = L10_2[3]

  L11_2 = A0_2.creatingData

  L11_2 = L11_2.coords

  L11_2 = L11_2[4]

  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)

  L6_2.coords = L7_2

  L6_2 = A0_2.creatingData

  L6_2 = L6_2.spawn

  if L6_2 then

    L6_2 = L4_2[L5_2]

    L7_2 = vector4

    L8_2 = A0_2.creatingData

    L8_2 = L8_2.spawn

    L8_2 = L8_2[1]

    L9_2 = A0_2.creatingData

    L9_2 = L9_2.spawn

    L9_2 = L9_2[2]

    L10_2 = A0_2.creatingData

    L10_2 = L10_2.spawn

    L10_2 = L10_2[3]

    L11_2 = A0_2.creatingData

    L11_2 = L11_2.coords

    L11_2 = L11_2[4]

    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)

    L6_2.spawn = L7_2

  end

  L6_2 = Debuger

  L7_2 = "Create Marker Data: "

  L8_2 = json

  L8_2 = L8_2.encode

  L9_2 = L4_2

  L10_2 = {}

  L10_2.indent = true

  L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2, L10_2)

  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)

end

L0_1(L1_1, L2_1)

L0_1 = RegisterNetEvent

L1_1 = "origen_police:client:ActiveStation"

function L2_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2

  L1_2 = A0_2.active

  if not L1_2 then

    L1_2 = pairs

    L2_2 = Config

    L2_2 = L2_2.Maps

    L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

    for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

      L7_2 = A0_2.station

      if L6_2 == L7_2 then

        L7_2 = Config

        L7_2 = L7_2.Maps

        L7_2[L5_2] = nil

        break

      end

    end

    L1_2 = ReloadMarkers

    L1_2()

    return

  end

  L1_2 = Config

  L1_2 = L1_2.Maps

  L2_2 = Config

  L2_2 = L2_2.Maps

  L2_2 = #L2_2

  L2_2 = L2_2 + 1

  L3_2 = A0_2.station

  L1_2[L2_2] = L3_2

  L1_2 = ReloadMarkers

  L1_2()

end

L0_1(L1_1, L2_1)

L0_1 = false

L1_1 = RegisterNetEvent

L2_1 = "origen_police:client:OnPlayerLoaded"

function L3_1()

  local L0_2, L1_2, L2_2

  L0_2 = Config

  L0_2 = L0_2.IgnoreSettings

  if not L0_2 then

    L0_2 = L0_1

    if not L0_2 then

      goto lbl_9

    end

  end

  do return end

  ::lbl_9::

  L0_2 = true

  L0_1 = L0_2

  L0_2 = FW_TriggerCallback

  L1_2 = "origen_police:callback:GetActiveMaps"

  function L2_2(A0_3)

    local L1_3, L2_3

    L1_3 = Config

    L1_3.Maps = A0_3

    L1_3 = #A0_3

    if 0 == L1_3 then

      L1_3 = print

      L2_3 = "^3WARNING: NO ACTIVE MAPS, PLEASE ADD SOME IN THE SETTING TAB OF THE POLICE TABLET^0"

      L1_3(L2_3)

    end

    L1_3 = ReloadMarkers

    L1_3()

  end

  L0_2(L1_2, L2_2)

end

L1_1(L2_1, L3_1)

