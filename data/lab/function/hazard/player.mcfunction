# As each player, once per second.
# --- SCP-009 rules come FIRST: the red ice ignores hazmat suits entirely. ---
# In hand it may only be handled with a tool (the Pipette in the other hand);
# otherwise it leaps out with a freezing sting.
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.offhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/drop_main_cold
execute if items entity @s weapon.offhand *[minecraft:custom_data~{scp009:1b}] unless items entity @s weapon.mainhand *[minecraft:custom_data~{lab_pipette:true}] run function lab:hazard/drop_off_cold
# Transport in the pack requires liquid nitrogen coolant (an N2 tube).
execute if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] unless items entity @s container.* *[minecraft:custom_data~{lab_compound:"N2"}] run function lab:hazard/cryo
# Heat + SCP-009 = infection. Near the Gas Burner's flame or while on fire.
execute if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] at @s if entity @e[type=interaction,tag=lab.burner,distance=..3] run function lab:hazard/infect_start
execute if items entity @s container.* *[minecraft:custom_data~{scp009:1b}] if predicate lab:on_fire run function lab:hazard/infect_start
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
