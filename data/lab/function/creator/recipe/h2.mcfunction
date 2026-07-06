# Creator grid: 2 H -> Hydrogen Gas (H2). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_H lab.var matches 2 run return 0
execute unless score #total lab.var matches 2 run return 0
scoreboard players set #done lab.var 1
data remove block ~ ~ ~ Items
data modify block ~ ~ ~ Items set value [{Slot:0b,id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Hydrogen Gas",color:"aqua",italic:false},"minecraft:lore":[{text:"H2",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false}],"minecraft:custom_data":{lab_compound:"H2",lab_is_compound:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_test_tube"]},"minecraft:potion_contents":{custom_color:14745599,custom_effects:[{id:"minecraft:levitation",duration:60,amplifier:0}]}}}]
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~ ~ ~ 1 1.1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~ ~ ~ 0.6 1.4
particle minecraft:bubble_pop ~ ~0.6 ~ 0.2 0.15 0.2 0.1 20
particle minecraft:witch ~ ~0.7 ~ 0.2 0.1 0.2 0 6
title @a[distance=..6] actionbar {"text":"The mixture becomes Hydrogen Gas.","color":"gray"}
# experiments (credited to the nearest player)
scoreboard players add @p lab.rxn 1
advancement grant @p only lab:first_compound
execute if score @p lab.rxn matches 10.. run advancement grant @p only lab:chemist
