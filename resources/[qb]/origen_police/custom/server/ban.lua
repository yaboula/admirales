function BanPlayer(source, reason)

    print("Player " .. GetPlayerName(source).."("..source..") has been kicked. Reason: " .. reason)

    DropPlayer(source, "You have been kicked from the server. Reason: " .. reason)

end

