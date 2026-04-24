-- [INST INST-028] Fix translations binding — 2026-04-23
-- _framework.lua asigna Config.Translations = Translations en el primer shared_script,
-- cuando Translations aún es nil (las traducciones cargan DESPUÉS en fxmanifest).
-- Este archivo se ejecuta DESPUÉS de todos los archivos de traducción para hacer el bind correcto.
Config.Translations      = Translations
Config.LogsTranslations  = LogsTranslations
