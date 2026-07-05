particle minecraft:flame ~ ~0.2 ~ 0.15 0.15 0.15 0.03 20
particle minecraft:lava ~ ~0.2 ~ 0.1 0.1 0.1 0 4
playsound minecraft:item.firecharge.use block @a[distance=..12] ~ ~ ~ 0.6 1.2
title @a[distance=..10] actionbar {"text":"The phosphorus ignites.","color":"gray"}
kill @s
