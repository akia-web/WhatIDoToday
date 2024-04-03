local _,core = ...;


function core.createDetailEventFrame( item, typePopup, color , size)
  local minHeight = 300
  local detailFrame = core.PopupEvent.CreatePopup(color)
  detailFrame:SetHeight(minHeight)
  if item["Icon"] then
    local button = core.Icones.CreateIconTexture(detailFrame, item["Icon"], size, nil)
    button:SetPoint("TOPLEFT",10, -15)
  end
  local frameTextTitle = CreateFrame("frame", "textTitle", detailFrame)
  frameTextTitle:SetPoint("TOPLEFT", detailFrame, "TOPLEFT", 0, 0)
  frameTextTitle:SetWidth(detailFrame:GetWidth())
  frameTextTitle:SetHeight(100)
  -- core.createBackground({r=0, b = 1, g = 0 }, frameTextTitle, 1) --background texte Title


  local textPopup = core.Text.GetText(typePopup, item)
  local texteTitle = core.Text.CreateText(frameTextTitle, "SystemFont_Shadow_Med2", "TOP","CENTER", 300, 0, 0, nil)

  texteTitle:SetText(textPopup['title'])

  local containerFrameDescription = CreateFrame("ScrollFrame", "frameDescription", detailFrame, "UIPanelScrollFrameTemplate")
  containerFrameDescription:SetPoint("TOP", frameTextTitle, "BOTTOM", 0, 0)
  containerFrameDescription:SetWidth(detailFrame:GetWidth()-70)
  containerFrameDescription:SetHeight(200)
  -- core.createBackground({r=0, b = 0, g = 1 }, containerFrameDescription, 1)

  local frameDescription = CreateFrame("frame", "textTitle", detailFrame)
  frameDescription:SetPoint("TOPLEFT", containerFrameDescription, "TOPLEFT", 0, 0)
  frameDescription:SetWidth(detailFrame:GetWidth())
  containerFrameDescription:SetScrollChild(frameDescription)

  local textDescription = core.Text.CreateText(frameDescription, "SystemFont_Shadow_Med1", "CENTER" ,"CENTER", 300, 0, 0, "LEFT")
  textDescription:SetText(textPopup['description'])
  frameDescription:SetHeight(textDescription:GetStringHeight())
  core.detailEventFrame = detailFrame
end

function core.createBackground( color, parent, opacity)

  local background = parent:CreateTexture(nil, "BACKGROUND")
  background:SetAllPoints()
  background:SetColorTexture(color.r, color.g, color.b, opacity)
  return background
end

local function createEtiquette(item, parent,etiquetteL, etiquetteH,color,rowIndex, colIndex, typeEtiquette, size, lastHeight )
  local etiquette = CreateFrame("frame", "etiquette", parent)
  local margeHauteur = 20
  local titleHeight = 30
  etiquette:SetWidth(etiquetteL)
  lastHeight = lastHeight == 0 and 0 or lastHeight + margeHauteur
  etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10,-rowIndex * lastHeight)
  core.createBackground(color, etiquette, 0.4) --background etiquette

  local frameTextTitle = CreateFrame("frame", "etiquette", etiquette)
  frameTextTitle:SetPoint("TOPLEFT", etiquette, "TOPLEFT", 0, 0)
  frameTextTitle:SetWidth(etiquette:GetWidth())
  frameTextTitle:SetHeight(titleHeight)

  local mountId = item["MountID"] ~= nil and item["MountID"] or nil
  local button = core.Icones.CreateIconTexture(frameTextTitle, item["Icon"],size, mountId) 
 

  core.createBackground({r=0, b = 0, g = 0 }, frameTextTitle, 1) --background texte Title
  local textEtiquette = core.Text.GetText(typeEtiquette, item) -- get Title and description
  local textTitre = core.Text.CreateText(frameTextTitle, "SystemFont_Shadow_Med2", 'CENTER', 'CENTER', 230, 0, 0, nil)
  textTitre:SetText(textEtiquette['title'])
   
  local frameTextDescription = CreateFrame("frame", "description", frameTextTitle)
  -- core.createBackground({r=0, b = 1, g = 0 }, frameTextDescription, 1) --background texte Title
  frameTextDescription:SetPoint("TOP", frameTextTitle, "BOTTOM", 0, 0)
  frameTextDescription:SetWidth(230)


  local text = core.Text.CreateText(frameTextTitle, "SystemFont_Shadow_Med1", "TOP" ,"BOTTOM",230, 30, -5, "LEFT")
  text:SetText(textEtiquette['description'])

  if textEtiquette['description'] == nil then
    frameTextDescription:SetHeight(button:GetHeight() + 20)
    else

      frameTextDescription:SetHeight(text:GetStringHeight()+15)
  end
  local searchText = 'Interface\\Addons\\WhatIDoToday\\UI\\events'
  local decalageY = -5
  
  if string.find(item["Icon"], searchText) then
    decalageY = 0
  end

  button:SetPoint("CENTER",frameTextDescription,"LEFT",0, decalageY)


  if typeEtiquette == 'events'then
    local actionButton =  core.Icones.CreateIconTexture(button, "Interface\\Icons\\inv_letter_13", 25, nil)
    actionButton:SetPoint("CENTER",frameTextTitle, "RIGHT", -13 , 0)
  
    -- Fonction de gestionnaire d'événements pour le clic du bouton
    actionButton:SetScript("OnClick", function()
      if core.detailEventFrame then
        core.detailEventFrame:Hide()
      end

      core.createDetailEventFrame(item, "event-popup", core.barres.eventsPopup, 100)
      core.detailEventFrame:Show()
    
    end)
  
  end
  local frameHF = nil
  local hightHF = 0
  if typeEtiquette == 'HF' then
    frameHF = core.listHF.CreateListHF(item, frameTextDescription)
    hightHF = frameHF:GetHeight()
  end
  etiquette:SetHeight(frameTextTitle:GetHeight() + frameTextDescription: GetHeight() + hightHF)
  return etiquette    
