local _, core = ...;
function core.Functions.getHF()
    local factionGroup = UnitFactionGroup("player")

    core.hautFaitDragonFlyght.Perso = {}
    for index, entry in ipairs(core.hautFaitDragonFlyght) do
        local id, name, points, completed, month, day, year, description, flags,
        icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(entry['idHF'])

        local hf= entry
        hf['title'] = name
        hf['description'] = description

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
        mountID = C_MountJournal.GetMountInfoByID(entry['MountID'])
        hf['MountName'] = nameMount

        local requirements = {}

        for index2, entry2 in ipairs(entry.dependsHF) do

            local idOrAllianceOrHorde = ''
            if entry2['id'] then
                idOrAllianceOrHorde = entry2['id']
            elseif factionGroup == "Alliance" then
                idOrAllianceOrHorde = entry2['horde']
            elseif factionGroup == "Horde" then
                idOrAllianceOrHorde = entry2['alliance']
            end
            local idRequirement, nameRequirement, pointsRequirement, completedRequirement, monthRequirement, dayRequirement,
            yearRequirement, descriptionRequirement, flagsRequirement, iconRequirement, rewardTextRequirement,
            isGuildRequirement, wasEarnedByMeRequirement, earnedByRequirement,
            isStatisticRequirement = GetAchievementInfo(idOrAllianceOrHorde)
            local requirement = entry2
            requirement['id']=idOrAllianceOrHorde
            requirement['nameHf'] = nameRequirement
            requirement['description'] = descriptionRequirement
            requirement['doHF'] = completedRequirement
            requirement['Icon'] = iconRequirement

            local numCriteria = GetAchievementNumCriteria(idOrAllianceOrHorde)
            local criterias = {}

            if numCriteria > 0 then
                for i = 1, numCriteria do
                    local criteriaString, criteriaType, criteriacompleted, quantity, reqQuantity, charName, criteriaflags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfo(requirement['id'], i)

                    table.insert(criterias, { name = criteriaString, doRequirement = criteriacompleted, totalQuantityMob = quantity, reqQuantity = reqQuantity, quantityString = quantityString })

                end
            end
            if #criterias > 0 then
                requirement.criteria = criterias
            end

            if not completedRequirement then
                if not core.Functions.includes(requirements, nameRequirement, 'nameHf') then
                    table.insert(requirements, requirement)
                end

            end
        end
        hf['dependsHF'] = requirements

        if not completed then
            table.insert(core.hautFaitDragonFlyght.Perso, hf)
        end


    end
end