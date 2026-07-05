# Macro: probe one direction. (x,y,z) = candidate step, (rx,ry,rz) = -(x,y,z).
execute if score #moved pn.var matches 1 run return 0
# never step straight back where we came from
$execute if score @s pn.dx matches $(rx) if score @s pn.dy matches $(ry) if score @s pn.dz matches $(rz) run return 0
# a station barrel ends the trip (name matched as compound or plain string)
scoreboard players set #station pn.var 0
$execute if block ~$(x) ~$(y) ~$(z) minecraft:barrel if data block ~$(x) ~$(y) ~$(z) {CustomName:{text:"Pneumatic Station"}} run scoreboard players set #station pn.var 1
$execute if block ~$(x) ~$(y) ~$(z) minecraft:barrel if data block ~$(x) ~$(y) ~$(z) {CustomName:"Pneumatic Station"} run scoreboard players set #station pn.var 1
$execute if score #station pn.var matches 1 run return run function pneumatic:capsule/arrive {x:$(x),y:$(y),z:$(z)}
# tube continues
$execute if block ~$(x) ~$(y) ~$(z) #pneumatic:tube run function pneumatic:capsule/go {x:$(x),y:$(y),z:$(z)}
