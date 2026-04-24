Config.MinAlertCooldown = 20
Config.RecieveAlwaysAlerts = true
Config.DispatchRedirect = false
Config.ShootAlert = true
Config.DisplayPlateOnVehicleAlerts = true
Config.HeatMapAlerts = true
Config.WeaponSilencierBlockShootAlert = true
Config.BlackListedShootAlertWeapons = {
}

Config.BlackListedShootAlertAmmo = {
    "AMMO_BALL",

    "AMMO_PETROLCAN",

}

Config.ShootAlertCooldown = 120000
Config.ShootAlertRequireSeen = true
Config.ShootAlertDisablePolice = true
Config.ShootAlertWeaponChance = 50
Config.ShootAlertAmmoChance = 50
Config.ShootAlertAmmoTranslation = {
    [`AMMO_PISTOL`] = Translations.LowCaliber,

    [`AMMO_SMG`] = Translations.LowCaliber,

    [`AMMO_FLARE`] = Translations.LowCaliber,

    [`AMMO_SHOTGUN`] = Translations.ShotgunCaliber,

    [`AMMO_RIFLE`] = Translations.MediumCaliber,

    [-1] = Translations.HighCaliber,
}

Config.DebugRestrictZones = false
Config.RestrictedAlertZones = {
    {

        {431.03, -981.66},

        {431.33, -971.71},

        {425.23, -979.31}

    }

}

Config.BlackListedWords = {
    "dani"

}

function IsWeaponBlacklisted(weaponName)

    for i = 1, #Config.BlackListedShootAlertWeapons do

        if Config.BlackListedShootAlertWeapons[i]:lower() == weaponName:lower() then

            return true

        end

    end

    return false

end

function IsWeaponBlacklistedForProfile(weaponName)

    for i = 1, #Config.BlackListedUsersWeapons do

        if Config.BlackListedUsersWeapons[i]:lower() == weaponName:lower() then

            return true

        end

    end

    return false

end

function IsAmmoBlacklisted(ammoHash)

    for i = 1, #Config.BlackListedShootAlertAmmo do

        if GetHashKey(Config.BlackListedShootAlertAmmo[i]) == ammoHash then

            return true

        end

    end

    return false

end

function GetCaliberTranslation(ammoHash)

    for k, v in pairs(Config.ShootAlertAmmoTranslation) do

        if k == ammoHash then

            return v

        end

    end

    return Config.ShootAlertAmmoTranslation[-1]
end

for k, _ in pairs(Config.ShootAlertAmmoTranslation) do

    if type(k) ~= "number" then

        print("^1[ERROR]^7 Config.ShootAlertAmmoTranslation index is not a number: " .. tostring(k))

    end

end

