local _,core = ...;

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
    LeftPanneau:SetPoint("TOPLEFT", 10, -50)
    local backgroundTextureLeftPanneau = LeftPanneau:CreateTexture(nil, "BACKGROUND")
    backgroundTextureLeftPanneau:SetAllPoints(LeftPanneau)
    backgroundTextureLeftPanneau:SetColorTexture(core.fondColor.r, core.fondColor.g, core.fondColor.b, 0.5) 
    
    core.scrollFrame = CreateFrame("ScrollFrame", "IconSelectorScrollFrame", frame, "UIPanelScrollFrameTemplate")
    core.scrollFrame:SetPoint("TOPLEFT", LeftPanneau,"TOPRIGHT",16, 0)
    core.scrollFrame:SetPoint("BOTTOMRIGHT", -32, 30)
  
    core.containerFrame = core.Functions.getContainerScrollFrame(core.scrollFrame) 
  
  ----------LetfButton --------------------
    core.todayButton = core.leftButton(LeftPanneau, "Aujourd'hui", 0, 'Daily') 
    core.leftButton(LeftPanneau, "Cette semaine", -50, 'Weekly')
    core.leftButton(LeftPanneau, "Haut faits", -100, 'HF')  

     --------------DONNEES DE DEPART---------------
    core.PopulateActivities(core.containerFrame, 'Daily')
    core.actionButton.Daily:SetColorTexture( core.activeButton.r, core.activeButton.g, core.activeButton.b, 1) 
    core.FrameAddon = frame
  end