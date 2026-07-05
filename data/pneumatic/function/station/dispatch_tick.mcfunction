scoreboard players set #t8 pn.var 0
execute as @e[type=marker,tag=pn.station] at @s if data block ~ ~ ~ Items[0] run function pneumatic:station/dispatch
