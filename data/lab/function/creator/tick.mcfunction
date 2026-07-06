scoreboard players set #t8 lab.var 0
# compound creator grids
execute as @e[type=marker,tag=lab.creator] at @s if data block ~ ~ ~ Items[0] run function lab:creator/check
