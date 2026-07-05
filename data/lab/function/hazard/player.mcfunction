# As each player, once per second.
# Full hazmat suit (labra-plugin) = immune to every element hazard.
function lab:hazard/check_hazmat
execute if score #hazmat lab.var matches 1 run return 0
# Iron chestplate = the improvised PPE (lead apron): blocks radiation and lets
# you handle toxic metals.
execute if items entity @s armor.chest minecraft:iron_chestplate run return 0
# radiation burns through the whole backpack
execute if items entity @s container.* *[minecraft:custom_data~{lab_radioactive:true}] run function lab:hazard/radiation
execute if items entity @s weapon.offhand *[minecraft:custom_data~{lab_radioactive:true}] run function lab:hazard/radiation
# toxic metals cannot be held bare-handed - they drop instantly
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_toxic:true}] run function lab:hazard/drop_main
execute if items entity @s weapon.offhand *[minecraft:custom_data~{lab_toxic:true}] run function lab:hazard/drop_off
