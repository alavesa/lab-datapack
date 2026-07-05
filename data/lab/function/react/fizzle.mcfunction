# Positioned at the cauldron corner, executed as the stirring player.
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.8 1
particle minecraft:smoke ~0.5 ~1 ~0.5 0.15 0.1 0.15 0.02 12
tellraw @s {"text":"[Lab] No reaction. The mix must match a compound formula exactly - nothing extra, nothing missing.","color":"yellow"}
