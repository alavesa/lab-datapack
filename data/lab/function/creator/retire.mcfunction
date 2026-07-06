# As a creator marker: drop the dispenser and its contents, retire the marker.
execute if block ~ ~ ~ minecraft:dispenser run setblock ~ ~ ~ air destroy
kill @s
