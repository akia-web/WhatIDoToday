local _, core = ...;
core.listHF = {}

local function createButtonHf(parent, text, width, height, item)
    local buttonLink = CreateFrame("button", nil, parent)
    buttonLink:SetSize(width, height)

    local buttonLinkBackground = buttonLink:CreateTexture(nil, "BACKGROUND")
    buttonLinkBackground:SetAllPoints()
    buttonLinkBackground:SetColorTexture(0, 0, 0, 0)

    local buttonTitle = buttonLink:CreateFontString(nil, "OVERLAY", "SystemFont_Shadow_Med1")
    buttonTitle:SetPoint("LEFT", buttonLink, "LEFT", 10, 0)
    buttonTitle:SetText('- ' .. text)
    buttonTitle:SetJustifyH('LEFT')
    buttonTitle:SetNonSpaceWrap(true)
    buttonTitle:SetWidth(width + 10)

    buttonLink:SetScript("OnEnter", function()
        buttonLinkBackground:SetColorTexture(core.activeButton.r, core.activeButton.g, core.activeButton.b, 0.8)
    end)

    buttonLink:SetScript("OnLeave", function()
        buttonLinkBackground:SetColorTexture(0, 0, 0, 0)
    end)

    buttonLink:SetScript("OnClick", function()
        if core.detailEventFrame then
            core.detailEventFrame:Hide()
        end

        core.createDetailEventFrame(item, "popupHF", core.barres.eventsPopup, 50)
        core.detailEventFrame:Show()

    end)
    return buttonLink

end

function core.listHF.CreateListHF(item, parent)

    local frameHF = CreateFrame("Frame", "MonCadre", parent)
    local buttonWidth = 260
    frameHF:SetWidth(buttonWidth)
    frameHF:SetPoint("TOP", parent, "BOTTOM", 0, 0)

    local buttonHeight = 30
    local buttonSpacingY = 5
    local buttons = {}

    -- Création des boutons dynamiquement
    for index, entry in ipairs(item.dependsHF) do
        local button2 = createButtonHf(frameHF, entry['nameHf'], buttonWidth, buttonHeight, entry)
        table.insert(buttons, button2)
        local yOffset = -((index - 1) * (buttonHeight + buttonSpacingY))
        button2:SetPoint("TOPLEFT", frameHF, "TOPLEFT", 0, yOffset)
    end

    frameHF:SetHeight(35 * #item.dependsHF)
    return frameHF

end