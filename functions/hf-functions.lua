local _,core = ...;
function core.Functions.getHF()
    core.hautFaitDragonFlyght.Perso = {}
    for index, entry in ipairs(core.hautFaitDragonFlyght) do
      local id, name, points, completed, month, day, year, description, flags,
      icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(entry['idHF'])
      entry['title'] = name
      entry['description'] = description

      local nameMount,
      spellID,
      iconMount,
      isActive,
      isUsable,
      sourceType,
      isFavorite,
      isFactionSpecific,
      faction,
      shouldHideOnChar,
      isCollected,
      mountID= C_MountJournal.GetMountInfoByID(entry['MountID'])
      entry['MountName'] = nameMount

      local requirements = {}

      for index2, entry2 in ipairs(entry.dependsHF) do
        local idRequirement, nameRequirement, pointsRequirement, completedRequirement, monthRequirement, dayRequirement,
         yearRequirement, descriptionRequirement, flagsRequirement, iconRequirement, rewardTextRequirement, 
         isGuildRequirement, wasEarnedByMeRequirement, earnedByRequirement, 
         isStatisticRequirement = GetAchievementInfo(entry2['id'])

         entry2['nameHf'] = nameRequirement
         entry2['description'] = descriptionRequirement
         entry2['doHF'] = completedRequirement

         local numCriteria = GetAchievementNumCriteria(entry2['id'])
         local criterias = {}
 
         if numCriteria > 0 then
           for i = 1, numCriteria do    
             local criteriaString, criteriaType, criteriacompleted, quantity, reqQuantity, charName, criteriaflags, assetID, quantityString, criteriaID, eligible
             = GetAchievementCriteriaInfo(entry2['id'], i )
 
             table.insert(criterias, {name = criteriaString, doRequirement = criteriacompleted,totalQuantityMob = quantity})
 
           end
         end
         if #criterias > 0 then
          entry2.criteria = criterias
         end
         
         if not completedRequirement then
          
          table.insert(requirements, entry2)
         end
      end
      entry.dependsHF = requirements
      table.insert(core.hautFaitDragonFlyght.Perso, entry)
      
    end
end