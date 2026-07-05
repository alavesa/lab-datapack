# Raycast to the floor spot the player is looking at (the Keycards trick,
# aimed down instead of at a wall). The machine lands in the last open cell
# before the surface.
scoreboard players set #steps lab.var 20
scoreboard players set #placed lab.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function lab:place/ray
execute if score #placed lab.var matches 0 run title @s actionbar {"text":"No suitable spot in sight.","color":"gray"}
