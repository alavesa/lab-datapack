# Macro ($(id)): recursively eject every shelved tube (rack removal).
$execute unless data storage lab:racks r$(id)[0] run return 0
summon item ~ ~0.7 ~ {PickupDelay:10,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
$data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from storage lab:racks r$(id)[0]
tag @e[type=item,tag=lab.drop] remove lab.drop
$data remove storage lab:racks r$(id)[0]
$function lab:rack/pop_all {id:$(id)}
