# C + 2 O -> Carbon Dioxide (CO2). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_C lab.var matches 1 run return 0
execute unless score #c_O lab.var matches 2 run return 0
execute unless score #total lab.var matches 3 run return 0
scoreboard players set #done lab.var 1
kill @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Carbon Dioxide",color:"aqua",italic:false},"minecraft:lore":[{text:"CO2",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false}],"minecraft:custom_data":{lab_compound:"CO2",lab_is_compound:1b},"minecraft:max_stack_size":1,"minecraft:potion_contents":{custom_color:11184810,custom_effects:[{id:"minecraft:slowness",duration:200,amplifier:0}]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.6 1.4
particle minecraft:bubble_pop ~0.5 ~0.9 ~0.5 0.2 0.15 0.2 0.1 25
particle minecraft:witch ~0.5 ~1 ~0.5 0.2 0.1 0.2 0 8
tellraw @a[distance=..8] {"text":"[Lab] C + 2 O -> Carbon Dioxide (CO2)","color":"aqua"}
# experiments
scoreboard players add @s lab.rxn 1
advancement grant @s only lab:first_compound
execute if score @s lab.rxn matches 10.. run advancement grant @s only lab:chemist
