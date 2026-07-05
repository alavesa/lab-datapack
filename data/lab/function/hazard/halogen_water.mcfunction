# As a halogen item, aligned, standing in water: it dissolves into toxic fumes.
# The fumes are our own marker cloud (not a vanilla effect cloud) so hazmat
# suits can grant immunity - see hazard/fumes_tick.
summon marker ~0.5 ~0.5 ~0.5 {Tags:["lab.fumes","lab.newfume"]}
scoreboard players set @e[type=marker,tag=lab.newfume,limit=1] lab.age 8
tag @e[type=marker,tag=lab.newfume] remove lab.newfume
particle minecraft:sneeze ~0.5 ~0.5 ~0.5 0.3 0.3 0.3 0.02 20
playsound minecraft:block.brewing_stand.brew block @a[distance=..12] ~ ~ ~ 0.8 0.7
title @a[distance=..10] actionbar {"text":"The sample dissolves into toxic fumes.","color":"gray"}
kill @s
