# SCP-009 touched skin. The clock starts - the player only feels cold.
execute if score @s lab.inf matches 1.. run return 0
scoreboard players set @s lab.inf 1
playsound minecraft:block.powder_snow.place player @s ~ ~ ~ 1 0.5
title @s actionbar {"text":"Cold. Something is wrong.","color":"gray","italic":true}
