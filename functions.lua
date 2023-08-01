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
    local result = {}
    
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
        mountID= C_MountJournal.GetMountInfoByID(entry["MountID"])

        if not isCollected then
            entry["MountName"]=name
            entry["Icon"]=spellID
            local bossName, texture, isKilled, unknown4 = GetLFGDungeonEncounterInfo(entry["IdDonjon"], entry["BossPosition"])
            entry["BossName"]= bossName
            table.insert(result, entry)      
        end

    end
return result
end

function core.Functions.checkIfMountIsAlreadyDone(mountId, instance, tableauLockedInstance, position, difficulty)
    for _, entry in ipairs(tableauLockedInstance) do
        local bossName, fileDataID, isKilled, unknown4 = GetSavedInstanceEncounterInfo(entry[4], position)
        local lockedInstanceID = entry[1]

        -- print (instance .. " " ..lockedInstanceID.. " ".. difficulty .. entry[5])
        if instance == lockedInstanceID and isKilled  and difficulty == entry[5] then
            return {true, entry[2]}
        end
    end
        return {false, 0}
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
                    -- if string.find(objectives[1].text, "Accomplir des") then
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

function core.Functions.getActiveShadowlandWorldQuest()
    core.WorlQuestPersoShadowLand = {}
    for index, entry in ipairs(core.Mounts.worldQuestShadowLand) do
        
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
        
            entry[6] = mountTableau
            entry[2]= true
            entry[4]= questHasTemps
            local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry[1])
            if isCompleted then
                entry[3]= true
            end

            if not isCompleted and #entry[6] > 0 then
                
                    table.insert(core.WorlQuestPersoShadowLand, entry)
            end
        else
        end
    end

end

function core.Functions.getPersonnalInfoMount(tableauMountDaily)
    tableauMountDaily.Perso = {}
    -- tableauMountDaily.Perso = {MountID = nil, MountName = nil, IdInstance = nil, Icon = nil, IsDone = nil, TimeBeforeReset = nil, BossPosition = nil, Mode = nil, DonjonName = nil, BossName = nil, IdDonjon = nil}
    local instanceLock = core.Functions.getInstanceLoked()
    local tableau = core.Functions.getIconAndCheckIfMountIsAlreadyCollected(tableauMountDaily)
    for _, entry in ipairs(tableau) do
     if next(instanceLock) ~= nil then
         local isDone = core.Functions.checkIfMountIsAlreadyDone(entry["MountID"], entry["IdInstance"],instanceLock, entry["BossPosition"], entry["Mode"] )
         if not isDone[1]  then
            table.insert(tableauMountDaily.Perso, entry)
         end
         
         
     else
       entry["IsDone"]= false;
       entry["TimeBeforeReset"]= 0;
       table.insert(tableauMountDaily.Perso, entry)
     end
    end
   return tableauMountDaily.Perso
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
        local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry[3]);
        entry[5] = isCompleted;
    end

    return core.Mounts.WorldBoss.Perso
    
end

function core.Functions.getEventDay()
    local result = {}
    local currentDate = date("*t")
    local day = currentDate.day
    print(day)
  
    local numDayEvents =  C_Calendar.GetNumDayEvents(0, day)
    print ('events : ',numDayEvents)
  
    for i = 1, numDayEvents do
        local ligne = {}
        local event = C_Calendar.GetDayEvent(0, day, i)
        ligne['id'] = event['eventID']
        ligne['title'] = event['title']
        ligne['icon'] = event['iconTexture']

        print(ligne['icon'])
        table.insert(result, ligne)
    end
    return result
end