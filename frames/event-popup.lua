local _,core = ...;
core.PopupEvent = {};

function core.PopupEvent.CreatePopup(color)
    print('ke suis dans createPopup')
    local detailFrame = CreateFrame("Frame", "StranglethorndetailFrame",UIParent )
    detailFrame:SetSize(500, 300)
    detailFrame:SetPoint("CENTER")
    detailFrame:SetFrameStrata("DIALOG")
    local detailTexture = detailFrame:CreateTexture(nil, "BACKGROUND")
    detailTexture:SetAllPoints(detailFrame)
    detailTexture:SetColorTexture(color.r, color.g, color.b, 1)
    detailFrame.closeButton = CreateFrame("Button", nil, detailFrame, "UIPanelCloseButton")
    detailFrame.closeButton:SetPoint("TOPRIGHT", -8, -8)

    detailFrame.closeButton:SetScript("OnClick", function()
        core.detailEventFrame = nil
        detailFrame:Hide()
      end) 
    return detailFrame
end