# As the creator marker (centre of the dispenser block), grid is non-empty.
scoreboard players set #done lab.var 0
scoreboard players set #needheat lab.var 0
scoreboard players set #total lab.var 0
scoreboard players set #slots lab.var 0
scoreboard players set #heat lab.var 0
execute positioned ~ ~-1 ~ if entity @e[type=interaction,tag=lab.burner,tag=lab.lit,distance=..0.6] run scoreboard players set #heat lab.var 1
scoreboard players set #c_H lab.var 0
scoreboard players set #c_C lab.var 0
scoreboard players set #c_N lab.var 0
scoreboard players set #c_O lab.var 0
scoreboard players set #c_Na lab.var 0
scoreboard players set #c_Si lab.var 0
scoreboard players set #c_S lab.var 0
scoreboard players set #c_Cl lab.var 0
scoreboard players set #c_Fe lab.var 0
execute if data block ~ ~ ~ {Items:[{Slot:0b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:0b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:1b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:2b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:3b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:4b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:5b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:6b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:7b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b}]} run scoreboard players add #slots lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_is_element:1b}}}]} run scoreboard players add #total lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"H"}}}]} run scoreboard players add #c_H lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"C"}}}]} run scoreboard players add #c_C lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"N"}}}]} run scoreboard players add #c_N lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"O"}}}]} run scoreboard players add #c_O lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"Na"}}}]} run scoreboard players add #c_Na lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"Si"}}}]} run scoreboard players add #c_Si lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"S"}}}]} run scoreboard players add #c_S lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"Cl"}}}]} run scoreboard players add #c_Cl lab.var 1
execute if data block ~ ~ ~ {Items:[{Slot:8b,components:{"minecraft:custom_data":{lab_element:"Fe"}}}]} run scoreboard players add #c_Fe lab.var 1
# a non-element in the grid blocks every reaction (nothing gets eaten)
execute unless score #slots lab.var = #total lab.var run return 0
function lab:creator/recipe/h2
function lab:creator/recipe/o2
function lab:creator/recipe/n2
function lab:creator/recipe/h2o
function lab:creator/recipe/h2o2
function lab:creator/recipe/co2
function lab:creator/recipe/co
function lab:creator/recipe/ch4
function lab:creator/recipe/nh3
function lab:creator/recipe/nacl
function lab:creator/recipe/hcl
function lab:creator/recipe/naoh
function lab:creator/recipe/so2
function lab:creator/recipe/h2so4
function lab:creator/recipe/ethanol
function lab:creator/recipe/fe2o3
function lab:creator/recipe/sio2
execute if score #done lab.var matches 0 if score #needheat lab.var matches 1 run title @a[distance=..6] actionbar {"text":"The mixture needs heat.","color":"gray"}
