local _,core = ...;

if GetLocale() == "frFR" then
    local L = {}
 
    L["donjonLove"] = "Cie de Chimie La Royale "
    L["donjon"] = "donjon"
    L['difficulty'] = 'Difficulté'
    L['pays'] = 'Région'
    L['critere']='Critèries'
    L['lieu'] = 'Lieu'

    -- Raid
    L["ICC"] = 'Citadelle de la Couronne de glace'
    L['ameDesDragons'] = "L'Âme des dragons"
    L['SiegeOrgrimmar'] = "Siege d'Orgrimmar"
    L['PalaisSacrenuit'] = 'Palais Sacrenuit'
    L['BDA'] = "Bataille de Dazar'alor"
    L["Ny'alotha"] = "Ny'alotha La cité en éveil"
    L["SanctumOfDomination"] = "Sanctum de Domination"
    L["SepulcherOfTheFirstOnes"] = "Sépulcre des Fondateurs"
    L["AER"] = "Amirdrassil, l’Espoir du Rêve"

    -- Continent
    L['Norfendre'] = 'Norfendre' 
    L['Pandarie'] = 'Pandarie'
    L['RoyaumeEst'] = "Royaumes de l'Est" 
    L['IlesBrisees'] = 'Les Îles brisées'
    L['UldumOrValContinent'] = "Kalimdor ou Pandarie"
    L["Shadowlands"] = "Ombreterre"

    --Zone
    L['Courrone de glace'] = 'Couronne de glace'
    L['grotteDuTemps']= 'Grotte du temps'
    L['ValEtenerlPrintemps']= "Val de l'éternel printemps"
    L['defileDeuillevent']= 'Défilé de Deuillevent'
    L['picsFoudroyes'] = 'Les Pics Foudroyés'
    L['portDeTiragarde'] = 'Port de Tiragarde'
    L['UldumOrValCountry'] = "Uldum ou Val de l'Éternel printemps"
    L["TheMaw"] = "L'Antre"

    L['Today'] = "Aujourd'hui"
    L['ThisWeek'] = 'Cette semaine'
    L['Hf']= 'Hauts-faits'
    L['AddonName']="Ce que je dois faire aujoud'hui"
    L['buttonLink']="Lien vers Wowhead"
    core.L = L
 end