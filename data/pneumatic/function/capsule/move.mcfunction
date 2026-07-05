# One movement step, as the capsule at its block centre.
# Straight-first, then branches in a fixed order (up, down, north, south, west,
# east), never straight back the way it came. The gate is the scratch fake
# player #moved, NOT a score on @s: arrive/fail kill the capsule and dead-@s
# score checks silently fail, which would let later probes fire twice.
scoreboard players remove @s pn.ttl 1
execute if score @s pn.ttl matches ..0 run return run function pneumatic:capsule/fail
scoreboard players set #moved pn.var 0
# 1) prefer continuing straight
execute if score @s pn.dy matches 1 run function pneumatic:capsule/try {x:0,y:1,z:0,rx:0,ry:-1,rz:0}
execute if score @s pn.dy matches -1 run function pneumatic:capsule/try {x:0,y:-1,z:0,rx:0,ry:1,rz:0}
execute if score @s pn.dz matches -1 run function pneumatic:capsule/try {x:0,y:0,z:-1,rx:0,ry:0,rz:1}
execute if score @s pn.dz matches 1 run function pneumatic:capsule/try {x:0,y:0,z:1,rx:0,ry:0,rz:-1}
execute if score @s pn.dx matches -1 run function pneumatic:capsule/try {x:-1,y:0,z:0,rx:1,ry:0,rz:0}
execute if score @s pn.dx matches 1 run function pneumatic:capsule/try {x:1,y:0,z:0,rx:-1,ry:0,rz:0}
# 2) then any branch except reverse
function pneumatic:capsule/try {x:0,y:1,z:0,rx:0,ry:-1,rz:0}
function pneumatic:capsule/try {x:0,y:-1,z:0,rx:0,ry:1,rz:0}
function pneumatic:capsule/try {x:0,y:0,z:-1,rx:0,ry:0,rz:1}
function pneumatic:capsule/try {x:0,y:0,z:1,rx:0,ry:0,rz:-1}
function pneumatic:capsule/try {x:-1,y:0,z:0,rx:1,ry:0,rz:0}
function pneumatic:capsule/try {x:1,y:0,z:0,rx:-1,ry:0,rz:0}
# 3) dead end or broken tube -> pop the payload here
execute if score #moved pn.var matches 0 run function pneumatic:capsule/fail
