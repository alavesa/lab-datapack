scoreboard players set #t20 lab.var 0
# alkali metal items touching water -> boom (the classic)
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_alkali:1b}}}}] at @s align xyz run function lab:react/alkali_check
# compound vials resting on a grindstone -> centrifuge
execute as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}}] at @s run function lab:fuge/check
