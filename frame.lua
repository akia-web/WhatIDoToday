local _,core = ...;
core.Frame = {};


local function buttonMountArmury(parent, iconName, idMount)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(50, 50)

  button.texture = button:CreateTexture(nil, "ARTWORK")
  button.texture:SetAllPoints()

  if string.find(iconName, "Interface") then
    button:SetNormalTexture(iconName)
  else
    local iconTexture = GetSpellTexture(iconName)
    button:SetNormalTexture(iconTexture)
  end

  button:SetScript("OnMouseDown", function(self, button)
    if IsControlKeyDown()then
      DressUpMount(idMount)
    end
  end)
  return button
end
 local function CreateIconTexture(parent, iconName, isDown, typeIcone, idMount)
   local button = CreateFrame("Button", nil, parent)
   button:SetSize(50, 50)

   button.texture = button:CreateTexture(nil, "ARTWORK")
   button.texture:SetAllPoints()

     if typeIcone == "donjonDaily"  or typeIcone == "worldboss" then
       local iconTexture = GetSpellTexture(iconName)
       button:SetNormalTexture(iconTexture)
       button:SetScript("OnMouseDown", function(self, button)
         if IsControlKeyDown()then
           DressUpMount(idMount)
         end
       end)
      
      
    --  elseif typeIcone == "emissaire"  then
    --    button:SetNormalTexture(iconName)
    elseif typeIcone == "events" then
       button:SetNormalTexture(iconName)
     end

  --  if isDown then
  --      button:GetNormalTexture():SetDesaturated(true)
  --  end

 return button
 end

local function createEtiquette(item, parent,etiquetteL, etiquetteH, textOffsetX,color,rowIndex, colIndex, typeEtiquette )

  local etiquette = CreateFrame("frame", "etiquette", parent)
  local margeHauteur = 20
    if rowIndex == 0 then
      etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10, -rowIndex * (etiquetteH))
    else
      etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10, -rowIndex * (etiquetteH+margeHauteur))
    end

    
    
    etiquette:SetSize(300,100)
   
    local backgroundTextureEtiquette = etiquette:CreateTexture(nil, "BACKGROUND")
    
    backgroundTextureEtiquette:SetAllPoints()
   
    backgroundTextureEtiquette:SetColorTexture(0.53, 0.81, 0.92, 0.4)
   
    print('au dessus du bouton')
    local button
   
    if typeEtiquette == "donjon" or typeEtiquette == "worldboss" or typeEtiquette == "emissaire" then
      print('avant de creer le bouton')
       button =  buttonMountArmury(etiquette, item["Icon"], item["MountID"])
       print('bouton creer')
      --  button = CreateIconTexture(etiquette, item[4], item[5], typeEtiquette, item[1])
  
    elseif typeEtiquette == "events" then
      button = CreateIconTexture(etiquette, 'Interface\\Icons\\inv_rocmaldraxxusmount',false, 'events', nil)
    end
  
  
    button:SetPoint("TOPLEFT",10, -10)
     
    local text = etiquette:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med1")
    text:SetJustifyH("LEFT")
    text:SetPoint("LEFT", button, "RIGHT", textOffsetX, 0)
    print('avant le texte')
    if typeEtiquette == "donjon" then
      print(item["MountName"])
      print(item["MountName"].." "..item["DonjonName"].." "..  item["Mode"].." ".. item["BossName"].." "..item["Continent"].." "..item["Country"])
      text:SetText(item["MountName"] .. "\nDonjon : " .. item["DonjonName"] .. "\nDifficulté : " .. item["Mode"] .. "\nBoss : " .. item["BossName"].."\nContinent : ".. item["Continent"] .. "\nRégion : " .. item["Country"])
    elseif typeEtiquette == "emissaire" then
      text:SetText(item["Title"].."\nZone : " .. item["Country"] .. "\nRéputation : " .. item["ReputName"] .. "\n \n" .. item["Objectives"])
    elseif typeEtiquette == "worldboss" then
      text:SetText(item["MountName"] .. "\nContinent : ".. item["Continent"] .. "\nRégion : " .. item["Country"])

    elseif typeEtiquette == 'events'then
      text:SetText(item['title'])
    end
    print('apres le texte')
       

    -- local actionButton = CreateFrame("Button", nil, etiquette, "UIPanelButtonTemplate")
    -- actionButton:SetSize(25, 25)
    -- actionButton:SetPoint("BOTTOMLEFT", 10, 10)
    -- actionButton.texture = actionButton:CreateTexture(nil, "ARTWORK")
    -- actionButton.texture:SetAllPoints()
    -- actionButton.texture:SetTexture("Interface\\Icons\\inv_misc_map_01")
  
    
    -- -- Fonction de gestionnaire d'événements pour le clic du bouton
    -- actionButton:SetScript("OnClick", function()
    --   local mapFrame = CreateFrame("Frame", "StranglethornMapFrame",UIParent )
    --   mapFrame:SetSize(500, 500)
    --   mapFrame:SetPoint("CENTER")
    --   mapFrame:SetClampedToScreen(true)
    --   mapFrame:SetMovable(true)
    --   mapFrame:EnableMouse(true)
    --   mapFrame:RegisterForDrag("LeftButton")
    --   mapFrame:SetScript("OnDragStart", mapFrame.StartMoving)
    --   mapFrame:SetScript("OnDragStop", mapFrame.StopMovingOrSizing)
    --   mapFrame:SetScript("OnHide", mapFrame.StopMovingOrSizing)
    --   mapFrame:SetFrameStrata("DIALOG")
 
    --   local mapTexture = mapFrame:CreateTexture(nil, "BACKGROUND")
    --   mapTexture:SetAllPoints(mapFrame)
    --   -- mapTexture:SetAtlas(C_Map.GetMapArtID(50))
   
    
    --   mapFrame.closeButton = CreateFrame("Button", nil, mapFrame, "UIPanelCloseButton")
    --   mapFrame.closeButton:SetPoint("TOPRIGHT", -8, -8)
    --   mapFrame.closeButton:SetScript("OnClick", function()
    --   mapFrame:Hide()
    --   end)
     
    --   -- mapFrame:Show()

    -- end)

  
