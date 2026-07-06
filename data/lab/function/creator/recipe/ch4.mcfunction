# Creator grid: C + 4 H -> Methane (CH4). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_C lab.var matches 1 run return 0
execute unless score #c_H lab.var matches 4 run return 0
execute unless score #total lab.var matches 5 run return 0
scoreboard players set #done lab.var 1
data remove block ~ ~ ~ Items
data modify block ~ ~ ~ Items set value [{Slot:0b,id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Methane",color:"aqua",italic:false},"minecraft:lore":[{text:"CH4",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false},{text:"Not drinkable",color:"dark_gray",italic:true}],"minecraft:custom_data":{lab_compound:"CH4",lab_is_compound:1b,lab_no_drink:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_test_tube"]},"minecraft:consumable":{consume_seconds:3600f,animation:"drink",sound:"minecraft:entity.generic.drink",has_consume_particles:0b},"minecraft:potion_contents":{custom_color:12582847,custom_effects:[]}}}]
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~ ~ ~ 1 1.1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~ ~ ~ 0.6 1.4
particle minecraft:bubble_pop ~ ~0.6 ~ 0.2 0.15 0.2 0.1 20
particle minecraft:witch ~ ~0.7 ~ 0.2 0.1 0.2 0 6
title @a[distance=..6] actionbar {"text":"The mixture becomes Methane.","color":"gray"}
# experiments (credited to the nearest player)
scoreboard players add @p lab.rxn 1
advancement grant @p only lab:first_compound
execute if score @p lab.rxn matches 10.. run advancement grant @p only lab:chemist
