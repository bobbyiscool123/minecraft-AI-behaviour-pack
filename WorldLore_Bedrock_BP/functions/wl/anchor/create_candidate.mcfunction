execute as @e[type=villager,tag=!wl_anchor_primary,r=40,c=1] run tag @s add wl_anchor_candidate
execute as @e[tag=wl_anchor_candidate] run scoreboard players set @s wl_anchor_status 1
execute as @e[tag=wl_anchor_candidate] run function wl/anchor/initialize
