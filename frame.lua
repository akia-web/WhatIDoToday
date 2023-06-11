local _,core = ...;
core.Frame = {};



local function CreateIconTexture(parent, iconName, isDown, typeIcone)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(50, 50)

  button.texture = button:CreateTexture(nil, "ARTWORK")
  button.texture:SetAllPoints()

    if typeIcone == "donjonDaily" then
      local iconTexture = GetSpellTexture(iconName)
      button:SetNormalTexture(iconTexture)
    else if typeIcone == "emissaire" then
      button:SetNormalTexture(iconName)
    end
  end

  if isDown then
      button:GetNormalTexture():SetDesaturated(true)
  end

return button
end

local function createEtiquette(item, parent,etiquetteL, etiquetteH, textOffsetX,color,rowIndex, colIndex, typeEtiquette )
  local etiquette = CreateFrame("frame", "etiquette", parent)
 
    etiquette:SetPoint("TOPLEFT", parent,"TOPLEFT",colIndex * (etiquetteL+30)+10, -rowIndex * (etiquetteH))
    
    etiquette:SetSize(300,100)
    local backgroundTextureEtiquette = etiquette:CreateTexture(nil, "BACKGROUND")
    backgroundTextureEtiquette:SetAllPoints()
    backgroundTextureEtiquette:SetColorTexture(0.53, 0.81, 0.92, 0.4) 
    
    local button
    if typeEtiquette == "donjonDaily" then
       button = CreateIconTexture(etiquette, item[4], item[5], typeEtiquette)
    else if typeEtiquette == "emissaire" then
        button = CreateIconTexture(etiquette, item[5], item[3], typeEtiquette)

    end
  end

    button:SetPoint("TOPLEFT",10, -10)
     
    local text = etiquette:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med1")
    text:SetJustifyH("LEFT")
    text:SetPoint("LEFT", button, "RIGHT", textOffsetX, 0)
    if typeEtiquette == 'donjonDaily' then
      if item[5] then
        text:SetText("|cff808080"..item[2] .."\ndonjon : ".. item[9].."\ndifficulté : ".. item[8].. "\nboss : ".. item[10])
      else
        text:SetText(item[2] .."\ndonjon : ".. item[9].."\ndifficulté : ".. item[8].. "\nboss : ".. item[10])
      end
    else if typeEtiquette == 'emissaire' then
      text:SetText("Zone : "..item[7] .."\nRéputation : ".. item[9].."\n \n".. item[8])
    end
    end
       

    local actionButton = CreateFrame("Button", nil, etiquette, "UIPanelButtonTemplate")
    actionButton:SetSize(80, 20)
    actionButton:SetPoint("BOTTOMLEFT", 10, 10)
    actionButton:SetText("Trajet")
    
    -- Fonction de gestionnaire d'événements pour le clic du bouton
    actionButton:SetScript("OnClick", function()
      local mapFrame = CreateFrame("Frame", "StranglethornMapFrame",UIParent )
      mapFrame:SetSize(500, 500)
      mapFrame:SetPoint("CENTER")
      mapFrame:SetClampedToScreen(true)
      mapFrame:SetMovable(true)
      mapFrame:EnableMouse(true)
      mapFrame:RegisterForDrag("LeftButton")
      mapFrame:SetScript("OnDragStart", mapFrame.StartMoving)
      mapFrame:SetScript("OnDragStop", mapFrame.StopMovingOrSizing)
      mapFrame:SetScript("OnHide", mapFrame.StopMovingOrSizing)
      mapFrame:SetFrameStrata("DIALOG")
 
      local mapTexture = mapFrame:CreateTexture(nil, "BACKGROUND")
      mapTexture:SetAllPoints(mapFrame)
      -- mapTexture:SetAtlas(C_Map.GetMapArtID(50))
   
    
      mapFrame.closeButton = CreateFrame("Button", nil, mapFrame, "UIPanelCloseButton")
      mapFrame.closeButton:SetPoint("TOPRIGHT", -8, -8)
      mapFrame.closeButton:SetScript("OnClick", function()
      mapFrame:Hide()
      end)
     
      -- mapFrame:Show()

    end)

    local actionButton2 = CreateFrame("Button", nil, etiquette, "UIPanelButtonTemplate")
    actionButton2:SetSize(80, 20)
    actionButton2:SetPoint("LEFT", actionButton, "RIGHT", 10, 0)
    actionButton2:SetText("Carte")
    
    -- Fonction de gestionnaire d'événements pour le clic du bouton
    actionButton2:SetScript("OnClick", function()
      -- Action à effectuer lors du clic du bouton
      print("Le bouton a été cliqué !")
    end)
  
