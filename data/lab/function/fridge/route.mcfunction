# Right-click = store nearby chemicals, sneak + right-click = take everything out.
execute store result storage lab:tmp id int 1 run scoreboard players get @s lab.id
scoreboard players set #sneak lab.var 0
execute on target if predicate lab:sneaking run scoreboard players set #sneak lab.var 1
execute if score #sneak lab.var matches 1 run return run function lab:fridge/withdraw with storage lab:tmp
function lab:fridge/deposit with storage lab:tmp
