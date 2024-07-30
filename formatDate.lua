local _, core = ...;
core.DateFormat = {};

local function formatDate(eventDate)
    if eventDate < 10 then
        return '0' .. eventDate
    else
        return eventDate
    end
end

function core.DateFormat.format(eventDate)
    if eventDate["endTime"] ~= nil then
        local day = formatDate(eventDate["endTime"]["monthDay"])
        local month = formatDate(eventDate["endTime"]["month"])
        local hour = formatDate(eventDate['endTime']['hour'])
        local minutes = formatDate(eventDate['endTime']['minute'])
        return day .. "/" .. month .. " à " .. hour .. " h " .. minutes
    end

end