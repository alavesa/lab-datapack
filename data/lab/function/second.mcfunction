scoreboard players set #t20 lab.var 0
# alkali metal items touching water -> boom (the classic)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_alkali:1b}}}}] at @s align xyz run function lab:react/alkali_check
# halogens dissolving in water -> toxic fumes (before gas float, so Cl/F die here first)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_halogen:1b}}}}] at @s align xyz if block ~ ~ ~ minecraft:water run function lab:hazard/halogen_water
# gases drift up and escape unless capped in a cauldron
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_gas:1b}}}}] at @s run function lab:hazard/gas
# phosphorus ignites in open air
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_pyro:1b}}}}] at @s run function lab:hazard/pyro
# radioactive / toxic samples on players
execute as @a run function lab:hazard/player
