# Station barrel broken or renamed -> retire the marker.
execute unless block ~ ~ ~ minecraft:barrel run return run kill @s
execute if data block ~ ~ ~ {CustomName:{text:"Pneumatic Station"}} run return 0
execute if data block ~ ~ ~ {CustomName:"Pneumatic Station"} run return 0
kill @s
