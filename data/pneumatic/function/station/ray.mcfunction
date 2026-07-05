# Recursive raycast along the player's look direction (executor stays the player).
# You just placed the barrel, so you are looking at it - step until we hit it.
scoreboard players remove #steps pn.var 1
execute if score #steps pn.var matches ..0 run return 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 run function pneumatic:station/check
execute if score #placed pn.var matches 1 run return 0
execute positioned ^ ^ ^0.3 run function pneumatic:station/ray
