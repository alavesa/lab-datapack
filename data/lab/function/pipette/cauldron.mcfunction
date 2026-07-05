# Aligned at the cauldron, as the player: read out the current mix in one
# gray actionbar line (only recipe atoms are assayed).
scoreboard players set #found lab.var 1
execute store result score #total lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
execute if score #total lab.var matches 0 run return run title @s actionbar {"text":"The cauldron is empty.","color":"gray"}
execute store result score #c_H lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"H"}}}}]
execute store result score #c_C lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"C"}}}}]
execute store result score #c_N lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"N"}}}}]
execute store result score #c_O lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"O"}}}}]
execute store result score #c_Na lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Na"}}}}]
execute store result score #c_Si lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Si"}}}}]
execute store result score #c_S lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"S"}}}}]
execute store result score #c_Cl lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Cl"}}}}]
execute store result score #c_Fe lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Fe"}}}}]
title @s actionbar [{"text":"Mix: H ","color":"gray"},{"score":{"name":"#c_H","objective":"lab.var"},"color":"gray"},{"text":"  C ","color":"gray"},{"score":{"name":"#c_C","objective":"lab.var"},"color":"gray"},{"text":"  N ","color":"gray"},{"score":{"name":"#c_N","objective":"lab.var"},"color":"gray"},{"text":"  O ","color":"gray"},{"score":{"name":"#c_O","objective":"lab.var"},"color":"gray"},{"text":"  Na ","color":"gray"},{"score":{"name":"#c_Na","objective":"lab.var"},"color":"gray"},{"text":"  Si ","color":"gray"},{"score":{"name":"#c_Si","objective":"lab.var"},"color":"gray"},{"text":"  S ","color":"gray"},{"score":{"name":"#c_S","objective":"lab.var"},"color":"gray"},{"text":"  Cl ","color":"gray"},{"score":{"name":"#c_Cl","objective":"lab.var"},"color":"gray"},{"text":"  Fe ","color":"gray"},{"score":{"name":"#c_Fe","objective":"lab.var"},"color":"gray"}]
