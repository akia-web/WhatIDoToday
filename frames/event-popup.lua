local _, core = ...;
core.PopupEvent = {};

function core.PopupEvent.CreatePopup(color)
    local detailFrame = CreateFrame("Frame", "StranglethorndetailFrame", UIParent)
    detailFrame:SetWidth(500)
    detailFrame:SetPoint("CENTER")
    detailFrame:SetFrameStrata("DIALOG")
    local detailTexture = detailFrame:CreateTexture(nil, "BACKGROUND")
    detailTexture:SetAllPoints(detailFrame)
    detailTexture:SetColorTexture(color.r, color.g, color.b, 1)
    detailFrame.closeButton = CreateFrame("Button", nil, detailFrame, "UIPanelCloseButton")
    detailFrame.closeButton:SetPoint("TOPRIGHT", -8, -8)

    detailFrame:SetMovable(true)
    detailFrame:EnableMouse(true)
    detailFrame:RegisterForDrag("LeftButton")

    detailFrame:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)

    detailFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    detailFrame.closeButton:SetScript("OnClick", function()
        core.detailEventFrame = nil
        detailFrame:Hide()
    end)
    return detailFrame
end

function core.MapButton.CreatePopup()
    local btn = CreateFrame("Button", "MyMapButton", UIParent, "BackdropTemplate")
    btn:SetSize(40, 40)
    btn:SetPoint("CENTER")

    -- Texture (icône)
    btn.texture = btn:CreateTexture(nil, "BACKGROUND")
    btn.texture:SetAllPoints()
    btn.texture:SetTexture("Interface\\ICONS\\INV_Misc_Map_01") -- icône de carte

    -- Clique
    btn:SetScript("OnClick", function()
        WorldMapFrame:SetMapID(574) -- exemple
        WorldMapFrame:Show()
    end)
end