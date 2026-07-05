# 2 H -> Hydrogen Gas (H2). Exact match only.
execute unless score #done lab.var matches 0 run return 0
execute unless score #c_H lab.var matches 2 run return 0
execute unless score #total lab.var matches 2 run return 0
scoreboard players set #done lab.var 1
kill @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}]
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Hydrogen Gas",color:"aqua",italic:false},"minecraft:lore":[{text:"H2",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false}],"minecraft:custom_data":{lab_compound:"H2",lab_is_compound:1b},"minecraft:max_stack_size":1,"minecraft:potion_contents":{custom_color:14745599,custom_effects:[{id:"minecraft:levitation",duration:60,amplifier:0}]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~0.5 ~0.5 ~0.5 1 1
playsound minecraft:entity.experience_orb.pickup block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.6 1.4
particle minecraft:bubble_pop ~0.5 ~0.9 ~0.5 0.2 0.15 0.2 0.1 25
particle minecraft:witch ~0.5 ~1 ~0.5 0.2 0.1 0.2 0 8
tellraw @a[distance=..8] {"text":"[Lab] 2 H -> Hydrogen Gas (H2)","color":"aqua"}
# experiments
scoreboard players add @s lab.rxn 1
advancement grant @s only lab:first_compound
execute if score @s lab.rxn matches 10.. run advancement grant @s only lab:chemist
