Config.Vehicles = {

    ["car"] = {

        ["police"] = {

            ["police"] = {label = "Police Patrol 1", grade = 1},

            ["police2"] = {label = "Police Patrol 2", grade = 1},

            ["police3"] = {label = "Police Patrol 3", grade = 1},

            ["policeb"] = {label = "Police Patrol 4", grade = 2},

        },

        ["sheriff"] = {

        },

        ["ambulance"] = {

            ["ambulance"] = {label = "Ambulance", grade = 1},

        }

    },

    ["heli"] = {

        ["police"] = {

            ["polmav"] = {label = "Police maverick", grade = 3},

        },

        ["sheriff"] = {

        },

        ["ambulance"] = {

        }

    },

    ["boat"] = {

        ["police"] = {

            ["predator"] = {label = "Police Boat", grade = 1},

        },

        ["sheriff"] = {

        },

        ["ambulance"] = {

        }

    }

}

Config.AllowedAlprJobs = {
    ["police"] = true,

    ["sheriff"] = true,

}

Config.Camara = {

    fov_max = 80.0,

    fov_min = 10.0,

    zoomspeed = 5.0,

    speed_lr = 5.0,

    speed_ud = 5.0

}

Config.SirensSystem = true
Config.Sirens = {

    "VEHICLES_HORNS_SIREN_1",

    "VEHICLES_HORNS_SIREN_2",

    "VEHICLES_HORNS_POLICE_WARNING"

}

Config.DefaultCarCamOffset = vector3(0.0, 0.5, 0.7)

Config.CustomCarOffsets = {
    ["police"] =  vector3(0.0, 0.5, 0.7),

    ["police2"] =  vector3(0.0, 0.5, 0.7),

}

Config.CustomCarLabels = {
}

Config.SpeedType = 'kmh'
Config.VehicleDataDist = 3.0
Config.HeliCam = true
Config.ExtrasMaxCount = 20
local tempVehicles = {}

for k, v in pairs(Config.Vehicles) do

    tempVehicles[k] = {}

    for job, vehicles in pairs(v) do

        tempVehicles[k][job] = {}

        for vehicle, vehicleData in pairs(vehicles) do

            local hashKey = GetHashKey(vehicle)

            tempVehicles[k][job][hashKey] = vehicleData

        end

    end

end

Config.Vehicles = tempVehicles

