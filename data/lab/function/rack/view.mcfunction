# Macro ($(id),$(slot),$(dx)): one mini tube standing in the rack.
$summon item_display ~$(dx) ~0.3 ~ {Tags:["lab.rackview","lab.newview"],billboard:"vertical",brightness:{sky:15,block:10},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.28f,0.28f,0.28f]}}
$data modify entity @e[type=item_display,tag=lab.newview,limit=1] item set from storage lab:racks r$(id)[$(slot)]
tag @e[type=item_display,tag=lab.newview] remove lab.newview