end


local function createCadre(nameContainer, parent, heightContainer, containerTiltleText, setPointHeight)
  local container = CreateFrame("frame", nameContainer, parent);
  container:SetPoint("TOP", parent, "TOP",0, setPointHeight)
  container:SetSize(1100,heightContainer)

  local backgroundContainer = container:CreateTexture(nil, "BACKGROUND")
  backgroundContainer:SetAllPoints(container)
  backgroundContainer:SetColorTexture(0.9, 0.9, 0.9, 0.2)

  local containerTitle = container:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  containerTitle:SetPoint("TOP", container, "TOP",0 , -10)
  containerTitle:SetText(containerTiltleText)

  return container
end

local function createDataCadre(nameContainer, heightContainer, elementBottom, tableau, etiquetteL, etiquetteH, type)
  local rowIndex, colIndex = 0, 0
  local textOffsetX = 5

  local data= CreateFrame("frame", nameContainer, elementBottom)
    data:SetPoint("TOP", elementBottom, "TOP", 0, -40)

  data:SetSize(1100, heightContainer)
  data:SetHeight(heightContainer)
  
  for _, item in ipairs(tableau) do
    print('blibli')
    createEtiquette(item, data ,etiquetteL, etiquetteH,textOffsetX , "color", rowIndex, colIndex, type )

    colIndex = colIndex + 1
    if colIndex >= 3 then
      colIndex = 0
      rowIndex = rowIndex + 1
    end
  end

  return data
end


local function populateWeeklyActivities(parent, etiquetteL, etiquetteH, numColumns)
  print('entre dans populate weekly activities')
    core.Functions.getPersonnalInfoMount(core.MountsDonjonWeeks)
    core.Functions.getPersonnalInfoMount(core.MountsRaidWeekly)
    core.Functions.getWorldBossLocked()
  local totalHeight = 0;
 

