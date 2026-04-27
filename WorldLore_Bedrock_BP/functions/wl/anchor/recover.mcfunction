execute as @e[tag=wl_anchor_member,scores={wl_anchor_status=1..}] run tag @s add wl_anchor_primary
execute as @e[tag=wl_anchor_primary] run scoreboard players set @s wl_anchor_status 6
