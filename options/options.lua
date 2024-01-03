
local _,core = ...


local WIDT = LibStub("AceAddon-3.0"):NewAddon("WIDT", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
	profile = {
		daily={
			barreGauche = {
				["r"] = 0.9,
				["g"] = 0.9,
				["b"] = 0.9,
			},
			eventsEtiquettes = {
				["r"] = 0.9,
				["g"] = 0.9,
				["b"] = 0.9,
			},
			eventsPopup = {
				["r"] = 0.9,
				["g"] = 0.9,
				["b"] = 0.9,
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
			isEvents= true,
			isDonjonJour = true,
			isLegion= true,
			isBFA = true,
			isShadowLand= true,
			isArathie = true,
			isDarkshore = true,
			isHollidayEvent = true
		}
		
	}
}

local options = {
	name = "WIDT",
	handler = WIDT,
	type = "group",
	childGroups = 'tree',
	args={
		option1= core.getOption1(WIDT),
		option2 = {
			name = "PlayerFrame",
			desc = "PlayerFrame Options.",
			type = "group",
			order = 2,
			args = {
				colorBarreGauche={
					order = 1,
					type="color",
					name="Barre de gauche",
					get = function() return WIDT.db.profile.daily.barreGauche.r, WIDT.db.profile.daily.barreGauche.g, WIDT.db.profile.daily.barreGauche.b; end,
					set = function(info, r, g, b) WIDT.db.profile.barreGauche.r = r; WIDT.db.profile.barreGauche.g = g; WIDT.db.profile.barreGauche.b = b; core.barres.barreGauche = WIDT.db.profile.barreGauche; end,
				},
			}
		}
	},


	
	

}

function WIDT:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("WIDTDB", defaults, true)
	AC:RegisterOptionsTable("WIDT_options", options)
	self.optionsFrame = ACD:AddToBlizOptions("WIDT_options", "WIDT")
	core.optionFrame = self.optionsFrame
    core.barres.barreGauche = self.db.profile.daily.barreGauche
	
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
	
end

function WIDT:resetColorDaily(_,button)

	if button == "LeftButton" then
		for key, value in pairs(WIDT.db.profile.daily) do
			print(key)
			WIDT.db.profile.daily[key] = defaults.profile.daily[key]
			core.barres[key] = WIDT.db.profile.daily[key]
		end
	end
end







