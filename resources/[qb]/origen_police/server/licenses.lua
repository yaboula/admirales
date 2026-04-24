local L0_1, L1_1, L2_1

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:AddLicense"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = cachedLicenses

  L4_2 = A2_2.citizenid

  L3_2[L4_2] = nil

  L3_2 = TriggerEvent

  L4_2 = "origen_police:server:onLicenseAdded"

  L5_2 = A2_2.citizenid

  L6_2 = A2_2.type

  L3_2(L4_2, L5_2, L6_2)

  L3_2 = Config

  L3_2 = L3_2.UseDefaultSystem

  if L3_2 then

    L3_2 = Config

    L3_2 = L3_2.Framework

    if "qbcore" == L3_2 then

      L3_2 = Framework

      L3_2 = L3_2.Functions

      L3_2 = L3_2.GetPlayerByCitizenId

      L4_2 = A2_2.citizenid

      L3_2 = L3_2(L4_2)

      if L3_2 then

        L4_2 = L3_2.PlayerData

        L4_2 = L4_2.metadata

        L4_2 = L4_2.licences

        if L4_2 then

          L5_2 = A2_2.type

          L5_2 = L4_2[L5_2]

          if not L5_2 then

            L5_2 = A2_2.type

            L4_2[L5_2] = true

            L5_2 = L3_2.Functions

            L5_2 = L5_2.SetMetaData

            L6_2 = "licences"

            L7_2 = L4_2

            L5_2(L6_2, L7_2)

            L5_2 = A1_2

            L6_2 = true

            L5_2(L6_2)

        end

        else

          L5_2 = A1_2

          L6_2 = false

          L5_2(L6_2)

        end

      else

        L4_2 = Framework

        L4_2 = L4_2.Functions

        L4_2 = L4_2.GetOfflinePlayerByCitizenId

        L5_2 = A2_2.citizenid

        L4_2 = L4_2(L5_2)

        L3_2 = L4_2

        if L3_2 then

          L4_2 = L3_2.PlayerData

          L4_2 = L4_2.metadata

          L4_2 = L4_2.licences

          if L4_2 then

            L5_2 = A2_2.type

            L5_2 = L4_2[L5_2]

            if not L5_2 then

              L5_2 = A2_2.type

              L4_2[L5_2] = true

              L5_2 = L3_2.Functions

              L5_2 = L5_2.SetMetaData

              L6_2 = "licences"

              L7_2 = L4_2

              L5_2(L6_2, L7_2)

              L5_2 = A1_2

              L6_2 = true

              L5_2(L6_2)

          end

          else

            L5_2 = A1_2

            L6_2 = false

            L5_2(L6_2)

          end

        end

      end

    else

      L3_2 = Config

      L3_2 = L3_2.Framework

      if "esx" == L3_2 then

        L3_2 = MySQL

        L3_2 = L3_2.query

        L4_2 = "SELECT COUNT(*) as count FROM user_licenses WHERE type = ? AND owner = ?"

        L5_2 = {}

        L6_2 = A2_2.type

        L7_2 = A2_2.citizenid

        L5_2[1] = L6_2

        L5_2[2] = L7_2

        function L6_2(A0_3)

          local L1_3, L2_3, L3_3, L4_3, L5_3

          L1_3 = A0_3[1]

          L1_3 = L1_3.count

          if 0 == L1_3 then

            L1_3 = MySQL

            L1_3 = L1_3.insert

            L2_3 = "INSERT INTO user_licenses (type, owner) VALUES (?, ?)"

            L3_3 = {}

            L4_3 = A2_2.type

            L5_3 = A2_2.citizenid

            L3_3[1] = L4_3

            L3_3[2] = L5_3

            function L4_3(A0_4)

              local L1_4, L2_4

              if A0_4 > 0 then

                L1_4 = A1_2

                L2_4 = true

                L1_4(L2_4)

              end

            end

            L1_3(L2_3, L3_3, L4_3)

          else

            L1_3 = A1_2

            L2_3 = false

            L1_3(L2_3)

          end

        end

        L3_2(L4_2, L5_2, L6_2)

      end

    end

  else

    L3_2 = AddLicense

    L4_2 = A0_2

    L5_2 = A2_2.citizenid

    L6_2 = A2_2.type

    function L7_2(A0_3)

      local L1_3, L2_3

      if A0_3 then

        L1_3 = A1_2

        L2_3 = true

        L1_3(L2_3)

      else

        L1_3 = A1_2

        L2_3 = false

        L1_3(L2_3)

      end

    end

    L3_2(L4_2, L5_2, L6_2, L7_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:RemoveLicense"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = TriggerEvent

  L4_2 = "origen_police:server:onLicenseRemoved"

  L5_2 = A2_2.citizenid

  L6_2 = A2_2.type

  L3_2(L4_2, L5_2, L6_2)

  L3_2 = cachedLicenses

  L4_2 = A2_2.citizenid

  L3_2[L4_2] = nil

  L3_2 = Config

  L3_2 = L3_2.UseDefaultSystem

  if L3_2 then

    L3_2 = Config

    L3_2 = L3_2.Framework

    if "qbcore" == L3_2 then

      L3_2 = Framework

      L3_2 = L3_2.Functions

      L3_2 = L3_2.GetPlayerByCitizenId

      L4_2 = A2_2.citizenid

      L3_2 = L3_2(L4_2)

      if L3_2 then

        L4_2 = L3_2.PlayerData

        L4_2 = L4_2.metadata

        L4_2 = L4_2.licences

        if L4_2 then

          L5_2 = A2_2.type

          L5_2 = L4_2[L5_2]

          if L5_2 then

            L5_2 = A2_2.type

            L4_2[L5_2] = false

            L5_2 = L3_2.Functions

            L5_2 = L5_2.SetMetaData

            L6_2 = "licences"

            L7_2 = L4_2

            L5_2(L6_2, L7_2)

            L5_2 = A1_2

            L6_2 = true

            L5_2(L6_2)

          end

        end

      else

        L4_2 = Framework

        L4_2 = L4_2.Functions

        L4_2 = L4_2.GetOfflinePlayerByCitizenId

        L5_2 = A2_2.citizenid

        L4_2 = L4_2(L5_2)

        L3_2 = L4_2

        if L3_2 then

          L4_2 = L3_2.PlayerData

          L4_2 = L4_2.metadata

          L4_2 = L4_2.licences

          if L4_2 then

            L5_2 = A2_2.type

            L5_2 = L4_2[L5_2]

            if L5_2 then

              L5_2 = A2_2.type

              L4_2[L5_2] = false

              L5_2 = L3_2.Functions

              L5_2 = L5_2.SetMetaData

              L6_2 = "licences"

              L7_2 = L4_2

              L5_2(L6_2, L7_2)

              L5_2 = A1_2

              L6_2 = true

              L5_2(L6_2)

            end

          end

        end

      end

    else

      L3_2 = Config

      L3_2 = L3_2.Framework

      if "esx" == L3_2 then

        L3_2 = MySQL

        L3_2 = L3_2.awaitQuery

        L4_2 = "DELETE FROM user_licenses WHERE owner = ? AND type = ?"

        L5_2 = {}

        L6_2 = A2_2.citizenid

        L7_2 = A2_2.type

        L5_2[1] = L6_2

        L5_2[2] = L7_2

        L3_2(L4_2, L5_2)

      end

    end

  else

    L3_2 = RemoveLicense

    L4_2 = A0_2

    L5_2 = A2_2.citizenid

    L6_2 = A2_2.type

    function L7_2(A0_3)

      local L1_3, L2_3

      if A0_3 then

        L1_3 = A1_2

        L2_3 = true

        L1_3(L2_3)

      else

        L1_3 = A1_2

        L2_3 = false

        L1_3(L2_3)

      end

    end

    L3_2(L4_2, L5_2, L6_2, L7_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetLicenses"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2

  L2_2 = Config

  L2_2 = L2_2.UseDefaultSystem

  if L2_2 then

    L2_2 = {}

    L3_2 = Config

    L3_2 = L3_2.Framework

    if "qbcore" == L3_2 then

      L3_2 = pairs

      L4_2 = Config

      L4_2 = L4_2.Licenses

      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

      for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

        L9_2 = {}

        L9_2.name = L8_2

        L9_2.type = L7_2

        L10_2 = Config

        L10_2 = L10_2.DefaultExpireTime

        L9_2.expire = L10_2

        L2_2[L7_2] = L9_2

      end

      L3_2 = A1_2

      L4_2 = L2_2

      L3_2(L4_2)

    else

      L3_2 = Config

      L3_2 = L3_2.Framework

      if "esx" == L3_2 then

        L3_2 = MySQL

        L3_2 = L3_2.awaitQuery

        L4_2 = "SELECT * FROM licenses"

        L3_2 = L3_2(L4_2)

        L4_2 = 1

        L5_2 = #L3_2

        L6_2 = 1

        for L7_2 = L4_2, L5_2, L6_2 do

          L8_2 = L3_2[L7_2]

          L8_2 = L8_2.type

          L9_2 = {}

          L10_2 = L3_2[L7_2]

          L10_2 = L10_2.label

          L9_2.name = L10_2

          L10_2 = L3_2[L7_2]

          L10_2 = L10_2.type

          L9_2.type = L10_2

          L10_2 = Config

          L10_2 = L10_2.DefaultExpireTime

          L9_2.expire = L10_2

          L2_2[L8_2] = L9_2

        end

        L4_2 = A1_2

        L5_2 = L2_2

        L4_2(L5_2)

      end

    end

  else

    L2_2 = A1_2

    L3_2 = GetLicenses

    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L3_2()

    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)

  end

end

L0_1(L1_1, L2_1)

