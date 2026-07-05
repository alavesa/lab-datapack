# As a machine interaction entity that was just punched. The `attack` data is
# cleared LAST - `execute on attacker` reads it.
function lab:machine/attack_route
data remove entity @s attack
