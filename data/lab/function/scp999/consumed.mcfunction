# SCP-999's gel: joy, comfort - and time. It is not SCP-500: an SCP-009
# infection or a bad cola only SLOW DOWN; the countdowns lose a chunk but
# never stop.
advancement revoke @s only lab:scp999_drunk
scoreboard players set #was lab.var 0
execute if score @s lab.inf matches 1.. run scoreboard players set #was lab.var 1
execute if score #was lab.var matches 1 run scoreboard players remove @s lab.inf 20
execute if score #was lab.var matches 1 if score @s lab.inf matches ..0 run scoreboard players set @s lab.inf 1
scoreboard players set #was lab.var 0
execute if score @s lab.cola matches 1.. run scoreboard players set #was lab.var 1
execute if score #was lab.var matches 1 run scoreboard players remove @s lab.cola 60
execute if score #was lab.var matches 1 if score @s lab.cola matches ..0 run scoreboard players set @s lab.cola 1
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
title @s actionbar {"text":"I feel wonderful. For now.","color":"gray","italic":true}
