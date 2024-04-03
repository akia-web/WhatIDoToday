local _,core = ...;
core.Icones = {}
core.PopupEvent = {}
local function getIcone(iconName, isSpell) 

    if not isSpell then
        return iconName
    else
        if tonumber(iconName) then
            return  GetSpellTexture(iconName)
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
  
    button:SetScript("OnMouseDown", function()
      if IsControlKeyDown()then
        DressUpMount(idMount)
      end
    end)
    return button
  end



  