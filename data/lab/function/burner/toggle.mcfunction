execute if entity @s[tag=lab.lit] run return run function lab:burner/off
tag @s add lab.lit
playsound minecraft:item.flintandsteel.use block @a[distance=..12] ~ ~0.3 ~ 0.8 1
particle minecraft:flame ~ ~0.6 ~ 0.08 0.05 0.08 0.01 8
execute on target run title @s actionbar {"text":"[Lab] Burner lit. Put a cauldron right above it for hot reactions.","color":"gold"}
