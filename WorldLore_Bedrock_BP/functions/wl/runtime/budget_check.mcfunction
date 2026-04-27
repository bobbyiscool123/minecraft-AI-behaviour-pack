scoreboard players set #sys wl_runtime_budget 25
execute if score #sys wl_debug matches 1 run tellraw @a[tag=wl_debug_viewer] {"rawtext":[{"text":"[WorldLore] budget=25"}]}
