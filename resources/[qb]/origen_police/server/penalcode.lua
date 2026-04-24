local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

L1_1 = Citizen

L1_1 = L1_1.CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L0_2 = MySQL

  L0_2 = L0_2.awaitQuery

  L1_2 = "SELECT id, title, job FROM origen_police_penalc WHERE cap = 0"

  L0_2 = L0_2(L1_2)

  L1_2 = 1

  L2_2 = #L0_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = L0_2[L4_2]

    L6_2 = L5_2.id

    L5_2 = L0_1

    L7_2 = {}

    L8_2 = {}

    L7_2.arts = L8_2

    L8_2 = L0_2[L4_2]

    L8_2 = L8_2.title

    L7_2.title = L8_2

    L8_2 = L0_2[L4_2]

    L8_2 = L8_2.id

    L7_2.id = L8_2

    L8_2 = L0_2[L4_2]

    L8_2 = L8_2.job

    if L8_2 then

      L8_2 = L0_2[L4_2]

      L8_2 = L8_2.job

      if L8_2 then

        goto lbl_32

      end

    end

    L8_2 = "police"

    ::lbl_32::

    L7_2.job = L8_2

    L5_2[L6_2] = L7_2

  end

  L1_2 = MySQL

  L1_2 = L1_2.awaitQuery

  L2_2 = "SELECT * FROM origen_police_penalc WHERE NOT cap = 0"

  L1_2 = L1_2(L2_2)

  L2_2 = 1

  L3_2 = #L1_2

  L4_2 = 1

  for L5_2 = L2_2, L3_2, L4_2 do

    L6_2 = L1_2[L5_2]

    L7_2 = L6_2.cap

    L6_2 = L0_1

    L6_2 = L6_2[L7_2]

    if L6_2 then

      L6_2 = table

      L6_2 = L6_2.insert

      L7_2 = L1_2[L5_2]

      L8_2 = L7_2.cap

      L7_2 = L0_1

      L7_2 = L7_2[L8_2]

      L7_2 = L7_2.arts

      L8_2 = {}

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.title

      L8_2.title = L9_2

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.description

      L8_2.description = L9_2

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.price

      L8_2.price = L9_2

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.month

      L8_2.month = L9_2

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.id

      L8_2.id = L9_2

      L9_2 = L1_2[L5_2]

      L9_2 = L9_2.job

      if L9_2 then

        L9_2 = L1_2[L5_2]

        L9_2 = L9_2.job

        if L9_2 then

          goto lbl_82

        end

      end

      L9_2 = "police"

      ::lbl_82::

      L8_2.job = L9_2

      L6_2(L7_2, L8_2)

    end

  end

end

