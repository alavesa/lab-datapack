# Carrying SCP-009 without liquid nitrogen coolant or a hazmat suit.
damage @s 2 minecraft:freeze
effect give @s minecraft:slowness 3 0 true
playsound minecraft:block.powder_snow.step player @s ~ ~ ~ 0.8 0.7
title @s actionbar {"text":"The sample is freezing me. I need liquid nitrogen (N2).","color":"gray"}
