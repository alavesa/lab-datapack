# Aligned at the cauldron, as the player: read out the current mix.
scoreboard players set #found lab.var 1
execute store result score #total lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
execute if score #total lab.var matches 0 run return run tellraw @s {"text":"[Lab] Pipette reading: the cauldron is empty.","color":"aqua"}
execute store result score #c_H lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"H"}}}}]
execute store result score #c_C lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"C"}}}}]
execute store result score #c_N lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"N"}}}}]
execute store result score #c_O lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"O"}}}}]
execute store result score #c_Na lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Na"}}}}]
execute store result score #c_Si lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Si"}}}}]
execute store result score #c_S lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"S"}}}}]
execute store result score #c_Cl lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Cl"}}}}]
execute store result score #c_Fe lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Fe"}}}}]
tellraw @s [{"text":"[Lab] Pipette reading (","color":"aqua"},{"score":{"name":"#total","objective":"lab.var"},"color":"white"},{"text":" atoms):","color":"aqua"}]
execute if score #c_H lab.var matches 1.. run tellraw @s [{"text":"  H x ","color":"white"},{"score":{"name":"#c_H","objective":"lab.var"},"color":"aqua"}]
execute if score #c_C lab.var matches 1.. run tellraw @s [{"text":"  C x ","color":"white"},{"score":{"name":"#c_C","objective":"lab.var"},"color":"aqua"}]
execute if score #c_N lab.var matches 1.. run tellraw @s [{"text":"  N x ","color":"white"},{"score":{"name":"#c_N","objective":"lab.var"},"color":"aqua"}]
execute if score #c_O lab.var matches 1.. run tellraw @s [{"text":"  O x ","color":"white"},{"score":{"name":"#c_O","objective":"lab.var"},"color":"aqua"}]
execute if score #c_Na lab.var matches 1.. run tellraw @s [{"text":"  Na x ","color":"white"},{"score":{"name":"#c_Na","objective":"lab.var"},"color":"aqua"}]
execute if score #c_Si lab.var matches 1.. run tellraw @s [{"text":"  Si x ","color":"white"},{"score":{"name":"#c_Si","objective":"lab.var"},"color":"aqua"}]
execute if score #c_S lab.var matches 1.. run tellraw @s [{"text":"  S x ","color":"white"},{"score":{"name":"#c_S","objective":"lab.var"},"color":"aqua"}]
execute if score #c_Cl lab.var matches 1.. run tellraw @s [{"text":"  Cl x ","color":"white"},{"score":{"name":"#c_Cl","objective":"lab.var"},"color":"aqua"}]
execute if score #c_Fe lab.var matches 1.. run tellraw @s [{"text":"  Fe x ","color":"white"},{"score":{"name":"#c_Fe","objective":"lab.var"},"color":"aqua"}]
tellraw @s {"text":"  (other elements may be present - the pipette only assays recipe atoms)","color":"dark_gray","italic":true}
