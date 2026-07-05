particle minecraft:flame ~ ~0.2 ~ 0.15 0.15 0.15 0.03 20
particle minecraft:lava ~ ~0.2 ~ 0.1 0.1 0.1 0 4
playsound minecraft:item.firecharge.use block @a[distance=..12] ~ ~ ~ 0.6 1.2
tellraw @a[distance=..10] {"text":"[Lab] The phosphorus ignited! Store it under water next time.","color":"gold"}
kill @s
