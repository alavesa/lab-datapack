# Dead end, broken tube or TTL exhausted: pop the payload right here so nothing
# is ever lost.
scoreboard players set #moved pn.var 1
summon item ~ ~ ~ {Item:{id:"minecraft:stone"},PickupDelay:15,Tags:["pn.drop"]}
data modify entity @e[type=item,tag=pn.drop,limit=1,sort=nearest] Item set from entity @s item
tag @e[type=item,tag=pn.drop] remove pn.drop
playsound minecraft:block.dispenser.fail block @a[distance=..16] ~ ~ ~ 0.7 0.9
particle minecraft:smoke ~ ~ ~ 0.12 0.12 0.12 0.02 8
kill @s
