# The mix matches a HOT recipe but there is no lit burner under the cauldron.
playsound minecraft:block.fire.extinguish block @a[distance=..16] ~0.5 ~0.5 ~0.5 0.6 0.7
particle minecraft:smoke ~0.5 ~1 ~0.5 0.1 0.05 0.1 0.01 6
tellraw @s {"text":"[Lab] This reaction needs HEAT - install a gas burner in the block under the cauldron and light it.","color":"gold"}
