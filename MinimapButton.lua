local _,core = ...;

local whatIdoToday = LibStub("AceAddon-3.0"):NewAddon("whatIDoToday", "AceEvent-3.0")

function whatIdoToday:OnInitialize()
    -- Créer le bouton sur la minimap
    self.minimapButton = CreateFrame("Button", "MinimapButtonWhatIDoToday", Minimap)
    self.minimapButton:SetSize(30, 30) -- Définir la taille du bouton selon vos besoins
    self.minimapButton:SetFrameStrata("LOW")
    self.minimapButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
    self.minimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 0) -- Définir la position du bouton sur la minimap

    -- Ajouter une texture à votre bouton
    self.minimapButton.texture = self.minimapButton:CreateTexture(nil, "BACKGROUND")
    self.minimapButton.texture:SetAllPoints()
    self.minimapButton.texture:SetTexture("Interface\\Icons\\achievement_boss_algalon_01") -- Définir la texture du bouton
    
   

    self.minimapButton:SetScript("OnClick", function(self, button)
    --    local active =  C_TaskQuest.GetQuestTimeLeftSeconds(50600)
        -- local active =  C_QuestLog.IsQuestFlaggedCompleted(50602)
   
        if core.FrameAddon then
            core.FrameAddon:Hide()
            core.FrameAddon = nil
        else
            core.Frame.createFrameContainer()
        end
       
       
    end)
end

function whatIdoToday:OnEnable()
    -- Code à exécuter lorsque l'addon est activé
    self:RegisterEvent("PLAYER_LOGIN")
end


function whatIdoToday:PLAYER_LOGIN()
    self.minimapButton:Show()
end

function whatIdoToday:OnDisable()
    self.minimapButton:Hide()
end



whatIdoToday:OnEnable()