local _, core = ...;
core.Text = {};
local function yelloColor(text)
    return '|cFFFFFF00' .. text .. '|r : '
end

local function green(text)
    return '|cFF00FF00' .. text .. '|r '
end

local function getTextDonjonRaid(item)
    local donjonOrRaid = item["DonjonName"] and core.L['donjon'] or 'Raid'
    local name = item["DonjonName"] and item["DonjonName"] or item['RaidName']
    local donjon = "\n\n" .. yelloColor(core.Functions.capitalizeFirstLetter(donjonOrRaid)) .. name
    local difficulty = "\n" .. yelloColor(core.L['difficulty']) .. item["ModeName"]
    local boss = "\n" .. yelloColor('Boss') .. item["BossName"]
    local continent = "\n" .. yelloColor('Continent') .. item["Continent"]
    local region = "\n" .. yelloColor(core.L['pays']) .. item["Country"]

    return {

        title = item['MountName'],
        description = donjon .. difficulty .. boss .. continent .. region
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
        description = "\n\n|cFFFFFF00Continent|r : " .. item["Continent"] .. "\n|cFFFFFF00Région|r : " .. item["Country"]
    }
end

local function getTextWarfront(item)
    return {
        title = item["MountName"],
        description = nil
    }
end

local function getTextEvent(item)
    return {
        title = item["title"],
        description = "\n\n\n  |cFFFFFF00Fin|r : " .. item['dateFin']
    }
end

local function getTextPopupEvent(item)
    return {
        title = item["title"],
        description = item["description"] .. "\n\n |cFFFFFF00date de fin|r : " .. item["dateFin"]
    }
end

local function getTextPopupEventWinter(item)

    local continent = item["Continent"] and "\n\n" .. yelloColor('Continent') .. item["Continent"] or ""
    local country = item["Country"] and "\n" .. yelloColor('Région') .. item["Country"] or ""
    local requirement = item["Requirement"] and "\n" .. yelloColor('Pré-requis') .. item["Requirement"] or ""
    local money = item["Monnaie"] and "\n" .. yelloColor('Monnaie') .. item["Monnaie"] or ""
    local consigne = item["Consigne"] and "\n" .. yelloColor('Achat PNJ') .. item["Consigne"] or ""
    local donjon = item["Donjon"] and "\n" .. yelloColor(core.Functions.capitalizeFirstLetter(core.L["donjon"])) .. item["Donjon"] or ""
    return {
        title = item["MountName"],
        description = continent .. country .. requirement .. money .. consigne .. donjon
    }
end

local function getTextPopupHF(item)
    local criteriatext = ''
    if item.criteria ~= nil and #item.criteria > 0 then
        local isMetaHF = item['metaHf'] and 'meta HF' or core.L['critere']
        criteriatext = isMetaHF .. ' : \n\n'
        for index, entry in ipairs(item.criteria) do
            local text = entry.name
            local transformNumberQuantityString = tonumber(entry.quantityString)

            if entry.doRequirement then
                text = green(text)
            end

            if #item.criteria == 1 and transformNumberQuantityString == nil then
                criteriatext = criteriatext .. entry.quantityString .. '\n'
            else
                criteriatext = criteriatext .. '- ' .. text .. '\n'
            end
        end
    end
    return {
        title = item["nameHf"],
        description = item["description"] .. '\n\n' .. criteriatext
    }
end

local function getTextHF(item)
    local nameHF = yelloColor(item["title"])
    return {
        title = item["MountName"],
        description = "\n\n" .. nameHF .. "\n\n" .. item['description']
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
    elseif type == 'warfront' then
        return getTextWarfront(item)
    elseif type == 'saisonnalEvent' then
        return getTextPopupEventWinter(item)
    elseif type == 'HF' then
        return getTextHF(item)
    elseif type == 'popupHF' then
        return getTextPopupHF(item)
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