execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2..5,wl_scenelet_cooldown=0}] run scoreboard players set @s wl_scenelet_pending 1
execute as @e[tag=wl_anchor_primary,scores={wl_scenelet_pending=1}] run scoreboard players set @s wl_scenelet_cooldown 80
