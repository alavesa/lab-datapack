# An SCP-008 syringe. Consuming it injects YOURSELF; striking another player
# with it (labra-plugin) injects THEM and spends the syringe. The label says
# nothing about a cure. The label is correct about most things.
give @s minecraft:ghast_tear[custom_name={text:"Syringe",color:"dark_green",italic:false},lore=[{text:"Grey-green fluid. Sealed.",color:"gray",italic:false},{text:"Object class: Euclid.",color:"dark_gray",italic:false}],custom_data={scp008_syringe:1b},max_stack_size=1,custom_model_data={strings:["lab_syringe_008"]},consumable={consume_seconds:1.2,animation:"bow",sound:"minecraft:item.bottle.empty",has_consume_particles:false}]
