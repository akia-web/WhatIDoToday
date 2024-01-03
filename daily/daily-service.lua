local _,core = ...;

function core.GetDataDaily()
    core.activityDaily.events.data = {}
    core.activityDaily.donjonJour.data = {}
    core.activityDaily.legion.data = {}
    core.activityDaily.BFA.data = {}
    core.activityDaily.shadowland.data = {}
    core.activityDaily.saisonnalEvent.data = {}
    core.activityDaily.arathie.data =  {}
    core.activityDaily.darshore.data =  {}
    if core.daily.active.events then
        core.Functions.getEventDay()
        core.activityDaily.events.data = core.Calendar
        core.activityDaily.events.active = true
        core.activityDaily.events.colorEtiquette = core.barres.eventsEtiquettes
    end

    if core.daily.active.donjonJour then
        core.Functions.getPersonnalInfoMount(core.MountsDonjonDaily)
        core.activityDaily.donjonJour.data = core.MountsDonjonDaily.Perso
        core.activityDaily.donjonJour.active = true
        core.activityDaily.donjonJour.colorEtiquette = core.barres.donjonJourEtiquettes

    end

    if core.daily.active.legion then
        core.Functions.getActiveBFAWorldQuest("legion")
        core.activityDaily.legion.data = core.WorldQuestLegion.Perso
        core.activityDaily.legion.active = true
        core.activityDaily.legion.colorEtiquette =core.barres.legionEtiquettes
    end

    if core.daily.active.BFA then 
        core.Functions.getActiveBFAWorldQuest("BFA")
        core.activityDaily.BFA.data = core.WorlQuestPersoBFA
        core.activityDaily.BFA.active = true
        core.activityDaily.BFA.colorEtiquette =core.barres.bfaEtiquettes
    end

    if core.daily.active.ShadowLand then
        core.Functions.getActiveShadowlandWorldQuest()
        core.activityDaily.shadowland.data =  core.worldQuestShadowLand.Perso
        core.activityDaily.shadowland.active = true
        core.activityDaily.shadowland.colorEtiquette = core.barres.shadowlandEtiquettes
    end

    if core.daily.active.Arathie or core.daily.active.Darkshore then
        core.Functions.getWarfrontRares()
        if core.daily.active.Arathie then
            core.activityDaily.arathie.data =  core.warfrontArathiPerso
            core.activityDaily.arathie.active = true
            core.activityDaily.arathie.colorEtiquette = {["r"]=0.9,["g"]=0.9,["b"]=0.9}
        end
   
        if core.daily.active.Darkshore then
            core.activityDaily.darshore.data =  core.warfrontDarkshorePerso
            core.activityDaily.darshore.active = true
            core.activityDaily.darshore.colorEtiquette = {["r"]=0.9,["g"]=0.9,["b"]=0.9}
        end
        

    end

    if core.daily.active.HollidayEvent then
        core.Functions.getSaisonnalEvent()
        core.activityDaily.saisonnalEvent.data = core.saisonnalEvent.Perso
        core.activityDaily.saisonnalEvent.active = true
        core.activityDaily.saisonnalEvent.colorEtiquette ={["r"]=0.9,["g"]=0.9,["b"]=0.9}
    end
end