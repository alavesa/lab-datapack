# As an SCP-008 carrier, once per second. Three minutes from needle to host.
# Symptoms surface as occasional thoughts; the later stages paint the screen
# edges with a pulsing red vignette (font lab:z008 in the title slot, SCP:CB
# style - no nausea). Death of any kind while infected raises an SCP-008 Host
# where the body falls (handled by the labra-plugin's death hook), and hosts
# spread the infection with their hits.
scoreboard players add @s lab.z008 1
execute if score @s lab.z008 matches 15 run title @s actionbar {"text":"I don't feel well.","color":"gray","italic":true}
execute if score @s lab.z008 matches 40 run title @s actionbar {"text":"It's just a cold. It has to be.","color":"gray","italic":true}
execute if score @s lab.z008 matches 70 run title @s actionbar {"text":"I'm burning up.","color":"gray","italic":true}
execute if score @s lab.z008 matches 90..179 run effect give @s minecraft:hunger 6 1 true
execute if score @s lab.z008 matches 105..179 run effect give @s minecraft:weakness 6 0 true
execute if score @s lab.z008 matches 120 run title @s actionbar {"text":"The fever is unbearable.","color":"red","italic":true}
execute if score @s lab.z008 matches 140..179 run damage @s 1 minecraft:wither
execute if score @s lab.z008 matches 160 run title @s actionbar {"text":"I can hear my own pulse slowing down.","color":"red","italic":true}
execute if score @s lab.z008 matches 175 run title @s actionbar {"text":"So tired. Just a short rest-","color":"dark_red","italic":true}
# the heartbeat: a red edge pulse - every other second at first, every beat
# near the end (fade-in 3, stay 8, fade-out 9 = one 1s throb per send)
scoreboard players set #z8m lab.var 2
scoreboard players operation #z8 lab.var = @s lab.z008
scoreboard players operation #z8 lab.var %= #z8m lab.var
execute if score @s lab.z008 matches 55.. run title @s times 3 8 9
execute if score @s lab.z008 matches 55..139 if score #z8 lab.var matches 0 run title @s title {"text":"","font":"lab:z008","color":"white"}
execute if score @s lab.z008 matches 55..139 if score #z8 lab.var matches 0 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.5 0.8
execute if score @s lab.z008 matches 140.. run title @s title {"text":"","font":"lab:z008","color":"white"}
execute if score @s lab.z008 matches 140.. run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.9 1.1
execute if score @s lab.z008 matches 180.. run damage @s 1000 minecraft:wither
