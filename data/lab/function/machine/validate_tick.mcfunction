scoreboard players set #t40 lab.var 0
# spawner-machine block mined some other way -> retire (contents handled)
execute as @e[type=interaction,tag=lab.machine,tag=!lab.rack] at @s unless block ~ ~ ~ minecraft:spawner run function lab:machine/retire
# creator dispenser mined -> retire its marker (vanilla drops block + contents)
execute as @e[type=marker,tag=lab.creator] at @s unless block ~ ~ ~ minecraft:dispenser run function lab:machine/gui_gone
# fridges hum with frost
execute as @e[type=interaction,tag=lab.fridge] at @s run particle minecraft:snowflake ~ ~0.9 ~ 0.25 0.25 0.25 0.01 3
