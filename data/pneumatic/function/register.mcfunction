# Manual fallback if auto-registration ever misses: look straight at a placed
# "Pneumatic Station" barrel and run this.
scoreboard players set #steps pn.var 20
scoreboard players set #placed pn.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function pneumatic:station/ray
execute if score #placed pn.var matches 0 run tellraw @s {"text":"[Pneumatic] No unregistered station barrel found ahead (within ~6 blocks). Look straight at the barrel and try again.","color":"red"}
