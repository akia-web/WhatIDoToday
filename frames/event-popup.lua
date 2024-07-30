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