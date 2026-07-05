# As the fridge interaction entity, at the machine. The `interaction` data is
# cleared LAST - `execute on target` reads it, so it must survive the action.
function lab:fridge/route
data remove entity @s interaction
