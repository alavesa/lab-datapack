# As an infected player, once per second. SCP-009 spreads through the blood;
# only SCP-999's gel stops it. At ~15 seconds, it wins.
scoreboard players add @s lab.inf 1
damage @s 2 minecraft:freeze
effect give @s minecraft:slowness 3 1 true
effect give @s minecraft:nausea 5 0 true
particle minecraft:dust{color:[0.8,0.08,0.08],scale:1.2} ~ ~1.2 ~ 0.3 0.5 0.3 0 6
playsound minecraft:block.powder_snow.step player @s ~ ~ ~ 0.6 0.6
execute if score @s lab.inf matches ..8 run title @s actionbar {"text":"The red ice is inside me.","color":"red","italic":true}
execute if score @s lab.inf matches 9..14 run title @s actionbar {"text":"SCP-999... or this is the end.","color":"red","italic":true}
execute if score @s lab.inf matches 15.. run scoreboard players set @s lab.inf 0
execute if score @s lab.inf matches 0 run damage @s 1000 minecraft:freeze
