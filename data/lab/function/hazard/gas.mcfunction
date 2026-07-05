# As a gas element item. A cauldron caps it; anywhere else it drifts upward
# and escapes for good after ~30s.
execute if block ~ ~ ~ #lab:contains run return run scoreboard players set @s lab.age 0
scoreboard players add @s lab.age 1
data merge entity @s {Motion:[0.0,0.08,0.0]}
particle minecraft:cloud ~ ~0.2 ~ 0.05 0.05 0.05 0.005 2
execute if score @s lab.age matches 30.. run function lab:hazard/gas_escape
