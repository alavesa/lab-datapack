# Scratch objective (#t2/#t8/#t40 timers, #steps/#placed/#station/#moved/#launched)
scoreboard objectives add pn.var dummy
# Capsule state: heading (unit vector) + time-to-live in blocks
scoreboard objectives add pn.dx dummy
scoreboard objectives add pn.dy dummy
scoreboard objectives add pn.dz dummy
scoreboard objectives add pn.ttl dummy

tellraw @a {"text":"[Pneumatic Tubes v0.1] Loaded. /function pneumatic:give/station -> place two stations, connect them with glass tubing, drop items in one of the barrels.","color":"aqua"}
