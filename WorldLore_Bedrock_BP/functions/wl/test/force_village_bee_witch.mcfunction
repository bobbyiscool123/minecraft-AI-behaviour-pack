execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_place_threat 1
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/scenelet/bees_restless
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/messages/witch/m02
