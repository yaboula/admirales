Config.Commands = {

    OpenPoliceCad = {

        cmd = 'pcad',
        description = Config.Translations.OpenPoliceCad,
        key = '',
        item = 'police_cad',
    },

    VehicleRadar = {
        cmd = 'alpr',

        description = Config.Translations.VehicleRadar,

        key = 'NUMPAD5'

    },

    LockRadar = {
        cmd = 'balpr',

        description = Config.Translations.LockRadar,

        key = 'NUMPAD8',

    },

    MoveRadar = {
        cmd = 'moveralpr',

        description = Config.Translations.MoveRadar,

        key = 'NUMPAD4',

    },

    NextAlert = {
        cmd = 'nxtalert',

        description = Config.Translations.NextAlert,

        key = 'RIGHT',

    },

    PreviousAlert = {
        cmd = 'prvalert',

        description = Config.Translations.PreviousAlert,

        key = 'LEFT',

    },

    AcceptAlert = {
        key = 'O',

    },

    DeleteAlert = {
        key = 'I',

    },

    OpenMiniDispatch = {
        key = 'U',

    },

    K9Menu = {
        cmd = 'k9',

        description = Config.Translations.K9Menu,

        key = 'K',

    },

    SirensKey = {
        cmd = 'sirens',

        description = Config.Translations.SirensKey,

        key = 'COMMA',

    },

    LightsSirens = {
        cmd = 'lights',

        description = Config.Translations.LightsSirens,

        key = 'Q',

    },

    HornKey = {

        key = 86,
        disabledKey = 86,
    },

    HandCuff = {
        description = Config.Translations.HandCuff,

        key = '',

    },

    QRR = {
        description = Config.Translations.QRR,

        key = '',

    },

    Ten20 = {
        description = Config.Translations.Ten20,

        key = '',

    },

    Tackle = {
        description = Config.Translations.Tackle,

        key = '',

    },

    VehicleInto = {
        description = Config.Translations.VehicleInto,

        key = '',

    },

    ForceVehicle = {
        cmd = 'force',

    },

    QuickAccess = {
        cmd = 'quickaccess',

        description = Config.Translations.QuickAccess,

        key = 'F7',

    },

    Minimap = {
        cmd = 'policeminmap',

        description = Config.Translations.Minimap,

        key = '',

    },

    TalkRadio = {
        description = Config.Translations.TalkRadio,

        key = 'LMENU',

    },

    ChangeRadioAnim = {
        cmd = 'animradio',

    },

    TalkMegaphone = {
        key = 246,
    },

    CamOrRappel = {

        key = 38,
    },

    CustomCommandAlert = {

        ["911"] = {

            jobCategory = "police",

            triggerEvent = "origen_police:client:onPlayerCall911",

        },

        ["911ems"] = {

            jobCategory = "ambulance",

            triggerEvent = "origen_police:client:onPlayerCall911ems",

        },

    }

}

