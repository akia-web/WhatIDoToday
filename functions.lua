local _,core = ...;
core.Functions = {};
local levelMaxEvent = 60

function core.Functions.capitalizeFirstLetter(str)
    return str:gsub("^%l", string.upper)
end

function core.Functions.contient(tableau, element)
    for _, valeur in ipairs(tableau) do
        if valeur == element then
            return true
        end
    end
    return false
end
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
                
                    table.insert(lokedInstance, {instanceId = instanceId, instanceName = name, lockInstancePosition = i, difficultyId = difficultyId})
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

function core.Functions.getNameDifficulty(instance)
    local instanceName = ""
    if tonumber(instance)then
        local   name, _, _, _, _, _, _ = GetDifficultyInfo(instance)
        instanceName = name
    else
        for i, str in ipairs(instance) do
            local   name, _, _, _, _, _, _ = GetDifficultyInfo(str)
            if string.find(name, "(héroïque)") then
                name = string.gsub(name, "(héroïque)", "HM")
            end
            if string.find(name, "(Heroic)") then
                name = string.gsub(name, " (Heroic)", "HM")
            end
            instanceName = instanceName .. name
            if i < #instance then
                instanceName = instanceName .. ", "
            end
        end    
    end

    return instanceName

end
function core.Functions.checkIfMountIsAlreadyDone(mountId, instance, tableauLockedInstance, position, difficulty)
    for _, entry in ipairs(tableauLockedInstance) do
        local bossName, fileDataID, isKilled, unknown4 = GetSavedInstanceEncounterInfo(entry['lockInstancePosition'], position)
        local lockedInstanceID = entry["instanceId"] 
        if tonumber(difficulty) then
            if instance == lockedInstanceID and isKilled  and difficulty == entry["difficultyId"] then
                return true
                
            end
        else
            if instance == lockedInstanceID and isKilled  and core.Functions.contient(difficulty, entry["difficultyId"]) then
                return true
            end
        end  
    end
    return false
end

function core.Functions.getActiveBFAWorldQuest(zone)
    local factionGroup = UnitFactionGroup("player")

    local listWorldQuest = {}
    if factionGroup == "Alliance" and zone == "BFA" then
        core.WorlQuestPersoBFA = {}
        listWorldQuest = core.WorldQuestBfaAlliance
    
    elseif factionGroup == "Horde" and zone == "BFA" then
        core.WorlQuestPersoBFA = {}
        listWorldQuest = core.WorldQuestBfaHorde
    elseif  zone == "legion" then
        core.WorldQuestLegion.Perso = {}
        listWorldQuest = core.WorldQuestLegion
    else

    end


    local isCompletedHordeBFA = C_QuestLog.IsQuestFlaggedCompleted(51916) --Horde
    local isCompletedAllianceBFA = C_QuestLog.IsQuestFlaggedCompleted(51918) -- alliance
    local isCompletedLegion = C_QuestLog.IsQuestFlaggedCompleted(43341) -- legion

    if isCompletedAllianceBFA or isCompletedHordeBFA or isCompletedLegion then
        
        for index, entry in ipairs(listWorldQuest) do
            local questHasTemps =  C_TaskQuest.GetQuestTimeLeftSeconds(entry["IdQuest"])
            local mountTableau = {}
            
            if questHasTemps  then
                for index2, mount in ipairs(entry["TableauMount"]) do
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
               local objectives =   C_QuestLog.GetQuestObjectives(entry["IdQuest"])
                if string.find(objectives[1].text, "Accomplir 4") then
                    entry["Objectives"] = string.gsub(objectives[1].text, "Accomplir 4", "")
                elseif  string.find(objectives[1].text, "Achever 4") then
                    entry["Objectives"] = string.gsub(objectives[1].text, "Achever 4", "")
                else
                    -- if string.find(objectives[1].text, "Accomplir des") then
                    entry["Objectives"] = string.gsub(objectives[1].text, "Accomplir des", "") 
                end
                    
                entry["TableauMount"] = mountTableau
                entry["IsActive"]= true
                entry["Timer"]= questHasTemps
                local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry["IdQuest"])
                if isCompleted then
                    entry["IsCompleted"]= true
                end

                if not isCompleted and #entry["TableauMount"] > 0 then
                    if zone=="BFA" then
                        table.insert(core.WorlQuestPersoBFA, entry)
                    elseif zone=="legion" then
                        table.insert(core.WorldQuestLegion.Perso, entry)
                    end
                end
            else
            end
        end
    end
end

