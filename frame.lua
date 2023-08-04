local _,core = ...;
core.Frame = {};


local function CreateIconTexture(parent, iconName, isDown, typeIcone, idMount)
  local button = CreateFrame("Button", nil, parent)
  if typeIcone == "events" then
      button:SetSize(100, 100)

      button.texture = button:CreateTexture(nil, "ARTWORK")
      button.texture:SetAllPoints()
      button:SetNormalTexture(iconName)
  elseif typeIcone == "emissaire-4-quest" then
    button:SetSize(50, 50)
    button.texture = button:CreateTexture(nil, "ARTWORK")
    button.texture:SetAllPoints()
    button:SetNormalTexture(iconName)
    end
return button
end

local function createDetailEventFrame( title, text, endDate, icone, type)
  local detailFrame = CreateFrame("Frame", "StranglethorndetailFrame",UIParent )
        detailFrame:SetSize(500, 300)
        detailFrame:SetPoint("CENTER")
        detailFrame:SetClampedToScreen(true)
        detailFrame:SetMovable(true)
        detailFrame:EnableMouse(true)
        detailFrame:RegisterForDrag("LeftButton")
        detailFrame:SetScript("OnDragStart", detailFrame.StartMoving)
        detailFrame:SetScript("OnDragStop", detailFrame.StopMovingOrSizing)
        detailFrame:SetScript("OnHide", detailFrame.StopMovingOrSizing)
        detailFrame:SetFrameStrata("DIALOG")
        local detailTexture = detailFrame:CreateTexture(nil, "BACKGROUND")
        detailTexture:SetAllPoints(detailFrame)
        detailTexture:SetColorTexture(0.5, 0.5, 0.5, 1)
        detailFrame.closeButton = CreateFrame("Button", nil, detailFrame, "UIPanelCloseButton")
        detailFrame.closeButton:SetPoint("TOPRIGHT", -8, -8)
        
        local button = CreateIconTexture(detailFrame, icone, false, type, nil)
        button:SetPoint("TOPLEFT",10, -15)

        local texteTitle = detailFrame:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
        texteTitle:SetPoint("TOP", detailFrame, "TOP", 30, -10)
        texteTitle:SetJustifyH("LEFT")
        texteTitle:SetText(title)
        texteTitle:SetWidth(300)
        texteTitle:SetNonSpaceWrap(true)

        local textDescription = detailFrame:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med1")
        textDescription:SetPoint("TOP", texteTitle, "TOP", 0 , -40)
        textDescription:SetJustifyH("LEFT")
        textDescription:SetText(text.."\n\n |cFFFFFF00date de fin|r : "..endDate)
        textDescription:SetWidth(300)
        textDescription:SetNonSpaceWrap(true)
        -- textDescription:

        detailFrame.closeButton:SetScript("OnClick", function()
          core.detailEventFrame = nil
          detailFrame:Hide()
        end) 
          core.detailEventFrame = detailFrame
      end



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
   
    local button
   
    if typeEtiquette == "donjon" or typeEtiquette == "worldboss" or typeEtiquette == "emissaire" then
       button =  buttonMountArmury(etiquette, item["Icon"], item["MountID"])
  
    elseif typeEtiquette == "events" then
      button = CreateIconTexture(etiquette, item["icon"],false, typeEtiquette, nil)
    elseif typeEtiquette == "emissaire-4-quest" then
      button = CreateIconTexture(etiquette, item["Icon"],false, typeEtiquette, nil)
    end
  
  
    button:SetPoint("TOPLEFT",10, -15)
    local textTitre = etiquette:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
    textTitre:SetJustifyH("LEFT")
    textTitre:SetPoint("TOP", etiquette, "TOP", 30, -5)
    local text = etiquette:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med1")
    text:SetJustifyH("LEFT")
    text:SetWidth(230)
    text:SetNonSpaceWrap(true)
    textTitre:SetNonSpaceWrap(true)
    text:SetPoint("TOP", etiquette, "TOP", 30, 0)
    if typeEtiquette == "donjon" then
      local mode = ""
      if type(item["Mode"]) == "string" then
        mode = item["Mode"]
      else
        for i, str in ipairs(item["Mode"]) do
          mode = mode .. str
          if i < #item["Mode"] then
            mode = mode .. ", "
          end
        end
      end
      textTitre:SetText(item["MountName"])
      text:SetText("\n\n|cFFFFFF00Donjon|r : " .. item["DonjonName"] .. "\n|cFFFFFF00Difficulté|r : " .. mode .. "\n|cFFFFFF00Boss|r : " .. item["BossName"].."\n|cFFFFFF00Continent|r : ".. item["Continent"] .. "\n|cFFFFFF00Région|r : " .. item["Country"])
    elseif typeEtiquette == "emissaire" or typeEtiquette=="emissaire-4-quest" then
      textTitre:SetText(item["Title"])
      text:SetText("\n\n|cFFFFFF00Zone|r : " .. item["Country"] .. "\n|cFFFFFF00Réputation|r : " .. item["ReputName"] .. "\n \n" .. item["Objectives"])
    elseif typeEtiquette == "worldboss" then
      textTitre:SetText(item["MountName"])
      text:SetText("\n\n|cFFFFFF00Continent|r : ".. item["Continent"] .. "\n|cFFFFFF00Région|r : " .. item["Country"])

    elseif typeEtiquette == 'events'then
      button:SetPoint("TOPLEFT",10, -10)
      text:SetWidth(200)
      text:SetPoint("TOP", etiquette, "TOP", 40, -10)      
      text:SetText(item['title'])

    local actionButton = CreateFrame("Button", nil, button, "UIPanelButtonTemplate")
    actionButton:SetSize(25, 25)
    actionButton:SetPoint("BOTTOMRIGHT",button, "BOTTOMRIGHT", 0 , 20)
    actionButton.texture = actionButton:CreateTexture(nil, "ARTWORK")
    actionButton.texture:SetAllPoints()
    actionButton.texture:SetTexture("Interface\\Icons\\inv_letter_13")
  
    
    -- Fonction de gestionnaire d'événements pour le clic du bouton
    actionButton:SetScript("OnClick", function()
      if core.detailEventFrame then
        core.detailEventFrame:Hide()
        -- createDetailEventFrame(item["description"], item["icon"], "events")
        -- core.detailEventFrame:Show()
      else
        -- createDetailEventFrame(item["description"], item["icon"], "events")
        -- core.detailEventFrame:Show()
      end
      createDetailEventFrame(item["title"],item["description"],item["dateFin"], item["icon"], "events")
      core.detailEventFrame:Show()
     

    end)
    
    end
    
    -- etiquette:SetClipsChildren(true)

    

  
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
    core.Functions.getPersonnalInfoMount(core.MountsDonjonWeeks)
    core.Functions.getPersonnalInfoMount(core.MountsRaidWeekly)
    core.Functions.getWorldBossLocked()
  local totalHeight = 0;
 

