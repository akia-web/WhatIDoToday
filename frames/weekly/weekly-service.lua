local _, core = ...;

function core.GetDataWeekly()
    core.MountsDonjonWeeks.Perso = {}
    core.WorldBoss.Perso = {}
    core.MountsRaidWeekly.Perso = {}

    if core.weekly.active.isDonjon then
        core.Functions.getPersonnalInfoMount(core.MountsDonjonWeeks)
        core.activityWeekly.donjons.active = true
        core.activityWeekly.donjons.data = core.MountsDonjonWeeks.Perso
        core.activityWeekly.donjons.colorEtiquette = core.barres.donjonsWeeklyEtiquettes
    end

    if core.weekly.active.isRaid then
        core.Functions.getPersonnalInfoMount(core.MountsRaidWeekly)
        core.activityWeekly.raid.active = true
        core.activityWeekly.raid.data = core.MountsRaidWeekly.Perso
        core.activityWeekly.raid.colorEtiquette = core.barres.raidsEtiquettes
    end

    if core.weekly.active.isWorldBoss then
        core.Functions.getWorldBossLocked()
        core.activityWeekly.worldBoss.active = true
        core.activityWeekly.worldBoss.data = core.WorldBoss.Perso
        core.activityWeekly.worldBoss.colorEtiquette = core.barres.worldBossEtiquettes
    end

end
