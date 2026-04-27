# Select one active place candidate near players
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players operation #sys wl_active_place = @s wl_place_id
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players operation #sys wl_active_event = @s wl_arc_stage
