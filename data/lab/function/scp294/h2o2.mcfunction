# SCP-294 dispenses Hydrogen Peroxide. Positioned at the machine block's corner.
summon item ~0.5 ~1.1 ~0.5 {PickupDelay:15,Item:{id:"minecraft:potion",count:1,components:{"minecraft:custom_name":{text:"Hydrogen Peroxide",color:"aqua",italic:false},"minecraft:lore":[{text:"H2O2",color:"gray",italic:false},{text:"Lab compound",color:"dark_gray",italic:false}],"minecraft:custom_data":{lab_compound:"H2O2",lab_is_compound:1b},"minecraft:max_stack_size":1,"minecraft:custom_model_data":{strings:["lab_cup_h2o2"]},"minecraft:potion_contents":{custom_color:13628400,custom_effects:[{id:"minecraft:instant_health",duration:1,amplifier:0}]}}}}
playsound minecraft:block.brewing_stand.brew block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1.3
playsound minecraft:item.bottle.fill block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.8 1
particle minecraft:dripping_water ~0.5 ~0.9 ~0.5 0.1 0.1 0.1 0 6
title @a[distance=..6] actionbar {"text":"SCP-294 dispenses Hydrogen Peroxide.","color":"gray"}
