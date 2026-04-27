function wl/runtime/clock
function wl/runtime/budget_check
execute if score #sys wl_clock matches 100 run function wl/runtime/phase_100_scan
execute if score #sys wl_clock matches 200 run function wl/runtime/phase_200_pressure
execute if score #sys wl_clock matches 300 run function wl/runtime/phase_300_select_event
execute if score #sys wl_clock matches 400 run function wl/runtime/phase_400_advance_event
execute if score #sys wl_clock matches 500 run function wl/runtime/phase_500_cleanup
function wl/runtime/failsafe