end


local function PopulateIconSelector(tableau, parent, etiquetteL, etiquetteH, numColumns)
  local lastParent = parent;
  local rowIndex, colIndex = 0, 0
  local textOffsetX = 5

  local totalHeight = 0;


  ----------------------------CADRE DONJON DAILY ------------------
  local numRowsDaily = math.ceil(#core.Mounts.MountsDonjonDaily.Perso / numColumns)
  local heightDonjonDaily = numRowsDaily * (etiquetteH);
  local heightContainerDonjonDaily = heightDonjonDaily+50

  local donjonDaily = CreateFrame("frame", "donjonDaily", parent)
  donjonDaily:SetPoint("TOP", parent, "TOP")
  donjonDaily:SetSize(1100,0)
  donjonDaily:SetHeight(heightContainerDonjonDaily)

  local backgroundDonjonDaily = donjonDaily:CreateTexture(nil, "BACKGROUND")
  backgroundDonjonDaily:SetAllPoints(donjonDaily)
  backgroundDonjonDaily:SetColorTexture(0.9, 0.9, 0.9, 0.2)

  local donjonTitle = donjonDaily:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  donjonTitle:SetPoint("TOP", donjonDaily, "TOP",0 , -10)
  donjonTitle:SetText("Donjons")
  
  local allDailyDJ= CreateFrame("frame", "containerDJ", donjonDaily)
  allDailyDJ:SetPoint("TOP", donjonDaily, "TOP", 0, -40)
  allDailyDJ:SetSize(1100, heightDonjonDaily)
  allDailyDJ:SetHeight(heightDonjonDaily)

  for _, item in ipairs(core.Mounts.MountsDonjonDaily.Perso) do
    createEtiquette(item, allDailyDJ,etiquetteL, etiquetteH,textOffsetX , "color", rowIndex, colIndex,"donjonDaily" )
    colIndex = colIndex + 1
    if colIndex >= numColumns then
      colIndex = 0
      rowIndex = rowIndex + 1
    end
  end
  totalHeight = totalHeight + heightContainerDonjonDaily ;


  ----------------------------CADRE EXPE BFA ------------------
  local numRowBFA = math.ceil(#core.WorlQuestPersoBFA / numColumns)
  local heightBFAContainer =  numRowBFA * (etiquetteH)
  local heightContainerBFA = heightBFAContainer+50

  local containerQuestBFA = CreateFrame("frame", "containerQuestBFA", parent)
  containerQuestBFA:SetPoint("TOP", parent, "TOP", 0, -(totalHeight+20))
  containerQuestBFA:SetSize(1100,0)
  containerQuestBFA:SetHeight(heightContainerBFA)

  heightContainerBFA = heightContainerBFA + 20

  local backgroundExpeBFA = containerQuestBFA:CreateTexture(nil, "BACKGROUND")
  backgroundExpeBFA:SetAllPoints(containerQuestBFA)
  backgroundExpeBFA:SetColorTexture(0.9, 0.9, 0.9, 0.2)
  
  local textEmissaire = containerQuestBFA:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  textEmissaire:SetPoint("TOP", containerQuestBFA, "TOP", 0, -10)
  textEmissaire:SetText("Emissaires BFA")
   
  local allQuestBFA = CreateFrame("frame", "containerQuest", containerQuestBFA)
  allQuestBFA:SetPoint("TOP", containerQuestBFA, "TOP", 0, -40)
  allQuestBFA:SetSize(1100,0)
  allQuestBFA:SetHeight(heightBFAContainer)

  rowIndex=0
  colIndex = 0
  
  for _, item in ipairs(core.WorlQuestPersoBFA) do
    createEtiquette(item, allQuestBFA,etiquetteL, etiquetteH,textOffsetX , "color", rowIndex, colIndex,"emissaire" )
   
    colIndex = colIndex + 1
    if colIndex >= numColumns then
      colIndex = 0
      rowIndex = rowIndex + 1
    end
  end
  totalHeight = totalHeight + heightContainerBFA

  -- ----------------------------CADRE EXPE Legion ------------------
  local numRowLegion = math.ceil(#core.WorlQuestPersoLegion / numColumns)
  local heightLegionExpe =  numRowLegion * (etiquetteH)
  local heightContainerLegion = heightLegionExpe+50

  local containerQuestLegion = CreateFrame("frame", "containerQuestLegion", parent)
  containerQuestLegion:SetPoint("TOP", parent, "TOP", 0, -(totalHeight+20))
  containerQuestLegion:SetSize(1100,0)
  containerQuestLegion:SetHeight(heightContainerLegion)

  heightContainerLegion = heightContainerLegion + 20


  local backgroundExpeLegion = containerQuestLegion:CreateTexture(nil, "BACKGROUND")
  backgroundExpeLegion:SetAllPoints(containerQuestLegion)
  backgroundExpeLegion:SetColorTexture(0.9, 0.9, 0.9, 0.2)
   
  local textEmissaireLegion = containerQuestLegion:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
  textEmissaireLegion:SetPoint("TOP", containerQuestLegion, "TOP", 0, -10)
  textEmissaireLegion:SetText("Emissaires legion")
   
  local allQuestLegion = CreateFrame("frame", "containerQuest", containerQuestLegion)
  allQuestLegion:SetPoint("TOP", containerQuestLegion, "TOP", 0, -40)
  allQuestLegion:SetSize(1100,0)
  allQuestLegion:SetHeight(heightLegionExpe)

  rowIndex=0
  colIndex = 0
  
  for _, item in ipairs(core.WorlQuestPersoLegion) do
    createEtiquette(item, allQuestLegion,etiquetteL, etiquetteH,textOffsetX , "color", rowIndex, colIndex,"emissaire" )
   
    colIndex = colIndex + 1
    if colIndex >= numColumns then
      colIndex = 0
      rowIndex = rowIndex + 1
    end
  end
  totalHeight = totalHeight + heightContainerLegion



  -- Ajuster la hauteur du ScrollChild en fonction du nombre de lignes d'icônes
  local numRows = math.ceil(#tableau / numColumns)
  local scrollChildHeight = numRows * (etiquetteH + 4)
  -- parent:SetHeight(scrollChildHeight+130)
  parent:SetHeight(totalHeight)

end

function core.Frame.createFrameContainer(tableau)
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
  frame.title:SetText("Ce que je dois faire aujourd'hui")
  frame:SetFrameStrata("HIGH")
  frame.closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  frame.closeButton:SetPoint("TOPRIGHT", -8, -8)
  frame.closeButton:SetScript("OnClick", function()
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

  

  local donjonContainer = CreateFrame("Frame", "IconSelectorScrollChild2", scrollFrame)
  donjonContainer:SetSize(1100,0)
  scrollFrame:SetScrollChild(donjonContainer)



  -- local backgroundDonjon = donjonContainer:CreateTexture(nil, "BACKGROUND")
  -- backgroundDonjon:SetAllPoints(donjonContainer)
  -- backgroundDonjon:SetColorTexture(0, 0, 1, 1)
  
  PopulateIconSelector(tableau, donjonContainer, etiquetteL,etiquetteH,  numColumns)


  return frame
  end

 function core.Frame.show(frame)
    frame:Show()
 end

function  core.Frame.hide(frame)
    frame:Hide()
end

function core.Frame.getAddonFrame()
  local instanceLock =  core.Functions.getInstanceLoked()

  local allMounts = core.Functions.getIconAndCheckIfMountIsAlreadyCollected()
  for index, entry in ipairs(allMounts) do
     if next(instanceLock) ~= nil then
         local isDone = core.Functions.checkIfMountIsAlreadyDone(entry[1], entry[3],instanceLock, entry[7] )
         allMounts[index][5] = isDone[1]
         allMounts[index][6] = isDone[2]
     else
        allMounts[index][5]= false;
        allMounts[index][6]= 0;

     end
    
 end

 core.Functions.getActiveBFAWorldQuest("BFA")
 
  core.Frame.createFrameContainer(allMounts)

end