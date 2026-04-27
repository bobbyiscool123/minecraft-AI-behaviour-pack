execute as @e[tag=wl_anchor_primary,scores={wl_event_pending=1}] run scoreboard players add @s wl_arc_stage 1
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_arc_pool=1}] run function wl/scenelet/bees_restless
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_arc_pool=2}] run function wl/scenelet/pillager_pressure_hint
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_arc_pool=3}] run function wl/scenelet/portal_omen
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=3,wl_arc_pool=1}] run function wl/scenelet/witch_smoke
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=4,wl_arc_pool=1}] run function wl/scenelet/bell_warning
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=5,wl_arc_pool=2}] run function wl/scenelet/villagers_hide_hint
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=8}] run function wl/after/memory_grateful
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=9}] run function wl/arc/reset_or_cooldown
