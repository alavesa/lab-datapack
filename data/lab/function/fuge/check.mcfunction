# As a compound vial item: any grindstone is a centrifuge. The item can rest
# inside the grindstone's own cell (the wheel has gaps) or on top of it.
execute if block ~ ~ ~ minecraft:grindstone run return run function lab:fuge/spin
execute if block ~ ~-1 ~ minecraft:grindstone run return run function lab:fuge/spin
