execute as @e[type=villager,tag=wl_anchor_primary] at @s run tag @e[type=villager,tag=wl_anchor_primary,r=20,rm=1,c=10] add wl_anchor_duplicate
execute as @e[tag=wl_anchor_duplicate] run tag @s remove wl_anchor_primary
execute as @e[tag=wl_anchor_duplicate] run tag @s add wl_anchor_member
execute as @e[tag=wl_anchor_duplicate] run scoreboard players set @s wl_anchor_status 8
execute if entity @e[tag=wl_anchor_duplicate] run scoreboard players add #sys wl_perf_duplicate_cleanups 1
