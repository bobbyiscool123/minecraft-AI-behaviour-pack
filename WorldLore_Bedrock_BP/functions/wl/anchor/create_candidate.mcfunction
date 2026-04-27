# Primary candidates: villager first, golem fallback
execute as @e[type=villager,tag=!wl_anchor_primary,tag=!wl_anchor_member,r=40,c=1] run tag @s add wl_anchor_candidate
execute unless entity @e[type=villager,tag=wl_anchor_candidate,r=40,c=1] as @e[type=iron_golem,tag=!wl_anchor_primary,tag=!wl_anchor_member,r=40,c=1] run tag @s add wl_anchor_candidate
execute as @e[tag=wl_anchor_candidate] run scoreboard players set @s wl_anchor_status 1
execute as @e[tag=wl_anchor_candidate] run function wl/anchor/initialize
