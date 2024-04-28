local _,core = ...;

if GetLocale() == "frFR" then
    local L = {}
 
    L["donjonLove"] = "Cie de Chimie La Royale "
    L["donjon"] = "donjon"
    L['difficulty'] = 'Difficulté'
    L['pays'] = 'Région'
    L['critere']='Critèries'

    -- Raid
    L["ICC"] = 'Citadelle de la Couronne de glace'
    L['ameDesDragons'] = "L'Âme des dragons"
    L['SiegeOrgrimmar'] = "Siege d'Orgrimmar"
    L['PalaisSacrenuit'] = 'Palais Sacrenuit'

    -- Continent
    L['Norfendre'] = 'Norfendre' 
    L['Pandarie'] = 'Pandarie'
    L['RoyaumeEst'] = "Royaumes de l'Est" 
    L['IlesBrisees'] = 'Les Îles brisées'

    --Zone
    L['Courrone de glace'] = 'Couronne de glace'
    L['grotteDuTemps']= 'Grotte du temps'
    L['ValEtenerlPrintemps']= "Val de l'éternel printemps"
    L['defileDeuillevent']= 'Défilé de Deuillevent'
    L['picsFoudroyes'] = 'Les Pics Foudroyés'

    L['Today'] = "Aujourd'hui"
    L['ThisWeek'] = 'Cette semaine'
    L['Hf']= 'Hauts-faits'
    L['AddonName']="Ce que je dois faire aujoud'hui"
    L['buttonLink']="Lien vers Wowhead"
    core.L = L
 end