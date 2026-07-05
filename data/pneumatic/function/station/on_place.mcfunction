# Reward from the station_placed advancement, which fires on ANY barrel placement.
# The ray only registers barrels named "Pneumatic Station", so ordinary barrels
# are a silent no-op.
advancement revoke @s only pneumatic:station_placed
scoreboard players set #steps pn.var 20
scoreboard players set #placed pn.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function pneumatic:station/ray
