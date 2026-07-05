# Stirring Rod right-clicks (reaction trigger)
execute as @a[scores={lab.rod=1..}] run function lab:react/start
scoreboard players set @a lab.rod 0

# 1s cadence: alkali metals in water + centrifuge; 2s cadence: fridge upkeep
scoreboard players add #t20 lab.var 1
scoreboard players add #t40 lab.var 1
execute if score #t20 lab.var matches 20.. run function lab:second
execute if score #t40 lab.var matches 40.. run function lab:fridge/tick
