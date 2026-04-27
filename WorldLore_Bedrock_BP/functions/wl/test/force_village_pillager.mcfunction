execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_place_threat 2
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_event_pending 1
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_arc_pool 2
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_arc_stage 2
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run function wl/scenelet/pillager_pressure_hint
