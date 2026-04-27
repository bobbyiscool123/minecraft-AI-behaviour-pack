# Threat approximation from local entities (village-like PR1)
execute at @s if entity @e[type=witch,r=32,c=1] run scoreboard players set @s wl_place_threat 1
execute at @s if entity @e[type=pillager,r=40,c=1] run scoreboard players set @s wl_place_threat 2
execute at @s if entity @e[type=zombie_pigman,r=24,c=1] run scoreboard players set @s wl_place_threat 3
execute at @s unless entity @e[type=witch,r=32,c=1] unless entity @e[type=pillager,r=40,c=1] unless entity @e[type=zombie_pigman,r=24,c=1] run scoreboard players set @s wl_place_threat 0

# Mood from threat + memory
execute if score @s wl_place_history matches 8 run scoreboard players set @s wl_place_mood 8
execute if score @s wl_place_history matches 5 run scoreboard players set @s wl_place_mood 5
execute if score @s wl_place_history matches ..4 if score @s wl_place_threat matches 0 run scoreboard players set @s wl_place_mood 1
execute if score @s wl_place_history matches ..4 if score @s wl_place_threat matches 1..2 run scoreboard players set @s wl_place_mood 2
execute if score @s wl_place_history matches ..4 if score @s wl_place_threat matches 3.. run scoreboard players set @s wl_place_mood 3
