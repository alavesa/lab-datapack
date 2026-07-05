# Recursive raycast along the player's look direction (executor stays the player).
scoreboard players remove #steps lab.var 1
execute if score #steps lab.var matches ..0 run return 0
execute if block ~ ~ ~ minecraft:cauldron align xyz run return run function lab:react/at
execute if block ~ ~ ~ minecraft:water_cauldron run return run function lab:react/wet
execute if block ~ ~ ~ minecraft:lava_cauldron run return run function lab:react/wet
execute if block ~ ~ ~ minecraft:powder_snow_cauldron run return run function lab:react/wet
execute positioned ^ ^ ^0.3 run function lab:react/ray
