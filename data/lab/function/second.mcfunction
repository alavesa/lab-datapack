scoreboard players set #t20 lab.var 0
# alkali metal items touching water -> boom (the classic)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_alkali:1b}}}}] at @s align xyz run function lab:react/alkali_check
# halogens dissolving in water -> toxic fumes (before gas float, so Cl/F die here first)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_halogen:1b}}}}] at @s align xyz if block ~ ~ ~ minecraft:water run function lab:hazard/halogen_water
# gases drift up and escape unless capped in a cauldron
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_gas:1b}}}}] at @s run function lab:hazard/gas
# phosphorus ignites in open air
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_pyro:1b}}}}] at @s run function lab:hazard/pyro
# compound tubes in/on a centrifuge split automatically (fed by hand or by
# the plugin's Centrifuge GUI dropping its contents into the drum)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}}] at @s if entity @e[type=interaction,tag=lab.fuge,distance=..1.4] run function lab:fuge/spin
# lingering halogen fume clouds
execute as @e[type=marker,tag=lab.fumes] at @s run function lab:hazard/fumes_tick
# gas burners idle with a small standing flame
execute as @e[type=interaction,tag=lab.burner] at @s run particle minecraft:small_flame ~ ~1.05 ~ 0.06 0.04 0.06 0.005 3
# SCP-009 flash-freezes any water it touches
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{scp009:1b}}}}] at @s align xyz if block ~ ~ ~ minecraft:water run function lab:hazard/scp009_water
# radioactive / toxic samples on players
execute as @a run function lab:hazard/player
# SCP-009 infections run their course
execute as @a[scores={lab.inf=1..}] run function lab:hazard/infection
# "I shouldn't drink this" message cooldown
scoreboard players remove @a[scores={lab.sip=1..}] lab.sip 1
