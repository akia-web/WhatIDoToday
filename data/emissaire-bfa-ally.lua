local _,core = ...;

local mountOrdreBraise = {
    {1062, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"}, --Griffon sombre des malvoies
    {1016, false, "Interface\\Icons\\ability_mount_ridinghorse"} --Destrié anthracite
}
local mountChantorage = {
    --IDMount, isCollected, IconeMount, isParengon, ReputLevel, nextStep
    {1063, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"},-- garde-côte-chantorage
    {1015, false, "Interface\\Icons\\ability_mount_ridinghorse"}, -- Gris truité
}

local mountPorvaillant = {
    {1064, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"}, --Éclaireur des mers des Portvaillant
    {1010, false, "Interface\\Icons\\inv_horse3saddle003_pale"}, --Étalon de l’amirauté
}
local mountAnkoiens = {
    {1231, false, "Interface\\Icons\\inv_sharkraymount_1"}, -- Raie des vagues ankoïenne
    {1237, false, "Interface\\Icons\\inv_snapdragonmount01"} -- Mordragon royal

}
core.WorldQuestBfaAlliance = {
    {--ordre des braises
        IdQuest = 50600,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_faction_orderofembers_round",
        TableauMount = mountOrdreBraise,
        Country = "Drustvar",
        Objectives = "nil",
        ReputName="Ordre des braises",
        Title = "Emissaire"
    },
    {-- sillage des tempete
        IdQuest = 50601,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_stormswake",
        TableauMount = mountChantorage,
        Country = "Vallée Chantorage",
        Objectives = "nil",
        ReputName="Sillage des tempetes",
        Title = "Emissaire"
    },
    {-- Portvaillant
       IdQuest = 50599,
       IsActive = false,
       IsCompleted = false,
       Timer = 0,
       Icon = "Interface\\Icons\\inv_proudmooreadmirality",
       TableauMount = mountPorvaillant,
       Country = "Rade de Tiragarde",
       Objectives = "nil",
       ReputName="Amirauté Portvaillant",
       Title = "Emissaire"
    },
    {-- Nazjatar
       IdQuest = 56119,
       IsActive = false,
       IsCompleted = false,
       Timer = 0,
       Icon = "Interface\\Icons\\inv_misc_enchantedpearlf",
       TableauMount = mountAnkoiens,
       Country = "Nazjatar",
       Objectives = "nil",
       ReputName="Ankoïens du brisant",
       Title = "Emissaire"
    },
    {-- Tas de fourrures légèrement humides
       IdQuest = 52196,
       IsActive = false,
       IsCompleted = false,
       Timer = 0,
       Icon = "Interface\\Icons\\inv_alpacamount_brown",
       TableauMount = {{1250, false, "Interface\\Icons\\inv_alpacamount_brown"}},
       Country = "Vol'dun",
       Objectives = "nil",
       ReputName="World boss",
       Title = "Tas de fourrures légèrement humides"
    }
}

