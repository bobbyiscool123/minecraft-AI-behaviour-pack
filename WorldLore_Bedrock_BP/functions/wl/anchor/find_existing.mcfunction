execute as @e[type=villager,tag=wl_anchor_primary,r=48] run scoreboard players set @s wl_anchor_status 3
scoreboard players set #sys wl_perf_anchor_count 0
execute as @e[tag=wl_anchor_primary] run scoreboard players add #sys wl_perf_anchor_count 1