--  --------------------------CADRE DONJON Weeks ------------------
  if next(core.MountsDonjonWeeks.Perso) ~= nil then
    local numRowsWeeks = math.ceil(#core.MountsDonjonWeeks.Perso / numColumns)
    local heightDonjonWeeks = numRowsWeeks * (etiquetteH);
    local heightContainerDonjonWeeks = heightDonjonWeeks+50+ numRowsWeeks*20 - 20

    local donjonWeeks = createCadre("donjonWeeks", parent, heightContainerDonjonWeeks, "Donjons", 0)
    local allWeeksDJ = createDataCadre("containerDJ", heightDonjonWeeks, donjonWeeks, core.MountsDonjonWeeks.Perso, etiquetteL, etiquetteH, "donjon")
    
    totalHeight = totalHeight + heightContainerDonjonWeeks ;
 
  end

   ----------------------------CADRE World boss ------------------
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
    if next(core.MountsRaidWeekly.Perso) ~= nil then
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
  -- core.Functions.getActiveBFAWorldQuest("BFA")
  core.Functions.getActiveBFAWorldQuest("legion")
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
  if next(core.WorldQuestLegion.Perso) ~= nil then
  local numRowLegion = math.ceil(#core.WorldQuestLegion.Perso / numColumns)
  local heightLegionExpe =  numRowLegion * (etiquetteH)
  local heightContainerLegion = heightLegionExpe+50 + numRowLegion*20 - 20

  local containerQuestLegion = createCadre("containerQuestLegion", parent, heightContainerLegion, "Emissaire Legion",-(totalHeight+20) )
  heightContainerLegion = heightContainerLegion + 20
  local allQuestLegion = createDataCadre("containerLegionQuest", heightLegionExpe, containerQuestLegion,core.WorldQuestLegion.Perso, etiquetteL, etiquetteH, "emissaire-4-quest" )
  totalHeight = totalHeight + heightContainerLegion

  
  end

  ------------------- Cadre expe ShadowLand --------------------------------
  if next(core.worldQuestShadowLand.Perso ) ~= nil then
    local numRowShadowLand = math.ceil(#core.worldQuestShadowLand.Perso  / numColumns)
    local heightShadowLandExpe =  numRowShadowLand * (etiquetteH)
    local heightContainerShadowLand = heightShadowLandExpe+50 + numRowShadowLand*20 - 20
    local containerQuestLegion = createCadre("containerQuestShadowLand", parent, heightContainerShadowLand, "Emissaire ShadowLand",-(totalHeight+20) )
    heightContainerShadowLand = heightContainerShadowLand + 20
  
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
