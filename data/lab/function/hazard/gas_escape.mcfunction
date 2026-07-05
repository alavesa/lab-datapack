particle minecraft:cloud ~ ~0.3 ~ 0.15 0.15 0.15 0.02 15
playsound minecraft:block.fire.extinguish block @a[distance=..12] ~ ~ ~ 0.5 1.4
title @a[distance=..10] actionbar {"text":"A gas sample escapes.","color":"gray"}
kill @s
