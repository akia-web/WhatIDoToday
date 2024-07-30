local _, core = ...;
core.FrameAddon = nil

-- idMount [1] = recherche google nom monture + wowhead -> enseigner par 
-- idInstance [3] = https://wowpedia.fandom.com/wiki/InstanceID
-- numBoss [7] = la position du boss dans l'instance (visible dans le infoRaid)
-- mode[8] = Normal, Mythique, Héroïque 
-- nomDJ [9] = nom du raid
-- idDJ [11] = reprends le nom en anglais trouver lors de la recherche [3] puis prendre l'id tout a gauche en faisant a attention
--             que l'id tout a droite corresponde bien au [3]
--             https://wowpedia.fandom.com/wiki/LfgDungeonID
