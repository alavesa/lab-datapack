# As each player, once per second.
# --- SCP-009 comes FIRST: it ignores hazmat suits entirely, and even the
# slightest contact starts a ~60s infection (lab.inf). The safe procedures
# exist, but nothing in-game spells them out - that's the players' problem.
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.offhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/infect_start
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.offhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/drop_main_cold
execute if items entity @s weapon.offhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.mainhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/infect_start
execute if items entity @s weapon.offhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.mainhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/drop_off_cold
# Uncooled transport counts as contact too (an N2 tube keeps it packed).
execute if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] unless items entity @s container.* *[minecraft:custom_data~{lab_compound:"N2"}] run function lab:hazard/infect_start
# Heat makes the infection race (near the Gas Burner or while on fire).
execute if score @s lab.inf matches 1.. if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] at @s if entity @e[type=interaction,tag=lab.burner,distance=..3] run scoreboard players add @s lab.inf 2
execute if score @s lab.inf matches 1.. if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] if predicate lab:on_fire run scoreboard players add @s lab.inf 2
# --- Ordinary element hazards: full hazmat suit = immune. ---
function lab:hazard/check_hazmat
execute if score #hazmat lab.var matches 1 run return 0
# Iron chestplate = the improvised PPE (lead apron): blocks radiation and lets
# you handle toxic metals.
execute if items entity @s armor.chest minecraft:iron_chestplate run return 0
# radiation burns through the whole backpack - unless SCP-148 is carried
execute if items entity @s container.* *[minecraft:custom_data~{lab_radioactive:true}] unless items entity @s container.* *[minecraft:custom_data~{scp148:1b}] run function lab:hazard/radiation
execute if items entity @s weapon.offhand *[minecraft:custom_data~{lab_radioactive:true}] unless items entity @s container.* *[minecraft:custom_data~{scp148:1b}] run function lab:hazard/radiation
# toxic metals cannot be held bare-handed - they drop instantly
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_toxic:true}] run function lab:hazard/drop_main
execute if items entity @s weapon.offhand *[minecraft:custom_data~{lab_toxic:true}] run function lab:hazard/drop_off
