# Reward from the fridge_placed advancement, which fires on ANY barrel placement.
# The ray only registers barrels named "Lab Fridge", so ordinary barrels are a
# silent no-op.
advancement revoke @s only lab:fridge_placed
scoreboard players set #steps lab.var 20
scoreboard players set #placed lab.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function lab:fridge/ray
