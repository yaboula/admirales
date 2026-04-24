Config                       = {}

Config.Framework             = 'qb'      -- esx, oldesx, qb, oldqb
Config.SQL                   = "oxmysql" -- oxmysql, ghmattimysql, mysql-async

Config.InventoryImages       = "codem-inventory/html/itemimages" -- codem-inventory/html/itemimages , ox_inventory/web/images , qb-inventory/html/images
Config.ExampleProfilePicture = "https://cdn.discordapp.com/attachments/983471660684423240/1147567519712940044/example-pp.png"

Config.InteractionHandler    = 'drawtext'       --  qb-target, drawtext,ox-target

Config.StartCraftPoint       = 0             -- Start craft point

Config.Inventory             = "codem-inventory" -- codem-inventory, qb_inventory, esx_inventory, ox_inventory, qs_inventory
Config.addWeapon             = false          -- Do true if you are not using the weapon as an item(xPlayer.addWeapon use)
Config.AccessAnywhereLearned = true          -- Learned crafts access from anywhere table (true) or not (false)

Config.CraftSettings = {
    {
        ['coords'] = {
            ['intreactionCoords'] = vector3(91.87, -819.33, 31.29),
            ['ped'] = true,
            ['pedCoords'] = vector3(91.87, -819.33, 31.29),
            ['pedHeading'] = 70.91,
            ['pedHash'] = 0xF0EC56E2,
        },
        ['blip'] = {
            show = true,
            blipName = 'Craft 1',
            blipType = 814,
            blipColor = 2,
            blipScale = 0.55

        },
        ['craftTableUniqueID'] = {
            'crafttable1',
        },
        ['job'] = {
            ['all'] = true,
        },
        ['categories'] = {
            { name = 'all',    label = 'All' },
            { name = 'weapon', label = 'Weapons' },
            { name = 'melee',  label = 'Melee' },
            { name = 'tools',  label = 'Tools' },
            { name = 'meds',   label = 'Medical' },
        },
        ['items'] = {
            ['weapon'] = { -- category name
                {
                    name = 'weapon_pistol',
                    label = 'Walther P99',
                    chance = 80,            -- chance max 100 min 0
                    craftpoint = 100,       -- craft point
                    time = 2,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 400, -- reward craft point
                    rewardXP = 500,         -- reward xp
                    improveCraftPoint = 300,
                    requiredItems = {
                        { name = 'iron',       label = "Iron",        learn = true, point = 100, count = 2 },
                        { name = 'steel',      label = "Steel",       learn = true, point = 150, count = 1 },
                        { name = 'metalscrap', label = "Metal Scrap", learn = true, point = 50,  count = 5 },
                    },
                    description = "Semi-automatic single-shot weapon"
                },
            },
            ['melee'] = { -- category name
                {
                    name = 'weapon_bat',
                    label = 'Baseball Bat',
                    chance = 100,           -- chance max 100 min 0
                    craftpoint = 50,        -- craft point
                    time = 1,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 100, -- reward craft point
                    rewardXP = 150,         -- reward xp
                    improveCraftPoint = 50,
                    requiredItems = {
                        { name = 'plastic',    label = "Plastic",     learn = true, point = 50, count = 3 },
                        { name = 'metalscrap', label = "Metal Scrap", learn = true, point = 50, count = 2 },
                    },
                    description = "Used for hitting a ball in sports or other things"
                },
            },
            ['tools'] = { -- category name
                {
                    name = 'advancedlockpick',
                    label = 'Advc. Lockpick',
                    chance = 75,            -- chance max 100 min 0
                    craftpoint = 80,        -- craft point
                    time = 1,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 150, -- reward craft point
                    rewardXP = 200,         -- reward xp
                    improveCraftPoint = 100,
                    requiredItems = {
                        { name = 'lockpick', label = "Lockpick", learn = true, point = 100, count = 1 },
                        { name = 'steel',    label = "Steel",    learn = true, point = 100, count = 1 },
                        { name = 'iron',     label = "Iron",     learn = true, point = 100, count = 1 },
                    },
                    description = "If you lose your keys a lot this is very useful..."
                },
            },
            ['meds'] = { -- category name
                {
                    name = 'firstaid',
                    label = 'First Aid Kit',
                    chance = 90,            -- chance max 100 min 0
                    craftpoint = 60,        -- craft point
                    time = 1,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 200, -- reward craft point
                    rewardXP = 250,         -- reward xp
                    improveCraftPoint = 100,
                    requiredItems = {
                        { name = 'bandage', label = "Bandage", learn = true, point = 50, count = 3 },
                        { name = 'plastic', label = "Plastic", learn = true, point = 50, count = 2 },
                    },
                    description = "You can use this to get people back on their feet"
                },
            },
        },
    },
    {
        ['coords'] = {
            ['intreactionCoords'] = vector3(90.41, -823.89, 31.23),
            ['ped'] = true,
            ['pedCoords'] = vector3(90.41, -823.89, 31.23),
            ['pedHeading'] = 70.91,
            ['pedHash'] = 0xF0EC56E2,
        },
        ['blip'] = {
            show = true,
            blipName = 'Craft 2',
            blipType = 814,
            blipColor = 2,
            blipScale = 0.55
        },
        ['craftTableUniqueID'] = {
            'crafttable2',
        },
        ['job'] = {
            ['police'] = true, -- jobname if delete this line all jobs can use this craft
            -- ['mechanic'] = true,
            --['uwu'] = true
        },
        ['categories'] = {
            { name = 'weapon', label = 'Weapons' },
            { name = 'police_gear', label = 'Police Gear' },
            { name = 'meds', label = 'Medical' },
        },
        ['items'] = {
            ['weapon'] = { -- category name
                {
                    name = 'weapon_combatpistol',
                    label = 'Combat Pistol',
                    chance = 60,            -- chance max 100 min 0
                    craftpoint = 150,       -- craft point
                    time = 3,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 450, -- reward craft point
                    rewardXP = 600,         -- reward xp
                    improveCraftPoint = 400,
                    requiredItems = {
                        { name = 'iron',       label = "Iron",        learn = true, point = 120, count = 3 },
                        { name = 'steel',      label = "Steel",       learn = true, point = 150, count = 2 },
                        { name = 'metalscrap', label = "Metal Scrap", learn = true, point = 50,  count = 5 },
                    },
                    description = "A combat version of a firearm, police exclusive"
                },
            },
            ['police_gear'] = { -- category name
                {
                    name = 'armor',
                    label = 'Body Armor',
                    chance = 90,           -- chance max 100 min 0
                    craftpoint = 80,       -- craft point
                    time = 2,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 200, -- reward craft point
                    rewardXP = 250,         -- reward xp
                    improveCraftPoint = 150,
                    requiredItems = {
                        { name = 'plastic',    label = "Plastic",     learn = true, point = 80, count = 4 },
                        { name = 'rubber',     label = "Rubber",      learn = true, point = 60, count = 2 },
                    },
                    description = "Protective gear to stop bullets"
                },
            },
            ['meds'] = { -- category name
                {
                    name = 'ifaks',
                    label = 'IFAK Kit',
                    chance = 100,           -- chance max 100 min 0
                    craftpoint = 100,       -- craft point
                    time = 1,               -- minutes
                    level = 1,              -- level
                    rewardCraftPoint = 300, -- reward craft point
                    rewardXP = 300,         -- reward xp
                    improveCraftPoint = 260,
                    requiredItems = {
                        { name = 'bandage',    label = "Bandage",     learn = true, point = 100, count = 2 },
                        { name = 'painkiller', label = "Painkiller",  learn = true, point = 100, count = 1 },
                    },
                    description = "Individual First Aid Kit used by LEOs"
                },
            },

        },
    },


}


