# As the station marker, at the barrel centre, and the barrel has items.
# Launch the first stack into the first connected tube (fixed probe order:
# up, down, north, south, west, east).
# Skip while a capsule is still at the mouth - keeps departures spaced out.
execute if entity @e[type=item_display,tag=pn.capsule,distance=..1.8] run return 0
scoreboard players set #launched pn.var 0
execute if score #launched pn.var matches 0 if block ~ ~1 ~ #pneumatic:tube run function pneumatic:station/launch {x:0,y:1,z:0}
execute if score #launched pn.var matches 0 if block ~ ~-1 ~ #pneumatic:tube run function pneumatic:station/launch {x:0,y:-1,z:0}
execute if score #launched pn.var matches 0 if block ~ ~ ~-1 #pneumatic:tube run function pneumatic:station/launch {x:0,y:0,z:-1}
execute if score #launched pn.var matches 0 if block ~ ~ ~1 #pneumatic:tube run function pneumatic:station/launch {x:0,y:0,z:1}
execute if score #launched pn.var matches 0 if block ~-1 ~ ~ #pneumatic:tube run function pneumatic:station/launch {x:-1,y:0,z:0}
execute if score #launched pn.var matches 0 if block ~1 ~ ~ #pneumatic:tube run function pneumatic:station/launch {x:1,y:0,z:0}
