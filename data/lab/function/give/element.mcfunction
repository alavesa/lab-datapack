# Macro: expects sym/name/num/color/rgb/extra (one entry from storage lab:elements).
# Elements are firework stars - the explosion color tints the item sprite, so
# every category gets its color with zero resource pack. max_stack_size=1 keeps
# reaction counting honest (1 item entity = 1 atom).
$give @s minecraft:firework_star[custom_name={text:"$(name)",color:"$(color)",italic:false},lore=[{text:"$(sym) - element $(num)",color:"gray",italic:false}$(hlore)],custom_data={lab_element:"$(sym)",lab_is_element:1b$(extra)},max_stack_size=1,firework_explosion={shape:"small_ball",colors:[I;$(rgb)]}]
