# Full hazmat suit from the companion labra-plugin = total external immunity.
# The plugin marks each piece with the PDC key labra:hazmat, which lives in the
# item's custom_data under PublicBukkitValues - readable from a datapack.
# Same rule as the plugin's hasFullHazmat(): all four slots must be hazmat.
scoreboard players set #hazmat lab.var 0
execute if items entity @s armor.head *[minecraft:custom_data~{PublicBukkitValues:{"labra:hazmat":1b}}] if items entity @s armor.chest *[minecraft:custom_data~{PublicBukkitValues:{"labra:hazmat":1b}}] if items entity @s armor.legs *[minecraft:custom_data~{PublicBukkitValues:{"labra:hazmat":1b}}] if items entity @s armor.feet *[minecraft:custom_data~{PublicBukkitValues:{"labra:hazmat":1b}}] run scoreboard players set #hazmat lab.var 1
