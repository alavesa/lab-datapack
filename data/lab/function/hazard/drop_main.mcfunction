# The toxic sample leaves the player's bare hand on its own.
summon item ~ ~1 ~ {PickupDelay:40,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from entity @s SelectedItem
tag @e[type=item,tag=lab.drop] remove lab.drop
item replace entity @s weapon.mainhand with air
effect give @s minecraft:poison 4 0 true
playsound minecraft:entity.player.hurt player @s ~ ~ ~ 0.7 1
title @s actionbar {"text":"I shouldn't touch this with bare hands.","color":"gray","italic":true}
