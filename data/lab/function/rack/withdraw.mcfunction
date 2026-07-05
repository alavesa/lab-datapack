# Macro ($(id)): pop the most recently shelved tube back out.
$execute unless data storage lab:racks r$(id)[0] run return run execute on target run title @s actionbar {"text":"The rack is empty.","color":"gray"}
$data modify storage lab:tmp take set from storage lab:racks r$(id)[-1]
$data remove storage lab:racks r$(id)[-1]
summon item ~ ~0.7 ~ {PickupDelay:5,Tags:["lab.drop"],Item:{id:"minecraft:stone"}}
data modify entity @e[type=item,tag=lab.drop,limit=1,sort=nearest] Item set from storage lab:tmp take
tag @e[type=item,tag=lab.drop] remove lab.drop
playsound minecraft:item.bottle.fill block @a[distance=..8] ~ ~ ~ 0.6 1.3
$function lab:rack/refresh {id:$(id)}
