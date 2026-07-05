# Only lab admins dismantle machines. The lab.admin tag can only be granted
# through /function lab:admin, and running functions requires server op - so
# dismantling is impossible for non-operators.
scoreboard players set #adm lab.var 0
execute on attacker if entity @s[tag=lab.admin] run scoreboard players set #adm lab.var 1
execute if score #adm lab.var matches 0 run return run execute on attacker run title @s actionbar {"text":"It's bolted down tight.","color":"gray"}
function lab:machine/retire
