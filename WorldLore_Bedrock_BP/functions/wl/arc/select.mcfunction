execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0}] run scoreboard players set @s wl_arc_stage 1
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=1}] run scoreboard players set @s wl_event_pending 1
