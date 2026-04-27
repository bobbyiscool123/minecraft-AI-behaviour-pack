# Candidate anchor: nearest villager first (village-like PR1)
execute as @e[type=villager,tag=!wl_anchor_primary,tag=!wl_anchor_member,r=40,c=1,sort=nearest] run tag @s add wl_anchor_candidate
execute as @e[tag=wl_anchor_candidate] run scoreboard players set @s wl_anchor_status 1
execute if entity @e[tag=wl_anchor_candidate] run function wl/anchor/initialize
