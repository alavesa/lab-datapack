# Recursive raycast along the player's look direction (executor stays the player).
scoreboard players remove #steps lab.var 1
execute if score #steps lab.var matches ..0 run return 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function lab:fridge/check
execute if score #placed lab.var matches 1 run return 0
execute positioned ^ ^ ^0.3 run function lab:fridge/ray
