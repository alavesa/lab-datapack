# As a player standing in halogen fumes.
function lab:hazard/check_hazmat
execute if score #hazmat lab.var matches 1 run return 0
effect give @s minecraft:poison 3 0 true
title @s actionbar {"text":"The fumes sting.","color":"gray"}
