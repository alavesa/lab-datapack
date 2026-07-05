# Positioned at the centre of the block the ray is passing through.
execute unless block ~ ~ ~ minecraft:barrel run return 0
execute if entity @e[type=marker,tag=lab.fridge,distance=..0.9] run return 0
# Name accepted as text-component compound (give item) or plain string (anvil).
scoreboard players set #station lab.var 0
execute if data block ~ ~ ~ {CustomName:{text:"Lab Fridge"}} run scoreboard players set #station lab.var 1
execute if data block ~ ~ ~ {CustomName:"Lab Fridge"} run scoreboard players set #station lab.var 1
execute if score #station lab.var matches 0 run return 0
function lab:fridge/create
