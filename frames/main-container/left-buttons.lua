local _,core = ...;

local function removeActiveOtherButton(option)
    for key, value in pairs(core.actionButton) do
        if not (core.actionButton[key] == option)  then
            core.actionButton[key]:SetColorTexture(0,0, 0, 0)
        end
      end
end

function core.leftButton(parent, title, y, option)
    local button = CreateFrame("frame", nil, parent);
    button:SetPoint("TOP", 0, y)
    button:SetSize(200,50)
  
    core.actionButton[option] = button:CreateTexture(nil, "BACKGROUND")
    core.actionButton[option]:SetAllPoints(button)
    core.actionButton[option]:SetColorTexture(0,0, 0, 0.2)
  
    local buttonTitle = button:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med2")
    buttonTitle:SetPoint("CENTER", button, "CENTER", 0, 0)
    buttonTitle:SetText(title)

    ------Button daily Script-----------------
    button:SetScript("OnMouseDown", function()
        core.containerFrame:Hide()
        core.containerFrame = core.Functions.getContainerScrollFrame(core.scrollFrame)
        core.PopulateActivities(core.containerFrame, option)
        removeActiveOtherButton(option)
        core.actionButton[option]:SetColorTexture( core.activeButton.r, core.activeButton.g, core.activeButton.b, 1)
        core.buttonActive = option
    end)

       -- OnEnter: Changement de couleur lors du survol
       button:SetScript("OnEnter", function()
        if not (core.buttonActive == option) then
            core.actionButton[option]:SetColorTexture(core.activeButton.r, core.activeButton.g, core.activeButton.b, 0.2)
        end
    end)

    -- OnLeave: Retour à la couleur d'origine lorsque la souris quitte le bouton
    button:SetScript("OnLeave", function()
        core.actionButton[option]:SetColorTexture(0, 0, 0, 0)
        core.actionButton[core.buttonActive]:SetColorTexture(core.activeButton.r, core.activeButton.g, core.activeButton.b, 1)
    end)


    return button
end
