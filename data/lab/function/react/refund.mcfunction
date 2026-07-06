# No reaction: pop every item inside the machine block back out on top,
# unharmed and collectable again.
execute as @e[type=item,dx=0,dy=0,dz=0] at @s run function lab:react/refund_one
