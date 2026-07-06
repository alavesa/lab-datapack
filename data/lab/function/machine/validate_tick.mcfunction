scoreboard players set #t40 lab.var 0
# GUI machine block mined -> retire the marker (vanilla drops the block and
# its contents, so nothing is lost); the dress-up display goes with it
execute as @e[type=marker,tag=lab.creator] at @s unless block ~ ~ ~ minecraft:dispenser run function lab:machine/gui_gone
execute as @e[type=marker,tag=lab.fuge_m] at @s unless block ~ ~ ~ minecraft:dropper run function lab:machine/gui_gone
execute as @e[type=marker,tag=lab.fridge_m] at @s unless block ~ ~ ~ minecraft:barrel run function lab:machine/gui_gone
execute as @e[type=marker,tag=lab.burner_m] at @s unless block ~ ~ ~ minecraft:furnace run function lab:machine/gui_gone
# fridges hum with frost
execute as @e[type=marker,tag=lab.fridge_m] at @s run particle minecraft:snowflake ~ ~0.9 ~ 0.25 0.25 0.25 0.01 3
