# Positioned at the cauldron block (aligned corner), executed as the stirring player.
scoreboard players set #found lab.var 1
scoreboard players set #done lab.var 0
execute store result score #total lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
execute if score #total lab.var matches 0 run return run tellraw @s {"text":"[Lab] The cauldron is empty - toss element items in first.","color":"yellow"}
execute store result score #c_H lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"H"}}}}]
execute store result score #c_C lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"C"}}}}]
execute store result score #c_N lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"N"}}}}]
execute store result score #c_O lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"O"}}}}]
execute store result score #c_Na lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Na"}}}}]
execute store result score #c_Si lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Si"}}}}]
execute store result score #c_S lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"S"}}}}]
execute store result score #c_Cl lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Cl"}}}}]
execute store result score #c_Fe lab.var if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_element:"Fe"}}}}]
# Exact-match recipes are mutually exclusive, so order does not matter.
function lab:react/recipe/h2
function lab:react/recipe/o2
function lab:react/recipe/n2
function lab:react/recipe/h2o
function lab:react/recipe/h2o2
function lab:react/recipe/co2
function lab:react/recipe/co
function lab:react/recipe/ch4
function lab:react/recipe/nh3
function lab:react/recipe/nacl
function lab:react/recipe/hcl
function lab:react/recipe/naoh
function lab:react/recipe/so2
function lab:react/recipe/h2so4
function lab:react/recipe/ethanol
function lab:react/recipe/glucose
function lab:react/recipe/fe2o3
function lab:react/recipe/sio2
execute if score #done lab.var matches 0 run function lab:react/fizzle
