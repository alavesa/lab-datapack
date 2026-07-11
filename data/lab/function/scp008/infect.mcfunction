# The needle goes in. Three minutes on the clock (lab.z008, ticked by second).
# SCP-500 stops it; SCP-999 only buys time; nothing else does. Bites from an
# SCP-008 Host land here too (labra-plugin) - a full hazmat suit blocks those,
# for as long as it holds together.
execute if score @s lab.z008 matches 1.. run return 0
scoreboard players set @s lab.z008 1
playsound minecraft:item.bottle.empty player @s ~ ~ ~ 0.8 0.7
title @s actionbar {"text":"Just a pinprick.","color":"gray","italic":true}
