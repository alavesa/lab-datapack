# Alkali metal + water: a violent flash. It hurts whoever stands close, but
# the facility itself never takes a scratch (static RP map - no TNT, no block
# damage).
particle minecraft:explosion_emitter ~ ~0.3 ~ 0 0 0 0 1
particle minecraft:cloud ~ ~0.5 ~ 0.4 0.4 0.4 0.1 30
particle minecraft:splash ~ ~0.5 ~ 0.5 0.3 0.5 1 40
playsound minecraft:entity.generic.explode block @a[distance=..24] ~ ~ ~ 1 1.1
execute as @a[distance=..3.5] run damage @s 6 minecraft:explosion
title @a[distance=..16] actionbar {"text":"That was a bad idea.","color":"gray","italic":true}
advancement grant @p only lab:never_trust_sodium
kill @s
