local _,core = ...
function core.getOption2(WIDT)
    return {
        name = "Weekly options",
        desc = "Weekly options",
        type = "group",
        order = 2,
        args = {
            setskinheader1 = {
                order=1,
                type = "header",
                name = "Couleur des Étiquettes",
            },
            colorDonjon={
                order = 2,
                type="color",
                name="donjons ",
                get = function() return WIDT.db.profile.weekly.donjonsEtiquettes.r, WIDT.db.profile.weekly.donjonsEtiquettes.g, WIDT.db.profile.weekly.donjonsEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.weekly.donjonsEtiquettes.r = r; WIDT.db.profile.weekly.donjonsEtiquettes.g = g; WIDT.db.profile.weekly.donjonsEtiquettes.b = b; core.barres.donjonsWeeklyEtiquettes = WIDT.db.profile.weekly.donjonsEtiquettes; end,
            },
            colorWorldBoss={
                order = 3,
                type="color",
                name="worldBoss",
                get = function() return WIDT.db.profile.weekly.raidsEtiquettes.r, WIDT.db.profile.weekly.raidsEtiquettes.g, WIDT.db.profile.weekly.raidsEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.weekly.raidsEtiquettes.r = r; WIDT.db.profile.weekly.raidsEtiquettes.g = g; WIDT.db.profile.weekly.raidsEtiquettes.b = b; core.barres.raidsEtiquettes = WIDT.db.profile.weekly.raidsEtiquettes; end,
            },
            colorRaids={
                order = 4,
                type="color",
                name="raid",
                get = function() return WIDT.db.profile.weekly.worldBossEtiquettes.r, WIDT.db.profile.weekly.worldBossEtiquettes.g, WIDT.db.profile.weekly.worldBossEtiquettes.b; end,
                set = function(info, r, g, b) WIDT.db.profile.weekly.worldBossEtiquettes.r = r; WIDT.db.profile.weekly.worldBossEtiquettes.g = g; WIDT.db.profile.weekly.worldBossEtiquettes.b = b; core.barres.worldBossEtiquettes = WIDT.db.profile.weekly.worldBossEtiquettes; end,
            },
            ghostDescription1 = {
                order = 5,
                type = "description",
                name = "",
                cmdHidden = true
            },
            button={
                order=6,
                type = "execute",
                name="reset des couleurs",
                func = "resetColorWeekly",
            },
            ghostDescription2 = {
                order = 7,
                type = "description",
                name = "",
                cmdHidden = true
            },
            ghostDescription3 = {
                order = 8,
                type = "description",
                name = "",
                cmdHidden = true
            },
            setskinheader = {
                order=8,
                type = "header",
                name = "Afficher dans l'addon",
            },
            isDonjon={
                order = 9,
                type="toggle",
                name='Donjons',
                get= function () return WIDT.db.profile.weekly.isDonjon;end,
                set= function () WIDT.db.profile.weekly.isDonjon = not WIDT.db.profile.weekly.isDonjon; core.weekly.active.isDonjon = WIDT.db.profile.weekly.isDonjon; end
            },
            isWorldBoss={
                order = 10,
                type="toggle",
                name='WorldBoss',
                get= function () return WIDT.db.profile.weekly.isWorldBoss;end,
                set= function () WIDT.db.profile.weekly.isWorldBoss = not WIDT.db.profile.weekly.isWorldBoss; core.weekly.active.isWorldBoss = WIDT.db.profile.weekly.isWorldBoss; end
            },
            isRaid={
                order = 11,
                type="toggle",
                name='Raids',
                get= function () return WIDT.db.profile.weekly.isRaid;end,
                set= function () WIDT.db.profile.weekly.isRaid = not WIDT.db.profile.weekly.isRaid; core.weekly.active.isRaid = WIDT.db.profile.weekly.isRaid;end
            },
        },
    }
end
