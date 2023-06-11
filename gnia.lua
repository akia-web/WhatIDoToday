-- print("hello whatIdo")
-- local minimapIcon = LibStub("LibDBIcon-1.0")
-- local LDB, LDBo

-- mountsDonjonDaily = { --idMount, idInstance, iconMount, isDone, timeBeforeReset
-- {410, 859, nil, nil, nil}, -- raptor rouge
--     {264,575, nil, nil, nil}, -- proto drake bleu
    
--     {213, 585, nil, nil, nil} -- faucon blanc peregrin
-- }

-- allMountByPerso={}

-- lokedInstance = {}

-- local  function  getInstanceLoked()
--     local numberInstance = GetNumSavedInstances()
--     for i = 1, numberInstance do        
--             local name,
--             lockoutId,
--             reset, 
--             difficultyId, 
--             locked, 
--             extended, 
--             instanceIDMostSig, 
--             isRaid, 
--             maxPlayers, 
--             difficultyName, 
--             numEncounters, 
--             encounterProgress, 
--             extendDisabled, 
--             instanceId = GetSavedInstanceInfo(i)    
--             if locked  then
--                 local time
--                 if reset < 86400 then
--                     time = math.floor(reset/3600).."heures"
--                 else 
--                     time = math.floor(reset/86400).."jours "
--                 end
--                 table.insert(lokedInstance, {instanceId, time, name})
--                 -- print("Instance déjà faite cette semaine :".. name.."reset : ".. time.."id : ".. instanceId )
--             end
--     end
-- end

-- local function getIconAndCheckIfMountIsAlreadyCollected()

--     for index, entry in ipairs(mountsDonjonDaily) do
--         local name,
--         spellID,
--         icon,
--         isActive,
--         isUsable,
--         sourceType,
--         isFavorite,
--         isFactionSpecific,
--         faction,
--         shouldHideOnChar,
--         isCollected,
--         mountID= C_MountJournal.GetMountInfoByID(entry[1])
    
--         if isCollected then
--             table.remove(mountsDonjonDaily, index)
--         else
--            mountsDonjonDaily[index][3]=spellID
--         end

--     end

--     return mountsDonjonDaily

-- end

-- local function checkIfMountIsAlreadyDone(mountId, instance, tableauLockedInstance)

--      for _, entry in ipairs(tableauLockedInstance) do
--         local lockedInstanceID = entry[1]
--         if instance == lockedInstanceID then
--             -- {name, icon, true, entry[2], entry[3]}
--             -- return true -- Correspondance trouvée, retourne false
--             return {true, entry[2]}
--         end
--     end
--         return {false, 0}
--     -- return false -- Aucune correspondance trouvée, retourne true
-- end










-- function createFrameContainer(tableau)
--     print("le tableau")
--   local frame = CreateFrame("Frame", "IconSelectorFrame", UIParent, "UIPanelDialogTemplate")
--   frame:SetSize(1300, 1000)
--   frame:SetPoint("CENTER")
--   frame:SetClampedToScreen(true)
--   frame:SetMovable(true)
--   frame:EnableMouse(true)
--   frame:RegisterForDrag("LeftButton")
--   frame:SetScript("OnDragStart", frame.StartMoving)
--   frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
--   frame:SetScript("OnHide", frame.StopMovingOrSizing)
  
--   frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
--   frame.title:SetPoint("TOPLEFT", 16, -10)
--   frame.title:SetText("Sélection d'icône")
--   frame:SetFrameStrata("HIGH")
  
--   local iconSize = 50
--   local numColumns = 7
  
--   local scrollFrame = CreateFrame("ScrollFrame", "IconSelectorScrollFrame", frame, "UIPanelScrollFrameTemplate")
--   scrollFrame:SetPoint("TOPLEFT", 16, -40)
--   scrollFrame:SetPoint("BOTTOMRIGHT", -32, 30)
  
--   local scrollChild = CreateFrame("Frame", "IconSelectorScrollChild", scrollFrame)
--   scrollChild:SetSize(numColumns * (iconSize + 4), 0) -- La largeur doit correspondre à la largeur du ScrollFrame, la hauteur sera ajustée dynamiquement
--   scrollFrame:SetScrollChild(scrollChild)
--   print("gnia")
  
  
--     local function CreateIconTexture(parent, iconName)
--         print("coucou")
--         local button = CreateFrame("Button", nil, parent)
--         button:SetSize(iconSize, iconSize)
    
--         button.texture = button:CreateTexture(nil, "ARTWORK")
--         button.texture:SetAllPoints()
     
--         local iconTexture = GetSpellTexture(iconName[3])
--         button:SetNormalTexture(iconTexture)
--         if iconName[4] then
--             button:GetNormalTexture():SetDesaturated(true)
--         end

--       return button
--     end
  
  
--   local function PopulateIconSelector(tableau)
--       print("lala")
--       local rowIndex, colIndex = 0, 0
--       for _, item in ipairs(tableau) do
--           local button = CreateIconTexture(scrollChild, item)
--           button:SetPoint("TOPLEFT", colIndex * (iconSize + 150), -rowIndex * (iconSize + 150))
  
--           colIndex = colIndex + 1
--           if colIndex >= numColumns then
--               colIndex = 0
--               rowIndex = rowIndex + 1
--           end
--       end
  
--       -- Ajuster la hauteur du ScrollChild en fonction du nombre de lignes d'icônes
--       local numRows = math.ceil(#tableau / numColumns)
--       local scrollChildHeight = numRows * (iconSize + 4)
--       scrollChild:SetHeight(scrollChildHeight)
--   end
  
--   PopulateIconSelector(tableau)
  
-- --   frame:Hide()
--   end

--   local whatIDoToday = CreateFrame("Frame")
--   whatIDoToday:RegisterEvent("PLAYER_LOGIN")
--   whatIDoToday:SetScript("OnEvent", function(self, event, ...)
     
      
--       if event == "PLAYER_LOGIN" then
--           getInstanceLoked()
--               allMountByPerso =   getIconAndCheckIfMountIsAlreadyCollected()
--               for index, entry in ipairs(allMountByPerso) do
--                   local isDone = checkIfMountIsAlreadyDone(entry[1], entry[2])
--                   allMountByPerso[index][4] = isDone[1]
--                   allMountByPerso[index][5] = isDone[2]
--               end
--           print(allMountByPerso[1][4])
--           print(allMountByPerso[2][4])
--           createFrameContainer(allMountByPerso)
--       end
      
--   end)

