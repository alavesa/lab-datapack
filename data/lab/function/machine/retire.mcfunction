# As a machine interaction entity, at the machine. Fridge contents are dumped
# first so nothing is ever lost.
execute if entity @s[tag=lab.fridge] store result storage lab:tmp id int 1 run scoreboard players get @s lab.id
execute if entity @s[tag=lab.fridge] run function lab:fridge/pop with storage lab:tmp
kill @e[type=item_display,tag=lab.display,distance=..0.8]
execute if block ~ ~ ~ minecraft:spawner run setblock ~ ~ ~ air
playsound minecraft:block.anvil.destroy block @a[distance=..12] ~ ~0.5 ~ 0.4 1.5
kill @s