end

local function createCadre(nameContainer, parent, containerTiltleText, color, index, lastContainer)
  local container = CreateFrame("frame", nameContainer, parent);
  if index == 1 then
    container:SetPoint("TOP", lastContainer, "TOP",0, 0)
  else
    container:SetPoint("TOP", lastContainer, "BOTTOM",0, -20)
  end

  container:SetWidth(1100)
  core.createBackground(color, container, 0.2)

  local containerTitle = container:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  containerTitle:SetPoint("TOP", container, "TOP",0 , -10)
  containerTitle:SetText(containerTiltleText)
  return container
end

local function createDataCadre(nameContainer, elementBottom, tableau, etiquetteL, etiquetteH, type, color, size)
  local rowIndex, colIndex =0, 0

  local containerData= CreateFrame("frame", nameContainer, elementBottom)
  containerData:SetPoint("TOP", elementBottom, "TOP", 0, -40)
  -- core.createBackground({r=1, b=0, g=0}, containerData, 1)
  containerData:SetWidth(1100)

  local hightEtiquette=0
  local lineTableauEtiquette = {}
  local biggestEtiquette = 0
  local previousLineSize = 0
  for _, item in ipairs(tableau) do
    local etiquette = createEtiquette(item, containerData ,etiquetteL, etiquetteH , color, rowIndex, colIndex, type, size, hightEtiquette )
    hightEtiquette = etiquette:GetHeight()
    table.insert(lineTableauEtiquette, etiquette)
    biggestEtiquette = biggestEtiquette < hightEtiquette and hightEtiquette or biggestEtiquette
    
    colIndex = colIndex + 1
    if colIndex >= 3 then
      colIndex = 0
      rowIndex = rowIndex + 1

      for _, item2 in ipairs(lineTableauEtiquette) do
        local a, b, c, x, y = item2:GetPoint()
        local height = y == -0 and -0 or -(previousLineSize + 20)*(rowIndex-1)
        item2:SetPoint(a, b, c, x, height)
        item2:SetHeight(biggestEtiquette)
      end

      previousLineSize = biggestEtiquette
      lineTableauEtiquette = {}
      biggestEtiquette = 0
    end
  end

  local nbligne = colIndex == 0 and rowIndex or rowIndex+1
  local ecart = (rowIndex == 1 and colIndex == 0) and 0 or rowIndex* 20
  containerData:SetHeight(((hightEtiquette * nbligne) + ecart ))
  return containerData
end

function core.getContainer(categorie, index, parent, lastContainer)
    if next(categorie['data']) ~= nil then
      local container = createCadre(categorie['containerName'], parent, categorie['name'], categorie['colorCadre'], index, lastContainer)
      local dataCadre = createDataCadre(categorie['containerEtiquetteName'], container, categorie['data'], categorie['etiquetteL'], categorie['etiquetteH'], categorie['typeEtiquettes'],categorie['colorEtiquette'], categorie['sizeButton'])
      container:SetHeight(dataCadre:GetHeight()+40)
      return container
    end
end

function core.PopulateActivities(parent, option)
  local selectedTable = nil
  if option == 'Daily' then
    core.GetDataDaily()
    selectedTable = core.activityDaily
  elseif option == 'Weekly' then
    selectedTable = core.activityWeekly
    core.GetDataWeekly()
  elseif option == 'HF' then
    selectedTable = core.activityHF
    core.GetHautFait()

  end
  local index = 0
  if selectedTable then
    local lastContainer = parent
    local totalHeight = 0
    local totalContainer = 0
    for key, value in pairs(selectedTable) do
      if selectedTable[key]['active'] and next(selectedTable[key]['data'])~= nil then
        index = index +1
        lastContainer = core.getContainer(selectedTable[key], index, parent, lastContainer)
        totalHeight = totalHeight + lastContainer:GetHeight()
        totalContainer = totalContainer + 1
      end
    end
    totalHeight = totalHeight+ 20* totalContainer
    parent:SetHeight(totalHeight)
  end
end
  