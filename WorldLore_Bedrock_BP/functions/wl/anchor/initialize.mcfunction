execute as @e[tag=wl_anchor_candidate] run tag @s add wl_anchor_primary
execute as @e[tag=wl_anchor_primary,scores={wl_anchor_status=1}] run scoreboard players set @s wl_anchor_status 3
execute as @e[tag=wl_anchor_primary,scores={wl_place_id=0}] run scoreboard players random @s wl_place_id 1000 999999
execute as @e[tag=wl_anchor_primary,scores={wl_anchor_id=0}] run scoreboard players operation @s wl_anchor_id = @s wl_place_id
execute as @e[tag=wl_anchor_primary,scores={wl_place_base=0}] run function wl/place/assign_dna
execute as @e[tag=wl_anchor_candidate] run tag @s remove wl_anchor_candidate
