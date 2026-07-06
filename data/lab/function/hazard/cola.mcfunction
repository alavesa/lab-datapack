# As a player who drank SCP-207, once per second. Three and a half minutes:
# euphoria, then warning signs, then a racing heartbeat for the final minute.
# Messages surface occasionally, like thoughts. SCP-999 only buys time.
scoreboard players add @s lab.cola 1
# occasional thoughts
execute if score @s lab.cola matches 10 run title @s actionbar {"text":"I feel incredible.","color":"gray","italic":true}
execute if score @s lab.cola matches 30 run title @s actionbar {"text":"I can't sit still.","color":"gray","italic":true}
execute if score @s lab.cola matches 55 run title @s actionbar {"text":"My heart is pounding.","color":"gray","italic":true}
execute if score @s lab.cola matches 80 run title @s actionbar {"text":"My chest feels tight.","color":"gray","italic":true}
execute if score @s lab.cola matches 110 run title @s actionbar {"text":"My hands are shaking.","color":"gray","italic":true}
execute if score @s lab.cola matches 140 run title @s actionbar {"text":"Something is wrong with my heart.","color":"red","italic":true}
execute if score @s lab.cola matches 165 run title @s actionbar {"text":"I can hear my own heartbeat.","color":"red","italic":true}
execute if score @s lab.cola matches 190 run title @s actionbar {"text":"It's beating too fast. Far too fast.","color":"red","italic":true}
execute if score @s lab.cola matches 205 run title @s actionbar {"text":"It hurts-","color":"dark_red","italic":true}
# body wearing down
execute if score @s lab.cola matches 110..209 run effect give @s minecraft:nausea 5 0 true
execute if score @s lab.cola matches 150..209 run damage @s 1 minecraft:magic
execute if score @s lab.cola matches 180..209 run effect give @s minecraft:wither 3 0 true
# the last minute: the heartbeat, getting faster and louder
execute if score @s lab.cola matches 150..179 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 0.7 1.2
execute if score @s lab.cola matches 180..199 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 1.5
execute if score @s lab.cola matches 200..209 run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1.4 1.8
# 3.5 minutes after the first sip
execute if score @s lab.cola matches 210.. run scoreboard players set @s lab.cola 0
execute if score @s lab.cola matches 0 run damage @s 1000 minecraft:magic
