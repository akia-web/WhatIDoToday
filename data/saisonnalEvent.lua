local _,core = ...;

core.saisonnalEvent = {
    noel={
        MountID = 769,
        MountName = nil,
        IdQuest = {39648, 39668,39649,39651},
        Icon = nil,
        IdDonjon= nil,
        Donjon= nil,
        isCompleted = nil,
        Continent = "Draenor",
        Country = " Fief",
        Requirement = "Fief Level 3",
        Monnaie = 'x5 fournitures Joviales' ,
        Consigne = "Cadeau sauvage"
    },
    loveInAir={
        {
            -- fusee Brise-cœur X-45
            MountID = 352,
            MountName = nil,
            IdQuest = {},
            Icon = nil,
            IdDonjon= 288,
            Donjon= core.L['donjonLove'],
            isCompleted = nil,
            Continent = nil,
            Country = nil,
            Requirement = nil,
            Monnaie = nil,
            Consigne = nil
        },
        {
            -- Raie de mana cherche-cœur
            MountID = 1941,
            MountName = nil,
            IdQuest = {},
            Icon = nil,
            IdDonjon= nil,
            Donjon= nil,
            isCompleted = nil,
            Continent = nil,
            Country = nil,
            Requirement = nil,
            Monnaie = "x270 gage d'amour",
            Consigne = nil
        },
        {
            -- Inséparable rapide
            MountID = 431,
            MountName = nil,
            IdQuest = {},
            Icon = nil,
            IdDonjon= nil,
            Donjon= nil,
            isCompleted = nil,
            Continent = nil,
            Country = nil,
            Requirement = nil,
            Monnaie = "x270 gage d'amour",
            Consigne = nil
        }
    }


}