# The panacea. Stops the SCP-009 infection and the SCP-207 countdown COLD
# (SCP-999 only slows them), clears their symptoms and the ordinary ailments,
# and heals the body whole.
#
# Deliberately NOT cured: anything SCP-914 did. Darkness is 914-Coarse's mark
# and stays off this list; max health, the Very Fine clock and borrowed faces
# belong to the machine, and the machine does not give refunds.
advancement revoke @s only lab:scp500_taken
scoreboard players set @s lab.inf 0
scoreboard players set @s lab.cola 0
scoreboard players set @s lab.z008 0
effect clear @s minecraft:poison
effect clear @s minecraft:wither
effect clear @s minecraft:nausea
effect clear @s minecraft:blindness
effect clear @s minecraft:slowness
effect clear @s minecraft:mining_fatigue
effect clear @s minecraft:hunger
effect clear @s minecraft:weakness
effect clear @s minecraft:levitation
effect give @s minecraft:instant_health 1 3 true
particle minecraft:happy_villager ~ ~1.2 ~ 0.4 0.6 0.4 0 15
playsound minecraft:block.brewing_stand.brew player @s ~ ~ ~ 0.8 1.6
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 0.5 1.8
title @s actionbar {"text":"Whole again. Mostly.","color":"gray","italic":true}
