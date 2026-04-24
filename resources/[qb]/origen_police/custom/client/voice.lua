function OverrideProximityRange(distance, bool)

    if Config.VoiceSystem == "pma-voice" then

        if distance ~= nil then

            exports["pma-voice"]:overrideProximityRange(distance, bool)

            return

        end

        exports["pma-voice"]:clearProximityOverride()

    end

end

function ToggleVoice(target, value, string)

    if Config.VoiceSystem == "pma-voice" then

        -- [INST INST-028] toggleVoice es función INTERNA de pma-voice, NO exportada.
        -- pma-voice gestiona el mute/unmute de radio internamente via el evento
        -- pma-voice:setTalkingOnRadio. No se requiere llamada externa.
        return

    end

end

function PlayerTargets(radioFreqs, freqName)

    if Config.VoiceSystem == "pma-voice" then

        -- [INST INST-028] playerTargets NO existe como export en esta versión de pma-voice.
        -- pma-voice gestiona los targets de voz automáticamente cuando setRadioChannel
        -- es llamado (TriggerServerEvent pma-voice:setPlayerRadio). No se requiere acción.
        return

    elseif Config.VoiceSystem == "saltychat" then

        exports["saltychat"]:SetRadioChanel(freqName or "", true)

    end

end

function SetRadioVolume(volume)

    if Config.VoiceSystem == "pma-voice" then

        exports["pma-voice"]:setRadioVolume(volume)

    end

end

function CanTalk()

    return true

end

