# As an SCP-008 carrier, once per second. Five minutes from needle to host.
# Symptoms surface as occasional thoughts; the ending is not survivable by
# waiting. Death of any kind while infected raises an SCP-008 Host where the
# body falls (handled by the labra-plugin's death hook).
scoreboard players add @s lab.z008 1
execute if score @s lab.z008 matches 20 run title @s actionbar {"text":"I don't feel well.","color":"gray","italic":true}
execute if score @s lab.z008 matches 60 run title @s actionbar {"text":"It's just a cold. It has to be.","color":"gray","italic":true}
execute if score @s lab.z008 matches 90..179 run effect give @s minecraft:nausea 6 0 true
execute if score @s lab.z008 matches 120 run title @s actionbar {"text":"I'm burning up.","color":"gray","italic":true}
execute if score @s lab.z008 matches 150..299 run effect give @s minecraft:hunger 6 1 true
execute if score @s lab.z008 matches 180..299 run effect give @s minecraft:weakness 6 0 true
execute if score @s lab.z008 matches 200 run title @s actionbar {"text":"The fever is unbearable.","color":"red","italic":true}
execute if score @s lab.z008 matches 240..299 run damage @s 1 minecraft:wither
execute if score @s lab.z008 matches 240..299 run effect give @s minecraft:nausea 6 1 true
execute if score @s lab.z008 matches 270 run title @s actionbar {"text":"I can hear my own pulse slowing down.","color":"red","italic":true}
execute if score @s lab.z008 matches 295 run title @s actionbar {"text":"So tired. Just a short rest-","color":"dark_red","italic":true}
execute if score @s lab.z008 matches 300.. run damage @s 1000 minecraft:wither
