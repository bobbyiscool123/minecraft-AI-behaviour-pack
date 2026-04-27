# Update local threat context around each anchor without global scans
scoreboard players add #sys wl_perf_event_calls 1
execute as @e[tag=wl_anchor_primary] run scoreboard players set @s wl_place_threat 0
execute as @e[tag=wl_anchor_primary] at @s if entity @e[type=witch,r=32,c=1] run scoreboard players set @s wl_place_threat 1
execute as @e[tag=wl_anchor_primary] at @s if entity @e[type=pillager,r=40,c=1] run scoreboard players set @s wl_place_threat 2
execute as @e[tag=wl_anchor_primary] at @s if entity @e[type=zombie_pigman,r=40,c=1] run scoreboard players set @s wl_place_threat 3
execute as @e[tag=wl_anchor_primary] run function wl/place/update_mood
