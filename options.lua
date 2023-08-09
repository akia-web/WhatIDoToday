
local _,core = ...

local WIDT = LibStub("AceAddon-3.0"):NewAddon("WIDT", "AceConsole-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
	profile = {
        barreGauche = {
            ["r"] = 1,
            ["g"] = 0.4,
            ["b"] = 0.6,
        }
	},
}

local options = {
	name = "WIDT",
	handler = WIDT,
	type = "group",
	args = {

		ghostDescription = {
			order=2,
			type = "description",
			name = "   ",
			cmdHidden = true
		},
        color={
            order=3,
            type="color",
            name="Barre de gauche",
            width="normal",
            desc="gnia",
            get = "GetColor",
			set = "SetColor",
        }
		
	},
}



function WIDT:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("WIDTDB", defaults, true)
	AC:RegisterOptionsTable("WIDT_options", options)
	self.optionsFrame = ACD:AddToBlizOptions("WIDT_options", "WIDT")
    core.barres.barreGauche = self.db.profile.barreGauche
end


function WIDT:GetColor(info)
	return self.db.profile.barreGauche.r, self.db.profile.barreGauche.g, self.db.profile.barreGauche.b
end

function WIDT:SetColor(info, r, g, b)
	self.db.profile.barreGauche.r = r
    self.db.profile.barreGauche.g = g
    self.db.profile.barreGauche.b = b
    core.barres.barreGauche = self.db.profile.barreGauche
	
end







