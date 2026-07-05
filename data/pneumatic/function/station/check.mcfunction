# Positioned at the centre of the block the ray is passing through.
execute unless block ~ ~ ~ minecraft:barrel run return 0
# already registered?
execute if entity @e[type=marker,tag=pn.station,distance=..0.9] run return 0
# Accept the name both as a text-component compound (our give item) and as a
# plain string (anvil renames collapse to a string in 1.21.5+).
scoreboard players set #station pn.var 0
execute if data block ~ ~ ~ {CustomName:{text:"Pneumatic Station"}} run scoreboard players set #station pn.var 1
execute if data block ~ ~ ~ {CustomName:"Pneumatic Station"} run scoreboard players set #station pn.var 1
execute if score #station pn.var matches 0 run return 0
function pneumatic:station/create
