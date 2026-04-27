scoreboard players add #sys wl_perf_scan_calls 1
execute as @a at @s run function wl/anchor/find_existing
execute as @a at @s unless entity @e[type=villager,tag=wl_anchor_primary,r=48,c=1] run function wl/anchor/create_candidate
function wl/anchor/prevent_duplicates
