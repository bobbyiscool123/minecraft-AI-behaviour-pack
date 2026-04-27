# If no primary anchor exists near players, promote a member as replacement.
execute as @a at @s unless entity @e[type=villager,tag=wl_anchor_primary,r=48,c=1] if entity @e[type=villager,tag=wl_anchor_member,r=48,c=1] run tag @e[type=villager,tag=wl_anchor_member,r=48,c=1] add wl_anchor_primary
execute as @a at @s unless entity @e[type=villager,tag=wl_anchor_primary,r=48,c=1] if entity @e[type=villager,tag=wl_anchor_member,r=48,c=1] run scoreboard players set @e[type=villager,tag=wl_anchor_primary,r=48,c=1] wl_anchor_status 6
execute as @a at @s unless entity @e[type=villager,tag=wl_anchor_primary,r=48,c=1] run function wl/anchor/mark_lost
