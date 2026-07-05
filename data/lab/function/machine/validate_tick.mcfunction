scoreboard players set #t40 lab.var 0
# machine's spawner block mined or destroyed -> retire (fridges dump contents)
execute as @e[type=interaction,tag=lab.machine,tag=!lab.rack] at @s unless block ~ ~ ~ minecraft:spawner run function lab:machine/dismantle
# fridges hum with frost
execute as @e[type=interaction,tag=lab.fridge] at @s run particle minecraft:snowflake ~ ~0.9 ~ 0.25 0.25 0.25 0.01 3
