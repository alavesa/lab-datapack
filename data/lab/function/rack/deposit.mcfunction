# Macro ($(id)): move the tube from the clicking player's hand into the rack.
scoreboard players set #cnt lab.var 0
$execute if data storage lab:racks r$(id) store result score #cnt lab.var run data get storage lab:racks r$(id)
execute if score #cnt lab.var matches 6.. run return run execute on target run title @s actionbar {"text":"[Lab] The rack is full (6 tubes).","color":"yellow"}
$execute on target run data modify storage lab:racks r$(id) append from entity @s SelectedItem
execute on target run item replace entity @s weapon.mainhand with air
playsound minecraft:block.glass.place block @a[distance=..8] ~ ~ ~ 0.7 1.5
$function lab:rack/refresh {id:$(id)}
