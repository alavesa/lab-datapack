# Fires every tick while a player tries to drink an undrinkable vial (the
# consume time is an hour, so the sip never completes). lab.sip throttles the
# thought to once per ~3s.
advancement revoke @s only lab:no_drink
execute if score @s lab.sip matches 1.. run return 0
scoreboard players set @s lab.sip 3
tellraw @s {"text":"I shouldn't drink this.","color":"gray","italic":true}
playsound minecraft:entity.villager.no player @s ~ ~ ~ 0.35 1.2
