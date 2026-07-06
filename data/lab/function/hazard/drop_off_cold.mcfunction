# Same as drop_main_cold, for the offhand (player Inventory slot -106).
summon item ~ ~1 ~ {PickupDelay:40,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:-106b}]
data remove entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item.Slot
tag @e[type=item,tag=lab.drop] remove lab.drop
item replace entity @s weapon.offhand with air
damage @s 2 minecraft:freeze
playsound minecraft:block.powder_snow.break player @s ~ ~ ~ 0.8 0.7
title @s actionbar {"text":"I can't hold it - only a tool can. The pipette, maybe.","color":"gray","italic":true}
