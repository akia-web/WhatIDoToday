local _,core = ...;
core.Frame = {};

local function createDetailEventFrame( item, typePopup, color , size)
  local detailFrame = core.PopupEvent.CreatePopup(color)
  local button = core.Icones.CreateIconTexture(detailFrame, item["Icon"], size, nil)
  button:SetPoint("TOPLEFT",10, -15)

  local textPopup = core.Text.GetText(typePopup, item)
  local texteTitle = core.Text.CreateText(detailFrame, "SystemFont_Shadow_Med2", "LEFT", 300, 30, -10)
  texteTitle:SetText(textPopup['title'])
  local textDescription = core.Text.CreateText(detailFrame, "SystemFont_Shadow_Med1", "LEFT", 300, 30, -50)
  textDescription:SetText(textPopup['description'])

  core.detailEventFrame = detailFrame
end

local function createEtiquette(item, parent,etiquetteL, etiquetteH, textOffsetX,color,rowIndex, colIndex, typeEtiquette, size )
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
    backgroundTextureEtiquette:SetColorTexture(color.r, color.g, color.b, 0.4)
    local mountId = item["MountID"] ~= nil and item["MountID"] or nil
    local button = core.Icones.CreateIconTexture(etiquette, item["Icon"],size, mountId) 
    button:SetPoint("TOPLEFT",10, -15)

    ---- Create Text
    local textEtiquette = core.Text.GetText(typeEtiquette, item)
    local textTitre = core.Text.CreateText(etiquette, "SystemFont_Shadow_Med2", "LEFT", 230, 30, -5)
    textTitre:SetText(textEtiquette['title'])
    local text = core.Text.CreateText(etiquette, "SystemFont_Shadow_Med1", "LEFT", 230, 30, -5)
    text:SetText(textEtiquette['description'])

    if typeEtiquette == 'events'then
      local actionButton =  core.Icones.CreateIconTexture(button, "Interface\\Icons\\inv_letter_13", 25, nil)
      actionButton:SetPoint("BOTTOMRIGHT",button, "BOTTOMRIGHT", 10 , 0)
    
    -- Fonction de gestionnaire d'événements pour le clic du bouton
    actionButton:SetScript("OnClick", function()
      if core.detailEventFrame then
        core.detailEventFrame:Hide()
      end
      createDetailEventFrame(item, "event-popup", core.barres.eventsPopup, 100)
      core.detailEventFrame:Show()
     

    end)
    
    end
end

local function createCadre(nameContainer, parent, heightContainer, containerTiltleText, setPointHeight, color)
  local container = CreateFrame("frame", nameContainer, parent);
  container:SetPoint("TOP", parent, "TOP",0, setPointHeight)
  container:SetSize(1100,heightContainer)

  local backgroundContainer = container:CreateTexture(nil, "BACKGROUND")
  backgroundContainer:SetAllPoints(container)
  backgroundContainer:SetColorTexture(color.r,color.g, color.b, 0.2)

  local containerTitle = container:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  containerTitle:SetPoint("TOP", container, "TOP",0 , -10)
  containerTitle:SetText(containerTiltleText)

  return container
end