function core.Functions.getActiveShadowlandWorldQuest()
    core.worldQuestShadowLand.Perso = {}
    for index, entry in ipairs(core.worldQuestShadowLand) do
        
        local questHasTemps =  C_TaskQuest.GetQuestTimeLeftSeconds(entry["IdQuest"])
        local mountTableau = {}
        
        if questHasTemps  then
            for index2, mount in ipairs(entry["TableauMount"]) do
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
        
            entry["TableauMount"] = mountTableau
            entry["IsActive"]= true
            entry["Timer"]= questHasTemps
            local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry["IdQuest"])
            if isCompleted then
                entry["IsCompleted"]= true
            end

            if not isCompleted and #entry["TableauMount"] > 0 then
                
                    table.insert(core.worldQuestShadowLand.Perso, entry)
            end
        else
        end
    end

end

function core.Functions.getPersonnalInfoMount(tableauMountDaily)
    tableauMountDaily.Perso = {}

    local instanceLock = core.Functions.getInstanceLoked()
    local tableau = core.Functions.getIconAndCheckIfMountIsAlreadyCollected(tableauMountDaily)
 
    for _, entry in ipairs(tableau) do

    entry["ModeName"]=core.Functions.getNameDifficulty(entry['Mode'])
     if next(instanceLock) ~= nil then
         local isDone = core.Functions.checkIfMountIsAlreadyDone(entry["MountID"], entry["IdInstance"],instanceLock, entry["BossPosition"], entry["Mode"] )
         if not isDone then
            table.insert(tableauMountDaily.Perso, entry)
         end
     else

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
    core.WorldBoss.Perso = {}
    for index, entry in ipairs(core.WorldBoss) do
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
            if not C_QuestLog.IsQuestFlaggedCompleted(entry["IdQuest"]) then
                table.insert(core.WorldBoss.Perso, entry)  
            end
                 
        end

    end


    -- for _, entry in ipairs(core.WorldBoss.Perso) do
    --     local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry[3]);
    --     entry[5] = isCompleted;
    -- end

    return core.WorldBoss.Perso
    
end

local function getEventIcone(event, eventInfo, newCalandar)
    if eventInfo and (eventInfo['eventID'] == 423) then 
        return 'Interface\\Addons\\WhatIDoToday\\UI\\events\\amour.png'
    elseif eventInfo and (eventInfo['eventID'] == 327) then
        return 'Interface\\Addons\\WhatIDoToday\\UI\\events\\lunaire.png'
    elseif eventInfo and (eventInfo['eventID'] == 479) then
        return 'Interface\\Addons\\WhatIDoToday\\UI\\events\\foire-sombrelune.png'
    elseif eventInfo and (eventInfo['eventID'] == 602) then
        return 'Interface\\Addons\\WhatIDoToday\\UI\\events\\bonus-champ-bataille.png'
    elseif eventInfo and (eventInfo['eventID'] == 599) then
        return 'Interface\\Addons\\WhatIDoToday\\UI\\events\\battle-pet-bonus.png'
    elseif newCalandar ~= nil then
        return newCalandar['texture']
    else
       return event['texture']
    end

 
end

function core.Functions.getEventDay()
    C_Calendar.OpenCalendar()
   
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
            table.insert(lokedInstance, name)
    end

    local result = {}
    local currentDate = date("*t")
    local day = currentDate.day
    local numDayEvents =  C_Calendar.GetNumDayEvents(0, day)
    for i = 1, numDayEvents do
        local infoEvent = C_Calendar.GetDayEvent(0, day, i)
        local ligne = {}
        local event = C_Calendar.GetHolidayInfo(0, day, i)
        if event then           
            ligne['title'] = event['name']
            -- print(ligne['title'])
            -- print(infoEvent['eventID'])
            ligne['description'] = event['description']
            -- ligne['Icon'] = event['texture']
            if event["endTime"] then
                ligne['dateFin']= core.DateFormat.format(event)
            else
                ligne['dateFin'] = "Seulement aujourd'hui"
            end
            -- ligne['Icon']= 'Interface\\Addons\\WhatIDoToday\\UI\\amour.png'
            
            if event["startTime"] then
                ligne['start'] = event["startTime"] 
                if ligne['start']['monthDay'] ~= day then
                    local numDayEvents2 =  C_Calendar.GetNumDayEvents(0, ligne['start']['monthDay'])
                    for j = 1, numDayEvents2 do
                       local newCalandar =  C_Calendar.GetHolidayInfo(0, ligne['start']['monthDay'], j)
                        if newCalandar and ligne['title'] == newCalandar["name"] then
                            ligne['Icon'] = getEventIcone(event, infoEvent, newCalandar)
                        end
                    end
                end
            end

            if ligne['Icon'] == nil then
                ligne['Icon'] =  getEventIcone(event, infoEvent, nil)
            end
                table.insert(result, ligne) 
        end
    end
    core.Calendar = result
