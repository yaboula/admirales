function GetSelfBloodType()
    local Player = FW_GetPlayerData(true)

    return Player and Player.metadata and Player.metadata.bloodtype or "Desconocido"

end

