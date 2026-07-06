# As a creator marker: break the dispenser (dropping it + contents), clean up.
execute if block ~ ~ ~ minecraft:dispenser run setblock ~ ~ ~ air destroy
kill @s
