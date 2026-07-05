# Stirring Rod was right-clicked. Raycast to the cauldron the player is
# looking at (same pattern as keycard-datapack reader placement).
execute unless items entity @s weapon.mainhand *[minecraft:custom_data~{lab_rod:true}] run return 0
scoreboard players set #steps lab.var 20
scoreboard players set #found lab.var 0
execute at @s anchored eyes positioned ^ ^ ^ run function lab:react/ray
execute if score #found lab.var matches 0 run tellraw @s {"text":"[Lab] No cauldron in sight (within ~6 blocks). Look at a dry cauldron holding your elements.","color":"red"}
