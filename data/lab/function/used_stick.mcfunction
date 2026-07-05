# A carrot_on_a_stick item was right-clicked - route by which lab tool it is.
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_rod:true}] run return run function lab:react/start
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_pipette:true}] at @s run return run function lab:pipette/use
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_place:"centrifuge"}] run return run function lab:place/kit_centrifuge
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_place:"fridge"}] run return run function lab:place/kit_fridge
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_place:"burner"}] run return run function lab:place/kit_burner
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_place:"rack"}] run return run function lab:place/kit_rack
