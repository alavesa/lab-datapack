# SCP-999's gel cures everything bad and leaves you giggling.
advancement revoke @s only lab:scp999_drunk
# the gel is the only cure for an SCP-009 infection
scoreboard players set @s lab.inf 0
effect clear @s minecraft:poison
effect clear @s minecraft:wither
effect clear @s minecraft:nausea
effect clear @s minecraft:blindness
effect clear @s minecraft:darkness
effect clear @s minecraft:slowness
effect clear @s minecraft:mining_fatigue
effect clear @s minecraft:hunger
effect clear @s minecraft:weakness
effect clear @s minecraft:levitation
particle minecraft:heart ~ ~1.5 ~ 0.4 0.4 0.4 0 8
playsound minecraft:entity.slime.squish player @s ~ ~ ~ 1 1.4
title @s actionbar {"text":"I feel wonderful.","color":"gray","italic":true}
