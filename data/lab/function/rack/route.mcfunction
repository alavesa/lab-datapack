# Holding a compound tube -> shelf it; otherwise -> take the last one out.
execute store result storage lab:tmp id int 1 run scoreboard players get @s lab.id
scoreboard players set #hold lab.var 0
execute on target if items entity @s weapon.mainhand minecraft:potion[minecraft:custom_data~{lab_is_compound:1b}] run scoreboard players set #hold lab.var 1
execute if score #hold lab.var matches 1 run return run function lab:rack/deposit with storage lab:tmp
function lab:rack/withdraw with storage lab:tmp
