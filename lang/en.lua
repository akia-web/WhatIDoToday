local _,core = ...;
if GetLocale() ~= "frFR" then
    local L = {}
 
    L["donjonLove"] = "The Crown Chemical Co. "
    L["donjon"] = "dungeon"
    L['difficulty'] = 'Difficulty'
    L['pays'] = 'Region'
    L['critere']='Criteria'
    L['lieu'] = 'Place'

    --raids 
    L["ICC"] = 'Icecrown Citadel'
    L['ameDesDragons'] = 'Dragon Soul'
    L['SiegeOrgrimmar'] = 'Siege of Orgrimmar'
    L['PalaisSacrenuit'] = 'The Nighthold'
    L['BDA'] = "Battle of Dazar'alor"
    L["Ny'alotha"] = "Ny'alotha, the sleeping city"
    L["SanctumOfDomination"] = "Sanctum of Domination"
    L["SepulcherOfTheFirstOnes"] = "Sepulcher of the First Ones"
    L["AER"] = "Amirdrassil, the Dream's Hope"

    -- Contienent
    L['Norfendre'] = 'Northrend' 
    L['Pandarie'] = 'Pandaria' 
    L['RoyaumeEst'] = 'Eastern Kingdoms'
    L['IlesBrisees'] = 'Broken Isles'
    L['UldumOrValContinent'] = "Kalimdor ou Pandaria"
    L["Shadowlands"] = "Shadowlands"

    --Zone
    L['Courrone de glace'] = 'Icecrown'
    L['grotteDuTemps']= 'Caverns of time'
    L['ValEtenerlPrintemps']= 'Val of Eternal Blossoms'
    L['defileDeuillevent']= 'Deadwind Pass'
    L['picsFoudroyes'] = 'The Storm Peaks'
    L['portDeTiragarde'] = 'Tiragarde Sound'
    L['UldumOrValCountry'] = "Uldum or The ancient seat of the pandaren empire"
    L["TheMaw"] = "L'Antre"


    L['Today'] = 'Today'
    L['ThisWeek'] = 'This Week'
    L['Hf']= 'Achievements'
    L['AddonName']="What I Do today"
    L['buttonLink']="Link to Wowhead"
    core.L = L
 end