# WorldLore root tick (safe pre-setup)
scoreboard players add #tick wl_perf_tick_calls 1
execute unless score #sys wl_initialized matches 1 run function wl/setup
execute if score #sys wl_initialized matches 1 run function wl/runtime/tick
