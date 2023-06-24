local _,core = ...;
core.Mounts = {};
core.WorldQuest = {};
core.WorldQuest.BFA = {}
core.WorlQuestPersoBFA = {}
core.WorlQuestPersoLegion = {}
core.FrameAddon = nil

----------------MOUNT BFA--------------------

local mountChantorage = {
    --IDMount, isCollected, IconeMount, isParengon, ReputLevel, nextStep
    {1063, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"},-- garde-côte-chantorage
    {1015, false, "Interface\\Icons\\ability_mount_ridinghorse"}, -- Gris truité
}

local mountOrdreBraise = {
    {1062, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"}, --Griffon sombre des malvoies
    {1016, false, "Interface\\Icons\\ability_mount_ridinghorse"} --Destrié anthracite
}

local mountPorvaillant = {
    {1064, false, "Interface\\Icons\\inv_misc_elitegryphonarmored"}, --Éclaireur des mers des Portvaillant
    {1010, false, "Interface\\Icons\\inv_horse3saddle003_pale"}, --Étalon de l’amirauté
}

local mountNazmir = {
    {1059, false, "Interface\\Icons\\inv_pterrordax2mount_lightgreen"}, --Traqueur des marais capturé
    {1061, false, "Interface\\Icons\\ability_mount_bloodtick_purple"}, --Grouillante de sang de l’Expédition
}

local mountVolDun = {
    {926, false, "Interface\\Icons\\inv_hyena2mount_light"}, --Hyène d’albâtre
    {1060, false, "Interface\\Icons\\inv_pterrordax2mount_purple"}, --Rase-dunes volduni
}

local mountZulDazar = {
    {958, false, "Interface\\Icons\\inv_pterrordax2mount_white"}, --Pterreurdaile spectral
    {1058, false, "Interface\\Icons\\inv_pterrordax2mount_blue"}, --Pterreurdactyle cobait
}

local mountAnkoiens = {
    {1231, false, "Interface\\Icons\\inv_sharkraymount_1"}, -- Raie des vagues ankoïenne
    {1237, false, "Interface\\Icons\\inv_snapdragonmount01"} -- Mordragon royal

}
---------TODO MOUNT AFFRANCHIS ------------

----------------MOUNT LEGION--------------------

local mountAzsuna = {
    {942, false, "Interface\\Icons\\inv_horse2green"} -- Courserêve sauvage
}

local mountValSharah = {
    {943, false, "Interface\\Icons\\inv_hippogryph2azsuna"} --Hippogriffe nuelle
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

----------------MOUNT DONJON DAILY--------------------
core.Mounts.MountsDonjonDaily = { 
    --idMount,mountName, idInstance, iconMount, isDone, timeBeforeReset, numBoss, mode, nomDj, nomBoss, idDj
    {410, nil, 859, nil, nil, nil, 2, "Héroïque", "Zul'Gurub", nil, 334 }, -- raptor rouge
    {264, nil, 575, nil, nil, nil,3, "Héroïque", "Cime d'Utgarde", nil,205 }, -- proto drake bleu
    {213, nil, 585, nil, nil, nil, 4, "Héroïque", "Terrasse des magistères", nil, 1154}, -- faucon blanc peregrin

    -- raptor rouge
    -- {264, nil, 575, nil, nil, nil,3, "Heroic", "Cime d'Utgarde", nil,205 }, -- proto drake bleu
}
core.Mounts.MountsDonjonDaily.Perso = {}

core.WorldQuest.BFA.Alliance = { 
    --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, NomRéput
    {50600, false, false, 0, "Interface\\Icons\\inv_faction_orderofembers_round", mountOrdreBraise, "Drustvar", nil, "Ordre des braises" }, --ordre des braises
    {50601, false, false, 0, "Interface\\Icons\\inv_stormswake", mountChantorage, "Vallée Chantorage", nil, "Sillage des tempetes" }, -- sillage des tempete
    {50599, false, false, 0, "Interface\\Icons\\inv_proudmooreadmirality", mountPorvaillant, "Rade de Tiragarde", nil, "Amirauté Portvaillant"}, -- Portvaillant
    {56119, false, false, 0, "Interface\\Icons\\inv_misc_enchantedpearlf" , mountAnkoiens, "Nazjatar", nil, "Ankoïens du brisant"} -- Nazjatar

}


core.WorldQuest.BFA.Horde={
      --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
      {50602, false, false, 0, "Interface\\Icons\\inv_talanjisexpedition", mountNazmir, "Nazmir", nil, "Talanji" }, -- talanji
      {50603, false, false, 0, "Interface\\Icons\\inv_voldun", mountVolDun, "Vol'Dun", nil, "Volduni" }, -- Vol'Dun
      {50598, false, false, 0, "Interface\\Icons\\inv_proudmooreadmirality", mountZulDazar, "ZulDazar", nil, "Empire Zandalari"}, -- ZulDazar
      {56120, false, false, 0, "Interface\\Icons\\inv_misc_enchantedpearlf" , mountAnkoiens, "Nazjatar", nil, "Affranchis"} -- Nazjatar / affranchis
    
}

core.WorldQuest.Legion = {
    {42420, false, false, 0, "Interface\\Icons\\inv_legioncircle_faction_courtoffarnodis", mountAzsuna, "Aszuna", nil, "Farondis" }, --Aszuna
    {42421, false, false, 0, "Interface\\Icons\\inv_legion_faction_nightfallen", mountSuramar, "Suramar", nil, "Souffrenuit" }, -- Suramar
    {42233, false, false, 0, "Interface\\Icons\\inv_fish_highmountainsalmonred", mountHautRoc, "Haut-Roc", nil, "Tribus de Haut-Roc"}, -- HautRoc
    {42170, false, false, 0, "Interface\\Icons\\inv_legion_faction_dreamweavers" , mountValSharah, "Val'Sharah", nil, "Tisse-rêve"}, -- ValSharah
    {42234, false, false, 0, "Interface\\Icons\\inv_legion_faction_valarjar" , mountTornheim, "Tornheim", nil, "Valarjar"}, -- Tornheim
    {48639, false, false, 0, "Interface\\Icons\\inv_legion_faction_armyofthelight" , mountArmeeDeLaLumiere, "Argus", nil, "Armée de la lumière"}, -- Argus armée de la lumiere
    {48642, false, false, 0, "Interface\\Icons\\inv_legion_faction_argussianreach" , mountFrontArgusseen, "Argus", nil, "Front argusséen"} -- Argus front argusseen
}

core.Mounts.MountsDonjonWeeks = {
    --idMount,mountName, idInstance, iconMount, isDone, timeBeforeReset, numBoss, mode, nomDj, nomBoss, idDj
    --BFA
    {995, nil, 1754, nil, nil, nil, 4, "Mythique", "Port-Liberté", nil, 1704 }, -- Jacasse
    {1053, nil, 1841, nil, nil, nil, 4, "Mythique", "Tréfond putrides", nil, 1711 }, -- Crogg des tréfonds Putrides
    {1040, nil, 1762, nil, nil, nil, 4, "Mythique", "ZulDazar", nil, 1785 }, -- Traqueur des tombes
    {875, nil, 1651, nil, nil, nil, 4, "Mythique", "Defile de Deuillevent", nil, 1475 }, -- Minuit
    -- {1252, nil, 2097, nil, nil, nil, 4, "Mythique", "Mecagone", nil, 2006 }, -- garde paix de mecagone
    -- {1227, nil, 2097, nil, nil, nil, 8, "Mythique", "Mecagone", nil, 2006 }, -- Unité aérienne R-21/X
}

core.Mounts.MountsDonjonWeeks.Perso = {}

core.Mounts.WorldBoss = {
    --idMount,mountName, questID, iconMount, isDone, timeBeforeReset, nomZone, nomBoss, idDj
    --BFA
    {473, nil, 32099, nil, nil, nil, "Sommet de Kun-lai", nil, 1704 }, -- sha
    {515, nil, 32098, nil, nil, nil, "Vallée des quatre vents", nil, 1711 }, -- galion
    {542, nil, 32518, nil, nil, nil, "Ile tonnerre", nil, 1785 }, -- nalak
    {533, nil, 32519, nil, nil, nil, "Ile des géants", nil, 1785 }, -- Navrecorne Primordial cobalt
    {634, nil, 37464, nil, nil, nil, "Flèches d’arak", nil, 1785 }, -- Faucon des flèches solaire
    
}

core.Mounts.WorldBoss.Perso = {}

