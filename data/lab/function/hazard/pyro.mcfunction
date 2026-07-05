# As a phosphorus item. Safe under water or in any cauldron; in open air it
# smokes and then ignites.
execute if block ~ ~ ~ minecraft:water run return run scoreboard players set @s lab.age 0
execute if block ~ ~ ~ #lab:contains run return run scoreboard players set @s lab.age 0
scoreboard players add @s lab.age 1
execute if score @s lab.age matches 4.. run particle minecraft:smoke ~ ~0.2 ~ 0.05 0.05 0.05 0.01 4
execute if score @s lab.age matches 8.. run function lab:hazard/pyro_ignite
