# As a rack interaction entity, at the rack. Shelved tubes are dumped first
# so nothing is ever lost.
execute if entity @s[tag=lab.rack] store result storage lab:tmp id int 1 run scoreboard players get @s lab.id
execute if entity @s[tag=lab.rack] run function lab:rack/pop_all with storage lab:tmp
kill @e[type=item_display,tag=lab.rackview,distance=..1.2]
kill @e[type=item_display,tag=lab.display,distance=..0.8]
playsound minecraft:block.anvil.destroy block @a[distance=..12] ~ ~0.5 ~ 0.4 1.5
kill @s
