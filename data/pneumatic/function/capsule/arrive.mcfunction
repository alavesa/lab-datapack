# Macro: (x,y,z) points at the receiving station barrel. Deliver just above it.
scoreboard players set #moved pn.var 1
$execute positioned ~$(x) ~$(y) ~$(z) positioned ~ ~0.6 ~ run function pneumatic:capsule/deposit
