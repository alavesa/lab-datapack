# As a GUI-machine marker: break the block (dropping it + contents), clean up.
kill @e[type=item_display,tag=lab.display,distance=..1.0]
execute if block ~ ~ ~ minecraft:dispenser run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ minecraft:dropper run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ minecraft:barrel run setblock ~ ~ ~ air destroy
execute if block ~ ~ ~ minecraft:furnace run setblock ~ ~ ~ air destroy
kill @s
