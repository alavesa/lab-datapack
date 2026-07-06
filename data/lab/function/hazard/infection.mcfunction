# As an infected player, once per second. Any contact with SCP-009 ends the
# same way in about a minute; heat makes it faster, SCP-999 only buys time.
# The messages describe symptoms, never solutions.
scoreboard players add @s lab.inf 1
particle minecraft:dust{color:[0.8,0.08,0.08],scale:1.0} ~ ~1.2 ~ 0.3 0.5 0.3 0 4
playsound minecraft:block.powder_snow.step player @s ~ ~ ~ 0.5 0.6
execute if score @s lab.inf matches 1..15 run damage @s 1 minecraft:freeze
execute if score @s lab.inf matches 1..15 run effect give @s minecraft:slowness 3 0 true
execute if score @s lab.inf matches 1..15 run title @s actionbar {"text":"My fingertips have gone numb.","color":"gray","italic":true}
execute if score @s lab.inf matches 16..30 run damage @s 1 minecraft:freeze
execute if score @s lab.inf matches 16..30 run effect give @s minecraft:slowness 3 1 true
execute if score @s lab.inf matches 16..30 run title @s actionbar {"text":"I can't feel my arms.","color":"gray","italic":true}
execute if score @s lab.inf matches 31..45 run damage @s 2 minecraft:freeze
execute if score @s lab.inf matches 31..45 run effect give @s minecraft:mining_fatigue 3 0 true
execute if score @s lab.inf matches 31..45 run effect give @s minecraft:nausea 5 0 true
execute if score @s lab.inf matches 31..45 run title @s actionbar {"text":"There is frost under my skin.","color":"red","italic":true}
execute if score @s lab.inf matches 46..59 run damage @s 2 minecraft:freeze
execute if score @s lab.inf matches 46..59 run effect give @s minecraft:blindness 3 0 true
execute if score @s lab.inf matches 46..59 run title @s actionbar {"text":"The cold is reaching my heart.","color":"red","italic":true}
execute if score @s lab.inf matches 60.. run scoreboard players set @s lab.inf 0
execute if score @s lab.inf matches 0 run damage @s 1000 minecraft:freeze
