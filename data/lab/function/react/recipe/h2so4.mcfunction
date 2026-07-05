# 2 H + S + 4 O -> Sulfuric Acid (H2SO4). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_H lab.var matches 2 run return 0
execute unless score #c_S lab.var matches 1 run return 0
execute unless score #c_O lab.var matches 4 run return 0
execute unless score #total lab.var matches 7 run return 0
# this reaction needs a lit burner under the cauldron
execute if score #heat lab.var matches 0 run return run scoreboard players set #needheat lab.var 1
scoreboard players set #done lab.var 1
kill @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Sulfuric Acid",color:"aqua",italic:false},"minecraft:lore":[{text:"H2SO4",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false},{text:"Not drinkable",color:"dark_gray",italic:true}],"minecraft:custom_data":{lab_compound:"H2SO4",lab_is_compound:1b,lab_no_drink:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_flask"]},"minecraft:consumable":{consume_seconds:3600f,animation:"drink",sound:"minecraft:entity.generic.drink",has_consume_particles:0b},"minecraft:potion_contents":{custom_color:16777164,custom_effects:[]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.6 1.4
particle minecraft:bubble_pop ~0.5 ~0.9 ~0.5 0.2 0.15 0.2 0.1 25
particle minecraft:witch ~0.5 ~1 ~0.5 0.2 0.1 0.2 0 8
title @a[distance=..8] actionbar {"text":"The mixture becomes Sulfuric Acid.","color":"gray"}
# experiments
scoreboard players add @s lab.rxn 1
advancement grant @s only lab:first_compound
advancement grant @s only lab:handle_with_care
execute if score @s lab.rxn matches 10.. run advancement grant @s only lab:chemist
