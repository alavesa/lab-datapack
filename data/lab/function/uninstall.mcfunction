# Remove everything the pack has put in the world. Element/compound items in
# inventories and chests stay - they are ordinary items and harmless.
kill @e[type=marker,tag=lab.fridge]
scoreboard objectives remove lab.var
scoreboard objectives remove lab.rod
scoreboard objectives remove lab.rxn
data remove storage lab:elements
tellraw @a {"text":"[Lab] Uninstalled - fridge markers, scoreboards and the element registry removed. Safe to disable the pack.","color":"yellow"}
