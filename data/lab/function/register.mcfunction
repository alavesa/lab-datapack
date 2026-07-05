# Manual fallback if fridge auto-registration ever misses: look straight at a
# placed "Lab Fridge" barrel and run this.
scoreboard players set #steps lab.var 20
scoreboard players set #placed lab.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function lab:fridge/ray
execute if score #placed lab.var matches 0 run tellraw @s {"text":"[Lab] No unregistered fridge found ahead (within ~6 blocks). Look straight at the barrel and try again.","color":"red"}
