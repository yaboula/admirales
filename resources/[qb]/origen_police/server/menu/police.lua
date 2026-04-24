local L0_1, L1_1, L2_1

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:SearchCitizen"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L3_2 = {}

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = ""

    L5_2 = A2_2.job

    if L5_2 then

      L5_2 = FW_GetPlayer

      L6_2 = A0_2

      L5_2 = L5_2(L6_2)

      if not L5_2 then

        return

      end

      L6_2 = CanOpenTablet

      L7_2 = L5_2.PlayerData

      L7_2 = L7_2.job

      L7_2 = L7_2.name

      L6_2 = L6_2(L7_2)

      L6_2 = L6_2[2]

      L7_2 = pairs

      L8_2 = Config

      L8_2 = L8_2.JobCategory

      L8_2 = L8_2[L6_2]

      L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

      for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

        L13_2 = L4_2

        if "" ~= L4_2 then

          L14_2 = "OR"

          if L14_2 then

            goto lbl_36

          end

        end

        L14_2 = ""

        ::lbl_36::

        L15_2 = " job LIKE '%\"name\":\""

        L16_2 = L12_2.name

        L17_2 = "\"%' "

        L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2

        L4_2 = L13_2

      end

      L7_2 = L4_2

      L8_2 = "AND ("

      L9_2 = L7_2

      L10_2 = ")"

      L8_2 = L8_2 .. L9_2 .. L10_2

      L4_2 = L8_2

    end

    L5_2 = SearchCitizen

    L6_2 = A2_2.text

    L7_2 = L4_2

    L5_2 = L5_2(L6_2, L7_2)

    L6_2 = 1

    L7_2 = #L5_2

    L8_2 = 1

    for L9_2 = L6_2, L7_2, L8_2 do

      L10_2 = json

      L10_2 = L10_2.decode

      L11_2 = L5_2[L9_2]

      L11_2 = L11_2.charinfo

      L10_2 = L10_2(L11_2)

      L11_2 = GetPhoneFromIdentifier

      L12_2 = L5_2[L9_2]

      L12_2 = L12_2.citizenid

      L11_2 = L11_2(L12_2)

      L12_2 = table

      L12_2 = L12_2.insert

      L13_2 = L3_2

      L14_2 = {}

      L15_2 = L5_2[L9_2]

      L15_2 = L15_2.citizenid

      L14_2.citizenid = L15_2

      L14_2.phone = L11_2

      L15_2 = L10_2.firstname

      L14_2.firstname = L15_2

      L15_2 = L10_2.lastname

      L14_2.lastname = L15_2

      L15_2 = L5_2[L9_2]

      L15_2 = L15_2.image

      L14_2.image = L15_2

      L12_2(L13_2, L14_2)

    end

  else

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "esx" == L4_2 then

      L4_2 = ""

      L5_2 = A2_2.job

      if L5_2 then

        L5_2 = FW_GetPlayer

        L6_2 = A0_2

        L5_2 = L5_2(L6_2)

        if not L5_2 then

          return

        end

        L6_2 = CanOpenTablet

        L7_2 = L5_2.PlayerData

        L7_2 = L7_2.job

        L7_2 = L7_2.name

        L6_2 = L6_2(L7_2)

        L6_2 = L6_2[2]

        L7_2 = pairs

        L8_2 = Config

        L8_2 = L8_2.JobCategory

        L8_2 = L8_2[L6_2]

        L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)

        for L11_2, L12_2 in L7_2, L8_2, L9_2, L10_2 do

          L13_2 = L4_2

          if "" ~= L4_2 then

            L14_2 = "OR"

            if L14_2 then

              goto lbl_119

            end

          end

          L14_2 = ""

          ::lbl_119::

          L15_2 = " job LIKE '%\"name\":\""

          L16_2 = L12_2.name

          L17_2 = "\"%' "

          L13_2 = L13_2 .. L14_2 .. L15_2 .. L16_2 .. L17_2

          L4_2 = L13_2

        end

        L7_2 = L4_2

        L8_2 = "OR ("

        L9_2 = L7_2

        L10_2 = ")"

        L8_2 = L8_2 .. L9_2 .. L10_2

        L4_2 = L8_2

      end

      L5_2 = SearchCitizen

      L6_2 = A2_2.text

      L7_2 = L4_2

      L5_2 = L5_2(L6_2, L7_2)

      L6_2 = 1

      L7_2 = #L5_2

      L8_2 = 1

      for L9_2 = L6_2, L7_2, L8_2 do

        L10_2 = GetPhoneFromIdentifier

        L11_2 = L5_2[L9_2]

        L11_2 = L11_2.identifier

        L10_2 = L10_2(L11_2)

        L11_2 = table

        L11_2 = L11_2.insert

        L12_2 = L3_2

        L13_2 = {}

        L14_2 = L5_2[L9_2]

        L14_2 = L14_2.identifier

        L13_2.citizenid = L14_2

        L13_2.phone = L10_2

        L14_2 = L5_2[L9_2]

        L14_2 = L14_2.firstname

        L13_2.firstname = L14_2

        L14_2 = L5_2[L9_2]

        L14_2 = L14_2.lastname

        L13_2.lastname = L14_2

        L14_2 = L5_2[L9_2]

        L14_2 = L14_2.image

        L13_2.image = L14_2

        L11_2(L12_2, L13_2)

      end

    end

  end

  L4_2 = table

  L4_2 = L4_2.sort

  L5_2 = L3_2

  function L6_2(A0_3, A1_3)

    local L2_3, L3_3, L4_3

    L2_3 = A0_3.firstname

    L3_3 = A0_3.lastname

    L2_3 = L2_3 .. L3_3

    L3_3 = A1_3.firstname

    L4_3 = A1_3.lastname

    L3_3 = L3_3 .. L4_3

    L2_3 = L2_3 < L3_3

    return L2_3

  end

  L4_2(L5_2, L6_2)

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetCitizen"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2

  L3_2 = false

  L4_2 = CanOpenTablet

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  L4_2 = L4_2[2]

  L5_2 = Config

  L5_2 = L5_2.Framework

  if "qbcore" == L5_2 then

    L5_2 = GetCitizen

    L6_2 = A2_2.citizenid

    L5_2 = L5_2(L6_2)

    L6_2 = L5_2[1]

    if L6_2 then

      L6_2 = json

      L6_2 = L6_2.decode

      L7_2 = L5_2[1]

      L7_2 = L7_2.charinfo

      L6_2 = L6_2(L7_2)

      L7_2 = json

      L7_2 = L7_2.decode

      L8_2 = L5_2[1]

      L8_2 = L8_2.job

      L7_2 = L7_2(L8_2)

      L8_2 = GetPhoneFromIdentifier

      L9_2 = L5_2[1]

      L9_2 = L9_2.citizenid

      L8_2 = L8_2(L9_2)

      L9_2 = {}

      L10_2 = MySQL

      L10_2 = L10_2.awaitQuery

      L11_2 = "SELECT * FROM origen_police_notes WHERE citizenid = ? ORDER BY id DESC"

      L12_2 = {}

      L13_2 = A2_2.citizenid

      L12_2[1] = L13_2

      L10_2 = L10_2(L11_2, L12_2)

      L9_2.notes = L10_2

      L10_2 = GetBillsFromCitizenID

      L11_2 = A2_2.citizenid

      L12_2 = L4_2

      L10_2 = L10_2(L11_2, L12_2)

      L9_2.bills = L10_2

      L10_2 = json

      L10_2 = L10_2.encode

      L11_2 = GetLicensesByIdentifier

      L12_2 = A2_2.citizenid

      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L11_2(L12_2)

      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

      L9_2.licenses = L10_2

      L10_2 = GetCitizenProperties

      L11_2 = L5_2[1]

      L11_2 = L11_2.citizenid

      L10_2 = L10_2(L11_2)

      L9_2.properties = L10_2

      L10_2 = GetWeapons

      L11_2 = A2_2.citizenid

      L12_2 = json

      L12_2 = L12_2.decode

      L13_2 = L5_2[1]

      L13_2 = L13_2.inventory

      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L12_2(L13_2)

      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)

      L9_2.weapons = L10_2

      L10_2 = MySQL

      L10_2 = L10_2.awaitQuery

      L11_2 = "SELECT id, title FROM origen_police_reports WHERE implicated LIKE @citizenid OR victims LIKE @citizenid ORDER BY id DESC"

      L12_2 = {}

      L13_2 = "%"

      L14_2 = A2_2.citizenid

      L15_2 = "%"

      L13_2 = L13_2 .. L14_2 .. L15_2

      L12_2["@citizenid"] = L13_2

      L10_2 = L10_2(L11_2, L12_2)

      L9_2.reports = L10_2

      L10_2 = GetVehiclesByIdentifier

      L11_2 = A2_2.citizenid

      L10_2 = L10_2(L11_2)

      L9_2.vehicles = L10_2

      L10_2 = L5_2[1]

      L10_2 = L10_2.citizenid

      L9_2.citizenid = L10_2

      L10_2 = L5_2[1]

      L10_2 = L10_2.image

      L9_2.image = L10_2

      L10_2 = L6_2.firstname

      L9_2.firstname = L10_2

      L10_2 = L6_2.lastname

      L9_2.lastname = L10_2

      L9_2.phone = L8_2

      L10_2 = GetPlayerBankNumber

      L11_2 = A2_2.citizenid

      L12_2 = L6_2.account

      L10_2 = L10_2(L11_2, L12_2)

      L9_2.iban = L10_2

      L10_2 = L5_2[1]

      L10_2 = L10_2.dangerous

      L9_2.dangerous = L10_2

      L10_2 = L5_2[1]

      L10_2 = L10_2.wanted

      L9_2.wanted = L10_2

      L10_2 = L6_2.birthdate

      L9_2.birthdate = L10_2

      L10_2 = L6_2.nationality

      L9_2.nationality = L10_2

      L10_2 = GetGender

      L11_2 = L6_2.gender

      L10_2 = L10_2(L11_2)

      L9_2.gender = L10_2

      L10_2 = L7_2.label

      L9_2.job = L10_2

      L10_2 = L7_2.grade

      L10_2 = L10_2.name

      L9_2.grade = L10_2

      L10_2 = GetTrackerFromCitizenid

      L11_2 = L5_2[1]

      L11_2 = L11_2.citizenid

      L10_2 = L10_2(L11_2)

      L9_2.ankle = L10_2

      L3_2 = L9_2

    end

  else

    L5_2 = Config

    L5_2 = L5_2.Framework

    if "esx" == L5_2 then

      L5_2 = GetCitizen

      L6_2 = A2_2.citizenid

      L5_2 = L5_2(L6_2)

      L6_2 = L5_2[1]

      if L6_2 then

        L6_2 = GetPhoneFromIdentifier

        L7_2 = L5_2[1]

        L7_2 = L7_2.identifier

        L6_2 = L6_2(L7_2)

        L7_2 = GetVehiclesByIdentifier

        L8_2 = A2_2.citizenid

        L7_2 = L7_2(L8_2)

        L8_2 = GetCitizenProperties

        L9_2 = L5_2[1]

        L9_2 = L9_2.identifier

        L8_2 = L8_2(L9_2)

        L9_2 = 1

        L10_2 = #L7_2

        L11_2 = 1

        for L12_2 = L9_2, L10_2, L11_2 do

          L13_2 = L7_2[L12_2]

          L14_2 = json

          L14_2 = L14_2.decode

          L15_2 = L7_2[L12_2]

          L15_2 = L15_2.vehicle

          L14_2 = L14_2(L15_2)

          L13_2.vehicle = L14_2

          L13_2 = L7_2[L12_2]

          L14_2 = L7_2[L12_2]

          L14_2 = L14_2.vehicle

          L14_2 = L14_2.model

          L13_2.hash = L14_2

          L13_2 = L7_2[L12_2]

          L13_2.garage = "Garage"

        end

        L9_2 = Framework

        L9_2 = L9_2.Shared

        L9_2 = L9_2.Jobs

        L10_2 = L5_2[1]

        L10_2 = L10_2.job

        L9_2 = L9_2[L10_2]

        L10_2 = "XXXXXXXXX"

        if L9_2 then

          L11_2 = L9_2.grades

          L12_2 = tostring

          L13_2 = L5_2[1]

          L13_2 = L13_2.job_grade

          L12_2 = L12_2(L13_2)

          L11_2 = L11_2[L12_2]

          if L11_2 then

            L11_2 = L9_2.grades

            L12_2 = tostring

            L13_2 = L5_2[1]

            L13_2 = L13_2.job_grade

            L12_2 = L12_2(L13_2)

            L11_2 = L11_2[L12_2]

            L10_2 = L11_2.label

          end

          L9_2 = L9_2.label

        else

          L11_2 = L5_2[1]

          L9_2 = L11_2.job

        end

        L11_2 = {}

        L12_2 = MySQL

        L12_2 = L12_2.awaitQuery

        L13_2 = "SELECT * FROM origen_police_notes WHERE citizenid = ? ORDER BY id DESC"

        L14_2 = {}

        L15_2 = A2_2.citizenid

        L14_2[1] = L15_2

        L12_2 = L12_2(L13_2, L14_2)

        L11_2.notes = L12_2

        L12_2 = GetBillsFromCitizenID

        L13_2 = A2_2.citizenid

        L14_2 = L4_2

        L12_2 = L12_2(L13_2, L14_2)

        L11_2.bills = L12_2

        L12_2 = json

        L12_2 = L12_2.encode

        L13_2 = GetLicensesByIdentifier

        L14_2 = A2_2.citizenid

        L13_2, L14_2, L15_2, L16_2, L17_2 = L13_2(L14_2)

        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

        L11_2.licenses = L12_2

        L11_2.properties = L8_2

        L12_2 = MySQL

        L12_2 = L12_2.awaitQuery

        L13_2 = "SELECT id, title FROM origen_police_reports WHERE implicated LIKE @citizenid OR victims LIKE @citizenid ORDER BY id DESC"

        L14_2 = {}

        L15_2 = "%"

        L16_2 = A2_2.citizenid

        L17_2 = "%"

        L15_2 = L15_2 .. L16_2 .. L17_2

        L14_2["@citizenid"] = L15_2

        L12_2 = L12_2(L13_2, L14_2)

        L11_2.reports = L12_2

        L12_2 = L7_2 or L12_2

        if not L7_2 then

          L12_2 = {}

        end

        L11_2.vehicles = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.identifier

        L11_2.citizenid = L12_2

        L12_2 = GetWeapons

        L13_2 = A2_2.citizenid

        L14_2 = json

        L14_2 = L14_2.decode

        L15_2 = L5_2[1]

        L15_2 = L15_2.inventory

        L14_2, L15_2, L16_2, L17_2 = L14_2(L15_2)

        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2)

        L11_2.weapons = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.image

        L11_2.image = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.firstname

        L11_2.firstname = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.lastname

        L11_2.lastname = L12_2

        L11_2.phone = L6_2

        L12_2 = GetPlayerBankNumber

        L13_2 = L5_2[1]

        L13_2 = L13_2.identifier

        L12_2 = L12_2(L13_2)

        L11_2.iban = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.dangerous

        L11_2.dangerous = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.wanted

        L11_2.wanted = L12_2

        L12_2 = L5_2[1]

        L12_2 = L12_2.dateofbirth

        L11_2.birthdate = L12_2

        L12_2 = GetPlayerNationality

        L13_2 = L5_2[1]

        L13_2 = L13_2.identifier

        L12_2 = L12_2(L13_2)

        L11_2.nationality = L12_2

        L12_2 = GetGender

        L13_2 = L5_2[1]

        L13_2 = L13_2.sex

        L12_2 = L12_2(L13_2)

        L11_2.gender = L12_2

        L11_2.job = L9_2

        L11_2.grade = L10_2

        L12_2 = GetTrackerFromCitizenid

        L13_2 = L5_2[1]

        L13_2 = L13_2.identifier

        L12_2 = L12_2(L13_2)

        L11_2.ankle = L12_2

        L3_2 = L11_2

      end

    end

  end

  L5_2 = A1_2

  L6_2 = L3_2

  L5_2(L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:SearchVehicle"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L3_2 = {}

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = SearchDataFromVehicle

    L5_2 = A2_2.plate

    L4_2 = L4_2(L5_2)

    L5_2 = 1

    L6_2 = #L4_2

    L7_2 = 1

    for L8_2 = L5_2, L6_2, L7_2 do

      L9_2 = json

      L9_2 = L9_2.decode

      L10_2 = L4_2[L8_2]

      L10_2 = L10_2.charinfo

      L9_2 = L9_2(L10_2)

      if L9_2 then

        L10_2 = L9_2.firstname

        L11_2 = " "

        L12_2 = L9_2.lastname

        L13_2 = " ("

        L14_2 = L4_2[L8_2]

        L14_2 = L14_2.citizenid

        L15_2 = ")"

        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2

        if L10_2 then

          goto lbl_32

        end

      end

      L10_2 = false

      ::lbl_32::

      if not L10_2 then

        L10_2 = "Unknown"

      end

      L11_2 = table

      L11_2 = L11_2.insert

      L12_2 = L3_2

      L13_2 = {}

      L14_2 = L4_2[L8_2]

      L14_2 = L14_2.hash

      L13_2.hash = L14_2

      L14_2 = L4_2[L8_2]

      L14_2 = L14_2.plate

      L13_2.plate = L14_2

      L13_2.owner = L10_2

      L14_2 = L4_2[L8_2]

      L14_2 = L14_2.garage

      if L14_2 then

        L14_2 = L4_2[L8_2]

        L14_2 = L14_2.garage

        if L14_2 then

          goto lbl_56

        end

      end

      L14_2 = "Outside"

      ::lbl_56::

      L13_2.garage = L14_2

      L11_2(L12_2, L13_2)

    end

  else

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "esx" == L4_2 then

      L4_2 = SearchDataFromVehicle

      L5_2 = A2_2.plate

      L4_2 = L4_2(L5_2)

      L5_2 = 1

      L6_2 = #L4_2

      L7_2 = 1

      for L8_2 = L5_2, L6_2, L7_2 do

        L9_2 = L4_2[L8_2]

        L9_2 = L9_2.firstname

        if L9_2 then

          L9_2 = L4_2[L8_2]

          L9_2 = L9_2.firstname

          L10_2 = " "

          L11_2 = L4_2[L8_2]

          L11_2 = L11_2.lastname

          L12_2 = " ("

          L13_2 = L4_2[L8_2]

          L13_2 = L13_2.owner

          L14_2 = ")"

          L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2

          if L9_2 then

            goto lbl_88

          end

        end

        L9_2 = false

        ::lbl_88::

        if not L9_2 then

          L9_2 = "Unknown"

        end

        L10_2 = table

        L10_2 = L10_2.insert

        L11_2 = L3_2

        L12_2 = {}

        L13_2 = json

        L13_2 = L13_2.decode

        L14_2 = L4_2[L8_2]

        L14_2 = L14_2.vehicle

        L13_2 = L13_2(L14_2)

        L13_2 = L13_2.model

        L12_2.hash = L13_2

        L13_2 = L4_2[L8_2]

        L13_2 = L13_2.plate

        L12_2.plate = L13_2

        L12_2.owner = L9_2

        L12_2.garage = "Garage"

        L10_2(L11_2, L12_2)

      end

    end

  end

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:NewPoliceNote"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = L3_2.PlayerData

  L4_2 = L4_2.charinfo

  L4_2 = L4_2.firstname

  L5_2 = " "

  L6_2 = L3_2.PlayerData

  L6_2 = L6_2.charinfo

  L6_2 = L6_2.lastname

  L7_2 = " ("

  L8_2 = L3_2.PlayerData

  L8_2 = L8_2.metadata

  L8_2 = L8_2.police_badge

  if not L8_2 then

    L8_2 = "0000"

  end

  L9_2 = ")"

  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2

  L5_2 = MySQL

  L5_2 = L5_2.insert

  L6_2 = "INSERT INTO origen_police_notes (citizenid, title, description, author) VALUES (?, ?, ?, ?)"

  L7_2 = {}

  L8_2 = A2_2.citizenid

  L9_2 = A2_2.police

  if L9_2 then

    L9_2 = "-police"

    if L9_2 then

      goto lbl_36

    end

  end

  L9_2 = ""

  ::lbl_36::

  L8_2 = L8_2 .. L9_2

  L9_2 = A2_2.noteTitle

  L10_2 = A2_2.noteText

  L11_2 = L4_2

  L7_2[1] = L8_2

  L7_2[2] = L9_2

  L7_2[3] = L10_2

  L7_2[4] = L11_2

  function L8_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3

    if A0_3 then

      L1_3 = A1_2

      L2_3 = {}

      L2_3.id = A0_3

      L3_3 = L4_2

      L2_3.author = L3_3

      L3_3 = os

      L3_3 = L3_3.time

      L3_3 = L3_3()

      L2_3.date = L3_3

      L1_3(L2_3)

      L1_3 = CreateLog

      L2_3 = {}

      L2_3.type = "Notes"

      L3_3 = {}

      L4_3 = Config

      L4_3 = L4_3.LogsTranslations

      L4_3 = L4_3.CreateNote

      L4_3 = L4_3.title

      L3_3.title = L4_3

      L4_3 = Config

      L4_3 = L4_3.LogsTranslations

      L4_3 = L4_3.CreateNote

      L4_3 = L4_3.message

      L5_3 = L4_3

      L4_3 = L4_3.format

      L6_3 = A2_2.noteTitle

      L7_3 = A2_2.noteText

      L8_3 = L4_2

      L4_3 = L4_3(L5_3, L6_3, L7_3, L8_3)

      L3_3.description = L4_3

      L3_3.color = 1791423

      L2_3.embed = L3_3

      L3_3 = A0_2

      L2_3.source = L3_3

      L1_3(L2_3)

    else

      L1_3 = TriggerClientEvent

      L2_3 = "origen_police:ShowNotification"

      L3_3 = A0_2

      L4_3 = Config

      L4_3 = L4_3.Translations

      L4_3 = L4_3.ProblemCreateNote

      L1_3(L2_3, L3_3, L4_3)

      L1_3 = A1_2

      L2_3 = false

      L1_3(L2_3)

    end

  end

  L5_2(L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdatePoliceNote"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2

  L3_2 = false

  L4_2 = A2_2.type

  if "pin" == L4_2 then

    L4_2 = MySQL

    L4_2 = L4_2.awaitUpdate

    L5_2 = "UPDATE origen_police_notes SET fixed = 1 WHERE id = ?"

    L6_2 = {}

    L7_2 = A2_2.noteid

    L6_2[1] = L7_2

    L4_2 = L4_2(L5_2, L6_2)

    L3_2 = L4_2 > 0

  else

    L4_2 = A2_2.type

    if "unpin" == L4_2 then

      L4_2 = MySQL

      L4_2 = L4_2.awaitUpdate

      L5_2 = "UPDATE origen_police_notes SET fixed = 0 WHERE id = ?"

      L6_2 = {}

      L7_2 = A2_2.noteid

      L6_2[1] = L7_2

      L4_2 = L4_2(L5_2, L6_2)

      L3_2 = L4_2 > 0

    else

      L4_2 = A2_2.type

      if "delete" == L4_2 then

        L4_2 = MySQL

        L4_2 = L4_2.awaitQuery

        L5_2 = "DELETE FROM origen_police_notes WHERE id = ?"

        L6_2 = {}

        L7_2 = A2_2.noteid

        L6_2[1] = L7_2

        L4_2 = L4_2(L5_2, L6_2)

        L4_2 = L4_2.affectedRows

        L3_2 = L4_2 > 0

        L4_2 = CreateLog

        L5_2 = {}

        L5_2.type = "Notes"

        L6_2 = {}

        L7_2 = Config

        L7_2 = L7_2.LogsTranslations

        L7_2 = L7_2.DeleteNote

        L7_2 = L7_2.title

        L6_2.title = L7_2

        L7_2 = Config

        L7_2 = L7_2.LogsTranslations

        L7_2 = L7_2.DeleteNote

        L7_2 = L7_2.message

        L8_2 = L7_2

        L7_2 = L7_2.format

        L9_2 = A2_2.noteid

        L7_2 = L7_2(L8_2, L9_2)

        L6_2.description = L7_2

        L6_2.color = 1791423

        L5_2.embed = L6_2

        L5_2.source = A0_2

        L4_2(L5_2)

      end

    end

  end

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdateCitizenStatus"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = Config

  L3_2 = L3_2.Framework

  if "qbcore" == L3_2 then

    L3_2 = A1_2

    L4_2 = MySQL

    L4_2 = L4_2.awaitUpdate

    L5_2 = "UPDATE players SET "

    L6_2 = A2_2.column

    L7_2 = " = ? WHERE citizenid = ?"

    L5_2 = L5_2 .. L6_2 .. L7_2

    L6_2 = {}

    L7_2 = A2_2.value

    L8_2 = A2_2.citizenid

    L6_2[1] = L7_2

    L6_2[2] = L8_2

    L4_2 = L4_2(L5_2, L6_2)

    L4_2 = L4_2 > 0

    L3_2(L4_2)

  else

    L3_2 = Config

    L3_2 = L3_2.Framework

    if "esx" == L3_2 then

      L3_2 = A1_2

      L4_2 = MySQL

      L4_2 = L4_2.awaitUpdate

      L5_2 = "UPDATE users SET "

      L6_2 = A2_2.column

      L7_2 = " = ? WHERE identifier = ?"

      L5_2 = L5_2 .. L6_2 .. L7_2

      L6_2 = {}

      L7_2 = A2_2.value

      L8_2 = A2_2.citizenid

      L6_2[1] = L7_2

      L6_2[2] = L8_2

      L4_2 = L4_2(L5_2, L6_2)

      L4_2 = L4_2 > 0

      L3_2(L4_2)

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdateCitizenImage"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  L3_2 = Config

  L3_2 = L3_2.Framework

  if "qbcore" == L3_2 then

    L3_2 = A1_2

    L4_2 = MySQL

    L4_2 = L4_2.awaitUpdate

    L5_2 = "UPDATE players SET image = ? WHERE citizenid = ?"

    L6_2 = {}

    L7_2 = A2_2.value

    L8_2 = A2_2.citizenid

    L6_2[1] = L7_2

    L6_2[2] = L8_2

    L4_2 = L4_2(L5_2, L6_2)

    L4_2 = L4_2 > 0

    L3_2(L4_2)

  else

    L3_2 = Config

    L3_2 = L3_2.Framework

    if "esx" == L3_2 then

      L3_2 = A1_2

      L4_2 = MySQL

      L4_2 = L4_2.awaitUpdate

      L5_2 = "UPDATE users SET image = ? WHERE identifier = ?"

      L6_2 = {}

      L7_2 = A2_2.value

      L8_2 = A2_2.citizenid

      L6_2[1] = L7_2

      L6_2[2] = L8_2

      L4_2 = L4_2(L5_2, L6_2)

      L4_2 = L4_2 > 0

      L3_2(L4_2)

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:NewReport"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L2_2 = FW_GetPlayer

  L3_2 = A0_2

  L2_2 = L2_2(L3_2)

  if not L2_2 then

    return

  end

  L3_2 = os

  L3_2 = L3_2.time

  L3_2 = L3_2()

  L3_2 = L3_2 * 1000

  L4_2 = L2_2.PlayerData

  L4_2 = L4_2.charinfo

  L4_2 = L4_2.firstname

  L5_2 = " "

  L6_2 = L2_2.PlayerData

  L6_2 = L6_2.charinfo

  L6_2 = L6_2.lastname

  L7_2 = " ("

  L8_2 = L2_2.PlayerData

  L8_2 = L8_2.metadata

  L8_2 = L8_2.police_badge

  if not L8_2 then

    L8_2 = "0000"

  end

  L9_2 = ")"

  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2

  L5_2 = exports

  L5_2 = L5_2.origen_police

  L6_2 = L5_2

  L5_2 = L5_2.CanOpenTablet

  L7_2 = L2_2.PlayerData

  L7_2 = L7_2.job

  L7_2 = L7_2.name

  L5_2 = L5_2(L6_2, L7_2)

  L5_2 = L5_2[2]

  L6_2 = MySQL

  L6_2 = L6_2.insert

  L7_2 = "INSERT INTO origen_police_reports (title, author, job) VALUES (?, ?, ?)"

  L8_2 = {}

  L9_2 = exports

  L9_2 = L9_2.origen_police

  L10_2 = L9_2

  L9_2 = L9_2.GetConfig

  L11_2 = "Translations"

  L9_2 = L9_2(L10_2, L11_2)

  L9_2 = L9_2.IntroduceName

  L10_2 = L4_2

  L11_2 = L5_2

  L8_2[1] = L9_2

  L8_2[2] = L10_2

  L8_2[3] = L11_2

  function L9_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3

    if A0_3 then

      L1_3 = A1_2

      L2_3 = {}

      L2_3.id = A0_3

      L3_3 = L3_2

      L2_3.date = L3_3

      L3_3 = L4_2

      L2_3.author = L3_3

      L1_3(L2_3)

    else

      L1_3 = TriggerClientEvent

      L2_3 = "origen_police:ShowNotification"

      L3_3 = A0_2

      L4_3 = Config

      L4_3 = L4_3.Translations

      L4_3 = L4_3.ProblemCreateReport

      L1_3(L2_3, L3_3, L4_3)

      L1_3 = A1_2

      L2_3 = false

      L1_3(L2_3)

    end

  end

  L6_2(L7_2, L8_2, L9_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:Get100Reports"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

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

  L3_2 = L3_2[2]

  L4_2 = A1_2

  L5_2 = MySQL

  L5_2 = L5_2.awaitQuery

  L6_2 = "SELECT id, title, author, date, tags FROM origen_police_reports WHERE job = ? ORDER BY id DESC LIMIT 100"

  L7_2 = {}

  L8_2 = L3_2

  L7_2[1] = L8_2

  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2, L7_2)

  L4_2(L5_2, L6_2, L7_2, L8_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:SearchReport"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L3_2 = nil

  L4_2 = FW_GetPlayer

  L5_2 = A0_2

  L4_2 = L4_2(L5_2)

  if not L4_2 then

    return

  end

  L5_2 = exports

  L5_2 = L5_2.origen_police

  L6_2 = L5_2

  L5_2 = L5_2.CanOpenTablet

  L7_2 = L4_2.PlayerData

  L7_2 = L7_2.job

  L7_2 = L7_2.name

  L5_2 = L5_2(L6_2, L7_2)

  L5_2 = L5_2[2]

  L6_2 = A2_2.tags

  if L6_2 then

    L6_2 = A2_2.text

    if "" ~= L6_2 then

      L6_2 = MySQL

      L6_2 = L6_2.awaitQuery

      L7_2 = "SELECT id, title, author, date, tags FROM origen_police_reports WHERE (id LIKE @text OR title LIKE @text OR author LIKE @text) AND job = @job AND tags LIKE @tags ORDER BY id DESC LIMIT 100"

      L8_2 = {}

      L9_2 = "%"

      L10_2 = A2_2.text

      L11_2 = "%"

      L9_2 = L9_2 .. L10_2 .. L11_2

      L8_2["@text"] = L9_2

      L9_2 = "%"

      L10_2 = A2_2.tags

      L11_2 = "%"

      L9_2 = L9_2 .. L10_2 .. L11_2

      L8_2["@tags"] = L9_2

      L8_2["@job"] = L5_2

      L6_2 = L6_2(L7_2, L8_2)

      L3_2 = L6_2

    else

      L6_2 = MySQL

      L6_2 = L6_2.awaitQuery

      L7_2 = "SELECT id, title, author, date, tags FROM origen_police_reports WHERE job = @job AND tags LIKE @tags ORDER BY id DESC LIMIT 100"

      L8_2 = {}

      L8_2["@job"] = L5_2

      L9_2 = "%"

      L10_2 = A2_2.tags

      L11_2 = "%"

      L9_2 = L9_2 .. L10_2 .. L11_2

      L8_2["@tags"] = L9_2

      L6_2 = L6_2(L7_2, L8_2)

      L3_2 = L6_2

    end

  else

    L6_2 = MySQL

    L6_2 = L6_2.awaitQuery

    L7_2 = "SELECT id, title, author, date, tags FROM origen_police_reports WHERE job = @job AND (id LIKE @text OR title LIKE @text OR author LIKE @text) ORDER BY id DESC LIMIT 100"

    L8_2 = {}

    L8_2["@job"] = L5_2

    L9_2 = "%"

    L10_2 = A2_2.text

    L11_2 = "%"

    L9_2 = L9_2 .. L10_2 .. L11_2

    L8_2["@text"] = L9_2

    L6_2 = L6_2(L7_2, L8_2)

    L3_2 = L6_2

  end

  L6_2 = A1_2

  L7_2 = L3_2

  L6_2(L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetReport"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L3_2 = MySQL

  L3_2 = L3_2.awaitQuery

  L4_2 = "SELECT * FROM origen_police_reports WHERE id = ?"

  L5_2 = {}

  L6_2 = A2_2.reportid

  L5_2[1] = L6_2

  L3_2 = L3_2(L4_2, L5_2)

  if L3_2 then

    L4_2 = L3_2[1]

    if L4_2 then

      L4_2 = {}

      L5_2 = GetBillsFromReporter

      L6_2 = A2_2.reportid

      L5_2 = L5_2(L6_2)

      L6_2 = pairs

      L7_2 = L5_2

      L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

      for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

        L12_2 = L11_2.citizenid

        L13_2 = {}

        L14_2 = L11_2.concepts

        L13_2.bills = L14_2

        L14_2 = L11_2.price

        L13_2.price = L14_2

        L14_2 = L11_2.months

        L13_2.months = L14_2

        L4_2[L12_2] = L13_2

      end

      L6_2 = L3_2[1]

      L7_2 = json

      L7_2 = L7_2.decode

      L8_2 = L3_2[1]

      L8_2 = L8_2.implicated

      L7_2 = L7_2(L8_2)

      L6_2.implicated = L7_2

      L6_2 = 1

      L7_2 = L3_2[1]

      L7_2 = L7_2.implicated

      L7_2 = #L7_2

      L8_2 = 1

      for L9_2 = L6_2, L7_2, L8_2 do

        L10_2 = L3_2[1]

        L10_2 = L10_2.implicated

        L10_2 = L10_2[L9_2]

        L11_2 = L3_2[1]

        L11_2 = L11_2.implicated

        L11_2 = L11_2[L9_2]

        L11_2 = L11_2.citizenid

        L11_2 = L4_2[L11_2]

        if not L11_2 then

          L11_2 = {}

        end

        L10_2.bills = L11_2

      end

      L6_2 = L3_2[1]

      L7_2 = json

      L7_2 = L7_2.encode

      L8_2 = L3_2[1]

      L8_2 = L8_2.implicated

      L7_2 = L7_2(L8_2)

      L6_2.implicated = L7_2

      L6_2 = A1_2

      L7_2 = L3_2[1]

      L6_2(L7_2)

  end

  else

    L4_2 = A1_2

    L5_2 = false

    L4_2(L5_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdateReport"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2

  L3_2 = A0_2

  L4_2 = A2_2.key

  if "implicated" == L4_2 then

    L4_2 = true

    L5_2 = 1

    L6_2 = A2_2.value

    L6_2 = #L6_2

    L7_2 = 1

    for L8_2 = L5_2, L6_2, L7_2 do

      L9_2 = A2_2.value

      L9_2 = L9_2[L8_2]

      L9_2 = L9_2.bills

      if L9_2 then

        L9_2 = A2_2.value

        L9_2 = L9_2[L8_2]

        L9_2 = L9_2.billid

        if L9_2 then

          L9_2 = A2_2.value

          L9_2 = L9_2[L8_2]

          L9_2 = L9_2.billid

          if "none" ~= L9_2 then

            goto lbl_65

          end

        end

        L9_2 = FW_GetPlayer

        L10_2 = L3_2

        L9_2 = L9_2(L10_2)

        if not L9_2 then

          return

        end

        L10_2 = L9_2.PlayerData

        L10_2 = L10_2.charinfo

        L10_2 = L10_2.firstname

        L11_2 = " "

        L12_2 = L9_2.PlayerData

        L12_2 = L12_2.charinfo

        L12_2 = L12_2.lastname

        L13_2 = " ("

        L14_2 = L9_2.PlayerData

        L14_2 = L14_2.metadata

        L14_2 = L14_2.police_badge

        if not L14_2 then

          L14_2 = "0000"

        end

        L15_2 = ")"

        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2

        L11_2 = CanOpenTablet

        L12_2 = L9_2.PlayerData

        L12_2 = L12_2.job

        L12_2 = L12_2.name

        L11_2 = L11_2(L12_2)

        L11_2 = L11_2[2]

        L12_2 = NewBillReport

        L13_2 = L8_2

        L14_2 = A2_2

        L15_2 = L10_2

        L16_2 = L11_2

        L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2)

        L4_2 = L12_2

        L12_2 = A2_2.value

        L12_2 = L12_2[L8_2]

        L12_2.billid = L4_2

      ::lbl_65::

      else

        L9_2 = A2_2.value

        L9_2 = L9_2[L8_2]

        L9_2 = L9_2.bills

        if L9_2 then

          L9_2 = A2_2.value

          L9_2 = L9_2[L8_2]

          L9_2 = L9_2.billid

          if L9_2 then

            L9_2 = A2_2.value

            L9_2 = L9_2[L8_2]

            L9_2 = L9_2.billid

            if "none" ~= L9_2 then

              L9_2 = UpdateBillReport

              L10_2 = L8_2

              L11_2 = A2_2

              L9_2 = L9_2(L10_2, L11_2)

              L4_2 = L9_2

            end

          end

        end

      end

      L9_2 = A2_2.value

      L9_2 = L9_2[L8_2]

      L9_2.bills = nil

      L9_2 = A2_2.value

      L9_2 = L9_2[L8_2]

      L9_2.price = nil

      L9_2 = A2_2.value

      L9_2 = L9_2[L8_2]

      L9_2.months = nil

    end

    L5_2 = A2_2.deletedbill

    if L5_2 then

      L5_2 = DeleteBill

      L6_2 = A0_2

      L7_2 = {}

      L8_2 = A2_2.deletedbill

      L7_2.billid = L8_2

      L5_2(L6_2, L7_2)

    end

    L5_2 = MySQL

    L5_2 = L5_2.update

    L6_2 = "UPDATE origen_police_reports SET implicated = ? WHERE id = ?"

    L7_2 = {}

    L8_2 = json

    L8_2 = L8_2.encode

    L9_2 = A2_2.value

    L8_2 = L8_2(L9_2)

    L9_2 = A2_2.reportid

    L7_2[1] = L8_2

    L7_2[2] = L9_2

    function L8_2(A0_3)

      local L1_3, L2_3

      L1_3 = A1_2

      if A0_3 > 0 then

        L2_3 = L4_2

        if L2_3 then

          goto lbl_8

        end

      end

      L2_3 = false

      ::lbl_8::

      L1_3(L2_3)

    end

    L5_2(L6_2, L7_2, L8_2)

  else

    L4_2 = MySQL

    L4_2 = L4_2.update

    L5_2 = "UPDATE origen_police_reports SET `"

    L6_2 = A2_2.key

    L7_2 = "` = ? WHERE id = ?"

    L5_2 = L5_2 .. L6_2 .. L7_2

    L6_2 = {}

    L7_2 = A2_2.value

    L8_2 = A2_2.reportid

    L6_2[1] = L7_2

    L6_2[2] = L8_2

    function L7_2(A0_3)

      local L1_3, L2_3

      L1_3 = A1_2

      L2_3 = A0_3 > 0

      L1_3(L2_3)

    end

    L4_2(L5_2, L6_2, L7_2)

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:DeleteReport"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = A1_2

  L4_2 = MySQL

  L4_2 = L4_2.awaitQuery

  L5_2 = "DELETE FROM origen_police_reports WHERE id = ?"

  L6_2 = {}

  L7_2 = A2_2.reportid

  L6_2[1] = L7_2

  L4_2 = L4_2(L5_2, L6_2)

  L4_2 = L4_2.affectedRows

  L4_2 = L4_2 > 0

  L3_2(L4_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:SendBill"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = A1_2

  L4_2 = sendBill

  L5_2 = A0_2

  L6_2 = A2_2

  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:DeleteBill"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2

  L3_2 = A1_2

  L4_2 = DeleteBill

  L5_2 = A0_2

  L6_2 = A2_2

  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)

  L3_2(L4_2, L5_2, L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:SetPoliceBadge"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2

  L3_2 = FW_GetPlayerFromCitizenid

  L4_2 = A2_2.citizenid

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = string

  L4_2 = L4_2.len

  L5_2 = A2_2.badge

  L4_2 = L4_2(L5_2)

  L5_2 = exports

  L5_2 = L5_2.origen_police

  L6_2 = L5_2

  L5_2 = L5_2.GetConfig

  L7_2 = "PoliceBadgeLength"

  L5_2 = L5_2(L6_2, L7_2)

  if L4_2 > L5_2 then

    L4_2 = A2_2.badge

    L5_2 = L4_2

    L4_2 = L4_2.sub

    L6_2 = 2

    L7_2 = -1

    L4_2 = L4_2(L5_2, L6_2, L7_2)

    A2_2.badge = L4_2

  else

    L4_2 = string

    L4_2 = L4_2.len

    L5_2 = A2_2.badge

    L4_2 = L4_2(L5_2)

    L5_2 = exports

    L5_2 = L5_2.origen_police

    L6_2 = L5_2

    L5_2 = L5_2.GetConfig

    L7_2 = "PoliceBadgeLength"

    L5_2 = L5_2(L6_2, L7_2)

    if L4_2 < L5_2 then

      L4_2 = "0"

      L5_2 = A2_2.badge

      L4_2 = L4_2 .. L5_2

      A2_2.badge = L4_2

    end

  end

  L4_2 = L3_2.Functions

  L4_2 = L4_2.SetMetaData

  L5_2 = "police_badge"

  L6_2 = A2_2.badge

  L4_2(L5_2, L6_2)

  L4_2 = CreateLog

  L5_2 = {}

  L5_2.type = "Management"

  L6_2 = {}

  L7_2 = Config

  L7_2 = L7_2.LogsTranslations

  L7_2 = L7_2.SetBadge

  L7_2 = L7_2.title

  L6_2.title = L7_2

  L7_2 = Config

  L7_2 = L7_2.LogsTranslations

  L7_2 = L7_2.SetBadge

  L7_2 = L7_2.message

  L8_2 = L7_2

  L7_2 = L7_2.format

  L9_2 = L3_2.PlayerData

  L9_2 = L9_2.charinfo

  L9_2 = L9_2.firstname

  L10_2 = " "

  L11_2 = L3_2.PlayerData

  L11_2 = L11_2.charinfo

  L11_2 = L11_2.lastname

  L12_2 = " ("

  L13_2 = A2_2.badge

  if not L13_2 then

    L13_2 = "0000"

  end

  L14_2 = ")"

  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2

  L10_2 = A2_2.badge

  L7_2 = L7_2(L8_2, L9_2, L10_2)

  L6_2.description = L7_2

  L6_2.color = 1791423

  L5_2.embed = L6_2

  L5_2.source = A0_2

  L4_2(L5_2)

  L4_2 = A1_2

  L5_2 = true

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetPoliceList"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2

  L3_2 = {}

  L4_2 = {}

  L5_2 = {}

  L6_2 = FW_GetPlayer

  L7_2 = A0_2

  L6_2 = L6_2(L7_2)

  if not L6_2 then

    L7_2 = A1_2

    L8_2 = {}

    L7_2(L8_2)

    return

  end

  L7_2 = L6_2.PlayerData

  L7_2 = L7_2.job

  L7_2 = L7_2.name

  L8_2 = exports

  L8_2 = L8_2.origen_police

  L9_2 = L8_2

  L8_2 = L8_2.CanOpenTablet

  L10_2 = L7_2

  L8_2 = L8_2(L9_2, L10_2)

  L8_2 = L8_2[2]

  L9_2 = exports

  L9_2 = L9_2.origen_police

  L10_2 = L9_2

  L9_2 = L9_2.GetConfig

  L11_2 = "JobCategory"

  L9_2 = L9_2(L10_2, L11_2)

  L9_2 = L9_2[L8_2]

  L10_2 = Config

  L10_2 = L10_2.Framework

  if "qbcore" == L10_2 then

    L10_2 = pairs

    L11_2 = L9_2

    L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)

    for L14_2, L15_2 in L10_2, L11_2, L12_2, L13_2 do

      L16_2 = Framework

      L16_2 = L16_2.Functions

      L16_2 = L16_2.GetPlayersOnDuty

      L17_2 = L15_2.name

      L16_2, L17_2 = L16_2(L17_2)

      L18_2 = pairs

      L19_2 = L16_2

      L18_2, L19_2, L20_2, L21_2 = L18_2(L19_2)

      for L22_2, L23_2 in L18_2, L19_2, L20_2, L21_2 do

        L24_2 = table

        L24_2 = L24_2.insert

        L25_2 = L5_2

        L26_2 = L23_2

        L24_2(L25_2, L26_2)

      end

    end

  else

    L10_2 = Config

    L10_2 = L10_2.Framework

    if "esx" == L10_2 then

      if nil == L9_2 then

        L10_2 = A1_2

        L11_2 = {}

        L10_2(L11_2)

        L10_2 = print

        L11_2 = "CANT FIND JOBS IN CONFIG WITH CATEGORY: "

        L12_2 = L8_2

        L10_2(L11_2, L12_2)

        return

      end

      L10_2 = GetResourceState

      L11_2 = "origen_police"

      L10_2 = L10_2(L11_2)

      if "started" == L10_2 then

        L10_2 = exports

        L10_2 = L10_2.origen_police

        L11_2 = L10_2

        L10_2 = L10_2.GetPlayersInDuty

        L12_2 = L8_2

        L10_2 = L10_2(L11_2, L12_2)

        L5_2 = L10_2 or L5_2

      end

      if not L10_2 then

        L10_2 = {}

        L5_2 = L10_2

      end

    else

      L10_2 = A1_2

      L11_2 = {}

      L10_2(L11_2)

      L10_2 = print

      L11_2 = "CANT FIND FRAMEWORK IN CONFIG"

      L10_2(L11_2)

      return

    end

  end

  L10_2 = 1

  L11_2 = #L5_2

  L12_2 = 1

  for L13_2 = L10_2, L11_2, L12_2 do

    L14_2 = pcall

    function L15_2()

      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

      L0_3 = FW_GetPlayer

      L2_3 = L13_2

      L1_3 = L5_2

      L1_3 = L1_3[L2_3]

      L0_3 = L0_3(L1_3)

      if L0_3 then

        L1_3 = L0_3.PlayerData

        if L1_3 then

          L1_3 = MySQL

          L1_3 = L1_3.awaitQuery

          L2_3 = "SELECT image FROM "

          L3_3 = Config

          L3_3 = L3_3.Framework

          if "qbcore" == L3_3 then

            L3_3 = "players"

            if L3_3 then

              goto lbl_22

            end

          end

          L3_3 = "users"

          ::lbl_22::

          L4_3 = " WHERE "

          L5_3 = Config

          L5_3 = L5_3.Framework

          if "qbcore" == L5_3 then

            L5_3 = "citizenid"

            if L5_3 then

              goto lbl_31

            end

          end

          L5_3 = "identifier"

          ::lbl_31::

          L6_3 = " = ?"

          L2_3 = L2_3 .. L3_3 .. L4_3 .. L5_3 .. L6_3

          L3_3 = {}

          L4_3 = L0_3.PlayerData

          L4_3 = L4_3.citizenid

          L3_3[1] = L4_3

          L1_3 = L1_3(L2_3, L3_3)

          L2_3 = L1_3[1]

          if L2_3 then

            L2_3 = L1_3[1]

            L2_3 = L2_3.image

            if L2_3 then

              goto lbl_47

              L1_3 = L2_3 or L1_3

            end

          end

          L1_3 = nil

          ::lbl_47::

          L2_3 = ""

          L3_3 = pairs

          L4_3 = L9_2

          L3_3, L4_3, L5_3, L6_3 = L3_3(L4_3)

          for L7_3, L8_3 in L3_3, L4_3, L5_3, L6_3 do

            L9_3 = L8_3.name

            L10_3 = L0_3.PlayerData

            L10_3 = L10_3.job

            L10_3 = L10_3.name

            if L9_3 == L10_3 then

              L2_3 = L8_3.titleListLabel

              break

            end

          end

          L3_3 = table

          L3_3 = L3_3.insert

          L4_3 = L3_2

          L5_3 = {}

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.citizenid

          L5_3.citizenid = L6_3

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.charinfo

          L6_3 = L6_3.firstname

          L5_3.firstname = L6_3

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.charinfo

          L6_3 = L6_3.lastname

          L5_3.lastname = L6_3

          L5_3.image = L1_3

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.metadata

          if L6_3 then

            L6_3 = L0_3.PlayerData

            L6_3 = L6_3.metadata

            L6_3 = L6_3.police_badge

            if L6_3 then

              goto lbl_93

            end

            L6_3 = "0000"

            if L6_3 then

              goto lbl_93

            end

          end

          L6_3 = "0000"

          ::lbl_93::

          L5_3.badge = L6_3

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.job

          L6_3 = L6_3.grade

          L6_3 = L6_3.name

          L5_3.grade = L6_3

          L6_3 = L0_3.PlayerData

          L6_3 = L6_3.job

          L6_3 = L6_3.name

          L5_3.job = L6_3

          L6_3 = L2_3 or L6_3

          if not L2_3 then

            L6_3 = "x List"

          end

          L5_3.titleLabel = L6_3

          L3_3(L4_3, L5_3)

          L3_3 = L0_3.PlayerData

          L4_3 = L3_3.citizenid

          L3_3 = L4_2

          L3_3[L4_3] = true

        end

      end

    end

    L14_2, L15_2 = L14_2(L15_2)

    if not L14_2 then

      L16_2 = print

      L17_2 = "[ERROR] Error procesando jugador QB/ESX: "

      L18_2 = tostring

      L19_2 = L15_2

      L18_2 = L18_2(L19_2)

      L17_2 = L17_2 .. L18_2

      L16_2(L17_2)

    end

  end

  function L10_2(A0_3)

    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3

    L1_3 = 1

    L2_3 = #A0_3

    L3_3 = 1

    for L4_3 = L1_3, L2_3, L3_3 do

      L5_3 = pcall

      function L6_3()

        local L0_4, L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4, L14_4

        L0_4 = Config

        L0_4 = L0_4.Framework

        if "qbcore" == L0_4 then

          L1_4 = L4_3

          L0_4 = A0_3

          L0_4 = L0_4[L1_4]

          L0_4 = L0_4.citizenid

          if L0_4 then

            goto lbl_15

          end

        end

        L1_4 = L4_3

        L0_4 = A0_3

        L0_4 = L0_4[L1_4]

        L0_4 = L0_4.identifier

        ::lbl_15::

        L1_4 = L4_2

        L1_4 = L1_4[L0_4]

        if not L1_4 then

          L1_4 = FW_GetPlayerFromCitizenid

          L2_4 = L0_4

          L1_4 = L1_4(L2_4)

          L2_4 = nil

          L3_4 = nil

          L4_4 = nil

          L5_4 = nil

          if L1_4 then

            L6_4 = L1_4.PlayerData

            if L6_4 then

              L6_4 = L1_4.PlayerData

              L2_4 = L6_4.charinfo

              L6_4 = L1_4.PlayerData

              L6_4 = L6_4.metadata

              L3_4 = L6_4 or L3_4

              if not L6_4 then

                L6_4 = {}

                L3_4 = L6_4

              end

              L6_4 = L1_4.PlayerData

              L4_4 = L6_4.job

              L6_4 = L4_4.grade

              L5_4 = L6_4.name

          end

          else

            L6_4 = json

            L6_4 = L6_4.decode

            L8_4 = L4_3

            L7_4 = A0_3

            L7_4 = L7_4[L8_4]

            L7_4 = L7_4.charinfo

            if not L7_4 then

              L7_4 = "{}"

            end

            L6_4 = L6_4(L7_4)

            L2_4 = L6_4

            L6_4 = json

            L6_4 = L6_4.decode

            L8_4 = L4_3

            L7_4 = A0_3

            L7_4 = L7_4[L8_4]

            L7_4 = L7_4.metadata

            if not L7_4 then

              L7_4 = "{}"

            end

            L6_4 = L6_4(L7_4)

            L3_4 = L6_4

            L6_4 = json

            L6_4 = L6_4.decode

            L8_4 = L4_3

            L7_4 = A0_3

            L7_4 = L7_4[L8_4]

            L7_4 = L7_4.job

            if not L7_4 then

              L7_4 = "{}"

            end

            L6_4 = L6_4(L7_4)

            L4_4 = L6_4

            L7_4 = L4_3

            L6_4 = A0_3

            L6_4 = L6_4[L7_4]

            L6_4 = L6_4.job_grade

            L5_4 = L6_4 or L5_4

            if not L6_4 then

              L5_4 = "unknown"

            end

          end

          L6_4 = nil

          L7_4 = pairs

          L8_4 = L9_2

          L7_4, L8_4, L9_4, L10_4 = L7_4(L8_4)

          for L11_4, L12_4 in L7_4, L8_4, L9_4, L10_4 do

            L13_4 = L12_4.name

            L14_4 = L4_4.name

            if L13_4 == L14_4 then

              L6_4 = L12_4.titleListLabel

              break

            end

          end

          if nil ~= L6_4 then

            L7_4 = table

            L7_4 = L7_4.insert

            L8_4 = L3_2

            L9_4 = {}

            L9_4.citizenid = L0_4

            L10_4 = L2_4.firstname

            if not L10_4 then

              L10_4 = "Unknown"

            end

            L9_4.firstname = L10_4

            L10_4 = L2_4.lastname

            if not L10_4 then

              L10_4 = "Unknown"

            end

            L9_4.lastname = L10_4

            L11_4 = L4_3

            L10_4 = A0_3

            L10_4 = L10_4[L11_4]

            L10_4 = L10_4.image

            if not L10_4 then

              L10_4 = nil

            end

            L9_4.image = L10_4

            L10_4 = L3_4.police_badge

            if not L10_4 then

              L10_4 = "0000"

            end

            L9_4.badge = L10_4

            L9_4.grade = L5_4

            L10_4 = L4_4.name

            if not L10_4 then

              L10_4 = "unknown"

            end

            L9_4.job = L10_4

            L9_4.titleLabel = L6_4

            L7_4(L8_4, L9_4)

          end

        end

      end

      L5_3, L6_3 = L5_3(L6_3)

      if not L5_3 then

        L7_3 = print

        L8_3 = "[ERROR] Error procesando registro offline: "

        L9_3 = tostring

        L10_3 = L6_3

        L9_3 = L9_3(L10_3)

        L8_3 = L8_3 .. L9_3

        L7_3(L8_3)

      end

    end

  end

  if L9_2 then

    L11_2 = ""

    L12_2 = pairs

    L13_2 = L9_2

    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)

    for L16_2, L17_2 in L12_2, L13_2, L14_2, L15_2 do

      L18_2 = L11_2

      L19_2 = "job LIKE '%"

      L20_2 = L17_2.name

      L21_2 = "%' OR "

      L18_2 = L18_2 .. L19_2 .. L20_2 .. L21_2

      L11_2 = L18_2

    end

    L13_2 = L11_2

    L12_2 = L11_2.sub

    L14_2 = 1

    L15_2 = -5

    L12_2 = L12_2(L13_2, L14_2, L15_2)

    L11_2 = L12_2

    L12_2 = GetPoliceList

    L13_2 = L11_2

    L12_2 = L12_2(L13_2)

    if L12_2 then

      L13_2 = L10_2

      L14_2 = L12_2

      L13_2(L14_2)

    end

  end

  L11_2 = table

  L11_2 = L11_2.sort

  L12_2 = L3_2

  function L13_2(A0_3, A1_3)

    local L2_3, L3_3, L4_3

    L2_3 = A0_3.firstname

    L3_3 = A0_3.lastname

    L2_3 = L2_3 .. L3_3

    L3_3 = A1_3.firstname

    L4_3 = A1_3.lastname

    L3_3 = L3_3 .. L4_3

    L2_3 = L2_3 < L3_3

    return L2_3

  end

  L11_2(L12_2, L13_2)

  L11_2 = A1_2

  L12_2 = L3_2

  L11_2(L12_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetPolice"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L3_2 = FW_GetPlayerFromCitizenid

  L4_2 = A2_2.citizenid

  L3_2 = L3_2(L4_2)

  L4_2 = false

  if L3_2 then

    L5_2 = L3_2.PlayerData

    L5_2 = L5_2.source

    if nil ~= L5_2 then

      L5_2 = MySQL

      L5_2 = L5_2.awaitQuery

      L6_2 = "SELECT image FROM "

      L7_2 = Config

      L7_2 = L7_2.Framework

      if "qbcore" == L7_2 then

        L7_2 = "players"

        if L7_2 then

          goto lbl_22

        end

      end

      L7_2 = "users"

      ::lbl_22::

      L8_2 = " WHERE "

      L9_2 = Config

      L9_2 = L9_2.Framework

      if "qbcore" == L9_2 then

        L9_2 = "citizenid"

        if L9_2 then

          goto lbl_31

        end

      end

      L9_2 = "identifier"

      ::lbl_31::

      L10_2 = " = ?"

      L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2

      L7_2 = {}

      L8_2 = L3_2.PlayerData

      L8_2 = L8_2.citizenid

      L7_2[1] = L8_2

      L5_2 = L5_2(L6_2, L7_2)

      L6_2 = L5_2[1]

      if L6_2 then

        L6_2 = L5_2[1]

        L5_2 = L6_2.image

      else

        L5_2 = nil

      end

      L6_2 = Framework

      L6_2 = L6_2.Shared

      L6_2 = L6_2.Jobs

      L7_2 = L3_2.PlayerData

      L7_2 = L7_2.job

      L7_2 = L7_2.name

      L6_2 = L6_2[L7_2]

      L7_2 = L3_2.PlayerData

      L7_2 = L7_2.job

      L7_2 = L7_2.grade

      L7_2 = L7_2.name

      L8_2 = Config

      L8_2 = L8_2.Framework

      if "esx" == L8_2 and L6_2 then

        L8_2 = L6_2.grades

        L9_2 = tostring

        L10_2 = L3_2.PlayerData

        L10_2 = L10_2.job

        L10_2 = L10_2.grade

        L10_2 = L10_2.level

        L9_2 = L9_2(L10_2)

        L8_2 = L8_2[L9_2]

        if L8_2 then

          L8_2 = L6_2.grades

          L9_2 = tostring

          L10_2 = L3_2.PlayerData

          L10_2 = L10_2.job

          L10_2 = L10_2.grade

          L10_2 = L10_2.level

          L9_2 = L9_2(L10_2)

          L8_2 = L8_2[L9_2]

          L7_2 = L8_2.label

        end

      end

      if L6_2 then

        L8_2 = L6_2.grades

        L9_2 = tostring

        L10_2 = L3_2.PlayerData

        L10_2 = L10_2.job

        L10_2 = L10_2.grade

        L10_2 = L10_2.level

        L9_2 = L9_2(L10_2)

        L8_2 = L8_2[L9_2]

        if L8_2 then

          L8_2 = L6_2.grades

          L9_2 = tostring

          L10_2 = L3_2.PlayerData

          L10_2 = L10_2.job

          L10_2 = L10_2.grade

          L10_2 = L10_2.level

          L9_2 = L9_2(L10_2)

          L8_2 = L8_2[L9_2]

          L8_2 = L8_2.type

          if L8_2 then

            goto lbl_106

          end

        end

      end

      L8_2 = "unk"

      ::lbl_106::

      L9_2 = GetPhoneFromIdentifier

      L10_2 = L3_2.PlayerData

      L10_2 = L10_2.citizenid

      L9_2 = L9_2(L10_2)

      L10_2 = {}

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.citizenid

      L10_2.citizenid = L11_2

      L10_2.image = L5_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.charinfo

      L11_2 = L11_2.firstname

      L10_2.firstname = L11_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.charinfo

      L11_2 = L11_2.lastname

      L10_2.lastname = L11_2

      L10_2.phone = L9_2

      L11_2 = GetPlayerBankNumber

      L12_2 = L3_2.PlayerData

      L12_2 = L12_2.citizenid

      L13_2 = L3_2.PlayerData

      L13_2 = L13_2.charinfo

      L13_2 = L13_2.account

      L11_2 = L11_2(L12_2, L13_2)

      L10_2.iban = L11_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.charinfo

      L11_2 = L11_2.birthdate

      L10_2.birthdate = L11_2

      L11_2 = Config

      L11_2 = L11_2.Framework

      if "qbcore" == L11_2 then

        L11_2 = L3_2.PlayerData

        L11_2 = L11_2.charinfo

        L11_2 = L11_2.nationality

        if L11_2 then

          goto lbl_150

        end

      end

      L11_2 = GetPlayerNationality

      L12_2 = L3_2.PlayerData

      L12_2 = L12_2.citizenid

      L11_2 = L11_2(L12_2)

      ::lbl_150::

      L10_2.nationality = L11_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.metadata

      L11_2 = L11_2.police_badge

      if not L11_2 then

        L11_2 = "0000"

      end

      L10_2.badge = L11_2

      L11_2 = GetGender

      L12_2 = L3_2.PlayerData

      L12_2 = L12_2.charinfo

      L12_2 = L12_2.gender

      L11_2 = L11_2(L12_2)

      L10_2.gender = L11_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.metadata

      L11_2 = L11_2.condecorates

      if not L11_2 then

        L11_2 = {}

      end

      L10_2.condecorates = L11_2

      L11_2 = L3_2.PlayerData

      L11_2 = L11_2.metadata

      L11_2 = L11_2.divisions

      if not L11_2 then

        L11_2 = {}

      end

      L10_2.divisions = L11_2

      L10_2.department = L8_2

      L10_2.grade = L7_2

      L4_2 = L10_2

  end

  else

    L5_2 = Config

    L5_2 = L5_2.Framework

    if "qbcore" == L5_2 then

      L5_2 = GetPolice

      L6_2 = A2_2.citizenid

      L5_2 = L5_2(L6_2)

      L6_2 = L5_2[1]

      if not L6_2 then

        goto lbl_413

      end

      L6_2 = json

      L6_2 = L6_2.decode

      L7_2 = L5_2[1]

      L7_2 = L7_2.charinfo

      L6_2 = L6_2(L7_2)

      L7_2 = json

      L7_2 = L7_2.decode

      L8_2 = L5_2[1]

      L8_2 = L8_2.job

      L7_2 = L7_2(L8_2)

      L8_2 = json

      L8_2 = L8_2.decode

      L9_2 = L5_2[1]

      L9_2 = L9_2.metadata

      L8_2 = L8_2(L9_2)

      L9_2 = GetPhoneFromIdentifier

      L10_2 = L5_2[1]

      L10_2 = L10_2.citizenid

      L9_2 = L9_2(L10_2)

      L10_2 = {}

      L11_2 = L5_2[1]

      L11_2 = L11_2.citizenid

      L10_2.citizenid = L11_2

      L11_2 = L5_2[1]

      L11_2 = L11_2.image

      L10_2.image = L11_2

      L11_2 = L6_2.firstname

      L10_2.firstname = L11_2

      L11_2 = L6_2.lastname

      L10_2.lastname = L11_2

      L10_2.phone = L9_2

      L11_2 = GetPlayerBankNumber

      L12_2 = L5_2[1]

      L12_2 = L12_2.citizenid

      L13_2 = L6_2.account

      L11_2 = L11_2(L12_2, L13_2)

      L10_2.iban = L11_2

      L11_2 = L6_2.birthdate

      L10_2.birthdate = L11_2

      L11_2 = L6_2.nationality

      L10_2.nationality = L11_2

      L11_2 = L8_2.police_badge

      if not L11_2 then

        L11_2 = "0000"

      end

      L10_2.badge = L11_2

      L11_2 = GetGender

      L12_2 = L6_2.gender

      L11_2 = L11_2(L12_2)

      L10_2.gender = L11_2

      L11_2 = L8_2.condecorates

      if not L11_2 then

        L11_2 = {}

      end

      L10_2.condecorates = L11_2

      L11_2 = L8_2.divisions

      if not L11_2 then

        L11_2 = {}

      end

      L10_2.divisions = L11_2

      L11_2 = Framework

      L11_2 = L11_2.Shared

      L11_2 = L11_2.Jobs

      L12_2 = L7_2.name

      L11_2 = L11_2[L12_2]

      if L11_2 then

        L11_2 = Framework

        L11_2 = L11_2.Shared

        L11_2 = L11_2.Jobs

        L12_2 = L7_2.name

        L11_2 = L11_2[L12_2]

        L11_2 = L11_2.grades

        L12_2 = tostring

        L13_2 = L7_2.grade

        L13_2 = L13_2.level

        L12_2 = L12_2(L13_2)

        L11_2 = L11_2[L12_2]

        if L11_2 then

          L11_2 = Framework

          L11_2 = L11_2.Shared

          L11_2 = L11_2.Jobs

          L12_2 = L7_2.name

          L11_2 = L11_2[L12_2]

          L11_2 = L11_2.grades

          L12_2 = tostring

          L13_2 = L7_2.grade

          L13_2 = L13_2.level

          L12_2 = L12_2(L13_2)

          L11_2 = L11_2[L12_2]

          L11_2 = L11_2.type

          if L11_2 then

            goto lbl_292

          end

        end

      end

      L11_2 = "lspd"

      ::lbl_292::

      L10_2.department = L11_2

      L11_2 = L7_2.grade

      L11_2 = L11_2.name

      L10_2.grade = L11_2

      L4_2 = L10_2

    else

      L5_2 = Config

      L5_2 = L5_2.Framework

      if "esx" == L5_2 then

        L5_2 = GetPolice

        L6_2 = A2_2.citizenid

        L5_2 = L5_2(L6_2)

        L6_2 = L5_2[1]

        if L6_2 then

          L6_2 = GetPhoneFromIdentifier

          L7_2 = L5_2[1]

          L7_2 = L7_2.identifier

          L6_2 = L6_2(L7_2)

          L7_2 = Framework

          L7_2 = L7_2.Shared

          L7_2 = L7_2.Jobs

          L8_2 = L3_2.PlayerData

          L8_2 = L8_2.job

          L8_2 = L8_2.name

          L7_2 = L7_2[L8_2]

          L8_2 = L3_2.Functions

          L8_2 = L8_2.GetMetaData

          L8_2 = L8_2()

          L9_2 = "XXXXXXXXX"

          if L7_2 then

            L10_2 = L7_2.grades

            L11_2 = tostring

            L12_2 = L5_2[1]

            L12_2 = L12_2.job_grade

            L11_2 = L11_2(L12_2)

            L10_2 = L10_2[L11_2]

            if L10_2 then

              L10_2 = L7_2.grades

              L11_2 = tostring

              L12_2 = L5_2[1]

              L12_2 = L12_2.job_grade

              L11_2 = L11_2(L12_2)

              L10_2 = L10_2[L11_2]

              L9_2 = L10_2.label

            end

          end

          L10_2 = {}

          L11_2 = L5_2[1]

          L11_2 = L11_2.identifier

          L10_2.citizenid = L11_2

          L11_2 = L5_2[1]

          L11_2 = L11_2.image

          L10_2.image = L11_2

          L11_2 = L5_2[1]

          L11_2 = L11_2.firstname

          L10_2.firstname = L11_2

          L11_2 = L5_2[1]

          L11_2 = L11_2.lastname

          L10_2.lastname = L11_2

          L10_2.phone = L6_2

          L11_2 = GetPlayerBankNumber

          L12_2 = L5_2[1]

          L12_2 = L12_2.identifier

          L11_2 = L11_2(L12_2)

          L10_2.iban = L11_2

          L11_2 = L5_2[1]

          L11_2 = L11_2.dateofbirth

          L10_2.birthdate = L11_2

          L11_2 = GetPlayerNationality

          L12_2 = L5_2[1]

          L12_2 = L12_2.identifier

          L11_2 = L11_2(L12_2)

          L10_2.nationality = L11_2

          L11_2 = L8_2.police_badge

          if not L11_2 then

            L11_2 = "0000"

          end

          L10_2.badge = L11_2

          L11_2 = GetGender

          L12_2 = L5_2[1]

          L12_2 = L12_2.sex

          L11_2 = L11_2(L12_2)

          L10_2.gender = L11_2

          L11_2 = L8_2.condecorates

          if not L11_2 then

            L11_2 = {}

          end

          L10_2.condecorates = L11_2

          L11_2 = L8_2.divisions

          if not L11_2 then

            L11_2 = {}

          end

          L10_2.divisions = L11_2

          if L7_2 then

            L11_2 = L7_2.grades

            L12_2 = tostring

            L13_2 = L5_2[1]

            L13_2 = L13_2.job_grade

            L12_2 = L12_2(L13_2)

            L11_2 = L11_2[L12_2]

            if L11_2 then

              L11_2 = L7_2.grades

              L12_2 = tostring

              L13_2 = L5_2[1]

              L13_2 = L13_2.job_grade

              L12_2 = L12_2(L13_2)

              L11_2 = L11_2[L12_2]

              L11_2 = L11_2.type

              if L11_2 then

                goto lbl_410

              end

            end

          end

          L11_2 = "lspd"

          ::lbl_410::

          L10_2.department = L11_2

          L10_2.grade = L9_2

          L4_2 = L10_2

        end

      end

    end

  end

  ::lbl_413::

  if L4_2 then

    L5_2 = MySQL

    L5_2 = L5_2.awaitQuery

    L6_2 = "SELECT * FROM origen_police_notes WHERE citizenid = ? ORDER BY id DESC"

    L7_2 = {}

    L8_2 = A2_2.citizenid

    L9_2 = "-police"

    L8_2 = L8_2 .. L9_2

    L7_2[1] = L8_2

    L5_2 = L5_2(L6_2, L7_2)

    L4_2.notes = L5_2

    L5_2 = MySQL

    L5_2 = L5_2.awaitQuery

    L6_2 = "SELECT id, title FROM origen_police_reports WHERE cops LIKE @citizenid OR author LIKE @name ORDER BY id DESC"

    L7_2 = {}

    L8_2 = "%"

    L9_2 = A2_2.citizenid

    L10_2 = "%"

    L8_2 = L8_2 .. L9_2 .. L10_2

    L7_2["@citizenid"] = L8_2

    L8_2 = "%"

    L9_2 = L4_2.firstname

    L10_2 = " "

    L11_2 = L4_2.lastname

    L12_2 = "%"

    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2

    L7_2["@name"] = L8_2

    L5_2 = L5_2(L6_2, L7_2)

    L4_2.reports = L5_2

  end

  L5_2 = A1_2

  L6_2 = L4_2

  L5_2(L6_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdatePoliceMetaData"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = FW_GetPlayerFromCitizenid

  L4_2 = A2_2.citizenid

  L3_2 = L3_2(L4_2)

  if L3_2 then

    L4_2 = L3_2.PlayerData

    if L4_2 then

      goto lbl_13

    end

  end

  L4_2 = A1_2

  L5_2 = false

  do return L4_2(L5_2) end

  ::lbl_13::

  L4_2 = L3_2.PlayerData

  L4_2 = L4_2.metadata

  L5_2 = A2_2.type

  L4_2 = L4_2[L5_2]

  if not L4_2 then

    L4_2 = L3_2.PlayerData

    L4_2 = L4_2.metadata

    L5_2 = A2_2.type

    L6_2 = {}

    L4_2[L5_2] = L6_2

  end

  L4_2 = L3_2.PlayerData

  L4_2 = L4_2.metadata

  L5_2 = A2_2.type

  L4_2 = L4_2[L5_2]

  L5_2 = A2_2.id

  L6_2 = A2_2.value

  L4_2[L5_2] = L6_2

  L4_2 = L3_2.Functions

  L4_2 = L4_2.SetMetaData

  L5_2 = A2_2.type

  L6_2 = L3_2.PlayerData

  L6_2 = L6_2.metadata

  L7_2 = A2_2.type

  L6_2 = L6_2[L7_2]

  L4_2(L5_2, L6_2)

  L4_2 = L3_2.PlayerData

  L4_2 = L4_2.source

  if not L4_2 then

    L4_2 = L3_2.Functions

    L4_2 = L4_2.Save

    if L4_2 then

      L4_2 = L3_2.Functions

      L4_2 = L4_2.Save

      L4_2()

    end

  end

  L4_2 = A1_2

  L5_2 = true

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetBusqueda"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L2_2 = Config

  L2_2 = L2_2.Framework

  if "qbcore" == L2_2 then

    L2_2 = GetWanted

    L2_2, L3_2 = L2_2()

    L4_2 = 1

    L5_2 = #L2_2

    L6_2 = 1

    for L7_2 = L4_2, L5_2, L6_2 do

      L8_2 = L2_2[L7_2]

      L9_2 = json

      L9_2 = L9_2.decode

      L10_2 = L2_2[L7_2]

      L10_2 = L10_2.charinfo

      L9_2 = L9_2(L10_2)

      L8_2.charinfo = L9_2

      L8_2 = table

      L8_2 = L8_2.insert

      L9_2 = L3_2

      L10_2 = {}

      L11_2 = L2_2[L7_2]

      L11_2 = L11_2.citizenid

      L10_2.citizenid = L11_2

      L11_2 = L2_2[L7_2]

      L11_2 = L11_2.charinfo

      L11_2 = L11_2.firstname

      L12_2 = " "

      L13_2 = L2_2[L7_2]

      L13_2 = L13_2.charinfo

      L13_2 = L13_2.lastname

      L11_2 = L11_2 .. L12_2 .. L13_2

      L10_2.name = L11_2

      L11_2 = L2_2[L7_2]

      L11_2 = L11_2.image

      L10_2.image = L11_2

      L8_2(L9_2, L10_2)

    end

    L4_2 = A1_2

    L5_2 = L3_2

    L4_2(L5_2)

  else

    L2_2 = Config

    L2_2 = L2_2.Framework

    if "esx" == L2_2 then

      L2_2 = GetWanted

      L2_2, L3_2 = L2_2()

      L4_2 = 1

      L5_2 = #L2_2

      L6_2 = 1

      for L7_2 = L4_2, L5_2, L6_2 do

        L8_2 = table

        L8_2 = L8_2.insert

        L9_2 = L3_2

        L10_2 = {}

        L11_2 = L2_2[L7_2]

        L11_2 = L11_2.identifier

        L10_2.citizenid = L11_2

        L11_2 = L2_2[L7_2]

        L11_2 = L11_2.firstname

        L12_2 = " "

        L13_2 = L2_2[L7_2]

        L13_2 = L13_2.lastname

        L11_2 = L11_2 .. L12_2 .. L13_2

        L10_2.name = L11_2

        L11_2 = L2_2[L7_2]

        L11_2 = L11_2.image

        L10_2.image = L11_2

        L8_2(L9_2, L10_2)

      end

      L4_2 = A1_2

      L5_2 = L3_2

      L4_2(L5_2)

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetMorosos"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2

  L2_2 = A0_2

  L3_2 = FW_GetPlayer

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = CanOpenTablet

  L5_2 = L3_2.PlayerData

  L5_2 = L5_2.job

  L5_2 = L5_2.name

  L4_2 = L4_2(L5_2)

  L4_2 = L4_2[2]

  L5_2 = Config

  L5_2 = L5_2.Framework

  if "qbcore" == L5_2 then

    L5_2 = GetDebors

    L6_2 = L4_2

    L5_2 = L5_2(L6_2)

    L6_2 = {}

    L7_2 = 1

    L8_2 = #L5_2

    L9_2 = 1

    for L10_2 = L7_2, L8_2, L9_2 do

      L11_2 = L5_2[L10_2]

      L12_2 = json

      L12_2 = L12_2.decode

      L13_2 = L5_2[L10_2]

      L13_2 = L13_2.charinfo

      L12_2 = L12_2(L13_2)

      L11_2.charinfo = L12_2

      L11_2 = table

      L11_2 = L11_2.insert

      L12_2 = L6_2

      L13_2 = {}

      L14_2 = L5_2[L10_2]

      L14_2 = L14_2.citizenid

      L13_2.citizenid = L14_2

      L14_2 = L5_2[L10_2]

      L14_2 = L14_2.totalprice

      L13_2.price = L14_2

      L14_2 = L5_2[L10_2]

      L14_2 = L14_2.charinfo

      L14_2 = L14_2.firstname

      L15_2 = " "

      L16_2 = L5_2[L10_2]

      L16_2 = L16_2.charinfo

      L16_2 = L16_2.lastname

      L14_2 = L14_2 .. L15_2 .. L16_2

      L13_2.name = L14_2

      L14_2 = L5_2[L10_2]

      L14_2 = L14_2.image

      L13_2.image = L14_2

      L11_2(L12_2, L13_2)

    end

    L7_2 = table

    L7_2 = L7_2.sort

    L8_2 = L6_2

    function L9_2(A0_3, A1_3)

      local L2_3, L3_3

      L2_3 = A0_3.price

      L3_3 = A1_3.price

      L2_3 = L2_3 > L3_3

      return L2_3

    end

    L7_2(L8_2, L9_2)

    L7_2 = A1_2

    L8_2 = L6_2

    L7_2(L8_2)

  else

    L5_2 = Config

    L5_2 = L5_2.Framework

    if "esx" == L5_2 then

      L5_2 = GetDebors

      L6_2 = L4_2

      L5_2 = L5_2(L6_2)

      L6_2 = {}

      L7_2 = 1

      L8_2 = #L5_2

      L9_2 = 1

      for L10_2 = L7_2, L8_2, L9_2 do

        L11_2 = table

        L11_2 = L11_2.insert

        L12_2 = L6_2

        L13_2 = {}

        L14_2 = L5_2[L10_2]

        L14_2 = L14_2.citizenid

        L13_2.citizenid = L14_2

        L14_2 = L5_2[L10_2]

        L14_2 = L14_2.totalprice

        L13_2.price = L14_2

        L14_2 = L5_2[L10_2]

        L14_2 = L14_2.firstname

        L15_2 = " "

        L16_2 = L5_2[L10_2]

        L16_2 = L16_2.lastname

        L14_2 = L14_2 .. L15_2 .. L16_2

        L13_2.name = L14_2

        L14_2 = L5_2[L10_2]

        L14_2 = L14_2.image

        L13_2.image = L14_2

        L11_2(L12_2, L13_2)

      end

      L7_2 = table

      L7_2 = L7_2.sort

      L8_2 = L6_2

      function L9_2(A0_3, A1_3)

        local L2_3, L3_3

        L2_3 = A0_3.price

        L3_3 = A1_3.price

        L2_3 = L2_3 > L3_3

        return L2_3

      end

      L7_2(L8_2, L9_2)

      L7_2 = A1_2

      L8_2 = L6_2

      L7_2(L8_2)

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:GetVehicle"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2

  L3_2 = false

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = GetDataFromVehicle

    L5_2 = A2_2.plate

    L4_2 = L4_2(L5_2)

    L5_2 = L4_2[1]

    if not L5_2 then

      goto lbl_111

    end

    L5_2 = json

    L5_2 = L5_2.decode

    L6_2 = L4_2[1]

    L6_2 = L6_2.charinfo

    L5_2 = L5_2(L6_2)

    if L5_2 then

      L6_2 = L5_2.firstname

      L7_2 = " "

      L8_2 = L5_2.lastname

      L9_2 = " ("

      L10_2 = L4_2[1]

      L10_2 = L10_2.citizenid

      L11_2 = ")"

      L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2

      if L6_2 then

        goto lbl_30

      end

    end

    L6_2 = false

    ::lbl_30::

    if not L6_2 then

      L6_2 = "Desconocido"

    end

    L7_2 = {}

    L8_2 = L4_2[1]

    L8_2 = L8_2.hash

    L7_2.hash = L8_2

    L8_2 = L4_2[1]

    L8_2 = L8_2.plate

    L7_2.plate = L8_2

    L7_2.owner = L6_2

    L8_2 = L4_2[1]

    L8_2 = L8_2.garage

    if L8_2 then

      L8_2 = L4_2[1]

      L8_2 = L8_2.garage

      if L8_2 then

        goto lbl_51

      end

    end

    L8_2 = "Outside"

    ::lbl_51::

    L7_2.garage = L8_2

    L8_2 = L4_2[1]

    L8_2 = L8_2.wanted

    L7_2.wanted = L8_2

    L8_2 = L4_2[1]

    L8_2 = L8_2.description

    L7_2.description = L8_2

    L3_2 = L7_2

  else

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "esx" == L4_2 then

      L4_2 = GetDataFromVehicle

      L5_2 = A2_2.plate

      L4_2 = L4_2(L5_2)

      L5_2 = L4_2[1]

      if L5_2 then

        L5_2 = L4_2[1]

        L5_2 = L5_2.firstname

        if L5_2 then

          L5_2 = L4_2[1]

          L5_2 = L5_2.firstname

          L6_2 = " "

          L7_2 = L4_2[1]

          L7_2 = L7_2.lastname

          L8_2 = " ("

          L9_2 = L4_2[1]

          L9_2 = L9_2.owner

          L10_2 = ")"

          L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2

          if L5_2 then

            goto lbl_87

          end

        end

        L5_2 = false

        ::lbl_87::

        if not L5_2 then

          L5_2 = "Desconocido"

        end

        L6_2 = {}

        L7_2 = json

        L7_2 = L7_2.decode

        L8_2 = L4_2[1]

        L8_2 = L8_2.vehicle

        L7_2 = L7_2(L8_2)

        L7_2 = L7_2.model

        L6_2.hash = L7_2

        L7_2 = L4_2[1]

        L7_2 = L7_2.plate

        L6_2.plate = L7_2

        L6_2.owner = L5_2

        L6_2.garage = "Garage"

        L7_2 = L4_2[1]

        L7_2 = L7_2.wanted

        L6_2.wanted = L7_2

        L7_2 = L4_2[1]

        L7_2 = L7_2.description

        L6_2.description = L7_2

        L3_2 = L6_2

      end

    end

  end

  ::lbl_111::

  L4_2 = A1_2

  L5_2 = L3_2

  L4_2(L5_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:police:UpdateVehicle"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2

  L3_2 = A1_2

  L4_2 = UpdateVehicleData

  L5_2 = A2_2.key

  L6_2 = A2_2.value

  L7_2 = A2_2.plate

  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2, L6_2, L7_2)

  L3_2(L4_2, L5_2, L6_2, L7_2)

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:GetPoliceCount"

function L2_1(A0_2, A1_2)

  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2

  L2_2 = A0_2

  L3_2 = FW_GetPlayer

  L4_2 = L2_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = Config

  L4_2 = L4_2.Framework

  if "qbcore" == L4_2 then

    L4_2 = CanOpenTablet

    L5_2 = L3_2.PlayerData

    L5_2 = L5_2.job

    L5_2 = L5_2.name

    L4_2 = L4_2(L5_2)

    L4_2 = L4_2[2]

    L5_2 = {}

    L6_2 = pairs

    L7_2 = Config

    L7_2 = L7_2.JobCategory

    L7_2 = L7_2[L4_2]

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

        L19_2 = L5_2

        L20_2 = L12_2[L17_2]

        L18_2(L19_2, L20_2)

      end

    end

    L6_2 = A1_2

    L7_2 = #L5_2

    L6_2(L7_2)

  else

    L4_2 = Config

    L4_2 = L4_2.Framework

    if "esx" == L4_2 then

      L4_2 = CanOpenTablet

      L5_2 = L3_2.PlayerData

      L5_2 = L5_2.job

      L5_2 = L5_2.name

      L4_2 = L4_2(L5_2)

      L4_2 = L4_2[2]

      L5_2 = GetPlayersInDuty

      L6_2 = L4_2

      L5_2 = L5_2(L6_2)

      L5_2 = #L5_2

      if not L5_2 then

        L5_2 = 0

      end

      L6_2 = A1_2

      L7_2 = L5_2

      L6_2(L7_2)

    end

  end

end

L0_1(L1_1, L2_1)

L0_1 = FW_CreateCallback

L1_1 = "origen_police:server:SetPoliceJob"

function L2_1(A0_2, A1_2, A2_2)

  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2

  L3_2 = FW_GetPlayer

  L4_2 = A0_2

  L3_2 = L3_2(L4_2)

  if not L3_2 then

    return

  end

  L4_2 = L3_2.PlayerData

  L4_2 = L4_2.job

  L4_2 = L4_2.name

  L5_2 = exports

  L5_2 = L5_2.origen_police

  L6_2 = L5_2

  L5_2 = L5_2.CanOpenTablet

  L7_2 = L4_2

  L5_2 = L5_2(L6_2, L7_2)

  L5_2 = L5_2[2]

  if not L5_2 then

    L6_2 = print

    L7_2 = "A player tried to hire someone without a job category with citidenid: "

    L8_2 = L3_2.PlayerData

    L8_2 = L8_2.citizenid

    L6_2(L7_2, L8_2)

    L6_2 = A1_2

    L7_2 = false

    L6_2(L7_2)

    return

  end

  L6_2 = FW_GetPlayerFromCitizenid

  L7_2 = A2_2.citizenid

  L6_2 = L6_2(L7_2)

  if not L6_2 then

    return

  end

  L7_2 = tonumber

  L8_2 = L6_2.PlayerData

  L8_2 = L8_2.job

  L8_2 = L8_2.grade

  L8_2 = L8_2.level

  L7_2 = L7_2(L8_2)

  L8_2 = tonumber

  L9_2 = L3_2.PlayerData

  L9_2 = L9_2.job

  L9_2 = L9_2.grade

  L9_2 = L9_2.level

  L8_2 = L8_2(L9_2)

  if L7_2 >= L8_2 then

    L7_2 = A1_2

    L8_2 = "You can't change the grade of someone with the same or higher grade than you."

    L7_2(L8_2)

    return

  end

  L7_2 = A2_2.grade

  if not L7_2 then

    L7_2 = 0

    if L7_2 then

      goto lbl_60

    end

  end

  L7_2 = tonumber

  L8_2 = A2_2.grade

  L7_2 = L7_2(L8_2)

  ::lbl_60::

  A2_2.grade = L7_2

  L7_2 = A2_2.job

  if not L7_2 then

    A2_2.job = "unemployed"

    A2_2.grade = 0

  end

  if L6_2 then

    L7_2 = string

    L7_2 = L7_2.lower

    L8_2 = A2_2.job

    L7_2 = L7_2(L8_2)

    A2_2.job = L7_2

    L7_2 = A2_2.job

    if "unemployed" == L7_2 then

      L7_2 = Config

      L7_2 = L7_2.Framework

      if "esx" == L7_2 then

        L7_2 = L6_2.PlayerData

        if nil ~= L7_2 then

          L7_2 = L6_2.PlayerData

          L7_2 = L7_2.source

          if nil ~= L7_2 then

            L7_2 = DropDutyPlayer

            L8_2 = L6_2.PlayerData

            L8_2 = L8_2.source

            L7_2(L8_2)

          end

        end

      end

      L7_2 = L6_2.Functions

      L7_2 = L7_2.SetMetaData

      L8_2 = "police_badge"

      L9_2 = "0000"

      L7_2(L8_2, L9_2)

      L7_2 = L6_2.Functions

      L7_2 = L7_2.SetMetaData

      L8_2 = "divisions"

      L9_2 = {}

      L7_2(L8_2, L9_2)

      L7_2 = L6_2.Functions

      L7_2 = L7_2.SetMetaData

      L8_2 = "condecorates"

      L9_2 = {}

      L7_2(L8_2, L9_2)

      L7_2 = CreateLog

      L8_2 = {}

      L8_2.type = "Management"

      L9_2 = {}

      L10_2 = Config

      L10_2 = L10_2.LogsTranslations

      L10_2 = L10_2.FirePolice

      L10_2 = L10_2.title

      L9_2.title = L10_2

      L10_2 = Config

      L10_2 = L10_2.LogsTranslations

      L10_2 = L10_2.FirePolice

      L10_2 = L10_2.message

      L11_2 = L10_2

      L10_2 = L10_2.format

      L12_2 = L6_2.PlayerData

      L12_2 = L12_2.charinfo

      L12_2 = L12_2.firstname

      L13_2 = " "

      L14_2 = L6_2.PlayerData

      L14_2 = L14_2.charinfo

      L14_2 = L14_2.lastname

      L12_2 = L12_2 .. L13_2 .. L14_2

      L10_2 = L10_2(L11_2, L12_2)

      L9_2.description = L10_2

      L9_2.color = 1791423

      L8_2.embed = L9_2

      L8_2.source = A0_2

      L7_2(L8_2)

    end

    L7_2 = L6_2.PlayerData

    if L7_2 then

      L7_2 = L6_2.PlayerData

      L7_2 = L7_2.source

      if L7_2 then

        L7_2 = L6_2.Functions

        L7_2 = L7_2.SetJob

        L8_2 = A2_2.job

        L9_2 = A2_2.grade

        L7_2(L8_2, L9_2)

    end

    else

      L7_2 = {}

      L8_2 = A2_2.job

      L7_2.name = L8_2

      L8_2 = Framework

      L8_2 = L8_2.Shared

      L8_2 = L8_2.Jobs

      L9_2 = A2_2.job

      L8_2 = L8_2[L9_2]

      L8_2 = L8_2.label

      L7_2.label = L8_2

      L8_2 = Framework

      L8_2 = L8_2.Shared

      L8_2 = L8_2.Jobs

      L9_2 = A2_2.job

      L8_2 = L8_2[L9_2]

      L8_2 = L8_2.defaultDuty

      L7_2.onduty = L8_2

      L8_2 = Framework

      L8_2 = L8_2.Shared

      L8_2 = L8_2.Jobs

      L9_2 = A2_2.job

      L8_2 = L8_2[L9_2]

      L8_2 = L8_2.grades

      L9_2 = tostring

      L10_2 = A2_2.grade

      L9_2 = L9_2(L10_2)

      if not L9_2 then

        L9_2 = "0"

      end

      L8_2 = L8_2[L9_2]

      if L8_2 then

        L8_2 = Framework

        L8_2 = L8_2.Shared

        L8_2 = L8_2.Jobs

        L9_2 = A2_2.job

        L8_2 = L8_2[L9_2]

        L8_2 = L8_2.grades

        L9_2 = tostring

        L10_2 = A2_2.grade

        L9_2 = L9_2(L10_2)

        if not L9_2 then

          L9_2 = "0"

        end

        L8_2 = L8_2[L9_2]

        L9_2 = {}

        L7_2.grade = L9_2

        L9_2 = L7_2.grade

        L10_2 = L8_2.name

        L9_2.name = L10_2

        L9_2 = L7_2.grade

        L10_2 = tostring

        L11_2 = A2_2.grade

        L10_2 = L10_2(L11_2)

        if not L10_2 then

          L10_2 = "0"

        end

        L9_2.level = L10_2

        L9_2 = L8_2.payment

        if nil ~= L9_2 then

          L9_2 = L8_2.payment

          if L9_2 then

            goto lbl_218

          end

        end

        L9_2 = 30

        ::lbl_218::

        L7_2.payment = L9_2

        L9_2 = L8_2.isboss

        if nil ~= L9_2 then

          L9_2 = L8_2.isboss

          if L9_2 then

            goto lbl_226

          end

        end

        L9_2 = false

        ::lbl_226::

        L7_2.isboss = L9_2

      else

        L8_2 = {}

        L7_2.grade = L8_2

        L8_2 = L7_2.grade

        L8_2.name = "No Grades"

        L8_2 = L7_2.grade

        L8_2.level = 0

        L7_2.payment = 30

        L7_2.isboss = false

      end

      L8_2 = MySQL

      L8_2 = L8_2.awaitQuery

      L9_2 = "SELECT "

      L10_2 = Config

      L10_2 = L10_2.Framework

      if "qbcore" == L10_2 then

        L10_2 = "charinfo"

        if L10_2 then

          goto lbl_248

        end

      end

      L10_2 = "firstname, lastname"

      ::lbl_248::

      L11_2 = ", image FROM "

      L12_2 = Config

      L12_2 = L12_2.Framework

      if "qbcore" == L12_2 then

        L12_2 = "players"

        if L12_2 then

          goto lbl_257

        end

      end

      L12_2 = "users"

      ::lbl_257::

      L13_2 = " WHERE "

      L14_2 = Config

      L14_2 = L14_2.Framework

      if "qbcore" == L14_2 then

        L14_2 = "citizenid"

        if L14_2 then

          goto lbl_266

        end

      end

      L14_2 = "identifier"

      ::lbl_266::

      L15_2 = " = ?"

      L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2

      L10_2 = {}

      L11_2 = A2_2.citizenid

      L10_2[1] = L11_2

      L8_2 = L8_2(L9_2, L10_2)

      L9_2 = Config

      L9_2 = L9_2.Framework

      if "qbcore" == L9_2 then

        L9_2 = MySQL

        L9_2 = L9_2.awaitUpdate

        L10_2 = "UPDATE players SET job = ? WHERE citizenid = ?"

        L11_2 = {}

        L12_2 = json

        L12_2 = L12_2.encode

        L13_2 = L7_2

        L12_2 = L12_2(L13_2)

        L13_2 = A2_2.citizenid

        L11_2[1] = L12_2

        L11_2[2] = L13_2

        L9_2(L10_2, L11_2)

        L9_2 = L8_2[1]

        L10_2 = json

        L10_2 = L10_2.decode

        L11_2 = L8_2[1]

        L11_2 = L11_2.charinfo

        L10_2 = L10_2(L11_2)

        L9_2.charinfo = L10_2

        L9_2 = A1_2

        L10_2 = {}

        L11_2 = L8_2[1]

        L11_2 = L11_2.charinfo

        L11_2 = L11_2.firstname

        L10_2.firstname = L11_2

        L11_2 = L8_2[1]

        L11_2 = L11_2.charinfo

        L11_2 = L11_2.lastname

        L10_2.lastname = L11_2

        L11_2 = A2_2.citizenid

        L10_2.citizenid = L11_2

        L11_2 = L8_2[1]

        L11_2 = L11_2.image

        L10_2.image = L11_2

        L11_2 = L7_2.grade

        L11_2 = L11_2.name

        L10_2.grade = L11_2

        L9_2(L10_2)

      else

        L9_2 = MySQL

        L9_2 = L9_2.awaitUpdate

        L10_2 = "UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?"

        L11_2 = {}

        L12_2 = L7_2.name

        L13_2 = tonumber

        L14_2 = L7_2.grade

        L14_2 = L14_2.level

        L13_2 = L13_2(L14_2)

        L14_2 = A2_2.citizenid

        L11_2[1] = L12_2

        L11_2[2] = L13_2

        L11_2[3] = L14_2

        L9_2(L10_2, L11_2)

        L9_2 = A1_2

        L10_2 = {}

        L11_2 = L8_2[1]

        L11_2 = L11_2.firstname

        L10_2.firstname = L11_2

        L11_2 = L8_2[1]

        L11_2 = L11_2.lastname

        L10_2.lastname = L11_2

        L11_2 = A2_2.citizenid

        L10_2.citizenid = L11_2

        L11_2 = L8_2[1]

        L11_2 = L11_2.image

        L10_2.image = L11_2

        L11_2 = L7_2.grade

        L11_2 = L11_2.name

        L10_2.grade = L11_2

        L9_2(L10_2)

        goto lbl_459

        L7_2 = MySQL

        L7_2 = L7_2.awaitQuery

        L8_2 = "SELECT image FROM "

        L9_2 = Config

        L9_2 = L9_2.Framework

        if "qbcore" == L9_2 then

          L9_2 = "players"

          if L9_2 then

            goto lbl_360

          end

        end

        L9_2 = "users"

        ::lbl_360::

        L10_2 = " WHERE "

        L11_2 = Config

        L11_2 = L11_2.Framework

        if "qbcore" == L11_2 then

          L11_2 = "citizenid"

          if L11_2 then

            goto lbl_369

          end

        end

        L11_2 = "identifier"

        ::lbl_369::

        L12_2 = " = ?"

        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2

        L9_2 = {}

        L10_2 = L6_2.PlayerData

        L10_2 = L10_2.citizenid

        L9_2[1] = L10_2

        L7_2 = L7_2(L8_2, L9_2)

        L8_2 = L7_2[1]

        if L8_2 then

          L8_2 = L7_2[1]

          L7_2 = L8_2.image

        else

          L7_2 = nil

        end

        L8_2 = A2_2.job

        if "unemployed" ~= L8_2 then

          L8_2 = L6_2.PlayerData

          if nil ~= L8_2 then

            L8_2 = L6_2.PlayerData

            L8_2 = L8_2.source

            if nil ~= L8_2 then

              L8_2 = TriggerClientEvent

              L9_2 = "origen_police:toggleDuty"

              L10_2 = tonumber

              L11_2 = L6_2.PlayerData

              L11_2 = L11_2.source

              L10_2 = L10_2(L11_2)

              L11_2 = true

              L8_2(L9_2, L10_2, L11_2)

            end

          end

        end

        L8_2 = CreateLog

        L9_2 = {}

        L9_2.type = "Management"

        L10_2 = {}

        L11_2 = Config

        L11_2 = L11_2.LogsTranslations

        L11_2 = L11_2.HirePolice

        L11_2 = L11_2.title

        L10_2.title = L11_2

        L11_2 = Config

        L11_2 = L11_2.LogsTranslations

        L11_2 = L11_2.HirePolice

        L11_2 = L11_2.message

        L12_2 = L11_2

        L11_2 = L11_2.format

        L13_2 = L6_2.PlayerData

        L13_2 = L13_2.charinfo

        L13_2 = L13_2.firstname

        L14_2 = " "

        L15_2 = L6_2.PlayerData

        L15_2 = L15_2.charinfo

        L15_2 = L15_2.lastname

        L13_2 = L13_2 .. L14_2 .. L15_2

        L14_2 = A2_2.job

        L15_2 = A2_2.grade

        L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)

        L10_2.description = L11_2

        L10_2.color = 1791423

        L9_2.embed = L10_2

        L9_2.source = A0_2

        L8_2(L9_2)

        L8_2 = A1_2

        L9_2 = {}

        L10_2 = L6_2.PlayerData

        L10_2 = L10_2.charinfo

        L10_2 = L10_2.firstname

        L9_2.firstname = L10_2

        L10_2 = L6_2.PlayerData

        L10_2 = L10_2.charinfo

        L10_2 = L10_2.lastname

        L9_2.lastname = L10_2

        L10_2 = L6_2.PlayerData

        L10_2 = L10_2.citizenid

        L9_2.citizenid = L10_2

        L9_2.image = L7_2

        L10_2 = L6_2.PlayerData

        L10_2 = L10_2.job

        L10_2 = L10_2.grade

        L10_2 = L10_2.name

        L9_2.grade = L10_2

        L8_2(L9_2)

      end

    end

  else

    L7_2 = Debuger

    L8_2 = "The feature to set the police job is only available for online players."

    L7_2(L8_2)

  end

  ::lbl_459::

end

L0_1(L1_1, L2_1)

