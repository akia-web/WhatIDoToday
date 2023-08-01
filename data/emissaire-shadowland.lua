local _,core = ...;

-- core.worldQuestShadowLand = {
--     --idWorldQuest, isActive, completed, timer, icone, tableau monture, région, objectives, nomReput
--      -- {60434, false, false, 0, "", mountSylvarden, "Sylvarden", nil, "nigthFae"}, -- nightFae
--          {60395, false, false, 0, "Interface\\Icons\\inv_rocmaldraxxusmount", {1350, false, "Interface\\Icons\\inv_rocmaldraxxusmountblack"} , "Maldraxxus", "nil", "l'armee immortelle"}, -- --Fauche-griffe colossal
--          {63543, false, false, 0, "Interface\\Icons\\inv_darkhoundmount_draka_orange",  {{1350, false, "Interface\\Icons\\inv_darkhoundmount_draka_orange"}}, " Antre", "nil", "Assaut NecroSeigneur"}, -- Sombredogue immortel
--          {63823, false, false, 0, "Interface\\Icons\\inv_decomposermountgreen",  {{1476, false, "Interface\\Icons\\inv_decomposermountgreen"}}, " Antre", "nil", "Assaut Fae Nocture"}, -- Sombredogue immortel
--          {63822, false, false, 0, "Interface\\Icons\\inv_giantvampirebatmount_purple",  {{1378, false, "Interface\\Icons\\inv_giantvampirebatmount_purple"}}, " Antre", "nil", "Assaut Venthyr"} -- Aile de l’effroi du moissonneur     
--  }

 core.worldQuestShadowLand = {

    {--Fauche-griffe colossal
        IdQuest = 60395, 
        IsActive = false, 
        IsCompleted = false, 
        Timer = 0, 
        Icon = "Interface\\Icons\\inv_rocmaldraxxusmount",
        MountID = 1350,
        TableauMount = {{1350, false, "Interface\\Icons\\inv_rocmaldraxxusmountblack"}} ,
        Country = "Maldraxxus", 
        Objectives = "nil", 
        ReputName = "l'armee immortelle",
        Title = "Emissaire"
    },
    {-- Sombredogue immortel
        IdQuest = 63543, 
        IsActive = false, 
        IsCompleted = false, 
        Timer = 0, 
        Icon = "Interface\\Icons\\inv_darkhoundmount_draka_orange", 
        MountID = 1350,
        TableauMount = {{1350, false, "Interface\\Icons\\inv_darkhoundmount_draka_orange"}}, 
        Country = "Antre", 
        Objectives = "nil", 
        ReputName = "Assaut NecroSeigneur",
        Title = "Assaut"
    },
    {-- Sombredogue immortel
        IdQuest = 63823,
        IsActive = false,
        IsCompleted = false,
        Timer = 0, 
        Icon = "Interface\\Icons\\inv_decomposermountgreen",
        MountID = 1476,
        TableauMount = {{1476, false, "Interface\\Icons\\inv_decomposermountgreen"}},
        Country = "Antre",
        Objectives = "nil",
        ReputName = "Assaut Fae Nocture",
        Title = "Assaut"
    }, 
    {-- Aile de l’effroi du moissonneur 
        IdQuest = 63822,
        IsActive = false,
        IsCompleted = false,
        Timer = 0,
        MountID = 1378,
        Icon = "Interface\\Icons\\inv_giantvampirebatmount_purple",
        TableauMount = {{1378, false, "Interface\\Icons\\inv_giantvampirebatmount_purple"}},
        Country = "Antre",
        Objectives = "nil",
        ReputName="Assaut Venthyr",
        Title = "Assaut"
    }
 }

 core.WorlQuestPersoShadowLand = {}