--  --------------------------CADRE DONJON Weeks ------------------
  print('cadre donjonWeek')
  if next(core.MountsDonjonWeeks.Perso) ~= nil then
    local numRowsWeeks = math.ceil(#core.MountsDonjonWeeks.Perso / numColumns)
    local heightDonjonWeeks = numRowsWeeks * (etiquetteH);
    local heightContainerDonjonWeeks = heightDonjonWeeks+50+ numRowsWeeks*20 - 20

    local donjonWeeks = createCadre("donjonWeeks", parent, heightContainerDonjonWeeks, "Donjons", 0)
    local allWeeksDJ = createDataCadre("containerDJ", heightDonjonWeeks, donjonWeeks, core.MountsDonjonWeeks.Perso, etiquetteL, etiquetteH, "donjon")
    
    totalHeight = totalHeight + heightContainerDonjonWeeks ;
 
  end

   ----------------------------CADRE World boss ------------------
   print('cadre worldBoss')
   if next(core.WorldBoss.Perso) ~= nil then
    local numRowWoldBoss = math.ceil(#core.WorldBoss.Perso / numColumns)
    local heightWorldBoss =  numRowWoldBoss * (etiquetteH)
    local heightContainerWorldBoss = heightWorldBoss+50 + numRowWoldBoss*20 - 20
  
    local containerWorldBoss = createCadre("containerWorldBoss", parent,heightContainerWorldBoss, "WorldBoss", -(totalHeight+20) )
    heightContainerWorldBoss = heightContainerWorldBoss + 20
    
    local allWorldBoss = createDataCadre("containerDataWorldBoss", heightWorldBoss, containerWorldBoss, core.WorldBoss.Perso, etiquetteL, etiquetteH, "worldboss")
      
    totalHeight = totalHeight + heightContainerWorldBoss
   end
      ----------------------------CADRE Raid ------------------
    if next(core.WorldBoss.Perso) ~= nil then
      print('dans raid')
      local numRowRaid = math.ceil(#core.MountsRaidWeekly.Perso / numColumns)
      local heightRaid =  numRowRaid * (etiquetteH)
      local heightContainerRaid = heightRaid+50 + numRowRaid*20 - 20
    
      local containerWorldBoss = createCadre("containerRaid", parent,heightContainerRaid, "Raid", -(totalHeight+20) )
      heightContainerRaid = heightContainerRaid + 20
      local allRaid = createDataCadre("containerDataRaid", heightRaid, containerWorldBoss, core.MountsRaidWeekly.Perso, etiquetteL, etiquetteH, "donjon")
        
      totalHeight = totalHeight + heightContainerRaid

      end
   parent:SetHeight(totalHeight)

end

local function PopulateDailyActivities(parent, etiquetteL, etiquetteH, numColumns)
  print("je suis dans populate activities")
  -- core.Functions.getActiveBFAWorldQuest("BFA")
  -- core.Functions.getActiveBFAWorldQuest("legion")
  core.Functions.getPersonnalInfoMount(core.MountsDonjonDaily)
  core.Functions.getActiveShadowlandWorldQuest()
  local events = core.Functions.getEventDay()


  -- for _, event in ipairs(events) do
    
  --   print("Événement :".. event['title'])
    
  -- end

  local lastParent = parent;
  local rowIndex, colIndex = 0, 0
  local textOffsetX = 5
  local totalHeight = 0;

  ------------------------- Cadre Events ------------------------
  local numRowsEvents = math.ceil(#events / numColumns)

  local heightEvents = numRowsEvents * (etiquetteH);
  local heightContainerEvent = heightEvents+50 + numRowsEvents*20 - 20

  local eventsDay = createCadre("eventsDaily", parent, heightContainerEvent, "Evenements en cours", 0)
  local allEvents = createDataCadre("containerDJ", heightEvents, eventsDay, events, etiquetteL, etiquetteH, "events")
  totalHeight = totalHeight + heightContainerEvent ;
  --------------------------CADRE DONJON DAILY ------------------

  if next(core.MountsDonjonDaily.Perso) ~= nil then
    local numRowsDaily = math.ceil(#core.MountsDonjonDaily.Perso / numColumns)
    local heightDonjonDaily = numRowsDaily * (etiquetteH);
    local heightContainerDonjonDaily = heightDonjonDaily+50 + numRowsDaily*20 - 20

    local donjonDaily = createCadre("donjonDaily", parent, heightContainerDonjonDaily, "Donjons", -(totalHeight+20))
    heightContainerDonjonDaily = heightContainerDonjonDaily + 20
    local allDailyDJ = createDataCadre("containerDJ", heightDonjonDaily, donjonDaily, core.MountsDonjonDaily.Perso, etiquetteL, etiquetteH, "donjon")
    totalHeight = totalHeight + heightContainerDonjonDaily ;
    print('fini')
  end

  ----------------------------CADRE EXPE BFA ------------------
  -- if next(core.WorlQuestPersoBFA) ~= nil then
    
  --   local numRowBFA = math.ceil(#core.WorlQuestPersoBFA / numColumns)
  --   local heightBFAContainer =  numRowBFA * (etiquetteH)
  --   local heightContainerBFA = heightBFAContainer+50+ numRowBFA*20 - 20


  --   local containerQuestBFA = createCadre("containerQuestBFA", parent,heightContainerBFA, "Emissaires BFA", -(totalHeight+20) )
  --   heightContainerBFA = heightContainerBFA + 20
    
  --   local allQuestBFA = createDataCadre("containerQuest", heightBFAContainer, containerQuestBFA, core.WorlQuestPersoBFA, etiquetteL, etiquetteH, "emissaire")
    
  --   totalHeight = totalHeight + heightContainerBFA
  --  end
  -- ----------------------------CADRE EXPE Legion ------------------
  -- if next(core.WorlQuestPersoLegion) ~= nil then
  -- local numRowLegion = math.ceil(#core.WorlQuestPersoLegion / numColumns)
  -- local heightLegionExpe =  numRowLegion * (etiquetteH)
  -- local heightContainerLegion = heightLegionExpe+50 + numRowLegion*20 - 20

  -- local containerQuestLegion = createCadre("containerQuestLegion", parent, heightContainerLegion, "Emissaire Legion",-(totalHeight+20) )
  -- heightContainerLegion = heightContainerLegion + 20

  -- local allQuestLegion = createDataCadre("containerLegionQuest", heightLegionExpe, containerQuestLegion,core.WorlQuestPersoLegion, etiquetteL, etiquetteH, "emissaire" )
  -- totalHeight = totalHeight + heightContainerLegion

  
  -- end

  ------------------- Cadre expe ShadowLand --------------------------------
  if next(core.worldQuestShadowLand.Perso ) ~= nil then
    local numRowShadowLand = math.ceil(#core.worldQuestShadowLand.Perso  / numColumns)
    local heightShadowLandExpe =  numRowShadowLand * (etiquetteH)
    local heightContainerShadowLand = heightShadowLandExpe+50 + numRowShadowLand*20 - 20
  
    local containerQuestLegion = createCadre("containerQuestShadowLand", parent, heightContainerShadowLand, "Emissaire ShadowLand",-(totalHeight+20) )
  
    heightContainerShadowLand = heightContainerShadowLand + 20
    print('Emissaires')
  
    local allQuestLegion = createDataCadre("containerShadowlandQuest", heightShadowLandExpe, containerQuestLegion,core.worldQuestShadowLand.Perso, etiquetteL, etiquetteH, "emissaire" )
   
    totalHeight = totalHeight + heightContainerShadowLand
  
    
    end
  parent:SetHeight(totalHeight)
end

function core.Frame.createFrameContainer()
  local frame = CreateFrame("Frame", "IconSelectorFrame", UIParent)
  frame:SetSize(1300, 800)
  frame:SetPoint("CENTER")
  frame:SetClampedToScreen(true)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
  frame:SetScript("OnHide", frame.StopMovingOrSizing)
  
  frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
  frame.title:SetPoint("TOPLEFT", 16, -10)
  frame.title:SetText("Ce que je dois faire blabla")
  frame:SetFrameStrata("HIGH")
  frame.closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  frame.closeButton:SetPoint("TOPRIGHT", -8, -8)

  ------------- CLOSE ADDON ------------------
  frame:SetScript("OnKeyDown", function (self, key)
    if key == "ESCAPE" then
      core.FrameAddon = nil
      frame:Hide()
    else
      self:SetPropagateKeyboardInput(true)
    end
  end)

  frame.closeButton:SetScript("OnClick", function()
    core.FrameAddon = nil
    frame:Hide()
  end)



  local backgroundTextureFrame = frame:CreateTexture(nil, "BACKGROUND")
  backgroundTextureFrame:SetAllPoints(frame)
  backgroundTextureFrame:SetColorTexture(0, 0, 0, 0.7) 


  local LeftPanneau = CreateFrame("Frame", "IconSelectorScrollChild", frame)
  LeftPanneau:SetSize(200, 720)
  -- frame:SetScrollChild(LeftPanneau)
  LeftPanneau:SetPoint("TOPLEFT", 10, -50)
  -- LeftPanneau:SetPoint("BOTTOMRIGHT", -32, 30)
  local backgroundTextureLeftPanneau = LeftPanneau:CreateTexture(nil, "BACKGROUND")
  backgroundTextureLeftPanneau:SetAllPoints(LeftPanneau)
  backgroundTextureLeftPanneau:SetColorTexture(0.5, 1, 0.5, 0.5) 



  local etiquetteL = 300
  local etiquetteH = 100
  local numColumns = 3
  
  local scrollFrame = CreateFrame("ScrollFrame", "IconSelectorScrollFrame", frame, "UIPanelScrollFrameTemplate")
  scrollFrame:SetPoint("TOPLEFT", LeftPanneau,"TOPRIGHT",16, 0)
  scrollFrame:SetPoint("BOTTOMRIGHT", -32, 30)

  
  local containerFrame = core.Functions.getContainerScrollFrame(scrollFrame)


  -- local backgroundDonjon = donjonContainer:CreateTexture(nil, "BACKGROUND")
  -- backgroundDonjon:SetAllPoints(donjonContainer)
  -- backgroundDonjon:SetColorTexture(0, 0, 1, 1)
  

----------BOUTTON DAILY --------------------
  local buttonDaily = CreateFrame("Button", nil, LeftPanneau, "UIPanelButtonTemplate")
  buttonDaily:SetSize(80, 20)
  buttonDaily:SetPoint("TOP", 0, -10)
  buttonDaily:SetText("Aujourd'hui")

  ------Button daily Script-----------------
  buttonDaily:SetScript("OnClick", function()
    containerFrame:Hide()
    containerFrame = core.Functions.getContainerScrollFrame(scrollFrame)
    PopulateDailyActivities(containerFrame, etiquetteL,etiquetteH,  numColumns)
  end)
  
----------BOUTTON WEEKLY --------------------
  local weekly = CreateFrame("Button", nil, LeftPanneau, "UIPanelButtonTemplate")
  weekly:SetSize(80, 20)
  weekly:SetPoint("BOTTOM", buttonDaily ,0, -300)
  weekly:SetText("Cette semaine")

  ----Button weekly Script-----------------
  weekly:SetScript("OnClick", function()
    containerFrame:Hide()
    containerFrame = core.Functions.getContainerScrollFrame(scrollFrame)
    populateWeeklyActivities(containerFrame, etiquetteL,etiquetteH,  numColumns)
   end)

   --------------DONNEES DE DEPART---------------

 
  PopulateDailyActivities(containerFrame, etiquetteL,etiquetteH,  numColumns)


  core.FrameAddon = frame
  end
