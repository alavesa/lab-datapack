# Positioned at the centre of the target cell, executed as the placing op
# (via the labra-plugin's /lab place command).
# ALL machines use the mob-spawner method: spawner collision block +
# item_display model (rotated to the placer's facing) + interaction hitbox.
# GUIs are opened by the labra-plugin (v0.5+) on right-click.
#   1 centrifuge  2 fridge  3 gas burner (hot reactions GUI)
#   4 rack (furniture, no block)  5 compound creator (cold reactions GUI)
scoreboard players set #placed lab.var 1
execute if entity @e[type=interaction,tag=lab.machine,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute unless score #type lab.var matches 4 run setblock ~ ~ ~ minecraft:spawner
execute if score #type lab.var matches 1 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:grindstone",count:1,components:{"minecraft:custom_model_data":{strings:["lab_centrifuge"]}}}}
execute if score #type lab.var matches 1 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.fuge"],width:1.05f,height:1.02f,response:1b}
execute if score #type lab.var matches 2 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":{strings:["lab_fridge"]}}}}
execute if score #type lab.var matches 2 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.fridge"],width:1.05f,height:1.02f,response:1b}
execute if score #type lab.var matches 3 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:blast_furnace",count:1,components:{"minecraft:custom_model_data":{strings:["lab_burner"]}}}}
execute if score #type lab.var matches 3 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.burner"],width:1.05f,height:1.02f,response:1b}
execute if score #type lab.var matches 4 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:oak_planks",count:1,components:{"minecraft:custom_model_data":{strings:["lab_rack"]}}}}
execute if score #type lab.var matches 4 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.rack","lab.new"],width:0.9f,height:0.55f,response:1b}
execute if score #type lab.var matches 5 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:dispenser",count:1,components:{"minecraft:custom_model_data":{strings:["lab_creator"]}}}}
execute if score #type lab.var matches 5 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.creator"],width:1.05f,height:1.02f,response:1b}
# face the machine the way the placing player is looking (snapped to 90 deg)
execute store result score #yaw lab.var run data get entity @s Rotation[0] 1
execute if score #yaw lab.var matches -45..44 run tp @e[type=item_display,tag=lab.newdisp,limit=1] ~ ~ ~ 0 0
execute if score #yaw lab.var matches 45..134 run tp @e[type=item_display,tag=lab.newdisp,limit=1] ~ ~ ~ 90 0
execute if score #yaw lab.var matches -135..-46 run tp @e[type=item_display,tag=lab.newdisp,limit=1] ~ ~ ~ -90 0
execute if score #yaw lab.var matches 135..180 run tp @e[type=item_display,tag=lab.newdisp,limit=1] ~ ~ ~ 180 0
execute if score #yaw lab.var matches -180..-136 run tp @e[type=item_display,tag=lab.newdisp,limit=1] ~ ~ ~ 180 0
tag @e[type=item_display,tag=lab.newdisp] remove lab.newdisp
scoreboard players add #next_id lab.var 1
scoreboard players operation @e[type=interaction,tag=lab.new,limit=1] lab.id = #next_id lab.var
tag @e[type=interaction,tag=lab.new] remove lab.new
execute if score #type lab.var matches 2 run advancement grant @s only lab:cold_storage
playsound minecraft:block.anvil.place block @a[distance=..16] ~ ~ ~ 0.6 1.4
particle minecraft:happy_villager ~ ~0.6 ~ 0.3 0.3 0.3 0 10
execute if score #type lab.var matches 1 run title @s actionbar {"text":"Centrifuge installed.","color":"gray"}
execute if score #type lab.var matches 2 run title @s actionbar {"text":"Fridge installed.","color":"gray"}
execute if score #type lab.var matches 3 run title @s actionbar {"text":"Gas burner installed.","color":"gray"}
execute if score #type lab.var matches 4 run title @s actionbar {"text":"Tube rack installed.","color":"gray"}
execute if score #type lab.var matches 5 run title @s actionbar {"text":"Compound creator installed.","color":"gray"}
