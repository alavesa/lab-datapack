execute store result score #spun lab.var if entity @e[type=item,distance=..1.6,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}}]
execute if score #spun lab.var matches 0 run return run execute on target run title @s actionbar {"text":"[Lab] Drop a compound vial onto the centrifuge, then click.","color":"yellow"}
playsound minecraft:block.grindstone.use block @a[distance=..16] ~ ~0.5 ~ 1 0.8
execute as @e[type=item,distance=..1.6,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}}] at @s run function lab:fuge/spin
