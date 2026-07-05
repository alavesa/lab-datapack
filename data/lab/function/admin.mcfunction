# Toggle lab-admin mode. Running functions requires op, so this is op-gated by
# nature. Lab admins dismantle machines by punching them (kit refunded).
execute if entity @s[tag=lab.admin] run return run function lab:admin_off
tag @s add lab.admin
tellraw @s [{"text":"[Lab] ","color":"aqua"},{"text":"Lab admin ON - punch a machine to dismantle it (the kit is refunded, fridges drop their contents). Run again to turn off.","color":"white"}]
