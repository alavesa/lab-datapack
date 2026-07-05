# Recursive raycast along the player's look direction (executor stays the player).
scoreboard players remove #steps lab.var 1
execute if score #steps lab.var matches ..0 run return 0
execute unless block ~ ~ ~ #lab:passable run return 0
execute unless block ^ ^ ^0.3 #lab:passable align xyz positioned ~0.5 ~0.5 ~0.5 run return run function lab:place/do_place
execute positioned ^ ^ ^0.3 run function lab:place/ray
