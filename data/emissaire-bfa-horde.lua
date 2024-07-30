local _, core = ...;

local mountNazmir = {
    { 1059, false, "Interface\\Icons\\inv_pterrordax2mount_lightgreen" }, --Traqueur des marais capturé
    { 1061, false, "Interface\\Icons\\ability_mount_bloodtick_purple" }, --Grouillante de sang de l’Expédition
}
local mountVolDun = {
    { 926, false, "Interface\\Icons\\inv_hyena2mount_light" }, --Hyène d’albâtre
    { 1060, false, "Interface\\Icons\\inv_pterrordax2mount_purple" }, --Rase-dunes volduni
}

local mountZulDazar = {
    { 958, false, "Interface\\Icons\\inv_pterrordax2mount_white" }, --Pterreurdaile spectral
    { 1058, false, "Interface\\Icons\\inv_pterrordax2mount_blue" }, --Pterreurdactyle cobait
}
local mountAffranchis = {
    { 1230, false, "Interface\\Icons\\inv_sharkraymount_1" }, -- Raie des vagues des affranchis
    { 1237, false, "Interface\\Icons\\inv_snapdragonmount01" } -- Mordragon royal
}

core.WorldQuestBfaHorde = {
    {-- talanji
        IdQuest = 50602,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_talanjisexpedition",
        TableauMount = mountNazmir,
        Country = "Nazmir",
        Objectives = "nil",
        ReputName = "Talanji",
        Title = "Emissaire"
    },
    {-- Vol'Dun
        IdQuest = 50603,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_voldun",
        TableauMount = mountVolDun,
        Country = "Vol'Dun",
        Objectives = "nil",
        ReputName = "Volduni",
        Title = "Emissaire"
    },
    {-- ZulDazar
        IdQuest = 50598,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "inv_zuldazar",
        TableauMount = mountZulDazar,
        Country = "ZulDazar",
        Objectives = "nil",
        ReputName = "Empire Zandalari",
        Title = "Emissaire"
    },
    {-- Nazjatar
        IdQuest = 56120,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_misc_enchantedpearlf",
        TableauMount = mountAffranchis,
        Country = "Nazjatar",
        Objectives = "nil",
        ReputName = "Les affranchis",
        Title = "Emissaire"
    },
    {-- Tas de fourrures légèrement humides
        IdQuest = 52196,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        Icon = "Interface\\Icons\\inv_alpacamount_brown",
        TableauMount = { { 1250, false, "Interface\\Icons\\inv_alpacamount_brown" } },
        Country = "Vol'dun",
        Objectives = "nil",
        ReputName = "World boss",
        Title = "Tas de fourrures légèrement humides"
    }
}