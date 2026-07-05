# Macro ($(id)): vacuum every lab element/compound item within 2 blocks into
# this fridge's list in storage lab:fridges.
scoreboard players set #dep lab.var 0
$execute as @e[type=item,distance=..2,nbt={Item:{components:{"minecraft:custom_data":{lab_is_element:1b}}}}] run function lab:fridge/absorb {id:$(id)}
$execute as @e[type=item,distance=..2,nbt={Item:{components:{"minecraft:custom_data":{lab_is_compound:1b}}}}] run function lab:fridge/absorb {id:$(id)}
scoreboard players set #tot lab.var 0
$execute if data storage lab:fridges f$(id) store result score #tot lab.var run data get storage lab:fridges f$(id)
execute if score #dep lab.var matches 0 run return run execute on target run title @s actionbar {"text":"[Lab] Nothing to store - drop your elements/vials next to the fridge, then click it.","color":"yellow"}
playsound minecraft:block.barrel.close block @a[distance=..12] ~ ~0.5 ~ 0.6 1.3
particle minecraft:snowflake ~ ~0.9 ~ 0.25 0.25 0.25 0.02 12
execute on target run title @s actionbar [{"text":"[Lab] Stored ","color":"aqua"},{"score":{"name":"#dep","objective":"lab.var"},"color":"white"},{"text":" item(s) - the fridge now holds ","color":"aqua"},{"score":{"name":"#tot","objective":"lab.var"},"color":"white"},{"text":".","color":"aqua"}]
