# Only lab admins dismantle machines (ops: /function lab:admin toggles it).
scoreboard players set #adm lab.var 0
execute on attacker if entity @s[tag=lab.admin] run scoreboard players set #adm lab.var 1
execute if score #adm lab.var matches 0 run return run execute on attacker run title @s actionbar {"text":"[Lab] Machines are sturdy. A lab admin can dismantle them (op: /function lab:admin).","color":"yellow"}
function lab:machine/dismantle
