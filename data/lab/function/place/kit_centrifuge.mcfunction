# Deploy from a Centrifuge Kit; the kit is consumed only on success.
function lab:place/centrifuge
execute if score #placed lab.var matches 1 run clear @s *[minecraft:custom_data~{lab_place:"centrifuge"}] 1
