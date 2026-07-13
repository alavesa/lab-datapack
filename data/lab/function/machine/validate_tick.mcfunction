scoreboard players set #t40 lab.var 0
# machine's spawner block removed some other way -> retire cleanly
execute as @e[type=interaction,tag=lab.machine,tag=!lab.rack,tag=!lab.scp038] at @s unless block ~ ~ ~ minecraft:spawner run function lab:machine/retire
# SCP-038 stands in barrier, not spawner
execute as @e[type=interaction,tag=lab.scp038] at @s unless block ~ ~ ~ minecraft:barrier run function lab:machine/retire
# fridges hum with frost
execute as @e[type=interaction,tag=lab.fridge] at @s run particle minecraft:snowflake ~ ~0.9 ~ 0.25 0.25 0.25 0.01 3
