# Soft DNA updates
execute if score @s wl_place_threat matches 0 run scoreboard players set @s wl_place_mood 1
execute if score @s wl_place_threat matches 1..2 run scoreboard players set @s wl_place_mood 2
execute if score @s wl_place_threat matches 3.. run scoreboard players set @s wl_place_mood 3
execute if score @s wl_arc_stage matches 8 run scoreboard players set @s wl_place_mood 8