local function createDataCadre(nameContainer, heightContainer, elementBottom, tableau, etiquetteL, etiquetteH, type, color, size)
  local rowIndex, colIndex = 0, 0
  local textOffsetX = 5

  local data= CreateFrame("frame", nameContainer, elementBottom)
    data:SetPoint("TOP", elementBottom, "TOP", 0, -40)

  data:SetSize(1100, heightContainer)
  data:SetHeight(heightContainer)
  
  for _, item in ipairs(tableau) do
    createEtiquette(item, data ,etiquetteL, etiquetteH,textOffsetX , color, rowIndex, colIndex, type, size )
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

    local donjonWeeks = createCadre("donjonWeeks", parent, heightContainerDonjonWeeks, "Donjons", 0, {["r"]=0.9,["g"]=0.9,["b"]=0.9})
    createDataCadre("containerDJ", heightDonjonWeeks, donjonWeeks, core.MountsDonjonWeeks.Perso, etiquetteL, etiquetteH, "donjon", {["r"]=0.9,["g"]=0.9,["b"]=0.9}, 50)
    
    totalHeight = totalHeight + heightContainerDonjonWeeks ;
 
  end

   ----------------------------CADRE World boss ------------------
   if next(core.WorldBoss.Perso) ~= nil then
    local numRowWoldBoss = math.ceil(#core.WorldBoss.Perso / numColumns)
    local heightWorldBoss =  numRowWoldBoss * (etiquetteH)
    local heightContainerWorldBoss = heightWorldBoss+50 + numRowWoldBoss*20 - 20
  
    local containerWorldBoss = createCadre("containerWorldBoss", parent,heightContainerWorldBoss, "WorldBoss", -(totalHeight+20), {["r"]=0.9,["g"]=0.9,["b"]=0.9} )
    heightContainerWorldBoss = heightContainerWorldBoss + 20
    
    createDataCadre("containerDataWorldBoss", heightWorldBoss, containerWorldBoss, core.WorldBoss.Perso, etiquetteL, etiquetteH, "worldboss", {["r"]=0.9,["g"]=0.9,["b"]=0.9}, 50)
      
    totalHeight = totalHeight + heightContainerWorldBoss
   end
      ----------------------------CADRE Raid ------------------
    if next(core.MountsRaidWeekly.Perso) ~= nil then
      local numRowRaid = math.ceil(#core.MountsRaidWeekly.Perso / numColumns)
      local heightRaid =  numRowRaid * (etiquetteH)
      local heightContainerRaid = heightRaid+50 + numRowRaid*20 - 20
    
      local containerWorldBoss = createCadre("containerRaid", parent,heightContainerRaid, "Raid", -(totalHeight+20), {["r"]=0.9,["g"]=0.9,["b"]=0.9} )
      heightContainerRaid = heightContainerRaid + 20
      local allRaid = createDataCadre("containerDataRaid", heightRaid, containerWorldBoss, core.MountsRaidWeekly.Perso, etiquetteL, etiquetteH, "donjon",{["r"]=0.9,["g"]=0.9,["b"]=0.9}, 50)
        
      totalHeight = totalHeight + heightContainerRaid

      end
   parent:SetHeight(totalHeight)

end


local function getContainer(categorie, index, parent, totalHeight)
  if next(categorie['data']) ~= nil then
    local numRows = math.ceil(#categorie['data'] /categorie['etiquetteByLine'])
    local height = numRows * (categorie['etiquetteH']);
    local heightContainer = height+50 + numRows*20 - 20
    local pointHeight

    if index == 1 then
      pointHeight = 0
    else
      pointHeight = -(totalHeight+20)
    end

    local container = createCadre(categorie['containerName'], parent, heightContainer, categorie['name'], pointHeight, categorie['colorCadre'])

    if index == 1 then
    else
      heightContainer = heightContainer + 20
    end

    createDataCadre(categorie['containerEtiquetteName'], height, container, categorie['data'], categorie['etiquetteL'], categorie['etiquetteH'], categorie['typeEtiquettes'],categorie['colorEtiquette'], categorie['sizeButton'])

    return heightContainer
  else
  return totalHeight
  end
  
end

local function PopulateDailyActivities(parent, etiquetteL, etiquetteH, numColumns)

  core.GetDataDaily()
  local totalHeight = 0;
  local index = 0
	for key, value in pairs(core.activityDaily) do
    if core.activityDaily[key]['active'] and next(core.activityDaily[key]['data'])~= nil then
      index = index +1
      totalHeight = totalHeight + getContainer(core.activityDaily[key], index, parent, totalHeight)
    end
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
  frame.title:SetText("Ce que je dois faire")
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
  backgroundTextureLeftPanneau:SetColorTexture(core.barres.barreGauche.r, core.barres.barreGauche.g, core.barres.barreGauche.b, 0.5) 



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
