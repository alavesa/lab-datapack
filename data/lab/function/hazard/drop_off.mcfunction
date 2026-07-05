# Same as drop_main, for the offhand (player Inventory slot -106).
summon item ~ ~1 ~ {PickupDelay:40,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from entity @s Inventory[{Slot:-106b}]
data remove entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item.Slot
tag @e[type=item,tag=lab.drop] remove lab.drop
item replace entity @s weapon.offhand with air
effect give @s minecraft:poison 4 0 true
playsound minecraft:entity.player.hurt player @s ~ ~ ~ 0.7 1
title @s actionbar {"text":"[Lab] You can't hold that bare-handed! Wear an iron chestplate (PPE) to handle toxic metals.","color":"red"}
