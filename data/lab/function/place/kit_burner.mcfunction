# Deploy from a Gas Burner Kit; the kit is consumed only on success.
function lab:place/burner
execute if score #placed lab.var matches 1 run clear @s *[minecraft:custom_data~{lab_place:"burner"}] 1
