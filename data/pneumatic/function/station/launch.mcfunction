# Macro: (x,y,z) = unit offset from the barrel into the first tube block.
# The capsule is a single item_display - it is both the visual and the payload
# storage (its item field holds the whole travelling stack, count included).
scoreboard players set #launched pn.var 1
$summon item_display ~$(x) ~$(y) ~$(z) {Tags:["pn.capsule","pn.new"],teleport_duration:2,billboard:"center",brightness:{sky:15,block:15},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.45f,0.45f,0.45f]}}
# Move the barrel's first stack into the capsule (strip the container Slot tag).
data modify storage pneumatic:tmp stack set from block ~ ~ ~ Items[0]
data remove storage pneumatic:tmp stack.Slot
data modify entity @e[type=item_display,tag=pn.new,limit=1] item set from storage pneumatic:tmp stack
data remove block ~ ~ ~ Items[0]
# Heading + time-to-live (max travel distance in blocks).
$scoreboard players set @e[type=item_display,tag=pn.new,limit=1] pn.dx $(x)
$scoreboard players set @e[type=item_display,tag=pn.new,limit=1] pn.dy $(y)
$scoreboard players set @e[type=item_display,tag=pn.new,limit=1] pn.dz $(z)
scoreboard players set @e[type=item_display,tag=pn.new,limit=1] pn.ttl 512
tag @e[type=item_display,tag=pn.new,limit=1] remove pn.new
playsound minecraft:block.piston.extend block @a[distance=..16] ~ ~ ~ 0.5 1.5
particle minecraft:cloud ~ ~0.7 ~ 0.1 0.1 0.1 0.01 5
