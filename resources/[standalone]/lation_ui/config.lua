Config = {}

Config.version = true

-- [INST INST-024] Admirales: Sonidos de notify desactivados.
-- lib.notify está redirigido a JustNotify en init.lua — JustNotify es el motor único.
-- Este bloque Config.notify solo controla el componente interno NUI (notify.lua)
-- que ya no se usa directamente (lib.notify va directo a JustNotify).
Config.notify = {

    play_sound = false,

    default_sound = {

        info    = { bank = '', set = 'HUD_FRONTEND_DEFAULT_SOUNDSET', name = 'SELECT' },

        warning = { bank = '', set = 'HUD_FRONTEND_DEFAULT_SOUNDSET', name = 'SELECT' },

        error   = { bank = '', set = 'HUD_FRONTEND_DEFAULT_SOUNDSET', name = 'SELECT' },

        success = { bank = '', set = 'HUD_FRONTEND_DEFAULT_SOUNDSET', name = 'SELECT' },

    }

}

-- [INST INST-024] Admirales: Radial activo con tecla 'y'.
-- prism_uipack NO está instalado → lation_ui es el único sistema de radial disponible.
-- Los exports (registerRadial, addRadialItem, etc.) están activos para scripts consumidores.
Config.radial = {

    default_key = 'y'

}






