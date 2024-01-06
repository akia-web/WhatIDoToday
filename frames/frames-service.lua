local _,core = ...;


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

local function createEtiquette(item, parent,etiquetteL, etiquetteH,color,rowIndex, colIndex, typeEtiquette, size )
  local etiquette = CreateFrame("frame", "etiquette", parent)
  local margeHauteur = 20
    if rowIndex == 0 then
      etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10, -rowIndex * (etiquetteH))
    else
      etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10, -rowIndex * (etiquetteH+margeHauteur))
    end
    
    etiquette:SetSize(etiquetteL, etiquetteH)
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

  local containerData= CreateFrame("frame", nameContainer, elementBottom)
    containerData:SetPoint("TOP", elementBottom, "TOP", 0, -40)

  containerData:SetSize(1100, heightContainer)
  containerData:SetHeight(heightContainer)
  
  for _, item in ipairs(tableau) do
    createEtiquette(item, containerData ,etiquetteL, etiquetteH , color, rowIndex, colIndex, type, size )
    colIndex = colIndex + 1
    if colIndex >= 3 then
      colIndex = 0
      rowIndex = rowIndex + 1
    end
  end

  return containerData
end

function core.getContainer(categorie, index, parent, totalHeight)
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

function core.PopulateActivities(parent, option)
  local selectedTable = nil
if option == 'Daily' then
  core.GetDataDaily()
  selectedTable = core.activityDaily
elseif option == 'Weekly' then
  selectedTable = core.activityWeekly
  core.GetDataWeekly()
end

local totalHeight = 0;
local index = 0
if selectedTable then
  for key, value in pairs(selectedTable) do
    if selectedTable[key]['active'] and next(selectedTable[key]['data'])~= nil then
      index = index +1
      totalHeight = totalHeight + core.getContainer(selectedTable[key], index, parent, totalHeight)
    end
  end
end
parent:SetHeight(totalHeight)
end
  