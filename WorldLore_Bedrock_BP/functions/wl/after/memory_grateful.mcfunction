function wl/scenelet/village_grateful
execute as @s run function wl/messages/aftermath/m001
scoreboard players set @s wl_place_history 8
scoreboard players set @s wl_after_cooldown 400
scoreboard players add #sys wl_perf_after_calls 1
