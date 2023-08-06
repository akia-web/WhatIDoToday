local _,core = ...;
local mountAzsuna = {
   
    {943, false, "Interface\\Icons\\inv_hippogryph2azsuna"} --Hippogriffe nuelle
}

local mountValSharah = {
    {942, false, "Interface\\Icons\\inv_horse2green"} -- Courserêve sauvage
}

local mountHautRoc = {
    {941, false,  "Interface\\Icons\\inv_moosemount2"} --Noble-bois de Haut-Roc
}

local mountTornheim = {
    {944, false, "Interface\\Icons\\inv_stormdragonmount2"} --Aile-tempête valarjar
}

local mountSuramar = {
    {656, false, "Interface\\Icons\\foxmounticon"}, -- Rôdeur de Llothien
    {881, false, "Interface\\Icons\\inv_suramarmount"},--Sabre-de-mana d’arcaniste
    {905, false, "Interface\\Icons\\inv_suramarflyingcarpet"} -- Tapis volant tellurique
}

local mountArmeeDeLaLumiere = {
    {932, false, "Interface\\Icons\\inv_lightforgedmechsuit"} -- Exossature sancteforge
}

local mountFrontArgusseen = {
    {965, false, "Interface\\Icons\\inv_argustalbukmount_blue"}, -- Foule-ruines céruléen
    {968, false, "Interface\\Icons\\inv_argustalbukmount_red"}, -- Foule-ruines brun roux
    {966, false, "Interface\\Icons\\inv_argustalbukmount_green"}, -- Foule-ruines Béryl
    {964, false, "Interface\\Icons\\inv_argustalbukmount_purple"}, -- Foule-ruines améthyste
    {967, false, "Interface\\Icons\\inv_argustalbukmount_brown"}, -- Foule-ruines Acajou
    {939, false, "Interface\\Icons\\inv_argustalbukmount_black"}, -- Foule-ruines sable
}

core.WorldQuestLegion = {
    {-- --Aszuna
        IdQuest = 42420,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_legion_faction_nightfallen",
        TableauMount = mountAzsuna,
        Country = "Aszuna",
        Objectives = "nil",
        ReputName="Farondis",
        Title = "Emissaire"
    },
    {-- Souffrenuit
        IdQuest = 42421,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_legion_faction_nightfallen",
        TableauMount = mountSuramar,
        Country = "Suramar",
        Objectives = "nil",
        ReputName="Souffrenuit",
        Title = "Emissaire"
    },
    { --HautRoc
        IdQuest = 42233,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_fish_highmountainsalmonred",
        TableauMount = mountHautRoc,
        Country = "Haut-Roc",
        Objectives = "nil",
        ReputName="Tribus de Haut-Roc",
        Title = "Emissaire"
    },
    {--Val'Sharah
        IdQuest = 42170,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_legion_faction_dreamweavers",
        TableauMount = mountValSharah,
        Country = "Val'Sharah",
        Objectives = "nil",
        ReputName="Tisse-rêve",
        Title = "Emissaire"
    },
    {--Tornheim
        IdQuest = 42234,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_legion_faction_valarjar",
        TableauMount = mountTornheim,
        Country = "Tornheim",
        Objectives = "nil",
        ReputName="Valarjar",
        Title = "Emissaire"
    },
    {--Armée de la lumière
        IdQuest = 48639,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_legion_faction_armyofthelight",
        TableauMount = mountArmeeDeLaLumiere,
        Country = "Argus",
        Objectives = "nil",
        ReputName="Armée de la lumière",
        Title = "Emissaire"
    },
     {--Argus front argusseen
     IdQuest = 48642,
     IsActive = false,
     IsCompleted = false,
     Timer = 0,
     Icon = "Interface\\Icons\\inv_legion_faction_argussianreach",
     TableauMount = mountFrontArgusseen,
     Country = "Argus",
     Objectives = "nil",
     ReputName="Front argusséen",
     Title = "Emissaire"
    }
}