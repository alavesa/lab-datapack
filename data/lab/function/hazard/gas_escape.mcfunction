particle minecraft:cloud ~ ~0.3 ~ 0.15 0.15 0.15 0.02 15
playsound minecraft:block.fire.extinguish block @a[distance=..12] ~ ~ ~ 0.5 1.4
tellraw @a[distance=..10] {"text":"[Lab] A gas sample escaped into the air.","color":"gray"}
kill @s
