# Remove lab machines within 5 blocks of you (contents always drop).
execute as @e[type=interaction,tag=lab.machine,distance=..5] at @s run function lab:machine/retire
execute as @e[type=marker,tag=lab.creator,distance=..5] at @s run function lab:machine/gui_retire
execute as @e[type=marker,tag=lab.fuge_m,distance=..5] at @s run function lab:machine/gui_retire
execute as @e[type=marker,tag=lab.fridge_m,distance=..5] at @s run function lab:machine/gui_retire
execute as @e[type=marker,tag=lab.burner_m,distance=..5] at @s run function lab:machine/gui_retire
tellraw @s {"text":"[Lab] Machines within 5 blocks removed.","color":"yellow"}