L1_1(L2_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:GetPenalCode"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if not L2_2 then

    return

  end

  L3_2 = exports

  L3_2 = L3_2.origen_police

  L4_2 = L3_2

  L3_2 = L3_2.CanOpenTablet

  L5_2 = L2_2.PlayerData

  L5_2 = L5_2.job

  L5_2 = L5_2.name

  L3_2 = L3_2(L4_2, L5_2)

  L3_2 = L3_2[3]

  L4_2 = {}

  L5_2 = pairs

  L6_2 = L0_1

  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

  for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

    L11_2 = L10_2.job

    if L11_2 == L3_2 then

      L4_2[L9_2] = L10_2

    end

  end

  L5_2 = A1_2

  L6_2 = L4_2

  L5_2(L6_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:UpdatePenalCode"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = exports

  L4_2 = L4_2.origen_police

  L5_2 = L4_2

  L4_2 = L4_2.CanOpenTablet

  L6_2 = L3_2.PlayerData

  L6_2 = L6_2.job

  L6_2 = L6_2.name

  L4_2 = L4_2(L5_2, L6_2)

  L4_2 = L4_2[3]

  L5_2 = L3_2.PlayerData

  L5_2 = L5_2.job

  L5_2 = L5_2.isboss

  if L5_2 then

    L5_2 = A2_2.type

    if "edit-art" == L5_2 then

      L5_2 = MySQL

      L5_2 = L5_2.awaitUpdate

      L6_2 = "UPDATE origen_police_penalc SET title = ?, description = ?, price = ?, month = ? WHERE id = ?"

      L7_2 = {}

      L8_2 = A2_2.title

      L9_2 = A2_2.description

      L10_2 = A2_2.price

      L11_2 = A2_2.month

      L12_2 = A2_2.id

      L7_2[1] = L8_2

      L7_2[2] = L9_2

      L7_2[3] = L10_2

      L7_2[4] = L11_2

      L7_2[5] = L12_2

      L5_2 = L5_2(L6_2, L7_2)

      L6_2 = 1

      L8_2 = A2_2.cap

      L7_2 = L0_1

      L7_2 = L7_2[L8_2]

      L7_2 = L7_2.arts

      L7_2 = #L7_2

      L8_2 = 1

      for L9_2 = L6_2, L7_2, L8_2 do

        L11_2 = A2_2.cap

        L10_2 = L0_1

        L10_2 = L10_2[L11_2]

        L10_2 = L10_2.arts

        L10_2 = L10_2[L9_2]

        L10_2 = L10_2.id

        L11_2 = A2_2.id

        if L10_2 == L11_2 then

          L11_2 = A2_2.cap

          L10_2 = L0_1

          L10_2 = L10_2[L11_2]

          L10_2 = L10_2.arts

          L11_2 = {}

          L12_2 = A2_2.title

          L11_2.title = L12_2

          L12_2 = A2_2.description

          L11_2.description = L12_2

          L12_2 = A2_2.price

          L11_2.price = L12_2

          L12_2 = A2_2.month

          L11_2.month = L12_2

          L12_2 = A2_2.id

          L11_2.id = L12_2

          L10_2[L9_2] = L11_2

          break

        end

      end

      L6_2 = A1_2

      L7_2 = L5_2 > 0

      return L6_2(L7_2)

    else

      L5_2 = A2_2.type

      if "new-art" == L5_2 then

        L5_2 = MySQL

        L5_2 = L5_2.awaitInsert

        L6_2 = "INSERT INTO origen_police_penalc (cap, title, description, price, month, job) VALUES (?, ?, ?, ?, ?, ?)"

        L7_2 = {}

        L8_2 = A2_2.cap

        L9_2 = A2_2.title

        L10_2 = A2_2.description

        L11_2 = A2_2.price

        L12_2 = A2_2.month

        L13_2 = L4_2

        L7_2[1] = L8_2

        L7_2[2] = L9_2

        L7_2[3] = L10_2

        L7_2[4] = L11_2

        L7_2[5] = L12_2

        L7_2[6] = L13_2

        L5_2 = L5_2(L6_2, L7_2)

        L6_2 = table

        L6_2 = L6_2.insert

        L8_2 = A2_2.cap

        L7_2 = L0_1

        L7_2 = L7_2[L8_2]

        L7_2 = L7_2.arts

        L8_2 = {}

        L9_2 = A2_2.title

        L8_2.title = L9_2

        L9_2 = A2_2.description

        L8_2.description = L9_2

        L9_2 = A2_2.price

        L8_2.price = L9_2

        L9_2 = A2_2.month

        L8_2.month = L9_2

        L8_2.id = L5_2

        L8_2.job = L4_2

        L6_2(L7_2, L8_2)

        L6_2 = A1_2

        L7_2 = L5_2

        return L6_2(L7_2)

      else

        L5_2 = A2_2.type

        if "delete-art" == L5_2 then

          L5_2 = MySQL

          L5_2 = L5_2.awaitQuery

          L6_2 = "DELETE FROM origen_police_penalc WHERE id = ?"

          L7_2 = {}

          L8_2 = A2_2.id

          L7_2[1] = L8_2

          L5_2 = L5_2(L6_2, L7_2)

          L6_2 = 1

          L8_2 = A2_2.cap

          L7_2 = L0_1

          L7_2 = L7_2[L8_2]

          L7_2 = L7_2.arts

          L7_2 = #L7_2

          L8_2 = 1

          for L9_2 = L6_2, L7_2, L8_2 do

            L11_2 = A2_2.cap

            L10_2 = L0_1

            L10_2 = L10_2[L11_2]

            L10_2 = L10_2.arts

            L10_2 = L10_2[L9_2]

            L10_2 = L10_2.id

            L11_2 = A2_2.id

            if L10_2 == L11_2 then

              L10_2 = table

              L10_2 = L10_2.remove

              L12_2 = A2_2.cap

              L11_2 = L0_1

              L11_2 = L11_2[L12_2]

              L11_2 = L11_2.arts

              L12_2 = L9_2

              L10_2(L11_2, L12_2)

              break

            end

          end

          L6_2 = A1_2

          L7_2 = L5_2.affectedRows

          L7_2 = L7_2 > 0

          return L6_2(L7_2)

        else

          L5_2 = A2_2.type

          if "new-cap" == L5_2 then

            L5_2 = MySQL

            L5_2 = L5_2.awaitInsert

            L6_2 = "INSERT INTO origen_police_penalc (title, description, job) VALUES (?, ?, ?)"

            L7_2 = {}

            L8_2 = A2_2.title

            L9_2 = ""

            L10_2 = L4_2

            L7_2[1] = L8_2

            L7_2[2] = L9_2

            L7_2[3] = L10_2

            L5_2 = L5_2(L6_2, L7_2)

            L6_2 = L0_1

            L7_2 = {}

            L8_2 = {}

            L7_2.arts = L8_2

            L8_2 = A2_2.title

            L7_2.title = L8_2

            L7_2.id = L5_2

            L7_2.job = L4_2

            L6_2[L5_2] = L7_2

            L6_2 = A1_2

            L7_2 = L5_2

            return L6_2(L7_2)

          else

            L5_2 = A2_2.type

            if "edit-cap" == L5_2 then

              L5_2 = MySQL

              L5_2 = L5_2.awaitUpdate

              L6_2 = "UPDATE origen_police_penalc SET title = ? WHERE id = ?"

              L7_2 = {}

              L8_2 = A2_2.title

              L9_2 = A2_2.id

              L7_2[1] = L8_2

              L7_2[2] = L9_2

              L5_2 = L5_2(L6_2, L7_2)

              L7_2 = A2_2.id

              L6_2 = L0_1

              L6_2 = L6_2[L7_2]

              L7_2 = A2_2.title

              L6_2.title = L7_2

              L6_2 = A1_2

              L7_2 = L5_2 > 0

              return L6_2(L7_2)

            else

              L5_2 = A2_2.type

              if "delete-cap" == L5_2 then

                L5_2 = MySQL

                L5_2 = L5_2.awaitQuery

                L6_2 = "DELETE FROM origen_police_penalc WHERE id = ? or cap = ?"

                L7_2 = {}

                L8_2 = A2_2.id

                L9_2 = A2_2.id

                L7_2[1] = L8_2

                L7_2[2] = L9_2

                L5_2(L6_2, L7_2)

                L5_2 = pairs

                L6_2 = L0_1

                L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)

                for L9_2, L10_2 in L5_2, L6_2, L7_2, L8_2 do

                  L11_2 = L10_2.id

                  L12_2 = A2_2.id

                  if L11_2 == L12_2 then

                    L11_2 = L0_1

                    L11_2[L9_2] = nil

                  end

                end

                L5_2 = A1_2

                L6_2 = true

                return L5_2(L6_2)

              end

            end

          end

        end

      end

    end

    L5_2 = A1_2

    L6_2 = false

    return L5_2(L6_2)

  end

end

L1_1(L2_1, L3_1)

