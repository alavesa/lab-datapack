# As a fume marker, once per second for lab.age seconds.
scoreboard players remove @s lab.age 1
execute if score @s lab.age matches ..0 run return run kill @s
particle minecraft:sneeze ~ ~0.5 ~ 0.9 0.5 0.9 0.02 15
execute as @a[distance=..3] run function lab:hazard/fume_hit
