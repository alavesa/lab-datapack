# A carrot_on_a_stick item was right-clicked - route by which lab tool it is.
# (Machines are installed by op commands only: /function lab:place/...)
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_rod:true}] run return run function lab:react/start
execute if items entity @s weapon.mainhand *[minecraft:custom_data~{lab_pipette:true}] at @s run return run function lab:pipette/use
