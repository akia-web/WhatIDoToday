local _,core = ...

function core.getOption1(WIDT)
    return {
        name = "Daily options",
        desc = "Daily options",
        type = "group",
        order = 1,
        args = {
            colorBarreGauche={
                order = 1,
                type="color",
                name="Barre de gauche",
                get = function() return WIDT.db.profile.daily.barreGauche.r, WIDT.db.profile.daily.barreGauche.g, WIDT.db.profile.daily.barreGauche.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.barreGauche.r = r; WIDT.db.profile.daily.barreGauche.g = g; WIDT.db.profile.daily.barreGauche.b = b; core.barres.barreGauche = WIDT.db.profile.daily.barreGauche; end,
            },
            colorEtiquettesDonjonJour={
                order = 2,
                type="color",
                name="Donjons journaliers",
                get = function() return WIDT.db.profile.daily.donjonJourEtiquettes.r, WIDT.db.profile.daily.donjonJourEtiquettes.g, WIDT.db.profile.daily.donjonJourEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.donjonJourEtiquettes.r = r; WIDT.db.profile.daily.donjonJourEtiquettes.g = g; WIDT.db.profile.daily.donjonJourEtiquettes.b = b; core.barres.donjonJourEtiquettes = WIDT.db.profile.daily.donjonJourEtiquettes; end,
            },
            colorEventsEtiquettes={
                order = 3,
                type="color",
                name="events",
                get = function() return WIDT.db.profile.daily.eventsEtiquettes.r, WIDT.db.profile.daily.eventsEtiquettes.g, WIDT.db.profile.daily.eventsEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.eventsEtiquettes.r = r; WIDT.db.profile.daily.eventsEtiquettes.g = g; WIDT.db.profile.daily.eventsEtiquettes.b = b; core.barres.eventsEtiquettes = WIDT.db.profile.daily.eventsEtiquettes; end,
            },
            colorEventsPopup={
                order = 4,
                type="color",
                name="popup events",
                get = function() return WIDT.db.profile.daily.eventsPopup.r, WIDT.db.profile.daily.eventsPopup.g, WIDT.db.profile.daily.eventsPopup.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.eventsPopup.r = r; WIDT.db.profile.daily.eventsPopup.g = g; WIDT.db.profile.daily.eventsPopup.b = b; core.barres.eventsPopup = WIDT.db.profile.daily.eventsPopup; end,
            },
            colorLegionEtiquettes={
                order = 5,
                type="color",
                name="Légion",
                get = function() return WIDT.db.profile.daily.legionEtiquettes.r, WIDT.db.profile.daily.legionEtiquettes.g, WIDT.db.profile.daily.legionEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.legionEtiquettes.r = r; WIDT.db.profile.daily.legionEtiquettes.g = g; WIDT.db.profile.daily.legionEtiquettes.b = b; core.barres.legionEtiquettes = WIDT.db.profile.daily.legionEtiquettes; end,
            },		
            colorBfaEtiquettes={
                order = 6,
                type="color",
                name="BFA",
                get = function() return WIDT.db.profile.daily.bfaEtiquettes.r, WIDT.db.profile.daily.bfaEtiquettes.g, WIDT.db.profile.daily.bfaEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.bfaEtiquettes.r = r; WIDT.db.profile.daily.bfaEtiquettes.g = g; WIDT.db.profile.daily.bfaEtiquettes.b = b; core.barres.bfaEtiquettes = WIDT.db.profile.daily.bfaEtiquettes; end,
            },
            colorShadowlandEtiquettes={
                order = 7,
                type="color",
                name="Shadowland",
                get = function() return WIDT.db.profile.daily.shadowlandEtiquettes.r, WIDT.db.profile.daily.shadowlandEtiquettes.g, WIDT.db.profile.daily.shadowlandEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.daily.shadowlandEtiquettes.r = r; WIDT.db.profile.daily.shadowlandEtiquettes.g = g; WIDT.db.profile.daily.shadowlandEtiquettes.b = b; core.barres.shadowlandEtiquettes = WIDT.db.profile.daily.shadowlandEtiquettes; end,
            },
            ghostDescription1 = {
                order = 8,
                type = "description",
                name = "",
                cmdHidden = true
            },
            button={
                order=9,
                type = "execute",
                name="reset",
                func = "resetColorDaily",
            },
            ghostDescription2 = {
                order = 10,
                type = "description",
                name = "",
                cmdHidden = true
            },
            isEvents={
                order = 11,
                type="toggle",
                name='Évenements',
                get= function () return WIDT.db.profile.daily.isEvent;end,
                set= function () WIDT.db.profile.daily.isEvent = not WIDT.db.profile.daily.isEvent; core.daily.active.events = WIDT.db.profile.daily.isEvent; end
            },
            isDonjonJour={
                order = 12,
                type="toggle",
                name='Donjon du jour',
                get= function () return WIDT.db.profile.daily.isDonjonJour;end,
                set= function () WIDT.db.profile.daily.isDonjonJour = not WIDT.db.profile.daily.isDonjonJour; core.daily.active.donjonJour = WIDT.db.profile.daily.isDonjonJour; end
            },
            isLegion={
                order = 13,
                type="toggle",
                name='Legion',
                get= function () return WIDT.db.profile.daily.isLegion;end,
                set= function () WIDT.db.profile.daily.isLegion = not WIDT.db.profile.daily.isLegion; core.daily.active.legion = WIDT.db.profile.daily.isLegion;end
            },
            isBFA={
                order = 13,
                type="toggle",
                name='BFA',
                get= function () return WIDT.db.profile.daily.isBFA;end,
                set= function () WIDT.db.profile.daily.isBFA = not WIDT.db.profile.daily.isBFA; core.daily.active.BFA = WIDT.db.profile.daily.isBFA; end
            },
            isShadowLand={
                order = 14,
                type="toggle",
                name='ShadowLand',
                get= function () return WIDT.db.profile.daily.isShadowLand;end,
                set= function () WIDT.db.profile.daily.isShadowLand = not WIDT.db.profile.daily.isShadowLand; core.daily.active.ShadowLand = WIDT.db.profile.daily.isShadowLand; end
            },
            isArathie={
                order = 15,
                type="toggle",
                name='Arathie',
                get= function () return WIDT.db.profile.daily.isArathie;end,
                set= function () WIDT.db.profile.daily.isArathie = not WIDT.db.profile.daily.isArathie; core.daily.active.Arathie = WIDT.db.profile.daily.isArathie; end
            },
            isDarkshore={
                order = 16,
                type="toggle",
                name='Darkshore',
                get= function () return WIDT.db.profile.daily.isDarkshore;end,
                set= function () WIDT.db.profile.daily.isDarkshore = not WIDT.db.profile.daily.isDarkshore; core.daily.active.Darkshore = WIDT.db.profile.daily.isDarkshore; end
            },
            isHollidayEvent={
                order = 17,
                type="toggle",
                name='HollidayEvent',
                get= function () return WIDT.db.profile.daily.isHollidayEvent;end,
                set= function () WIDT.db.profile.daily.isHollidayEvent = not WIDT.db.profile.daily.isHollidayEvent; core.daily.active.HollidayEvent= WIDT.db.profile.daily.isHollidayEvent; end
            },
        },
    }
end
