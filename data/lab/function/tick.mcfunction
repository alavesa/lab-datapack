# Stirring Rod / pipette right-clicks
execute as @a[scores={lab.rod=1..}] run function lab:used_stick
scoreboard players set @a lab.rod 0

# Rack right-clicks (the only interaction-entity machine left - the other
# machines are real container blocks with real GUIs now)
execute as @e[type=interaction,tag=lab.rack] if data entity @s interaction at @s run function lab:rack/clicked
# Rack punches: lab admins dismantle
execute as @e[type=interaction,tag=lab.machine] if data entity @s attack at @s run function lab:machine/attacked

# 0.4s: GUI machines scan their grids; 1s: hazards; 2s: machine upkeep
scoreboard players add #t8 lab.var 1
scoreboard players add #t20 lab.var 1
scoreboard players add #t40 lab.var 1
execute if score #t8 lab.var matches 8.. run function lab:creator/tick
execute if score #t20 lab.var matches 20.. run function lab:second
execute if score #t40 lab.var matches 40.. run function lab:machine/validate_tick
