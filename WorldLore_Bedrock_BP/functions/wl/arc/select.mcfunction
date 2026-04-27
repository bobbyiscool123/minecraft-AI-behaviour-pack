# Select threat-specific arc start only when no active stage and no cooldown
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0,wl_event_pending=1,wl_place_threat=1}] run scoreboard players set @s wl_arc_pool 1
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0,wl_event_pending=1,wl_place_threat=2}] run scoreboard players set @s wl_arc_pool 2
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0,wl_event_pending=1,wl_place_threat=3}] run scoreboard players set @s wl_arc_pool 3
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0,wl_event_pending=1}] run scoreboard players set @s wl_arc_stage 1
