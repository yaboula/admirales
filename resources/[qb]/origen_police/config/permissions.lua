Config.Permissions = {

    [Config.PoliceJobName] = {

        Dispatch = 1,

        SearchCitizen = 1,

        SearchReports = 1,

        SearchVehicles = 1,

        CriminalCode = 1,

        SearchCapture = 1,

        SearchDebtors = 1,

        FederalManagement = 1,

        AgentManagement = 4,

        SecurityCamera = 1,

        Radio = 1,

        TimeControl = 1,

        MovePlayerInRadio = 4,

        EnterRadioFreq = 1,

        SendRadioMessage = 1,

        AddNotesToAlert = 1,

        AssignAlertToUnit = 3,

        SetWanted = 4,

        SetDanger = 1,

        CreateNotes = 1,

        PinNotes = 4,

        DeleteNotes = 4,

        CreateBill = 1,

        DeleteBill = 4,

        AddLicenses = 4,

        DeleteLicenses = 4,

        CreateReport = 1,

        AddPeopleToReport = 1,

        AddBillReport = 1,

        RemovePeopleFromReport = 1,

        AddEvidence = 1,

        DeleteEvidence = 1,

        AddReportAgent = 1,

        AddTags = 1,

        RemoveTags = 1,

        AddVictimToReport = 1,

        AddVehicleToReport = 1,

        DeleteReport = 3,

        AddFederal = 1,

        SeeBusinessCameras = 3,

        SeeVehicleCamera = 1,

        SeeBodyCams = 1,

        GenerateBadge = 4,

        AddPolice = 4,

        ChangePoliceGrade = 4,

        ChangePoliceBadge = 4,

        AddCondecorate = 4,

        RemoveCondecorate = 4,

        AddDivision = 4,

        RemoveDivision = 4,

        HirePolice = 4,

        Operations = 1,

        CreateShape = 1,

        DeleteShape = 1,

        RadialCommunicationTab = 1,

        RadioTab = 1,

        InteractTab = 1,

        HolsterTab = 1,

        ObjectPlacementTab = 1,

        CanTackle = 1,

    },

    ["ambulance"] = {

        Dispatch = 1,

        SearchCitizen = 1,

        SearchReports = 1,

        SearchVehicles = 99,

        CriminalCode = 3,

        SearchCapture = 99,

        SearchDebtors = 99,

        FederalManagement = 99,

        AgentManagement = 3,

        Radio = 1,

        TimeControl = 1,

        MovePlayerInRadio = 4,

        EnterRadioFreq = 1,

        SendRadioMessage = 1,

        AddNotesToAlert = 1,

        AssignAlertToUnit = 3,

        SetWanted = 4,

        SetDanger = 1,

        CreateNotes = 1,

        PinNotes = 4,

        DeleteNotes = 4,

        CreateBill = 1,

        DeleteBill = 4,

        AddLicenses = 99,

        DeleteLicenses = 99,

        CreateReport = 1,

        AddPeopleToReport = 1,

        AddBillReport = 1,

        RemovePeopleFromReport = 1,

        AddEvidence = 1,

        DeleteEvidence = 1,

        AddReportAgent = 1,

        AddTags = 1,

        RemoveTags = 1,

        AddVictimToReport = 1,

        AddVehicleToReport = 1,

        DeleteReport = 3,

        AddFederal = 99,

        SeeBusinessCameras = 99,

        SeeVehicleCamera = 99,

        SeeBodyCams = 99,

        GenerateBadge = 99,

        AddPolice = 99,

        ChangePoliceGrade = 99,

        ChangePoliceBadge = 99,

        AddCondecorate = 99,

        RemoveCondecorate = 99,

        AddDivision = 99,

        RemoveDivision = 99,

        HirePolice = 99,

        Operations = 99,

        CreateShape = 99,

        DeleteShape = 99,

        RadialCommunicationTab = 1,

        RadioTab = 1,

        InteractTab = 1,

        HolsterTab = 1,

        ObjectPlacementTab = 1,

        CanTackle = 99,

    },

    ["sheriff"] = {

        Dispatch = 1,

        SearchCitizen = 1,

        SearchReports = 1,

        SearchVehicles = 1,

        CriminalCode = 1,

        SearchCapture = 1,

        SearchDebtors = 1,

        FederalManagement = 1,

        AgentManagement = 4,

        SecurityCamera = 1,

        Radio = 1,

        TimeControl = 1,

        MovePlayerInRadio = 4,

        EnterRadioFreq = 1,

        SendRadioMessage = 1,

        AddNotesToAlert = 1,

        AssignAlertToUnit = 3,

        SetWanted = 4,

        SetDanger = 1,

        CreateNotes = 1,

        PinNotes = 4,

        DeleteNotes = 4,

        CreateBill = 1,

        DeleteBill = 4,

        AddLicenses = 4,

        DeleteLicenses = 4,

        CreateReport = 1,

        AddPeopleToReport = 1,

        AddBillReport = 1,

        RemovePeopleFromReport = 1,

        AddEvidence = 1,

        DeleteEvidence = 1,

        AddReportAgent = 1,

        AddTags = 1,

        RemoveTags = 1,

        AddVictimToReport = 1,

        AddVehicleToReport = 1,

        DeleteReport = 3,

        AddFederal = 1,

        SeeBusinessCameras = 3,

        SeeVehicleCamera = 1,

        SeeBodyCams = 1,

        GenerateBadge = 4,

        AddPolice = 4,

        ChangePoliceGrade = 4,

        ChangePoliceBadge = 4,

        AddCondecorate = 4,

        RemoveCondecorate = 4,

        AddDivision = 4,

        RemoveDivision = 4,

        HirePolice = 4,

        Operations = 1,

        CreateShape = 1,

        DeleteShape = 1,

        RadialCommunicationTab = 1,

        RadioTab = 1,

        InteractTab = 1,

        HolsterTab = 1,

        ObjectPlacementTab = 1,

        CanTackle = 1,

    },

}

Config.PermissionsGroups = {

    "mod", "admin", "superadmin", "god"
}

exports("GerPermissions", function()

    return Config.Permissions

end)

if not Config.JobCategory[Config.PoliceJobCategory] then

    print("Looks like you have a wrong police job category setted in the Config.PoliceJobCategory option, please check the config/permissions.lua file")

end

