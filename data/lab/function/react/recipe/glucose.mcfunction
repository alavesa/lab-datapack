# 6 C + 12 H + 6 O -> Glucose (C6H12O6). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_C lab.var matches 6 run return 0
execute unless score #c_H lab.var matches 12 run return 0
execute unless score #c_O lab.var matches 6 run return 0
execute unless score #total lab.var matches 24 run return 0
# this reaction needs a lit burner under the cauldron
execute if score #heat lab.var matches 0 run return run scoreboard players set #needheat lab.var 1
scoreboard players set #done lab.var 1
kill @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Glucose",color:"aqua",italic:false},"minecraft:lore":[{text:"C6H12O6",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false}],"minecraft:custom_data":{lab_compound:"C6H12O6",lab_is_compound:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_flask"]},"minecraft:potion_contents":{custom_color:16770229,custom_effects:[{id:"minecraft:speed",duration:400,amplifier:0},{id:"minecraft:haste",duration:400,amplifier:0}]}}}}
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:sugar",count:3}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.6 1.4
particle minecraft:bubble_pop ~0.5 ~0.9 ~0.5 0.2 0.15 0.2 0.1 25
particle minecraft:witch ~0.5 ~1 ~0.5 0.2 0.1 0.2 0 8
title @a[distance=..8] actionbar {"text":"The mixture becomes Glucose.","color":"gray"}
# experiments
scoreboard players add @s lab.rxn 1
advancement grant @s only lab:first_compound
advancement grant @s only lab:sugar_rush
execute if score @s lab.rxn matches 10.. run advancement grant @s only lab:chemist
