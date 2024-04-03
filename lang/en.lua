local _,core = ...;
if GetLocale() ~= "frFR" then
    local L = {}
 
    L["donjonLove"] = "The Crown Chemical Co. "
    L["donjon"] = "dungeon"
    L['difficulty'] = 'Difficulty'
    L['pays'] = 'Region'
    L['critere']='Criteria'

    --raids 
    L["ICC"] = 'Icecrown Citadel'
    L['ameDesDragons'] = 'Dragon Soul'
    L['SiegeOrgrimmar'] = 'Siege of Orgrimmar'
    L['PalaisSacrenuit'] = 'The Nighthold'

    -- Contienent
    L['Norfendre'] = 'Northrend' 
    L['Pandarie'] = 'Pandaria' 
    L['RoyaumeEst'] = 'Eastern Kingdoms'
    L['IlesBrisees'] = 'Broken Isles'

    --Zone
    L['Courrone de glace'] = 'Icecrown'
    L['grotteDuTemps']= 'Caverns of time'
    L['ValEtenerlPrintemps']= 'Val of Eternal Blossoms'
    L['defileDeuillevent']= 'Deadwind Pass'
    L['picsFoudroyes'] = 'The Storm Peaks'
    core.L = L
 end