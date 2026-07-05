# Recursive raycast along the player's look direction (executor stays the player).
scoreboard players remove #steps lab.var 1
execute if score #steps lab.var matches ..0 run return 0
execute if block ~ ~ ~ #lab:contains align xyz run return run function lab:pipette/cauldron
execute positioned ^ ^ ^0.3 run function lab:pipette/ray
