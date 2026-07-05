# Deploy from a Fridge Kit; the kit is consumed only on success.
function lab:place/fridge
execute if score #placed lab.var matches 1 run clear @s *[minecraft:custom_data~{lab_place:"fridge"}] 1
