# Macro ($(id)): as one lab item entity - move the stack into fridge storage.
$data modify storage lab:fridges f$(id) append from entity @s Item
scoreboard players add #dep lab.var 1
kill @s
