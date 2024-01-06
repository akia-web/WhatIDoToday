local _,core = ...;
core.activityWeekly = {
    donjons = {
        active = false,
        data = {},
        etiquetteH = 100,
        etiquetteL = 300,
        colorEtiquette = {},
        etiquetteByLine = 3,
        containerName = 'donjonWeeks',
        containerEtiquetteName = 'containerDJ',
        name = 'Donjons',
        typeEtiquettes = 'donjon',
        colorCadre = core.fondColor,
        sizeButton = 50
    },
    raid = {
        active = false,
        data = {},
        etiquetteH = 120,
        etiquetteL = 300,
        colorEtiquette = {["r"]=0.9,["g"]=0.9,["b"]=0.9},
        etiquetteByLine = 3,
        containerName = 'containerRaid',
        containerEtiquetteName = 'containerDataRaid',
        name = 'Raids',
        typeEtiquettes = 'donjon',
        colorCadre = core.fondColor,
        sizeButton = 50
    },
    worldBoss={
        active = false,
        data = {},
        etiquetteH = 100,
        etiquetteL = 300,
        colorEtiquette = core.barres.donjonJourEtiquettes,
        etiquetteByLine = 3,
        containerName = 'containerWorldBoss',
        containerEtiquetteName = 'containerDataWorldBoss',
        name = 'WorldBoss',
        typeEtiquettes = 'worldboss',
        colorCadre = core.fondColor,
        sizeButton = 50
    },
    
}