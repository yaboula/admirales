Config.Tags = {

    ['default'] = {
        "Altercation",

        "Firearms",

        "Open case",
        "Case closed",
        "Null case",
        "Crimes against animals",

        "Vial security felony",

        "Crimes against natural resources",

        "Crimes in documents, identifications or licenses",

        "Drugs",

        "Fib",

        "Quality report",

        "Homicide attempt",

        "Homicide attempt (police)",

        "Police operation",

        "Import robbery",

        "Vehicle theft",

        "Major robbery",

        "Minor robbery",

        "Kidnapping",

        "Kidnapping (police)",

    },

    ['police'] = 'default',
    ['sheriff'] = 'default',
    ['ambulance'] = {

        "Medical emergency",

        "Medical date",

    }

}

for k, v in pairs(Config.Tags) do

    if type(v) == 'string' then

        Config.Tags[k] = Config.Tags[v]

    end

end

Translations.ReportTags = Config.Tags

