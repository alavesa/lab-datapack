# Alkali metal + water. Chemistry class said this would happen.
summon tnt ~ ~ ~ {fuse:10}
particle minecraft:cloud ~ ~0.5 ~ 0.2 0.2 0.2 0.05 20
playsound minecraft:entity.generic.extinguish_fire block @a[distance=..16] ~ ~ ~ 1 0.8
tellraw @a[distance=..16] {"text":"[Lab] Alkali metal + water = bad idea.","color":"red"}
advancement grant @p only lab:never_trust_sodium
kill @s
