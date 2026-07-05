# As the nearest compound tube item: report what it is to the sampler.
scoreboard players set #found lab.var 1
tellraw @p [{"text":"[Lab] Sample analysis: ","color":"aqua"},{"nbt":"Item.components.\"minecraft:custom_name\"","entity":"@s","interpret":true},{"text":" (","color":"gray"},{"nbt":"Item.components.\"minecraft:lore\"[0]","entity":"@s","interpret":true},{"text":")","color":"gray"}]
