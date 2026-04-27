# WorldLore root tick (safe if setup never ran)
execute unless score #sys wl_initialized matches 1 run function wl/setup
execute if score #sys wl_initialized matches 1 run function wl/runtime/tick
