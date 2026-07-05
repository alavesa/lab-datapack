# Remove everything the pack has put in the world. Machines retire cleanly
# (fridges dump their contents, spawner blocks are removed). Element/compound
# items in inventories and chests stay - they are ordinary, harmless items.
execute as @e[type=interaction,tag=lab.machine] at @s run function lab:machine/retire
kill @e[type=item_display,tag=lab.display]
kill @e[type=marker,tag=lab.fumes]
scoreboard objectives remove lab.var
scoreboard objectives remove lab.rod
scoreboard objectives remove lab.rxn
scoreboard objectives remove lab.id
scoreboard objectives remove lab.age
scoreboard objectives remove lab.sip
kill @e[type=item_display,tag=lab.rackview]
data remove storage lab:elements
data remove storage lab:fridges
data remove storage lab:racks
data remove storage lab:tmp
tellraw @a {"text":"[Lab] Uninstalled - machines retired, scoreboards and registries removed. Safe to disable the pack.","color":"yellow"}
