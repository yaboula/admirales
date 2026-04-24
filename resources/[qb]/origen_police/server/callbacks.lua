local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:vehicledata"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = nil

  L4_2 = L0_1

  L4_2 = L4_2[A2_2]

  if L4_2 then

    L4_2 = L0_1

    L3_2 = L4_2[A2_2]

  else

    L4_2 = GetOwnerIdentifierByPlate

    L5_2 = A2_2

    L4_2 = L4_2(L5_2)

    if not L4_2 then

      L5_2 = GetRandomName

      L6_2 = math

      L6_2 = L6_2.random

      L7_2 = 1

      L8_2 = 2

      L6_2 = L6_2(L7_2, L8_2)

      if 1 == L6_2 then

        L6_2 = "male"

        if L6_2 then

          goto lbl_26

        end

      end

      L6_2 = "female"

      ::lbl_26::

      L5_2 = L5_2(L6_2)

      L3_2 = L5_2

    else

      L5_2 = FW_GetPlayerFromCitizenid

      L6_2 = L4_2

      L5_2 = L5_2(L6_2)

      if L5_2 then

        L6_2 = L5_2.PlayerData

        L6_2 = L6_2.charinfo

        L6_2 = L6_2.firstname

        L7_2 = " "

        L8_2 = L5_2.PlayerData

        L8_2 = L8_2.charinfo

        L8_2 = L8_2.lastname

        L6_2 = L6_2 .. L7_2 .. L8_2

        L3_2 = L6_2

      else

        L6_2 = GetRandomName

        L7_2 = math

        L7_2 = L7_2.random

        L8_2 = 1

        L9_2 = 2

        L7_2 = L7_2(L8_2, L9_2)

        if 1 == L7_2 then

          L7_2 = "male"

          if L7_2 then

            goto lbl_56

          end

        end

        L7_2 = "female"

        ::lbl_56::

        L6_2 = L6_2(L7_2)

        L3_2 = L6_2

      end

    end

    L5_2 = L0_1

    L5_2[A2_2] = L3_2

  end

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:K9Search"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2

  L3_2 = pairs

  L4_2 = A2_2

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L9_2 = Debuger

    L10_2 = "Processing search key"

    L11_2 = L7_2

    L9_2(L10_2, L11_2)

    L9_2 = tonumber

    L10_2 = L7_2

    L9_2 = L9_2(L10_2)

    if L9_2 then

      L9_2 = FW_GetPlayer

      L10_2 = L7_2

      L9_2 = L9_2(L10_2)

      L10_2 = Debuger

      L11_2 = "Player ID detected"

      L12_2 = L7_2

      L10_2(L11_2, L12_2)

      if L9_2 then

        L10_2 = CanOpenTablet

        L11_2 = L9_2.PlayerData

        L11_2 = L11_2.job

        L11_2 = L11_2.name

        L10_2 = L10_2(L11_2)

        L10_2 = L10_2[1]

        if L10_2 then

          L10_2 = L9_2.PlayerData

          L10_2 = L10_2.job

          L10_2 = L10_2.onduty

        end

        if not L10_2 then

          L10_2 = Debuger

          L11_2 = "Player is not allowed to use tablet or is off duty, job: "

          L12_2 = L9_2.PlayerData

          L12_2 = L12_2.job

          L10_2(L11_2, L12_2)

          L10_2 = 1

          L11_2 = L9_2.PlayerData

          L11_2 = L11_2.items

          L11_2 = #L11_2

          L12_2 = 1

          for L13_2 = L10_2, L11_2, L12_2 do

            L14_2 = L9_2.PlayerData

            L14_2 = L14_2.items

            L14_2 = L14_2[L13_2]

            L15_2 = Debuger

            L16_2 = "Checking player item"

            L17_2 = L14_2.name

            L15_2(L16_2, L17_2)

            L15_2 = Config

            L15_2 = L15_2.K9

            L15_2 = L15_2.IlegalItems

            L16_2 = L14_2.name

            L15_2 = L15_2[L16_2]

            if L15_2 then

              L15_2 = Debuger

              L16_2 = "Illegal item found on player"

              L17_2 = L14_2.name

              L15_2(L16_2, L17_2)

              L15_2 = A1_2

              L16_2 = L7_2

              L15_2(L16_2)

              return

            end

          end

        end

      end

    else

      L9_2 = Debuger

      L10_2 = "Vehicle ID detected"

      L11_2 = L7_2

      L9_2(L10_2, L11_2)

      L9_2 = GetTrunkItems

      L10_2 = L7_2

      L9_2 = L9_2(L10_2)

      L10_2 = GetGloveboxItems

      L11_2 = L7_2

      L10_2 = L10_2(L11_2)

      L11_2 = Debuger

      L12_2 = "Fetched vehicle storage, Trunk: "

      L13_2 = json

      L13_2 = L13_2.encode

      L14_2 = L9_2

      L13_2 = L13_2(L14_2)

      L14_2 = "Glovebox: "

      L15_2 = json

      L15_2 = L15_2.encode

      L16_2 = L10_2

      L15_2, L16_2, L17_2, L18_2 = L15_2(L16_2)

      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2)

      if L9_2 then

        L11_2 = type

        L12_2 = L9_2

        L11_2 = L11_2(L12_2)

        if "table" == L11_2 then

          L11_2 = #L9_2

          if L11_2 > 0 then

            L11_2 = 1

            L12_2 = #L9_2

            L13_2 = 1

            for L14_2 = L11_2, L12_2, L13_2 do

              L15_2 = Config

              L15_2 = L15_2.K9

              L15_2 = L15_2.IlegalItems

              L16_2 = L9_2[L14_2]

              L16_2 = L16_2.name

              L15_2 = L15_2[L16_2]

              if L15_2 then

                L15_2 = Debuger

                L16_2 = "Illegal item found in trunk"

                L17_2 = L9_2[L14_2]

                L17_2 = L17_2.name

                L18_2 = L7_2

                L15_2(L16_2, L17_2, L18_2)

                L15_2 = A1_2

                L16_2 = L7_2

                L15_2(L16_2)

                return

              end

            end

          end

        end

      end

      if L10_2 then

        L11_2 = type

        L12_2 = L10_2

        L11_2 = L11_2(L12_2)

        if "table" == L11_2 then

          L11_2 = #L10_2

          if L11_2 > 0 then

            L11_2 = 1

            L12_2 = #L10_2

            L13_2 = 1

            for L14_2 = L11_2, L12_2, L13_2 do

              L15_2 = Config

              L15_2 = L15_2.K9

              L15_2 = L15_2.IlegalItems

              L16_2 = L10_2[L14_2]

              L16_2 = L16_2.name

              L15_2 = L15_2[L16_2]

              if L15_2 then

                L15_2 = Debuger

                L16_2 = "Illegal item found in glovebox"

                L17_2 = L10_2[L14_2]

                L17_2 = L17_2.name

                L18_2 = L7_2

                L15_2(L16_2, L17_2, L18_2)

                L15_2 = A1_2

                L16_2 = L7_2

                L15_2(L16_2)

                return

              end

            end

          end

        end

      end

    end

  end

  L3_2 = Debuger

  L4_2 = "No illegal items found"

  L3_2(L4_2)

  L3_2 = A1_2

  L4_2 = false

  L3_2(L4_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:GetCameraUrl"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2

  L2_2 = ServerConfig

  L2_2 = L2_2.Logs

  L2_2 = L2_2.Camera

  L3_2 = isValidURL

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    L3_2 = Debuger

    L4_2 = "Camera url not set in config/logs/logs.lua"

    L3_2(L4_2)

    L3_2 = A1_2

    L4_2 = false

    L3_2(L4_2)

  else

    L3_2 = A1_2

    L4_2 = L2_2

    L3_2(L4_2)

  end

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:server:getAdminState"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2

  L2_2 = A1_2

  L3_2 = Framework

  L3_2 = L3_2.Functions

  L3_2 = L3_2.HasPermission

  L4_2 = A0_2

  L5_2 = "admin"

  L3_2 = L3_2(L4_2, L5_2)

  if not L3_2 then

    L4_2 = Framework

    L4_2 = L4_2.Functions

    L4_2 = L4_2.HasPermission

    L5_2 = A0_2

    L3_2 = L4_2(L5_2, "god")

  end

  L2_2(L3_2)

end

L1_1(L2_1, L3_1)

