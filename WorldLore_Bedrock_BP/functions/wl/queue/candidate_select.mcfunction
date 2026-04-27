execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players operation #sys wl_active_place = @s wl_place_id
execute if score #sys wl_active_place wl_active_place matches 1.. run scoreboard players set #sys wl_perf_active_places 1
