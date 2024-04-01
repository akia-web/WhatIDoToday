local _,core = ...;

function core.GetHautFait()
    core.Functions.getHF()
    core.activityHF.dragonFlyght.data = core.hautFaitDragonFlyght.Perso
    core.activityHF.dragonFlyght.etiquetteH = core.activityHF.dragonFlyght.etiquetteH 
    + ((30 * #core.hautFaitDragonFlyght.Perso[1]['dependsHF'])+ (30*5))
end