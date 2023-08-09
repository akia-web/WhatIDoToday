
local _,core = ...

local WIDT = LibStub("AceAddon-3.0"):NewAddon("WIDT", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
	profile = {
        barreGauche = {
            ["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
        },
		eventsFond = {
			["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
		},
		eventsEtiquettes = {
			["r"] = 0.53,
            ["g"] = 0.81,
            ["b"] = 0.92,
		},
		eventsPopup = {
			["r"] = 0.5,
            ["g"] = 0.5,
            ["b"] = 0.5,
		},
		donjonJourFond = {
			["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
		},
		donjonJourEtiquettes = {
			["r"] = 0.53,
            ["g"] = 0.81,
            ["b"] = 0.92,
		},
		legionFond = {
			["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
		},
		legionEtiquettes = {
			["r"] = 0.53,
            ["g"] = 0.81,
            ["b"] = 0.92,
		},
		bfaFond = {
			["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
		},
		bfaEtiquettes = {
			["r"] = 0.53,
            ["g"] = 0.81,
            ["b"] = 0.92,
		},
		shadowlandFond = {
			["r"] = 0.9,
            ["g"] = 0.9,
            ["b"] = 0.9,
		},
		shadowlandEtiquettes = {
			["r"] = 0.53,
            ["g"] = 0.81,
            ["b"] = 0.92,
		}
	},
}

local options = {
	name = "WIDT",
	handler = WIDT,
	type = "group",
	args = {

	
        colorBarreGauche={
			order = 1,
            type="color",
            name="Barre de gauche",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.barreGauche.r, WIDT.db.profile.barreGauche.g, WIDT.db.profile.barreGauche.b; end,
			set = function(info, r, g, b) WIDT.db.profile.barreGauche.r = r; WIDT.db.profile.barreGauche.g = g; WIDT.db.profile.barreGauche.b = b; core.barres.barreGauche = WIDT.db.profile.barreGauche; end,
        },
		ghostDescription = {
			order = 2,
			fontSize = "large",
			type = "description",
			name = "\n \n|cFFFFFF00Donjons journaliers|r \n \n",
			cmdHidden = true
		},
		colorBarreFondDonjonJour={
			order = 3,
            type="color",
            name="Fond Donjons journaliers",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.donjonJourFond.r, WIDT.db.profile.donjonJourFond.g, WIDT.db.profile.donjonJourFond.b; end,
			set = function(info, r, g, b) WIDT.db.profile.donjonJourFond.r = r; WIDT.db.profile.donjonJourFond.g = g; WIDT.db.profile.donjonJourFond.b = b; core.barres.donjonJourFond = WIDT.db.profile.donjonJourFond; end,
        },
		colorEtiquettesDonjonJour={
			order = 4,
            type="color",
            name="Etiquettes Donjons journaliers",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.donjonJourEtiquettes.r, WIDT.db.profile.donjonJourEtiquettes.g, WIDT.db.profile.donjonJourEtiquettes.b; end,
			set = function(info, r, g, b) WIDT.db.profile.donjonJourEtiquettes.r = r; WIDT.db.profile.donjonJourEtiquettes.g = g; WIDT.db.profile.donjonJourEtiquettes.b = b; core.barres.donjonJourEtiquettes = WIDT.db.profile.donjonJourEtiquettes; end,
        },
		ghostDescription3 = {
			order = 5,
			fontSize = "large",
			type = "description",
			name = "\n \n|cFFFFFF00Évenements|r \n \n",
			cmdHidden = true
		},
		colorEventsFond={
			order = 6,
            type="color",
            name="Fond cadre events",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.eventsFond.r, WIDT.db.profile.eventsFond.g, WIDT.db.profile.eventsFond.b; end,
			set = function(info, r, g, b) WIDT.db.profile.eventsFond.r = r; WIDT.db.profile.eventsFond.g = g; WIDT.db.profile.eventsFond.b = b; core.barres.eventsFond = WIDT.db.profile.eventsFond; end,
        },
		colorEventsEtiquettes={
			order = 7,
            type="color",
            name="Étiquettes events",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.eventsEtiquettes.r, WIDT.db.profile.eventsEtiquettes.g, WIDT.db.profile.eventsEtiquettes.b; end,
			set = function(info, r, g, b) WIDT.db.profile.eventsEtiquettes.r = r; WIDT.db.profile.eventsEtiquettes.g = g; WIDT.db.profile.eventsEtiquettes.b = b; core.barres.eventsEtiquettes = WIDT.db.profile.eventsEtiquettes; end,
        },
		colorEventsPopup={
			order = 8,
            type="color",
            name="Fond popup events",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.eventsPopup.r, WIDT.db.profile.eventsPopup.g, WIDT.db.profile.eventsPopup.b; end,
			set = function(info, r, g, b) WIDT.db.profile.eventsPopup.r = r; WIDT.db.profile.eventsPopup.g = g; WIDT.db.profile.eventsPopup.b = b; core.barres.eventsPopup = WIDT.db.profile.eventsPopup; end,
        },
		ghostDescription4 = {
			order = 9,
			fontSize = "large",
			type = "description",
			name = "\n \n|cFFFFFF00Légion|r \n \n",
			cmdHidden = true
		},
		colorLegionFond={
			order = 10,
            type="color",
            name="Fond cadre Légion",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.legionFond.r, WIDT.db.profile.legionFond.g, WIDT.db.profile.legionFond.b; end,
			set = function(info, r, g, b) WIDT.db.profile.legionFond.r = r; WIDT.db.profile.legionFond.g = g; WIDT.db.profile.legionFond.b = b; core.barres.legionFond = WIDT.db.profile.legionFond; end,
        },
		colorLegionEtiquettes={
			order = 11,
            type="color",
            name="Étiquettes Légion",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.legionEtiquettes.r, WIDT.db.profile.legionEtiquettes.g, WIDT.db.profile.legionEtiquettes.b; end,
			set = function(info, r, g, b) WIDT.db.profile.legionEtiquettes.r = r; WIDT.db.profile.legionEtiquettes.g = g; WIDT.db.profile.legionEtiquettes.b = b; core.barres.legionEtiquettes = WIDT.db.profile.legionEtiquettes; end,
        },
		ghostDescription5= {
			order = 12,
			fontSize = "large",
			type = "description",
			name = "\n \n|cFFFFFF00BFA|r\n \n",
			cmdHidden = true
		},
		colorBfaFond={
			order = 13,
            type="color",
            name="Fond cadre BFA",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.bfaFond.r, WIDT.db.profile.bfaFond.g, WIDT.db.profile.bfaFond.b; end,
			set = function(info, r, g, b) WIDT.db.profile.bfaFond.r = r; WIDT.db.profile.bfaFond.g = g; WIDT.db.profile.bfaFond.b = b; core.barres.bfaFond = WIDT.db.profile.bfaFond; end,
        },
		colorBfaEtiquettes={
			order = 14,
            type="color",
            name="Étiquettes BFA",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.bfaEtiquettes.r, WIDT.db.profile.bfaEtiquettes.g, WIDT.db.profile.bfaEtiquettes.b; end,
			set = function(info, r, g, b) WIDT.db.profile.bfaEtiquettes.r = r; WIDT.db.profile.bfaEtiquettes.g = g; WIDT.db.profile.bfaEtiquettes.b = b; core.barres.bfaEtiquettes = WIDT.db.profile.bfaEtiquettes; end,
        },
		ghostDescription6 = {
			order = 15,
			fontSize = "large",
			type = "description",
			name = "\n \n|cFFFFFF00Shadowland|r\n \n",
			cmdHidden = true
		},
		colorShadowlandFond={
			order = 16,
            type="color",
            name="Fond cadre Shadowland",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.shadowlandFond.r, WIDT.db.profile.shadowlandFond.g, WIDT.db.profile.shadowlandFond.b; end,
			set = function(info, r, g, b) WIDT.db.profile.shadowlandFond.r = r; WIDT.db.profile.shadowlandFond.g = g; WIDT.db.profile.shadowlandFond.b = b; core.barres.shadowlandFond = WIDT.db.profile.shadowlandFond; end,
        },
		colorShadowlandEtiquettes={
			order = 17,
            type="color",
            name="Étiquettes Shadowland",
            width="normal",
            desc="gnia",
            get = function() return WIDT.db.profile.shadowlandEtiquettes.r, WIDT.db.profile.shadowlandEtiquettes.g, WIDT.db.profile.shadowlandEtiquettes.b; end,
			set = function(info, r, g, b) WIDT.db.profile.shadowlandEtiquettes.r = r; WIDT.db.profile.shadowlandEtiquettes.g = g; WIDT.db.profile.shadowlandEtiquettes.b = b; core.barres.shadowlandEtiquettes = WIDT.db.profile.shadowlandEtiquettes; end,
        },
		ghostDescription7 = {
			order = 18,
			type = "description",
			name = "",
			cmdHidden = true
		},
		button={
			order=19,
			type = "execute",
			name="reset",
			func = "resetColor",
		}
	
	},
}



function WIDT:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("WIDTDB", defaults, true)
	AC:RegisterOptionsTable("WIDT_options", options)
	self.optionsFrame = ACD:AddToBlizOptions("WIDT_options", "WIDT")
	core.optionFrame = self.optionsFrame
    core.barres.barreGauche = self.db.profile.barreGauche
	core.barres.donjonJourFond = self.db.profile.donjonJourFond
	core.barres.donjonJourEtiquettes = self.db.profile.donjonJourEtiquettes
	core.barres.eventsFond = self.db.profile.eventsFond
	core.barres.eventsEtiquettes = self.db.profile.eventsEtiquettes
	core.barres.eventsPopup = self.db.profile.eventsPopup
	core.barres.legionFond = self.db.profile.legionFond
	core.barres.legionEtiquettes = self.db.profile.legionEtiquettes
	core.barres.bfaFond = self.db.profile.bfaFond
	core.barres.bfaEtiquettes = self.db.profile.bfaEtiquettes
	core.barres.shadowlandFond = self.db.profile.shadowlandFond
	core.barres.shadowlandEtiquettes = self.db.profile.shadowlandEtiquettes
end


-- function WIDT:GetColor(info)
-- 	return self.db.profile.barreGauche.r, self.db.profile.barreGauche.g, self.db.profile.barreGauche.b
-- end

function WIDT:SetColor(info, r, g, b)
	self.db.profile.barreGauche.r = r
    self.db.profile.barreGauche.g = g
    self.db.profile.barreGauche.b = b
    core.barres.barreGauche = self.db.profile.donjonJourFond
	
end

function WIDT:resetColor(_,button)

	if button == "LeftButton" then
		for key, value in pairs(WIDT.db.profile) do
			print("Key:", key)
			WIDT.db.profile[key] = defaults.profile[key]
			core.barres[key] = WIDT.db.profile[key]
		end
end
end







