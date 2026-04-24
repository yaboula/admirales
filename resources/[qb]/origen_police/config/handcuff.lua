Config.HandCuff = {

    BlockedInputs = {

        68,
        69,
        21,
        24,
        257,
        25,
        263,
        45,
        22,
        44,
        37,
        23,
        288,
        289,
        170,
        167,
        0,
        26,
        73,
        59,
        71,
        72,
        49,
        36,
        47,
        264,
        257,
        140,
        141,
        142,
        143,
        75,
        75,
        45,
        80,
        140,
        250,
        263,
        310,
    },

    SkillCheck = {

        enabled = false,
        WaitChance = 3500,
        func = function()

            if not lib then

                return print("^1[ERROR] ^0Oxlib not found, please make sure that you have it and the fxmanifest oxlib line is uncommented.")

            end

            return lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}}, {'w', 'a', 's', 'd'})

        end

    },

    AllowAllJobs = false,
}

