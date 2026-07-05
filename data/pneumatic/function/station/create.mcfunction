# Positioned at the barrel's centre, executed as the placing player.
scoreboard players set #placed pn.var 1
summon marker ~ ~ ~ {Tags:["pn.station"]}
playsound minecraft:block.copper_bulb.turn_on block @a[distance=..16] ~ ~ ~ 1 1
particle minecraft:happy_villager ~ ~0.8 ~ 0.3 0.3 0.3 0 10
tellraw @s [{"text":"[Pneumatic] ","color":"aqua"},{"text":"Station online. Run a glass tube from it to another station and drop items in.","color":"white"}]
