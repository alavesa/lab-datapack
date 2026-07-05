# As a halogen item, aligned, standing in water: it dissolves into toxic fumes.
summon area_effect_cloud ~0.5 ~0.3 ~0.5 {Radius:2.5f,Duration:160,potion_contents:{custom_color:8375321,custom_effects:[{id:"minecraft:poison",duration:80,amplifier:0}]}}
particle minecraft:sneeze ~0.5 ~0.5 ~0.5 0.3 0.3 0.3 0.02 20
playsound minecraft:block.brewing_stand.brew block @a[distance=..12] ~ ~ ~ 0.8 0.7
tellraw @a[distance=..12] {"text":"[Lab] The halogen dissolves - poisonous fumes!","color":"green"}
kill @s
