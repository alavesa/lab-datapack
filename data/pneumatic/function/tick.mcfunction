# Three cadences off one scratch objective. Each sub-function resets its own timer.
scoreboard players add #t2 pn.var 1
scoreboard players add #t8 pn.var 1
scoreboard players add #t40 pn.var 1

# every 2 ticks: capsules take one movement step (teleport_duration=2 keeps it smooth)
execute if score #t2 pn.var matches 2.. run function pneumatic:capsule/tick
# every 8 ticks: stations with items launch a capsule
execute if score #t8 pn.var matches 8.. run function pneumatic:station/dispatch_tick
# every 2s: retire markers whose station barrel is gone
execute if score #t40 pn.var matches 40.. run function pneumatic:station/cleanup_tick
