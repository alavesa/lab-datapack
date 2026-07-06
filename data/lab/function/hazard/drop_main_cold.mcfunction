# SCP-009 leaves the player's bare hand on its own. No explanations.
summon item ~ ~1 ~ {PickupDelay:40,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from entity @s SelectedItem
tag @e[type=item,tag=lab.drop] remove lab.drop
item replace entity @s weapon.mainhand with air
damage @s 2 minecraft:freeze
playsound minecraft:block.powder_snow.break player @s ~ ~ ~ 0.8 0.7
title @s actionbar {"text":"It slips from my grip, burning cold.","color":"gray","italic":true}
