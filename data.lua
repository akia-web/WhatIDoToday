local _,core = ...;
-- core.Mounts = {};
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

local mountMaldraxxus = {
    
}



core.WorldQuest.BFA.Alliance = { 
    --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, NomRéput
    {50600, false, false, 0, "Interface\\Icons\\inv_faction_orderofembers_round", mountOrdreBraise, "Drustvar", nil, "Ordre des braises" }, --ordre des braises
    {50601, false, false, 0, "Interface\\Icons\\inv_stormswake", mountChantorage, "Vallée Chantorage", nil, "Sillage des tempetes" }, -- sillage des tempete
    {50599, false, false, 0, "Interface\\Icons\\inv_proudmooreadmirality", mountPorvaillant, "Rade de Tiragarde", nil, "Amirauté Portvaillant"}, -- Portvaillant
    {56119, false, false, 0, "Interface\\Icons\\inv_misc_enchantedpearlf" , mountAnkoiens, "Nazjatar", nil, "Ankoïens du brisant"}, -- Nazjatar
    {52196, false, false, 0, "Interface\\Icons\\inv_alpacamount_brown" , {{1250, false, "Interface\\Icons\\inv_alpacamount_brown"}}, "Vol'dun", nil, "World boss"} -- Tas de fourrures légèrement humides
}


core.WorldQuest.BFA.Horde={
      --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
      {50602, false, false, 0, "Interface\\Icons\\inv_talanjisexpedition", mountNazmir, "Nazmir", nil, "Talanji" }, -- talanji
      {50603, false, false, 0, "Interface\\Icons\\inv_voldun", mountVolDun, "Vol'Dun", nil, "Volduni" }, -- Vol'Dun
      {50598, false, false, 0, "Interface\\Icons\\inv_proudmooreadmirality", mountZulDazar, "ZulDazar", nil, "Empire Zandalari"}, -- ZulDazar
      {56120, false, false, 0, "Interface\\Icons\\inv_misc_enchantedpearlf" , mountAnkoiens, "Nazjatar", nil, "Affranchis"}, -- Nazjatar / affranchis
      {52196, false, false, 0, "Interface\\Icons\\inv_alpacamount_brown" , {{1250, false, "Interface\\Icons\\inv_alpacamount_brown"}}, "Vol'dun", nil, "World boss"} -- Tas de fourrures légèrement humides
}

core.WorldQuest.Legion = {
     --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
    {42420, false, false, 0, "Interface\\Icons\\inv_legioncircle_faction_courtoffarnodis", mountAzsuna, "Aszuna", nil, "Farondis" }, --Aszuna
    {42421, false, false, 0, "Interface\\Icons\\inv_legion_faction_nightfallen", mountSuramar, "Suramar", nil, "Souffrenuit" }, -- Suramar
    {42233, false, false, 0, "Interface\\Icons\\inv_fish_highmountainsalmonred", mountHautRoc, "Haut-Roc", nil, "Tribus de Haut-Roc"}, -- HautRoc
    {42170, false, false, 0, "Interface\\Icons\\inv_legion_faction_dreamweavers" , mountValSharah, "Val'Sharah", nil, "Tisse-rêve"}, -- ValSharah
    {42234, false, false, 0, "Interface\\Icons\\inv_legion_faction_valarjar" , mountTornheim, "Tornheim", nil, "Valarjar"}, -- Tornheim
    {48639, false, false, 0, "Interface\\Icons\\inv_legion_faction_armyofthelight" , mountArmeeDeLaLumiere, "Argus", nil, "Armée de la lumière"}, -- Argus armée de la lumiere
    {48642, false, false, 0, "Interface\\Icons\\inv_legion_faction_argussianreach" , mountFrontArgusseen, "Argus", nil, "Front argusséen"}, -- Argus front argusseen
    
}

