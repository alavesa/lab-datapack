# Fridge barrel broken or renamed -> retire the marker. Otherwise: frost.
execute unless block ~ ~ ~ minecraft:barrel run return run kill @s
scoreboard players set #station lab.var 0
execute if data block ~ ~ ~ {CustomName:{text:"Lab Fridge"}} run scoreboard players set #station lab.var 1
execute if data block ~ ~ ~ {CustomName:"Lab Fridge"} run scoreboard players set #station lab.var 1
execute if score #station lab.var matches 0 run return run kill @s
particle minecraft:snowflake ~ ~0.7 ~ 0.25 0.25 0.25 0.01 3
