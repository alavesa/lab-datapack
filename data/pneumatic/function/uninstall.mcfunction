# Remove everything the pack has put in the world. In-flight capsules pop their
# payload where they are so no items are lost.
execute as @e[type=item_display,tag=pn.capsule] at @s run function pneumatic:capsule/fail
kill @e[type=marker,tag=pn.station]
scoreboard objectives remove pn.var
scoreboard objectives remove pn.dx
scoreboard objectives remove pn.dy
scoreboard objectives remove pn.dz
scoreboard objectives remove pn.ttl
tellraw @a {"text":"[Lab] Uninstalled - capsules landed, station markers and scoreboards removed. Safe to disable the pack.","color":"yellow"}
