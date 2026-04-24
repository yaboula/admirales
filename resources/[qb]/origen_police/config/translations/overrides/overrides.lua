local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

L0_1 = "police"

L1_1 = {}

L2_1 = {}

L2_1.Report = "ReportEms"

L2_1.Reports = "ReportsEms"

L2_1.Fine = "ReportBillsEms"

L2_1.AddFine = "AddReportBillEms"

L2_1.ReportName = "ReportNameEms"

L2_1.ReportID = "ReportIdEms"

L2_1.ReportDescription = "ReportDescEms"

L2_1.Evidences = "ReportEvidencesEms"

L2_1.AddEvidence = "AddReportEvidenceEms"

L2_1.PeopleInvolved = "ReportPeopleEms"

L2_1.AddPeople = "ReportAddPeopleEms"

L2_1.AgentsInvolved = "ReportAgentsEms"

L2_1.AddAgent = "ReportAddAgentEms"

L2_1.ReportList = "ReportListEms"

L2_1.SearchReport = "SearchReportEms"

L2_1.NewReport = "NewReportEms"

L2_1.SelectReport = "SelectReportEms"

L2_1.AgentInCharge = "AgentInChargeEms"

L2_1.EnterReportDesc = "EnterReportDescEms"

L2_1.DestroyReport = "DestroyReportEms"

L1_1.ambulance = L2_1

function L2_1()

  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2

  L0_2 = pairs

  L1_2 = L1_1

  L0_2, L1_2, L2_2, L3_2 = L0_2(L1_2)

  for L4_2, L5_2 in L0_2, L1_2, L2_2, L3_2 do

    L7_2 = L0_1

    L6_2 = L1_1

    L8_2 = {}

    L6_2[L7_2] = L8_2

    L6_2 = pairs

    L7_2 = L1_1

    L7_2 = L7_2[L4_2]

    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)

    for L10_2, L11_2 in L6_2, L7_2, L8_2, L9_2 do

      L13_2 = L0_1

      L12_2 = L1_1

      L12_2 = L12_2[L13_2]

      L12_2[L10_2] = L10_2

    end

    break

  end

end

GenerateDefaultTranslations = L2_1

L2_1 = {}

L3_1 = L0_1

function L4_1(A0_2)

  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2

  if A0_2 then

    L1_2 = L1_1

    L1_2 = L1_2[A0_2]

    if L1_2 then

      goto lbl_8

    end

  end

  A0_2 = L0_1

  ::lbl_8::

  L1_2 = L3_1

  if L1_2 == A0_2 then

    return

  end

  L3_1 = A0_2

  L1_2 = pairs

  L2_2 = L1_1

  L2_2 = L2_2[A0_2]

  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)

  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do

    if L5_2 == L6_2 then

      L7_2 = Translations

      L8_2 = L2_1

      L8_2 = L8_2[L5_2]

      if not L8_2 then

        L8_2 = Translations

        L8_2 = L8_2[L5_2]

      end

      L7_2[L5_2] = L8_2

      L7_2 = L2_1

      L7_2[L5_2] = nil

    else

      L7_2 = L2_1

      L8_2 = Translations

      L8_2 = L8_2[L5_2]

      L7_2[L5_2] = L8_2

      L7_2 = Translations

      L8_2 = Translations

      L8_2 = L8_2[L6_2]

      L7_2[L5_2] = L8_2

    end

  end

  L1_2 = SendNUIMessage

  L2_2 = {}

  L2_2.action = "UpdateTranslations"

  L3_2 = Translations

  L2_2.translations = L3_2

  L1_2(L2_2)

end

ApplyTranslationsOverride = L4_1

L4_1 = RegisterNetEvent

L5_1 = "origen_police:client:OnJobUpdate"

function L6_1(A0_2)

  local L1_2, L2_2

  if A0_2 then

    L1_2 = A0_2.name

    if L1_2 then

      goto lbl_7

    end

  end

  do return end

  ::lbl_7::

  L1_2 = ApplyTranslationsOverride

  L2_2 = A0_2.name

  L1_2(L2_2)

end

L4_1(L5_1, L6_1)

L4_1 = RegisterNetEvent

L5_1 = "origen_police:client:OnPlayerLoaded"

function L6_1()

  local L0_2, L1_2, L2_2

  L0_2 = FW_GetPlayerData

  L0_2 = L0_2()

  if L0_2 then

    L1_2 = L0_2.job

    if L1_2 then

      L1_2 = L0_2.job

      L1_2 = L1_2.name

      if L1_2 then

        L1_2 = ApplyTranslationsOverride

        L2_2 = L0_2.job

        L2_2 = L2_2.name

        L1_2(L2_2)

      end

    end

  end

end

L4_1(L5_1, L6_1)

L4_1 = GenerateDefaultTranslations

L4_1()

