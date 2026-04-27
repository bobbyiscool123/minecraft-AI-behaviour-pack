# Advance at low frequency while pending
execute as @e[tag=wl_anchor_primary,scores={wl_event_pending=1}] run scoreboard players add @s wl_arc_stage 1

# Threat-specific scenelets + messages
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_place_threat=1}] at @s run function wl/scenelet/bees_restless
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_place_threat=1}] at @s run function wl/messages/witch/m01

execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=3,wl_place_threat=2}] at @s run function wl/scenelet/pillager_pressure_hint
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=3,wl_place_threat=2}] at @s run function wl/messages/pillager/m01

execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=4,wl_place_threat=3}] at @s run function wl/scenelet/portal_omen
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=4,wl_place_threat=3}] at @s run function wl/messages/portal/m01

# generic village hints
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_place_threat=0}] at @s run function wl/scenelet/bell_warning
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=2,wl_place_threat=0}] at @s run function wl/messages/village/m01

# Memory stage
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=8}] run function wl/after/memory_grateful
execute as @e[tag=wl_anchor_primary,scores={wl_arc_stage=9}] run function wl/arc/reset_or_cooldown
