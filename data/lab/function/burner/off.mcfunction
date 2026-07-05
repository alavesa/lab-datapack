tag @s remove lab.lit
playsound minecraft:block.fire.extinguish block @a[distance=..12] ~ ~0.3 ~ 0.6 1.2
particle minecraft:smoke ~ ~0.6 ~ 0.06 0.05 0.06 0.01 6
execute on target run title @s actionbar {"text":"[Lab] Burner off.","color":"yellow"}
