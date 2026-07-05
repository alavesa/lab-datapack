# Stirring Rod / machine kit right-clicks
execute as @a[scores={lab.rod=1..}] run function lab:used_stick
scoreboard players set @a lab.rod 0

# Machine right-clicks: interaction entities record them in their `interaction`
# field; `execute on target` resolves the clicking player.
execute as @e[type=interaction,tag=lab.fuge] if data entity @s interaction at @s run function lab:fuge/clicked
execute as @e[type=interaction,tag=lab.fridge] if data entity @s interaction at @s run function lab:fridge/clicked

# 1s cadence: alkali metals in water; 2s cadence: machine upkeep
scoreboard players add #t20 lab.var 1
scoreboard players add #t40 lab.var 1
execute if score #t20 lab.var matches 20.. run function lab:second
execute if score #t40 lab.var matches 40.. run function lab:machine/validate_tick
