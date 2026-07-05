# Alkali metal + water. Chemistry class said this would happen.
summon tnt ~ ~ ~ {fuse:10}
particle minecraft:cloud ~ ~0.5 ~ 0.2 0.2 0.2 0.05 20
playsound minecraft:entity.generic.extinguish_fire block @a[distance=..16] ~ ~ ~ 1 0.8
title @a[distance=..16] actionbar {"text":"That was a bad idea.","color":"gray","italic":true}
advancement grant @p only lab:never_trust_sodium
kill @s
