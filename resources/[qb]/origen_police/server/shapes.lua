local L0_1, L1_1, L2_1, L3_1

L0_1 = {}

L1_1 = CreateThread

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L0_2 = MySQL

  L0_2 = L0_2.awaitQuery

  L1_2 = "SELECT id, type, title, data, radius FROM origen_police_shapes"

  L0_2 = L0_2(L1_2)

  L1_2 = 1

  L2_2 = #L0_2

  L3_2 = 1

  for L4_2 = L1_2, L2_2, L3_2 do

    L5_2 = L0_2[L4_2]

    if L5_2 then

      L5_2 = L0_2[L4_2]

      L6_2 = L5_2.id

      L5_2 = L0_1

      L7_2 = {}

      L8_2 = L0_2[L4_2]

      L8_2 = L8_2.type

      L7_2.type = L8_2

      L8_2 = L0_2[L4_2]

      L8_2 = L8_2.title

      L7_2.title = L8_2

      L8_2 = json

      L8_2 = L8_2.decode

      L9_2 = L0_2[L4_2]

      L9_2 = L9_2.data

      L8_2 = L8_2(L9_2)

      L7_2.data = L8_2

      L8_2 = L0_2[L4_2]

      L8_2 = L8_2.radius

      L7_2.radius = L8_2

      L8_2 = L0_2[L4_2]

      L8_2 = L8_2.id

      L7_2.id = L8_2

      L5_2[L6_2] = L7_2

    end

  end

end

L1_1(L2_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:UpdateShapes"

function L3_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2

  L3_2 = false

  L4_2 = {}

  L5_2 = A2_2.action

  if "create" == L5_2 then

    A2_2 = A2_2.shape

    L5_2 = MySQL

    L5_2 = L5_2.awaitInsert

    L6_2 = "INSERT INTO origen_police_shapes (type, title, data, radius) VALUES (?, ?, ?, ?)"

    L7_2 = {}

    L8_2 = A2_2.type

    L9_2 = A2_2.title

    L10_2 = json

    L10_2 = L10_2.encode

    L11_2 = A2_2.data

    L10_2 = L10_2(L11_2)

    L11_2 = A2_2.radius

    L7_2[1] = L8_2

    L7_2[2] = L9_2

    L7_2[3] = L10_2

    L7_2[4] = L11_2

    L5_2 = L5_2(L6_2, L7_2)

    L6_2 = L0_1

    L7_2 = {}

    L8_2 = A2_2.type

    L7_2.type = L8_2

    L8_2 = A2_2.title

    L7_2.title = L8_2

    L8_2 = A2_2.data

    L7_2.data = L8_2

    L8_2 = A2_2.radius

    L7_2.radius = L8_2

    L7_2.id = L5_2

    L6_2[L5_2] = L7_2

    L3_2 = L5_2

    L6_2 = CreateLog

    L7_2 = {}

    L7_2.type = "Shapes"

    L8_2 = {}

    L9_2 = Config

    L9_2 = L9_2.LogsTranslations

    L9_2 = L9_2.CreateShape

    L9_2 = L9_2.title

    L8_2.title = L9_2

    L9_2 = Config

    L9_2 = L9_2.LogsTranslations

    L9_2 = L9_2.CreateShape

    L9_2 = L9_2.message

    L10_2 = L9_2

    L9_2 = L9_2.format

    L11_2 = L0_1

    L11_2 = L11_2[L5_2]

    L11_2 = L11_2.title

    L9_2 = L9_2(L10_2, L11_2)

    L8_2.description = L9_2

    L8_2.color = 1791423

    L7_2.embed = L8_2

    L7_2.source = A0_2

    L6_2(L7_2)

  else

    L5_2 = A2_2.action

    if "delete" == L5_2 then

      L5_2 = A2_2.id

      L6_2 = L0_1

      L6_2 = L6_2[L5_2]

      if L6_2 then

        L6_2 = CreateLog

        L7_2 = {}

        L7_2.type = "Shapes"

        L8_2 = {}

        L9_2 = Config

        L9_2 = L9_2.LogsTranslations

        L9_2 = L9_2.DeleteShape

        L9_2 = L9_2.title

        L8_2.title = L9_2

        L9_2 = Config

        L9_2 = L9_2.LogsTranslations

        L9_2 = L9_2.DeleteShape

        L9_2 = L9_2.message

        L10_2 = L9_2

        L9_2 = L9_2.format

        L11_2 = L0_1

        L11_2 = L11_2[L5_2]

        L11_2 = L11_2.title

        L9_2 = L9_2(L10_2, L11_2)

        L8_2.description = L9_2

        L8_2.color = 1791423

        L7_2.embed = L8_2

        L7_2.source = A0_2

        L6_2(L7_2)

        L6_2 = MySQL

        L6_2 = L6_2.awaitQuery

        L7_2 = "DELETE FROM origen_police_shapes WHERE id = ?"

        L8_2 = {}

        L9_2 = L5_2

        L8_2[1] = L9_2

        L6_2 = L6_2(L7_2, L8_2)

        L7_2 = L6_2.affectedRows

        if L7_2 > 0 then

          L7_2 = L0_1

          L7_2[L5_2] = nil

          L3_2 = true

        end

      end

    end

  end

  L5_2 = CanOpenTablet

  L6_2 = A0_2

  L5_2 = L5_2(L6_2)

  L5_2 = L5_2[2]

  L6_2 = Config

  L6_2 = L6_2.Framework

  if "qbcore" == L6_2 then

    L6_2 = pairs

    L7_2 = Config

    L7_2 = L7_2.JobCategory

    L7_2 = L7_2[L5_2]

    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

      L12_2 = Framework

      L12_2 = L12_2.Functions

      L12_2 = L12_2.GetPlayersOnDuty

      L13_2 = L11_2.name

      L12_2, L13_2 = L12_2(L13_2)

      L14_2 = 1

      L15_2 = #L12_2

      L16_2 = 1

      for L17_2 = L14_2, L15_2, L16_2 do

        L18_2 = table

        L18_2 = L18_2.insert

        L19_2 = L4_2

        L20_2 = L12_2[L17_2]

        L18_2(L19_2, L20_2)

      end

    end

  else

    L6_2 = Config

    L6_2 = L6_2.Framework

    if "esx" == L6_2 then

      L6_2 = GetPlayersInDuty

      L7_2 = L5_2

      L6_2 = L6_2(L7_2)

      L4_2 = L6_2

    end

  end

  L6_2 = 1

  L7_2 = #L4_2

  L8_2 = 1

  for L9_2 = L6_2, L7_2, L8_2 do

    L10_2 = TriggerClientEvent

    L11_2 = "origen_police:client:ReloadShapes"

    L12_2 = L4_2[L9_2]

    L10_2(L11_2, L12_2)

  end

  L6_2 = A1_2

  L7_2 = L3_2

  L6_2(L7_2)

end

L1_1(L2_1, L3_1)

L1_1 = FW_CreateCallback

L2_1 = "origen_police:callback:GetShapes"

function L3_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L2_2 = {}

  L3_2 = pairs

  L4_2 = L0_1

  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)

  for L7_2, L8_2 in L3_2, L4_2, L5_2, L6_2 do

    L2_2[L7_2] = L8_2

  end

  L3_2 = A1_2

  L4_2 = L2_2

  L3_2(L4_2)

end

L1_1(L2_1, L3_1)

