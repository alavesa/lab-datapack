# Macro: step one block in direction (x,y,z). Particle fires before the tp so
# the trail is left behind the capsule.
scoreboard players set #moved pn.var 1
$scoreboard players set @s pn.dx $(x)
$scoreboard players set @s pn.dy $(y)
$scoreboard players set @s pn.dz $(z)
particle minecraft:electric_spark ~ ~ ~ 0.1 0.1 0.1 0 2
playsound minecraft:block.copper.step block @a[distance=..8] ~ ~ ~ 0.2 1.8
$tp @s ~$(x) ~$(y) ~$(z)
