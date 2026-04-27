execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=8,wl_after_cooldown=0}] run scoreboard players set @s wl_after_pending 1
execute as @e[tag=wl_anchor_primary,scores={wl_after_pending=1}] run scoreboard players set @s wl_after_cooldown 220
