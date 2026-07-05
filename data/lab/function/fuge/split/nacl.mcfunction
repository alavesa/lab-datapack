# Centrifuge: Salt (NaCl) -> Na + Cl
playsound minecraft:block.grindstone.use block @a[distance=..16] ~ ~ ~ 1 1.6
playsound minecraft:block.beacon.deactivate block @a[distance=..16] ~ ~ ~ 0.5 1.8
particle minecraft:crit ~ ~0.3 ~ 0.25 0.15 0.25 0.3 20
summon item ~ ~0.4 ~ {PickupDelay:20,Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":{text:"Sodium",color:"red",italic:false},"minecraft:lore":[{text:"Na - element 11",color:"gray",italic:false}],"minecraft:custom_data":{lab_element:"Na",lab_is_element:1b,lab_alkali:1b},"minecraft:max_stack_size":1,"minecraft:firework_explosion":{shape:"small_ball",colors:[I;16733525]}}}}
summon item ~ ~0.4 ~ {PickupDelay:20,Item:{id:"minecraft:firework_star",count:1,components:{"minecraft:custom_name":{text:"Chlorine",color:"light_purple",italic:false},"minecraft:lore":[{text:"Cl - element 17",color:"gray",italic:false}],"minecraft:custom_data":{lab_element:"Cl",lab_is_element:1b},"minecraft:max_stack_size":1,"minecraft:firework_explosion":{shape:"small_ball",colors:[I;16733695]}}}}
advancement grant @p only lab:spin_cycle
tellraw @a[distance=..8] {"text":"[Lab] Centrifuged Salt (NaCl) -> Na + Cl","color":"aqua"}
kill @s
