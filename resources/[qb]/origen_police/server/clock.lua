local L0_1, L1_1, L2_1, L3_1, L4_1

L0_1 = {}

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:ClockIn"

function L3_1()

  local L0_2, L1_2, L2_2, L3_2

  L0_2 = FW_GetPlayer

  L1_2 = source

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L1_2 = L0_2.PlayerData

    if L1_2 then

      L1_2 = L0_2.PlayerData

      L2_2 = L1_2.citizenid

      L1_2 = L0_1

      L1_2 = L1_2[L2_2]

      if not L1_2 then

        L1_2 = L0_2.PlayerData

        L2_2 = L1_2.citizenid

        L1_2 = L0_1

        L3_2 = os

        L3_2 = L3_2.time

        L3_2 = L3_2()

        L3_2 = L3_2 - 60

        L1_2[L2_2] = L3_2

      end

    end

  end

end

L1_1(L2_1, L3_1)

L1_1 = RegisterServerEvent

L2_1 = "origen_police:server:ClockOut"

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = FW_GetPlayer

  L1_2 = source

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L1_2 = L0_2.PlayerData

    if L1_2 then

      L1_2 = L0_2.PlayerData

      L2_2 = L1_2.citizenid

      L1_2 = L0_1

      L1_2 = L1_2[L2_2]

      if L1_2 then

        L1_2 = ClockOut

        L2_2 = L0_2.PlayerData

        L2_2 = L2_2.citizenid

        L3_2 = L0_2.PlayerData

        L3_2 = L3_2.charinfo

        L3_2 = L3_2.firstname

        L4_2 = " "

        L5_2 = L0_2.PlayerData

        L5_2 = L5_2.charinfo

        L5_2 = L5_2.lastname

        L6_2 = " ("

        L7_2 = L0_2.PlayerData

        L7_2 = L7_2.metadata

        L7_2 = L7_2.police_badge

        if not L7_2 then

          L7_2 = "0000"

        end

        L8_2 = ")"

        L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2

        L4_2 = L0_2.PlayerData

        L4_2 = L4_2.job

        L4_2 = L4_2.name

        L5_2 = L0_2.PlayerData

        L5_2 = L5_2.source

        L1_2(L2_2, L3_2, L4_2, L5_2)

      end

    end

  end

end

L1_1(L2_1, L3_1)

function L1_1(A0_2, A1_2, A2_2, A3_2)

  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  if nil ~= A0_2 and nil ~= A1_2 then

    L4_2 = L0_1

    L4_2 = L4_2[A0_2]

    if nil ~= L4_2 then

      goto lbl_10

    end

  end

  do return end

  ::lbl_10::

  L4_2 = CreateLog

  L5_2 = {}

  L5_2.type = "DutyClock"

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.LogsTranslations

  L7_2 = L7_2.ClockOut

  L7_2 = L7_2.title

  L6_2.title = L7_2

  L7_2 = Config

  L7_2 = L7_2.LogsTranslations

  L7_2 = L7_2.ClockOut

  L7_2 = L7_2.message

  L8_2 = L7_2

  L7_2 = L7_2.format

  L9_2 = os

  L9_2 = L9_2.date

  L10_2 = "%d/%m/%Y - %H:%M"

  L11_2 = L0_1

  L11_2 = L11_2[A0_2]

  L9_2 = L9_2(L10_2, L11_2)

  L10_2 = os

  L10_2 = L10_2.date

  L11_2 = "%d/%m/%Y - %H:%M"

  L10_2 = L10_2(L11_2)

  L11_2 = math

  L11_2 = L11_2.ceil

  L12_2 = os

  L12_2 = L12_2.time

  L12_2 = L12_2()

  L13_2 = L0_1

  L13_2 = L13_2[A0_2]

  L12_2 = L12_2 - L13_2

  L12_2 = L12_2 / 60

  L11_2, L12_2, L13_2 = L11_2(L12_2)

  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)

  L6_2.description = L7_2

  L6_2.color = 1791423

  L5_2.embed = L6_2

  L5_2.source = A3_2

  L4_2(L5_2)

  L4_2 = MySQL

  L4_2 = L4_2.awaitInsert

  L5_2 = "INSERT INTO origen_police_clocks (citizenid, name, clockin, clockout, minutes, job) VALUES (@citizenid, @name, @clockin, @clockout, @minutes, @job)"

  L6_2 = {}

  L6_2["@citizenid"] = A0_2

  L6_2["@name"] = A1_2

  L7_2 = os

  L7_2 = L7_2.date

  L8_2 = "%d/%m/%Y - %H:%M"

  L9_2 = L0_1

  L9_2 = L9_2[A0_2]

  L7_2 = L7_2(L8_2, L9_2)

  L6_2["@clockin"] = L7_2

  L7_2 = os

  L7_2 = L7_2.date

  L8_2 = "%d/%m/%Y - %H:%M"

  L7_2 = L7_2(L8_2)

  L6_2["@clockout"] = L7_2

  L7_2 = math

  L7_2 = L7_2.ceil

  L8_2 = os

  L8_2 = L8_2.time

  L8_2 = L8_2()

  L9_2 = L0_1

  L9_2 = L9_2[A0_2]

  L8_2 = L8_2 - L9_2

  L8_2 = L8_2 / 60

  L7_2 = L7_2(L8_2)

  L6_2["@minutes"] = L7_2

  L6_2["@job"] = A2_2

  L4_2(L5_2, L6_2)

  L4_2 = L0_1

  L4_2[A0_2] = nil

