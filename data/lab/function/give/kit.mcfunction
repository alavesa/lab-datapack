# Starter kit: the books, the tools, both machines and enough atoms for your
# first water.
function lab:give/table
function lab:give/manual
function lab:give/rod
function lab:give/pipette
function lab:give/centrifuge
function lab:give/fridge
function lab:give/burner
function lab:give/rack
function lab:e {s:"H"}
function lab:e {s:"H"}
function lab:e {s:"H"}
function lab:e {s:"H"}
function lab:e {s:"O"}
function lab:e {s:"O"}
function lab:e {s:"C"}
function lab:e {s:"C"}
function lab:e {s:"Na"}
function lab:e {s:"Cl"}
tellraw @s [{"text":"[Lab] ","color":"aqua"},{"text":"Kit delivered. Place a cauldron (keep it DRY), toss elements in, look at it and right-click the Stirring Rod. Right-click the machine kits at the floor to install them.","color":"white"}]
