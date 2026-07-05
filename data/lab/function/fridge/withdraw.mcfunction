# Macro ($(id)): pop everything back out above the fridge.
$execute unless data storage lab:fridges f$(id)[0] run return run execute on target run title @s actionbar {"text":"The fridge is empty.","color":"gray"}
playsound minecraft:block.barrel.open block @a[distance=..12] ~ ~0.5 ~ 0.6 1.1
particle minecraft:snowflake ~ ~1 ~ 0.3 0.3 0.3 0.02 15
$function lab:fridge/pop {id:$(id)}
