# SCP-294 dispenses Sulfur Dioxide. Positioned at the machine block's corner.
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Sulfur Dioxide",color:"aqua",italic:false},"minecraft:lore":[{text:"SO2",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false},{text:"Not drinkable",color:"dark_gray",italic:true}],"minecraft:custom_data":{lab_compound:"SO2",lab_is_compound:1b,lab_no_drink:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_test_tube"]},"minecraft:consumable":{consume_seconds:3600f,animation:"drink",sound:"minecraft:entity.generic.drink",has_consume_particles:0b},"minecraft:potion_contents":{custom_color:16777113,custom_effects:[]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1.3
playsound minecraft:item.bottle.fill block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1
particle minecraft:dripping_water ~0.5 ~0.9 ~0.5 0.1 0.1 0.1 0 6
title @a[distance=..6] actionbar {"text":"SCP-294 dispenses Sulfur Dioxide.","color":"gray"}
