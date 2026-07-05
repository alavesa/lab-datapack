# As the capsule, positioned just above the receiving barrel: pop the payload out.
summon item ~ ~ ~ {Item:{id:"minecraft:stone"},PickupDelay:15,Tags:["pn.drop"]}
data modify entity @e[type=item,tag=pn.drop,limit=1,sort=nearest] Item set from entity @s item
tag @e[type=item,tag=pn.drop] remove pn.drop
playsound minecraft:block.dispenser.dispense block @a[distance=..16] ~ ~ ~ 0.7 1.2
particle minecraft:poof ~ ~ ~ 0.12 0.12 0.12 0.02 6
kill @s
