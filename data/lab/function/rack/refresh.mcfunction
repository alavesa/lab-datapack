# Macro ($(id)): rebuild the six mini tube displays to match storage.
kill @e[type=item_display,tag=lab.rackview,distance=..1.2]
$execute if data storage lab:racks r$(id)[0] run function lab:rack/view {id:$(id),slot:0,dx:"-0.3"}
$execute if data storage lab:racks r$(id)[1] run function lab:rack/view {id:$(id),slot:1,dx:"-0.18"}
$execute if data storage lab:racks r$(id)[2] run function lab:rack/view {id:$(id),slot:2,dx:"-0.06"}
$execute if data storage lab:racks r$(id)[3] run function lab:rack/view {id:$(id),slot:3,dx:"0.06"}
$execute if data storage lab:racks r$(id)[4] run function lab:rack/view {id:$(id),slot:4,dx:"0.18"}
$execute if data storage lab:racks r$(id)[5] run function lab:rack/view {id:$(id),slot:5,dx:"0.3"}