end 

local function rareIsDown(listRarsQuest)
    local result = {}
       for index, entry in ipairs(listRarsQuest) do
        local mountTableau = {}
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
        mountID= C_MountJournal.GetMountInfoByID(entry['MountID'])
        
        
        
        local isCompleted = C_QuestLog.IsQuestFlaggedCompleted(entry["IdQuest"])
        if not isCompleted and not isCollected then
            entry['MountName'] = name
            entry['Icon'] = spellID
            table.insert(result, entry)
        end
    end
    return result

end

function core.Functions.getWarfrontRares()
    local factionGroup = UnitFactionGroup("player")
    if factionGroup == "Alliance" then
        core.warfrontArathiPerso = {}
        core.warfrontDarkshorePerso = {}
        core.warfrontArathiPerso = rareIsDown(core.warfrontArathiAlly)
        core.warfrontDarkshorePerso = rareIsDown(core.warfrontDarkshoreAlly)
    end

    if factionGroup == "Horde" then
        core.warfrontArathiPerso = {}
        core.warfrontDarkshorePerso = core.warfrontDarkshorePerso
        core.warfrontArathiPerso = rareIsDown(core.warfrontArathHorde)
        core.warfrontDarkshorePerso = rareIsDown(core.warfrontDarkshoreHorde)
    end

 
end

local function allQuestAreCompleted(tableau)
    for i = 1, #tableau do
    --  local quest = C_QuestLog.IsQuestFlaggedCompleted(tableau[i])
        if not C_QuestLog.IsQuestFlaggedCompleted(tableau[i])then
           return false
        end
    end
    return true
end



local function getWinterEvent(isEventUp)
    local questCompleted = false
    questCompleted = allQuestAreCompleted(core.saisonnalEvent['noel']['IdQuest'])

    local name,
    spellID,
    _,_,_,_,_,_,_,_,
    isCollected,
    _= C_MountJournal.GetMountInfoByID(core.saisonnalEvent['noel']['MountID'])
    core.saisonnalEvent['noel']['MountName'] = name
    core.saisonnalEvent['noel']['Icon'] = spellID


    if isEventUp and not isCollected and not questCompleted  then
        table.insert(core.saisonnalEvent.Perso, core.saisonnalEvent['noel'])
    end
end

local function getLoveEvent(isEventUp)


    for i = 1, #core.saisonnalEvent["loveInAir"] do
        local isDonjonMount = false
        local donjonComplete = false

        if core.saisonnalEvent["loveInAir"][i]['MountID'] == 352 then
         isDonjonMount = true
         donjonComplete =  GetLFGDungeonRewards(288)       
        end

        local name,
        spellID,
        _,_,_,_,_,_,_,_,
        isCollected,
        _= C_MountJournal.GetMountInfoByID(core.saisonnalEvent['loveInAir'][i]['MountID'])
        core.saisonnalEvent['loveInAir'][i]['MountName'] = name
        core.saisonnalEvent['loveInAir'][i]['Icon'] = spellID

        if isEventUp and not isCollected and (not isDonjonMount  or (isDonjonMount and not donjonComplete and UnitLevel("player") >= levelMaxEvent )) then
            table.insert(core.saisonnalEvent.Perso, core.saisonnalEvent['loveInAir'][i])
        end
    end
end

function core.Functions.getSaisonnalEvent()
    core.saisonnalEvent.Perso = {}
    local currentDate = date("*t")
    local day = currentDate.day
    C_Calendar.OpenCalendar()
    local numDayEvents =  C_Calendar.GetNumDayEvents(0, day)
    local isThereWinterEvent = false
    local isLoveInAirEvent = false

    
    for i = 1, numDayEvents do
        local event = C_Calendar.GetDayEvent(0, day, i)

        if event and (event['eventID'] == 141) then
            isThereWinterEvent = true
        end

        if event and (event['eventID'] == 423) then
            isLoveInAirEvent = true
        end
    end

    if not isThereWinterEvent and not isLoveInAirEvent then
        return
    end

   getWinterEvent(isThereWinterEvent)
   getLoveEvent(isLoveInAirEvent)
end 