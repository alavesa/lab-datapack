# As a machine interaction entity, at the machine. Rack tubes are dumped from
# datapack storage; fridge contents are dropped by the labra-plugin the moment
# the interaction entity dies. Nothing is ever lost.
execute if entity @s[tag=lab.rack] store result storage lab:tmp id int 1 run scoreboard players get @s lab.id
execute if entity @s[tag=lab.rack] run function lab:rack/pop_all with storage lab:tmp
kill @e[type=item_display,tag=lab.rackview,distance=..1.2]
kill @e[type=item_display,tag=lab.display,distance=..0.8]
execute if block ~ ~ ~ minecraft:spawner run setblock ~ ~ ~ air
playsound minecraft:block.anvil.destroy block @a[distance=..12] ~ ~0.5 ~ 0.4 1.5
kill @s
