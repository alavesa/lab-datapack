# Deploy from a Tube Rack Kit; the kit is consumed only on success.
function lab:place/rack
execute if score #placed lab.var matches 1 run clear @s *[minecraft:custom_data~{lab_place:"rack"}] 1
