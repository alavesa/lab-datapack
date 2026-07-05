# Remove lab machines within 5 blocks of you (fridges dump their contents).
execute as @e[type=interaction,tag=lab.machine,distance=..5] at @s run function lab:machine/retire
tellraw @s {"text":"[Lab] Machines within 5 blocks removed.","color":"yellow"}