Config.SkillTree = {
    ["timeboost"] = {
        { craftPoint = 250, marginTop = 5.5, marginLeft = 3.5,  level = 5 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 7.5,  level = 7 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 11.5, level = 10 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 15.5, level = 13 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 19.5, level = 15 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 23,   level = 17 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 27,   level = 20 }
    },
    ["chanceboost"] = {
        { craftPoint = 250, marginTop = 5.5, marginLeft = 46.3, level = 5 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 42.5, level = 7 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 38.5, level = 10 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 34.5, level = 13 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 30.5, level = 15 },
        { craftPoint = 250, marginTop = 9,   marginLeft = 26.5, level = 17 },
        { craftPoint = 250, marginTop = 5.5, marginLeft = 22.7, level = 20 }
    },
    ["xpboost"] = {
        { craftPoint = 250, marginTop = 10,   marginLeft = 3.5,  level = 2 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 7.5,  level = 4 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 11.5, level = 6 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 15.5, level = 8 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 19.3, level = 10 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 23.2, level = 12 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 27.2, level = 14 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 3.6,  level = 16 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 7.6,  level = 18 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 11.5, level = 20 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 15.5, level = 22 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 19.3, level = 24 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 23.2, level = 26 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 27.2, level = 28 }
    },
    ["cpboost"] = {
        { craftPoint = 250, marginTop = 10,   marginLeft = 46.4, level = 2 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 42.5, level = 4 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 38.5, level = 6 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 34.5, level = 8 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 30.5, level = 10 },
        { craftPoint = 250, marginTop = 13.6, marginLeft = 26.5, level = 12 },
        { craftPoint = 250, marginTop = 10,   marginLeft = 22.7, level = 14 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 46.4, level = 16 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 42.5, level = 18 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 38.5, level = 20 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 34.5, level = 22 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 30.5, level = 24 },
        { craftPoint = 250, marginTop = 21.5, marginLeft = 26.5, level = 26 },
        { craftPoint = 250, marginTop = 17.8, marginLeft = 22.7, level = 28 }
    }
}


Config.RequiredXP = {
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25000000000,
}
