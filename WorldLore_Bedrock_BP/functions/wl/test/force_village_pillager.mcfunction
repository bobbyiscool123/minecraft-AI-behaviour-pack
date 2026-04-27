execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] run scoreboard players set @s wl_place_threat 2
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/scenelet/pillager_pressure_hint
execute as @e[tag=wl_anchor_primary,c=1,sort=nearest] at @s run function wl/messages/pillager/m02
