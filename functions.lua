local _,core = ...;
core.Functions = {};

function core.Functions.getInstanceLoked()
        local numberInstance = GetNumSavedInstances()
        local lokedInstance = {}
        for i = 1, numberInstance do        
                local name,
                lockoutId,
                reset, 
                difficultyId, 
                locked, 
                extended, 
                instanceIDMostSig, 
                isRaid, 
                maxPlayers, 
                difficultyName, 
                numEncounters, 
                encounterProgress, 
                extendDisabled, 
                instanceId = GetSavedInstanceInfo(i)
                if locked then
                    local time
                    if reset < 86400 then
                        time = math.floor(reset/3600).."heures"
                    else 
                        time = math.floor(reset/86400).."jours "
                    end
                    table.insert(lokedInstance, {instanceId, time, name, i, difficultyName})
                end
        end
        return lokedInstance
end

function core.Functions.getIconAndCheckIfMountIsAlreadyCollected(liste)
    liste.Perso = {}
    
    for index, entry in ipairs(liste) do
        
        local name,
        spellID,
        icon,
        isActive,
        isUsable,
        sourceType,
        isFavorite,
        isFactionSpecific,
        faction,
        shouldHideOnChar,
        isCollected,
        mountID= C_MountJournal.GetMountInfoByID(entry[1])
        if not isCollected then
            entry[2]=name
            entry[4]=spellID
            local bossName, texture, isKilled, unknown4 = GetLFGDungeonEncounterInfo(entry[11], entry[7])
            entry[10]= bossName
            table.insert(liste.Perso, entry)      
        end

    end
   return liste.Perso
end

function core.Functions.checkIfMountIsAlreadyDone(mountId, instance, tableauLockedInstance, position, difficulty)
    for _, entry in ipairs(tableauLockedInstance) do
        local bossName, fileDataID, isKilled, unknown4 = GetSavedInstanceEncounterInfo(entry[4], position)
        local lockedInstanceID = entry[1]
        if instance == lockedInstanceID and isKilled  and difficulty == entry[5] then
            return {true, entry[2]}
        end
    end
        return {false, 0, }
end

function core.Functions.getActiveBFAWorldQuest(zone)

   
    

    local factionGroup = UnitFactionGroup("player")

    local listWorldQuest = {}
    if factionGroup == "Alliance" and zone == "BFA" then
        core.WorlQuestPersoBFA = {}
        listWorldQuest = core.WorldQuest.BFA.Alliance
    
    elseif factionGroup == "Horde" and zone == "BFA" then
        core.WorlQuestPersoBFA = {}
        listWorldQuest = core.WorldQuest.BFA.Horde
    elseif  zone == "legion" then
        core.WorlQuestPersoLegion = {}
        listWorldQuest = core.WorldQuest.Legion
    else

    end


    local isCompletedHordeBFA = C_QuestLog.IsQuestFlaggedCompleted(51916) --Horde
    local isCompletedAllianceBFA = C_QuestLog.IsQuestFlaggedCompleted(51918) -- alliance
    local isCompletedLegion = C_QuestLog.IsQuestFlaggedCompleted(43341) -- legion

    if isCompletedAllianceBFA or isCompletedHordeBFA or isCompletedLegion then
        
        for index, entry in ipairs(listWorldQuest) do
            local questHasTemps =  C_TaskQuest.GetQuestTimeLeftSeconds(entry[1])
            local mountTableau = {}
            
            if questHasTemps  then
                for index2, mount in ipairs(entry[6]) do
                    local name,
                    spellID,
                    icon,
                    isActive,
                    isUsable,
                    sourceType,
                    isFavorite,
                    isFactionSpecific,
                    faction,
                    shouldHideOnChar,
                    isCollected,
                    mountID= C_MountJournal.GetMountInfoByID(mount[1])

                    if not isCollected then
                        table.insert(mountTableau, mount)
                    end
                end
               local objectives =   C_QuestLog.GetQuestObjectives(entry[1])
                if string.find(objectives[1].text, "Accomplir 4") then
                    entry[8] = string.gsub(objectives[1].text, "Accomplir 4", "")
                else
                    entry[8] = string.gsub(objectives[1].text, "Accomplir des", "") 
                end
            
                entry[6] = mountTableau
                entry[2]= true
                entry[4]= questHasTemps
                local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry[1])
                if isCompleted then
                    entry[3]= true
                end

                if not isCompleted and #entry[6] > 0 then
                    if zone=="BFA" then
                        table.insert(core.WorlQuestPersoBFA, entry)
                    elseif zone=="legion" then
                        table.insert(core.WorlQuestPersoLegion, entry)
                    end
                end
            else
            end
        end
    end




end

function core.Functions.getPersonnalInfoMount(tableauMountDaily)

    local instanceLock = core.Functions.getInstanceLoked()
    tableauMountDaily.Perso = core.Functions.getIconAndCheckIfMountIsAlreadyCollected(tableauMountDaily)
  
    for _, entry in ipairs(tableauMountDaily.Perso) do
     if next(instanceLock) ~= nil then
         local isDone = core.Functions.checkIfMountIsAlreadyDone(entry[1], entry[3],instanceLock, entry[7], entry[8] )
         entry[5] = isDone[1]
         entry[6] = isDone[2]
     else
       entry[5]= false;
       entry[6]= 0;

     end
    end
    
end


function core.Functions.getContainerScrollFrame(parent)
    local containerFrame = CreateFrame("Frame", "IconSelectorScrollChild2", parent)
    containerFrame:SetSize(1100,0)
    parent:SetScrollChild(containerFrame)
    return containerFrame
end

   
function core.Functions.getWorldBossLocked()
    core.Mounts.WorldBoss.Perso = {}
    for index, entry in ipairs(core.Mounts.WorldBoss) do
        
        local name,
        spellID,
        icon,
        isActive,
        isUsable,
        sourceType,
        isFavorite,
        isFactionSpecific,
        faction,
        shouldHideOnChar,
        isCollected,
        mountID= C_MountJournal.GetMountInfoByID(entry[1])
        if not isCollected then
            entry[2]=name
            entry[4]=spellID
            table.insert(core.Mounts.WorldBoss.Perso, entry)      
        end

    end


    for _, entry in ipairs(core.Mounts.WorldBoss.Perso) do
    local isCompleted =    C_QuestLog.IsQuestFlaggedCompleted(entry[3])
    entry[5] = isCompleted
    end

    return core.Mounts.WorldBoss.Perso
    
end


