local _,core = ...;
core.Text = {};
local function yelloColor(text)
    return '|cFFFFFF00'..text..'|r : '
end

local function getTextDonjonRaid(item)
    return {
        title = item['MountName'],
        description = "\n\n|cFFFFFF00Donjon|r : " .. item["DonjonName"] .. "\n|cFFFFFF00Difficulté|r : " .. item["ModeName"] .. "\n|cFFFFFF00Boss|r : " .. item["BossName"].."\n|cFFFFFF00Continent|r : ".. item["Continent"] .. "\n|cFFFFFF00Région|r : " .. item["Country"]
    }
end

local function getTextEmissaire(item)
    return {
        title = item["Title"],
        description = "\n\n|cFFFFFF00Zone|r : " .. item["Country"] .. "\n|cFFFFFF00Réputation|r : " .. item["ReputName"] .. "\n \n" .. item["Objectives"]
    }
end

local function getTextWorlboss(item)
    return {
        title = item["MountName"],
        description = "\n\n|cFFFFFF00Continent|r : ".. item["Continent"] .. "\n|cFFFFFF00Région|r : " .. item["Country"]
    }
end

local function getTextWarfront(item)
    return {
        title = item["MountName"],
        description = ''
    }
end

local function getTextEvent(item)
    return {
        title = item["title"],
        description = "\n\n\n  |cFFFFFF00Fin|r : "..item['dateFin']
    }
end

local function getTextPopupEvent(item)
    return {
        title = item["title"],
        description = item["description"].."\n\n |cFFFFFF00date de fin|r : "..item["dateFin"]
    }
end

local function getTextPopupEventWinter(item)

    local continent =  item["Continent"] and "\n\n" .. yelloColor('Continent').. item["Continent"] or ""
    local country = item["Country"] and "\n" .. yelloColor('Région')..item["Country"] or ""
    local requirement = item["Requirement"] and "\n" .. yelloColor('Pré-requis') .. item["Requirement"] or ""
    local money = item["Monnaie"] and "\n".. yelloColor('Monnaie')..item["Monnaie"] or ""
    local consigne = item["Consigne"] and  "\n" ..yelloColor('Achat PNJ').. item["Consigne"] or ""
    local donjon = item["Donjon"] and  "\n" ..yelloColor(core.Functions.capitalizeFirstLetter(core.L["donjon"])).. item["Donjon"] or ""
    -- return {
    --     title = item["MountName"],
    --     description = "\n\n" .. yelloColor('Continent').. item["Continent"] .. 
    --     "\n" .. yelloColor('Région')..item["Country"] .. 
    --     "\n" .. yelloColor('Pré-requis') .. item["Requirement"]..
    --     "\n".. yelloColor('Monnaie')..item["Monnaie"] ..
    --     "\n" ..yelloColor('Achat PNJ').. item["Consigne"]
    -- }
    return {
        title = item["MountName"],
        description = continent .. country .. requirement .. money .. consigne .. donjon
    }
end

function core.Text.GetText(type, item)
    if type == 'donjon' then
        return getTextDonjonRaid(item)
    elseif type == 'emissaire' or type == 'emissaire-4-quest' then
        return getTextEmissaire(item)
    
    elseif type == 'worldboss' then
        return getTextWorlboss(item)
    elseif type == 'events' then
        return getTextEvent(item)
    
    elseif type == 'event-popup' then
        return getTextPopupEvent(item)
    elseif type== 'warfront' then
        return getTextWarfront(item)
    elseif type=='saisonnalEvent' then
       return getTextPopupEventWinter(item)
    end


end

function core.Text.CreateText(parent, font, ancrageY, ancrageX, textWidth, decalageX, decalageY, justify)
    local text = parent:CreateFontString(nil, "OVERLAY", font)
    if justify ~= nil then
        text:SetJustifyH(justify)
    end
    text:SetPoint(ancrageY, parent, ancrageX, decalageX, decalageY)
    text:SetNonSpaceWrap(true)
    text:SetWidth(textWidth)
    return text
end