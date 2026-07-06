# SCP-009 met heat while on this player. The infection begins.
execute if score @s lab.inf matches 1.. run return 0
scoreboard players set @s lab.inf 1
playsound minecraft:block.powder_snow.place player @s ~ ~ ~ 1 0.5
playsound minecraft:entity.player.hurt_freeze player @s ~ ~ ~ 1 0.8
title @s actionbar {"text":"Something cold is crawling up my arm.","color":"red","italic":true}
