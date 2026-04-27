# Promote local member if primary is missing
execute as @e[tag=wl_anchor_member,tag=!wl_anchor_primary,c=1,sort=nearest] run tag @s add wl_anchor_primary
execute as @e[tag=wl_anchor_primary,scores={wl_anchor_status=8}] run scoreboard players set @s wl_anchor_status 6
