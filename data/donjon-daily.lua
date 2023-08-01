local _,core = ...;
core.Mounts = {};

core.MountsDonjonDaily = {
    {   -- raptor rouge
        MountID = 410, 
        MountName = nil,
        IdInstance = 859,
        Icon = nil,
        IsDone = nil,
        TimeBeforeReset = nil,
        BossPosition = 2,
        Mode = "Héroïque",
        DonjonName = "Zul'Gurub",
        BossName = nil, 
        IdDonjon =334,
        Continent = "Royaume de l'est",
        Country = " Vallée de Strangleronce"
    },
    {   -- proto drake bleu
        MountID = 264,
        MountName = nil,
        IdInstance = 575,
        Icon = nil,
        IsDone = nil,
        TimeBeforeReset= nil,
        BossPosition = 3,
        Mode = "Héroïque",
        DonjonName = "Cime d'Utgarde",
        BossName = nil,
        IdDonjon = 205,
        Continent = "Norfendre",
        Country = "Fjord Hurlant"
    },
    {   -- faucon blanc peregrin
        MountID = 213,
        MountName = nil,
        IdInstance = 585,
        Icon = nil,
        IsDone = nil,
        TimeBeforeReset = nil,
        BossPosition = 4, 
        Mode = "Héroïque",
        DonjonName = "Terrasse des magistères",
        BossName = nil,
        IdDonjon = 1154,
        Continent = "Royaume de l'est",
        Country = " Ile de Quel'Danas"
    },
}
-- core.Mounts.MountsDonjonDaily.Perso = {}
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

-- core.Mounts.WorldBoss.Perso = {}

-- core.Mounts.worldQuestShadowLand = {
--    --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
--     -- {60434, false, false, 0, "", mountSylvarden, "Sylvarden", nil, "nigthFae"}, -- nightFae
--         {60395, false, false, 0, "Interface\\Icons\\inv_rocmaldraxxusmount", mountMaldraxxus, "Maldraxxus", "nil", "l'armee immortelle"}, -- maldraxxus
--         {63543, false, false, 0, "Interface\\Icons\\inv_darkhoundmount_draka_orange",  {{1350, false, "Interface\\Icons\\inv_darkhoundmount_draka_orange"}}, " Antre", "nil", "Assaut NecroSeigneur"}, -- Sombredogue immortel
--         {63823, false, false, 0, "Interface\\Icons\\inv_decomposermountgreen",  {{1476, false, "Interface\\Icons\\inv_decomposermountgreen"}}, " Antre", "nil", "Assaut Fae Nocture"}, -- Sombredogue immortel
--         {63822, false, false, 0, "Interface\\Icons\\inv_giantvampirebatmount_purple",  {{1378, false, "Interface\\Icons\\inv_giantvampirebatmount_purple"}}, " Antre", "nil", "Assaut Venthyr"} -- Aile de l’effroi du moissonneur
        
        
-- }
-- core.Mounts.MountsRaidWeekly.Perso = {}

-- core.Mounts.MountsRaidWeekly = {
--     --idMount,mountName, idInstance, iconMount, isDone, timeBeforeReset, numBoss, mode, nomDj, nomBoss, idDj
--     {304, nil, 	603, nil, nil, nil, 16, "Normal", "Ulduar", nil, 244},
--     {791, nil, 	1530, nil, nil, nil, 10, "Mythique", "Palais Sacrenuit", nil, 1351},
--     {168, nil, 	532, nil, nil, nil, 1, "10 joueurs", "Kharazan", nil, 175},
--     {559, nil, 	1136, nil, nil, nil, 14, "Mythique", "Siège d'Orgrimmar", nil, 766},
    
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