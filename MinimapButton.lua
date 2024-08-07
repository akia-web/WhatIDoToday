local _, core = ...;
local WIDT_MM = LibStub("AceAddon-3.0"):NewAddon("WIDT_MM ", "AceConsole-3.0")
local WIDT_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("WIDT!", {
    type = "data source",
    text = "WIDT!",
    icon = "Interface\\Icons\\achievement_boss_algalon_01",
    OnClick = function(_, button)
        if button == "LeftButton" then
            if core.FrameAddon then
                core.FrameAddon:Hide()
                core.FrameAddon = nil
            else
                core.Frame.createFrameContainer()

            end
        else
            if button == "RightButton" then
                Settings.OpenToCategory("WIDT");
            end
        end
    end,
    OnTooltipShow = function(tooltip)
        tooltip:AddLine("What I do Today", 1, 1, 1)
    end,
})
local icon = LibStub("LibDBIcon-1.0")
function WIDT_MM:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("WIDTMMDB", { profile = { minimap = { hide = false, }, }, })
    icon:Register("WIDT!", WIDT_LDB, self.db.profile.minimap)
end