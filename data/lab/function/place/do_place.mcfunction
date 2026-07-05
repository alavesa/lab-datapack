# Positioned at the centre of the target cell, executed as the placing player.
# Machine = spawner block (collision; the resource pack renders it invisible)
# + item_display (the 3D model via custom_model_data) + interaction (clicks).
scoreboard players set #placed lab.var 1
execute if entity @e[type=interaction,tag=lab.machine,distance=..0.7] run return run tellraw @s {"text":"[Lab] There is already a machine here.","color":"red"}
setblock ~ ~ ~ minecraft:spawner
execute if score #type lab.var matches 1 run summon item_display ~ ~ ~ {Tags:["lab.display"],brightness:{sky:15,block:10},item:{id:"minecraft:grindstone",count:1,components:{"minecraft:custom_model_data":{strings:["lab_centrifuge"]}}}}
execute if score #type lab.var matches 1 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.fuge"],width:1.05f,height:1.02f,response:1b}
execute if score #type lab.var matches 2 run summon item_display ~ ~ ~ {Tags:["lab.display"],brightness:{sky:15,block:10},item:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":{strings:["lab_fridge"]}}}}
execute if score #type lab.var matches 2 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.fridge","lab.new"],width:1.05f,height:1.02f,response:1b}
scoreboard players add #next_id lab.var 1
scoreboard players operation @e[type=interaction,tag=lab.new,limit=1] lab.id = #next_id lab.var
tag @e[type=interaction,tag=lab.new] remove lab.new
execute if score #type lab.var matches 2 run advancement grant @s only lab:cold_storage
playsound minecraft:block.anvil.place block @a[distance=..16] ~ ~ ~ 0.6 1.4
particle minecraft:happy_villager ~ ~0.6 ~ 0.3 0.3 0.3 0 10
execute if score #type lab.var matches 1 run tellraw @s [{"text":"[Lab] ","color":"aqua"},{"text":"Centrifuge installed. Drop a compound vial on it and right-click to spin.","color":"white"}]
execute if score #type lab.var matches 2 run tellraw @s [{"text":"[Lab] ","color":"aqua"},{"text":"Fridge installed. Drop chemicals next to it and right-click to store; sneak + right-click to take everything out.","color":"white"}]
