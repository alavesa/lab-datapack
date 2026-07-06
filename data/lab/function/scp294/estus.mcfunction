# SCP-294 dispenses Estus. Positioned at the machine block's corner.
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Estus",color:"white",italic:false},"minecraft:lore":[{text:"Dispensed by SCP-294",color:"dark_gray",italic:false}],"minecraft:custom_data":{scp294_drink:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_test_tube"]},"minecraft:potion_contents":{custom_color:16098851,custom_effects:[{id:"minecraft:instant_health",duration:1,amplifier:1},{id:"minecraft:regeneration",duration:200,amplifier:1}]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1.3
playsound minecraft:item.bottle.fill block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1
particle minecraft:dripping_water ~0.5 ~0.9 ~0.5 0.1 0.1 0.1 0 6
title @a[distance=..6] actionbar {"text":"SCP-294 dispenses Estus.","color":"gray"}
