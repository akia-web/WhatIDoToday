local _, core = ...;
core.Icones = {}
core.PopupEvent = {}
core.frame3D = nil

local function getIcone(iconName, isSpell)

    if not isSpell then
        return iconName
    else
        if tonumber(iconName) then
            iconID, originalIconID = C_Spell.GetSpellTexture(iconName)
            return iconID
        else
            return iconName
        end
    end
end

function core.Icones.CreateIconTexture(parent, iconName, size, idMount)
    local isSpell = (idMount ~= nil) and true or false
    local button = CreateFrame("Button", nil, parent)
    local searchText = 'Interface\\Addons\\WhatIDoToday\\UI\\events'

    if string.find(iconName, searchText) then
        size = 29
    end
    button:SetSize(size, size)

    button.texture = button:CreateTexture(nil, "ARTWORK")
    button.texture:SetAllPoints()
    local icone = getIcone(iconName, isSpell)
    button:SetNormalTexture(icone)

    if isSpell then
        button:SetScript("OnMouseDown", function()
            mount3DFrame(idMount)
        end)
    end

    return button
end

function mount3DFrame(idMount)
    --DressUpMount(idMount)
    local creatureDisplayID, description, source, isSelfMount, mountTypeID, uiModelSceneID = C_MountJournal.GetMountInfoExtraByID(idMount)

    if not core.frame3D then
        core.frame3D = CreateFrame("PlayerModel", nil, core.FrameAddon)
        core.frame3D:SetSize(350, core.FrameAddon:GetHeight())
    end

    core.frame3D:Show()
    core.frame3D:SetParent(core.FrameAddon)
    core.frame3D:ClearAllPoints()
    core.frame3D:SetPoint("RIGHT", core.FrameAddon, "RIGHT", 0, 0)
    core.frame3D:ClearModel()
    core.frame3D:SetDisplayInfo(0)

    core.frame3D.isDragging = false
    core.frame3D.lastCursorX = 0

    core.frame3D:EnableMouse(true)
    core.frame3D:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            core.frame3D.isDragging = true
            core.frame3D.lastCursorX = select(1, GetCursorPosition())
        end
        if core.frame3D.isDragging then
            self:SetScript("OnUpdate", function(self)
                local currentX, currentY = GetCursorPosition()
                if core.frame3D.isDragging then
                    local deltaX = currentX - core.frame3D.lastCursorX
                    local sensitivity = 0.01
                    local currentFacing = self:GetFacing()
                    self:SetFacing(currentFacing + (deltaX * sensitivity))
                    core.frame3D.lastCursorX = currentX
                end
            end)
        end
    end)

    core.frame3D:SetScript("OnMouseUp", function(self, button)
        core.frame3D.isDragging = false
        self:SetScript("OnUpdate", nil)
    end)


    if creatureDisplayID and creatureDisplayID > 0 then
        core.frame3D:SetDisplayInfo(creatureDisplayID)
        core.frame3D:RefreshCamera()
        core.frame3D:SetCamera(0)
        core.frame3D:SetSize(350, core.FrameAddon:GetHeight())
        core.frame3D:SetPosition(0, 0, 0)
        core.frame3D:SetFacing(0)

        --for big mount add distance cam
        if creatureDisplayID == 100912 or creatureDisplayID == 111720 then
            core.frame3D:SetCamDistanceScale(3.0)
        else
            core.frame3D:SetCamDistanceScale(1.0)
        end
        core.frame3D:RefreshCamera()


    end
end



  