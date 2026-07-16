# SCP-005 "Skeleton Key". An ordinary-looking key that opens any lock it is
# used on - and, held, reads any SCiPNET file regardless of clearance. The
# other plugins recognise it by its model string; the datapack just hands it
# out. Object class: Safe.
give @s minecraft:tripwire_hook[custom_name={text:"SCP-005",color:"gold",italic:false},lore=[{text:"An old brass key.",color:"gray",italic:false},{text:"It fits everything.",color:"dark_gray",italic:false},{text:"Object class: Safe.",color:"dark_gray",italic:false}],custom_data={scp005:1b},max_stack_size=1,custom_model_data={strings:["scp005"]}]
