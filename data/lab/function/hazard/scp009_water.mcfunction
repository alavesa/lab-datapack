# As an SCP-009 item, aligned, in water: the water flash-freezes red. Hurts
# whoever stands in it - no block damage on the static facility map. The
# sample persists (it does not melt).
particle minecraft:dust{color:[0.8,0.08,0.08],scale:1.6} ~0.5 ~0.6 ~0.5 0.7 0.4 0.7 0 35
particle minecraft:snowflake ~0.5 ~0.6 ~0.5 0.5 0.3 0.5 0.02 20
playsound minecraft:block.glass.break block @a[distance=..12] ~ ~ ~ 0.7 0.6
playsound minecraft:block.powder_snow.place block @a[distance=..12] ~ ~ ~ 1 0.7
execute as @a[distance=..3.5] run damage @s 3 minecraft:freeze
execute as @a[distance=..3.5] run effect give @s minecraft:slowness 6 1 true
execute as @a[distance=..3.5] run effect give @s minecraft:mining_fatigue 6 0 true
title @a[distance=..8] actionbar {"text":"The water flash-freezes red.","color":"gray"}
