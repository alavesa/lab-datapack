# Macro ($(id)): recursively eject stored stacks one by one.
$execute unless data storage lab:fridges f$(id)[0] run return 0
summon item ~ ~1.2 ~ {PickupDelay:10,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
$data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from storage lab:fridges f$(id)[0]
tag @e[type=item,tag=lab.drop] remove lab.drop
$data remove storage lab:fridges f$(id)[0]
$function lab:fridge/pop {id:$(id)}
