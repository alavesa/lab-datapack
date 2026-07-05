# As the player, at the player: sample what you're looking at.
scoreboard players set #steps lab.var 20
scoreboard players set #found lab.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function lab:pipette/ray
execute if score #found lab.var matches 1 run return 0
# no cauldron in sight - identify the nearest compound tube instead
execute at @s as @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}},limit=1,sort=nearest,distance=..4] run function lab:pipette/identify
execute if score #found lab.var matches 0 run title @s actionbar {"text":"There is nothing to sample.","color":"gray"}
