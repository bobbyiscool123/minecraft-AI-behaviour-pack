execute if score #sys wl_active_place wl_active_place matches 1.. run scoreboard players set #sys wl_event_pending 1
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=0,wl_arc_cooldown=0}] run scoreboard players set @s wl_event_pending 1