-- core.Mounts.MountsDonjonWeeks = {
--     --idMount,mountName, idInstance, iconMount, isDone, timeBeforeReset, numBoss, mode, nomDj, nomBoss, idDj
--     --BFA
--     {995, nil, 1754, nil, nil, nil, 4, "Mythique", "Port-Liberté", nil, 1704 }, -- Jacasse
--     {1053, nil, 1841, nil, nil, nil, 4, "Mythique", "Tréfond putrides", nil, 1711 }, -- Crogg des tréfonds Putrides
--     {1040, nil, 1762, nil, nil, nil, 4, "Mythique", "ZulDazar", nil, 1785 }, -- Traqueur des tombes
--     {875, nil, 1651, nil, nil, nil, 4, "Mythique", "Defile de Deuillevent", nil, 1475 }, -- Minuit
--     {1252, nil, 2097, nil, nil, nil, 4, "Mythique", "Mecagone", nil, 2006 }, -- garde paix de mecagone
--     {1227, nil, 2097, nil, nil, nil, 8, "Mythique", "Mecagone", nil, 2006 }, -- Unité aérienne R-21/X
-- }

-- core.Mounts.MountsDonjonWeeks.Perso = {}

-- core.Mounts.WorldBoss = {
--     --idMount,mountName, questID, iconMount, isDone, timeBeforeReset, nomZone, nomBoss, idDj
--     {473, nil, 32099, nil, nil, nil, "Sommet de Kun-lai", nil, 1704 }, -- sha
--     {515, nil, 32098, nil, nil, nil, "Vallée des quatre vents", nil, 1711 }, -- galion
--     {542, nil, 32518, nil, nil, nil, "Ile tonnerre", nil, 1785 }, -- nalak
--     {533, nil, 32519, nil, nil, nil, "Ile des géants", nil, 1785 }, -- Navrecorne Primordial cobalt
--     {634, nil, 37464, nil, nil, nil, "Flèches d’arak", nil, 1785 }, -- Faucon des flèches solaire
    
-- }

-- core.Mounts.WorldBoss.Perso = {}

-- core.Mounts.worldQuestShadowLand = {
--    --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
--     -- {60434, false, false, 0, "", mountSylvarden, "Sylvarden", nil, "nigthFae"}, -- nightFae
--         {60395, false, false, 0, "Interface\\Icons\\inv_rocmaldraxxusmount", mountMaldraxxus, "Maldraxxus", "nil", "l'armee immortelle"}, -- maldraxxus
--         {63543, false, false, 0, "Interface\\Icons\\inv_darkhoundmount_draka_orange",  {{1350, false, "Interface\\Icons\\inv_darkhoundmount_draka_orange"}}, " Antre", "nil", "Assaut NecroSeigneur"}, -- Sombredogue immortel
--         {63823, false, false, 0, "Interface\\Icons\\inv_decomposermountgreen",  {{1476, false, "Interface\\Icons\\inv_decomposermountgreen"}}, " Antre", "nil", "Assaut Fae Nocture"}, -- Sombredogue immortel
--         {63822, false, false, 0, "Interface\\Icons\\inv_giantvampirebatmount_purple",  {{1378, false, "Interface\\Icons\\inv_giantvampirebatmount_purple"}}, " Antre", "nil", "Assaut Venthyr"} -- Aile de l’effroi du moissonneur
        
        
-- }

-- core.WorlQuestPersoShadowLand = {}

core.Mounts.MountsRaidWeekly = {
    --idMount,mountName, idInstance, iconMount, isDone, timeBeforeReset, numBoss, mode, nomDj, nomBoss, idDj
    {304, nil, 	603, nil, nil, nil, 16, "Normal", "Ulduar", nil, 244},
    {791, nil, 	1530, nil, nil, nil, 10, "Mythique", "Palais Sacrenuit", nil, 1351},
    {168, nil, 	532, nil, nil, nil, 1, "10 joueurs", "Kharazan", nil, 175},
    {559, nil, 	1136, nil, nil, nil, 14, "Mythique", "Siège d'Orgrimmar", nil, 766},
    
}

-- idMount [1] = recherche google nom monture + wowhead -> enseigner par 
-- idInstance [3] = https://wowpedia.fandom.com/wiki/InstanceID
-- numBoss [7] = la position du boss dans l'instance (visible dans le infoRaid)
-- mode[8] = Normal, Mythique, Héroïque 
-- nomDJ [9] = nom du raid
-- idDJ [11] = reprends le nom en anglais trouver lors de la recherche [3] puis prendre l'id tout a gauche en faisant a attention
--             que l'id tout a droite corresponde bien au [3]
--             https://wowpedia.fandom.com/wiki/LfgDungeonID


core.Mounts.MountsRaidWeekly.Perso = {}