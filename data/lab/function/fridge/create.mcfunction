# Positioned at the barrel's centre, executed as the placing player.
scoreboard players set #placed lab.var 1
summon marker ~ ~ ~ {Tags:["lab.fridge"]}
playsound minecraft:block.iron_door.close block @a[distance=..16] ~ ~ ~ 0.8 1.6
particle minecraft:snowflake ~ ~0.8 ~ 0.3 0.3 0.3 0.02 15
advancement grant @s only lab:cold_storage
tellraw @s [{"text":"[Lab] ","color":"aqua"},{"text":"Fridge humming. Store your vials here - a tidy lab is a happy lab.","color":"white"}]