end

ClockOut = L1_1

L1_1 = AddEventHandler

L2_1 = "playerDropped"

function L3_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L0_2 = FW_GetPlayer

  L1_2 = source

  L0_2 = L0_2(L1_2)

  if L0_2 then

    L1_2 = L0_2.PlayerData

    if L1_2 then

      L1_2 = L0_2.PlayerData

      L1_2 = L1_2.citizenid

      if L1_2 then

        L1_2 = L0_2.PlayerData

        L2_2 = L1_2.citizenid

        L1_2 = L0_1

        L1_2 = L1_2[L2_2]

        if L1_2 then

          L1_2 = ClockOut

          L2_2 = L0_2.PlayerData

          L2_2 = L2_2.citizenid

          L3_2 = L0_2.PlayerData

          L3_2 = L3_2.charinfo

          L3_2 = L3_2.firstname

          L4_2 = " "

          L5_2 = L0_2.PlayerData

          L5_2 = L5_2.charinfo

          L5_2 = L5_2.lastname

          L6_2 = " ("

          L7_2 = L0_2.PlayerData

          L7_2 = L7_2.metadata

          L7_2 = L7_2.police_badge

          if not L7_2 then

            L7_2 = "0000"

          end

          L8_2 = ")"

          L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2

          L4_2 = L0_2.PlayerData

          L4_2 = L4_2.job

          L4_2 = L4_2.name

          L5_2 = source

          L1_2(L2_2, L3_2, L4_2, L5_2)

        end

      end

    end

  end

end

L1_1(L2_1, L3_1)

L1_1 = {}

L2_1 = FW_CreateCallback

L3_1 = "origen_police:server:GetClocks"

function L4_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  L3_2 = Config

  L3_2 = L3_2.PoliceJobName

  if L2_2 then

    L4_2 = L2_2.PlayerData

    if L4_2 then

      L4_2 = L2_2.PlayerData

      L4_2 = L4_2.job

      if L4_2 then

        L4_2 = L2_2.PlayerData

        L4_2 = L4_2.job

        L3_2 = L4_2.name

      end

    end

  end

  L4_2 = MySQL

  L4_2 = L4_2.awaitQuery

  L5_2 = "SELECT * FROM origen_police_clocks WHERE job = ? ORDER BY id DESC LIMIT 200"

  L6_2 = {}

  L7_2 = L3_2

  L6_2[1] = L7_2

  L4_2 = L4_2(L5_2, L6_2)

  L5_2 = L1_1

  L5_2 = L5_2[L3_2]

  if L5_2 then

    L5_2 = L1_1

    L5_2 = L5_2[L3_2]

    L5_2 = L5_2.time

    L5_2 = L5_2 + 30

    L6_2 = os

    L6_2 = L6_2.time

    L6_2 = L6_2()

    if L5_2 > L6_2 then

      L5_2 = A1_2

      L6_2 = {}

      L6_2.data = L4_2

      L7_2 = L1_1

      L7_2 = L7_2[L3_2]

      L7_2 = L7_2.data

      L6_2.top = L7_2

      L5_2(L6_2)

      return

    end

  end

  L5_2 = MySQL

  L5_2 = L5_2.awaitQuery

  L6_2 = "SELECT name, SUM(minutes) AS total_minutes FROM origen_police_clocks WHERE job = ? GROUP BY citizenid ORDER BY total_minutes DESC LIMIT 10"

  L7_2 = {}

  L8_2 = L3_2

  L7_2[1] = L8_2

  L5_2 = L5_2(L6_2, L7_2)

  L6_2 = L1_1

  L7_2 = {}

  L8_2 = os

  L8_2 = L8_2.time

  L8_2 = L8_2()

  L7_2.time = L8_2

  L7_2.data = L5_2

  L6_2[L3_2] = L7_2

  L6_2 = A1_2

  L7_2 = {}

  L7_2.data = L4_2

  L7_2.top = L5_2

  L6_2(L7_2)

end

L2_1(L3_1, L4_1)

