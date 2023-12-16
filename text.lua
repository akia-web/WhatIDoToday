local _,core = ...;
core.Text = {};

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

local function getTextEvent(item)
    return {
        title = item["title"],
        description = ''
    }
end

local function getTextPopupEvent(item)
    return {
        title = item["title"],
        description = item["description"].."\n\n |cFFFFFF00date de fin|r : "..item["dateFin"]
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
    end


end

function core.Text.CreateText(parent, font, justify, textWidth, decalageX, decalageY)
    local text = parent:CreateFontString(nil, "OVERLAY", font)
    text:SetJustifyH(justify)
    text:SetPoint("TOP", parent, "TOP", decalageX, decalageY)
    text:SetNonSpaceWrap(true)
    text:SetWidth(textWidth)
    return text
end