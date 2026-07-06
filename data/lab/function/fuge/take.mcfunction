# Macro ($(slot),$(key)): pull the tube from its slot, spin, release the atoms.
scoreboard players set #done lab.var 1
$data remove block ~ ~ ~ Items[{Slot:$(slot)b}]
$function lab:fuge/gui_split/$(key)
