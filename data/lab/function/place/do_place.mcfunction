# Positioned at the centre of the target cell, executed as the placing op.
# Machines exist ONLY through these op-level /function commands.
# GUI machines are real container/furnace blocks (their vanilla GUI is the
# interface); item_displays dress them up; markers drive the logic:
#   1 centrifuge = dropper "Centrifuge" + drum display on top
#   2 fridge     = barrel "Lab Fridge" + wrap-around cabinet display
#   3 gas burner = furnace "Gas Burner" (lit furnace = heat below cauldrons)
#   4 tube rack  = display + interaction only (furniture, no block)
#   5 creator    = dispenser "Compound Creator"
scoreboard players set #placed lab.var 1
execute if entity @e[type=interaction,tag=lab.machine,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute if entity @e[type=marker,tag=lab.creator,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute if entity @e[type=marker,tag=lab.fuge_m,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute if entity @e[type=marker,tag=lab.fridge_m,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute if entity @e[type=marker,tag=lab.burner_m,distance=..0.7] run return run title @s actionbar {"text":"Something is already installed here.","color":"gray"}
execute if score #type lab.var matches 1 run setblock ~ ~ ~ minecraft:dropper[facing=up]
execute if score #type lab.var matches 1 run data merge block ~ ~ ~ {CustomName:"Centrifuge"}
execute if score #type lab.var matches 1 run summon marker ~ ~ ~ {Tags:["lab.fuge_m"]}
execute if score #type lab.var matches 1 run summon item_display ~ ~0.85 ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.55f,0.55f,0.55f]},item:{id:"minecraft:grindstone",count:1,components:{"minecraft:custom_model_data":{strings:["lab_centrifuge"]}}}}
execute if score #type lab.var matches 2 run setblock ~ ~ ~ minecraft:barrel
execute if score #type lab.var matches 2 run data merge block ~ ~ ~ {CustomName:"Lab Fridge"}
execute if score #type lab.var matches 2 run summon marker ~ ~ ~ {Tags:["lab.fridge_m"]}
execute if score #type lab.var matches 2 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:iron_block",count:1,components:{"minecraft:custom_model_data":{strings:["lab_fridge"]}}}}
execute if score #type lab.var matches 3 run setblock ~ ~ ~ minecraft:furnace
execute if score #type lab.var matches 3 run data merge block ~ ~ ~ {CustomName:"Gas Burner"}
execute if score #type lab.var matches 3 run summon marker ~ ~ ~ {Tags:["lab.burner_m"]}
execute if score #type lab.var matches 4 run summon item_display ~ ~ ~ {Tags:["lab.display","lab.newdisp"],brightness:{sky:15,block:10},item:{id:"minecraft:oak_planks",count:1,components:{"minecraft:custom_model_data":{strings:["lab_rack"]}}}}
execute if score #type lab.var matches 4 run summon interaction ~ ~-0.5 ~ {Tags:["lab.machine","lab.rack","lab.new"],width:0.9f,height:0.55f,response:1b}
execute if score #type lab.var matches 5 run setblock ~ ~ ~ minecraft:dispenser[facing=up]
execute if score #type lab.var matches 5 run data merge block ~ ~ ~ {CustomName:"Compound Creator"}
execute if score #type lab.var matches 5 run summon marker ~ ~ ~ {Tags:["lab.creator"]}
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
execute if score #type lab.var matches 3 run title @s actionbar {"text":"Burner installed.","color":"gray"}
execute if score #type lab.var matches 4 run title @s actionbar {"text":"Tube rack installed.","color":"gray"}
execute if score #type lab.var matches 5 run title @s actionbar {"text":"Compound creator installed.","color":"gray"}
