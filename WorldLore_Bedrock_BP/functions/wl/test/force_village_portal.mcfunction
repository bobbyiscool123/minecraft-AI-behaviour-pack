execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_place_threat 3
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/scenelet/portal_omen
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/messages/portal/m02
