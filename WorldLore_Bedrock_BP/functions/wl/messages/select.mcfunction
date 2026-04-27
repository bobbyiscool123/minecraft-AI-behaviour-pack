# Runtime-safe message selector with anti-spam cooldown
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=1..}] run scoreboard players add @s wl_event_fatigue 0
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0}] run scoreboard players random @s wl_message_roll 1 4
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=1,wl_message_roll=1}] at @s run function wl/messages/witch/m001
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=1,wl_message_roll=2}] at @s run function wl/messages/witch/m002
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=2,wl_message_roll=1}] at @s run function wl/messages/pillager/m001
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=2,wl_message_roll=2}] at @s run function wl/messages/pillager/m002
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=3,wl_message_roll=1}] at @s run function wl/messages/portal/m001
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=3,wl_message_roll=2}] at @s run function wl/messages/portal/m002
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=0,wl_message_roll=1}] at @s run function wl/messages/village/m001
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0,wl_place_threat=0,wl_message_roll=2}] at @s run function wl/messages/village/m002
execute as @e[tag=wl_anchor_primary,scores={wl_message_cooldown=0}] run scoreboard players set @s wl_message_cooldown 120
