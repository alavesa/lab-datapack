# Centrifuge: Hydrochloric Acid (HCl) -> H + Cl. At the dropper's centre.
playsound minecraft:block.grindstone.use block @a[distance=..16] ~ ~ ~ 1 1.6
playsound minecraft:block.beacon.deactivate block @a[distance=..16] ~ ~ ~ 0.5 1.8
particle minecraft:crit ~ ~0.9 ~ 0.25 0.15 0.25 0.3 20
summon item ~ ~0.8 ~ {PickupDelay:20,Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":{text:"Hydrogen",color:"aqua",italic:false},"minecraft:lore":[{text:"H - element 1",color:"gray",italic:false},{text:"GAS - floats away; keep in a cauldron or fridge",color:"aqua",italic:false}],"minecraft:custom_data":{lab_element:"H",lab_is_element:1b,lab_gas:1b},"minecraft:max_stack_size":1,"minecraft:firework_explosion":{shape:"small_ball",colors:[I;5636095]}}}}
summon item ~ ~0.8 ~ {PickupDelay:20,Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":{text:"Chlorine",color:"light_purple",italic:false},"minecraft:lore":[{text:"Cl - element 17",color:"gray",italic:false},{text:"GAS - floats away; keep in a cauldron or fridge",color:"aqua",italic:false},{text:"Dissolves in water into toxic fumes",color:"green",italic:false}],"minecraft:custom_data":{lab_element:"Cl",lab_is_element:1b,lab_gas:1b,lab_halogen:1b},"minecraft:max_stack_size":1,"minecraft:firework_explosion":{shape:"small_ball",colors:[I;16733695]}}}}
advancement grant @p only lab:spin_cycle
title @a[distance=..8] actionbar {"text":"Separated Hydrochloric Acid into H + Cl.","color":"gray"}
