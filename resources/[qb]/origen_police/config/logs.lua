-- [INST INST-028] Temp: fivemanage es nil-safe en GetCustomUrlFromResponse.
-- 'discord' crashea cuando el webhook no está configurado (resp=nil → attempt to index nil).
-- Cambiar a 'discord' cuando ServerConfig.Logs.Camera tenga URL real en config/logs/logs.lua.
Config.UploadMethod = 'fivemanage'
Config.Fields = {

    ['discord'] = 'files[]',

    ['fivemanage'] = 'image',

    ['custom'] = ''

}

function GetCustomUrlFromResponse(resp)

    local function ShowErrorPhoto(response)

        print("Error taking photo: " .. json.encode(response) .. " - " .. "Probably you have to change the webhook because it's not valid")

    end

    local retval = false

    if Config.UploadMethod == 'discord' then

        if resp['attachments'] == nil then

            ShowErrorPhoto(resp)

        else

            retval = resp.attachments[1].url

        end

    elseif Config.UploadMethod == 'fivemanage' then

        if resp then

            retval = resp.url

        else

            ShowErrorPhoto(resp)

        end

    else

        print("Unknown upload method specified: " .. Config.UploadMethod)

    end

    return retval

end

