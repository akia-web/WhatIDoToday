local _, core = ...

local WIDT = LibStub("AceAddon-3.0"):NewAddon("WIDT", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
    profile = {
        daily = {
            activeButton = {
                ["r"] = 0.53,
                ["g"] = 0.81,
                ["b"] = 0.98,
            },
            eventsEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            eventsPopup = {
                ["r"] = 0,
                ["g"] = 0,
                ["b"] = 0,
            },
            donjonJourEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            legionEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            bfaEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            shadowlandEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            isEvents = true,
            isDonjonJour = true,
            isLegion = true,
            isBFA = true,
            isShadowLand = true,
            isArathie = true,
            isDarkshore = true,
            isHollidayEvent = true
        },
        weekly = {
            donjonsEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            raidsEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            worldBossEtiquettes = {
                ["r"] = 0.9,
                ["g"] = 0.9,
                ["b"] = 0.9,
            },
            isDonjon = true,
            isRaid = true,
            isWorldBoss = true
        }

    }
}

local options = {
    name = "WIDT",
    handler = WIDT,
    type = "group",
    childGroups = 'tree',
    args = {
        option1 = core.getOption1(WIDT),
        option2 = core.getOption2(WIDT)
    },
}

function WIDT:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("WIDTDB", defaults, true)
    AC:RegisterOptionsTable("WIDT_options", options)
    self.optionsFrame = ACD:AddToBlizOptions("WIDT_options", "WIDT")
    core.optionFrame = self.optionsFrame
    core.activeButton = self.db.profile.daily.activeButton

    -------Daily---------------
    core.barres.eventsEtiquettes = self.db.profile.daily.eventsEtiquettes
    core.barres.donjonJourEtiquettes = self.db.profile.daily.donjonJourEtiquettes
    core.barres.warfrontEtiquettes = self.db.profile.daily.warfrontEtiquettes
    core.barres.legionEtiquettes = self.db.profile.daily.legionEtiquettes
    core.barres.bfaEtiquettes = self.db.profile.daily.bfaEtiquettes
    core.barres.shadowlandEtiquettes = self.db.profile.daily.shadowlandEtiquettes
    core.barres.eventsPopup = self.db.profile.daily.eventsPopup

    -------Daily active---------------
    core.daily.active.events = self.db.profile.daily.isEvents
    core.daily.active.donjonJour = self.db.profile.daily.isDonjonJour
    core.daily.active.legion = self.db.profile.daily.isLegion
    core.daily.active.BFA = self.db.profile.daily.isBFA
    core.daily.active.ShadowLand = self.db.profile.daily.isShadowLand
    core.daily.active.Arathie = self.db.profile.daily.isArathie
    core.daily.active.Darkshore = self.db.profile.daily.isDarkshore
    core.daily.active.HollidayEvent = self.db.profile.daily.isHollidayEvent

    -------Weekly ---------------
    core.barres.donjonsWeeklyEtiquettes = self.db.profile.weekly.donjonsEtiquettes
    core.barres.raidsEtiquettes = self.db.profile.weekly.raidsEtiquettes
    core.barres.worldBossEtiquettes = self.db.profile.weekly.worldBossEtiquettes
    -------Weekly active---------------
    core.weekly.active.isDonjon = self.db.profile.weekly.isDonjon
    core.weekly.active.isRaid = self.db.profile.weekly.isRaid
    core.weekly.active.isWorldBoss = self.db.profile.weekly.isWorldBoss

end

function WIDT:resetColorDaily(_, button)

    if button == "LeftButton" then
        for key, value in pairs(WIDT.db.profile.daily) do
            WIDT.db.profile.daily[key] = defaults.profile.daily[key]
            core.barres[key] = WIDT.db.profile.daily[key]
        end
    end
end

function WIDT:resetColorWeekly(_, button)

    if button == "LeftButton" then
        for key, value in pairs(WIDT.db.profile.weekly) do
            WIDT.db.profile.weekly[key] = defaults.profile.weekly[key]
            core.barres[key] = WIDT.db.profile.weekly[key]
        end
    end
end






