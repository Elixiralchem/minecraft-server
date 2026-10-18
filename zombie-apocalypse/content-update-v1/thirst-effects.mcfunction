# Cross-platform thirst HUD. Vanilla Java datapacks cannot position custom graphics above hunger.
execute as @a[gamemode=!creative,gamemode=!spectator] run title @s actionbar [{"text":"THIRST ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"zs_thirst"},"color":"white"},{"text":"/20  •  Drink clean water","color":"gray"}]
execute as @a[gamemode=!creative,gamemode=!spectator,scores={zs_thirst=..6}] run effect give @s minecraft:slowness 3 0 true
execute as @a[gamemode=!creative,gamemode=!spectator,scores={zs_thirst=..3}] run effect give @s minecraft:weakness 3 0 true
execute as @a[gamemode=!creative,gamemode=!spectator,scores={zs_thirst=0}] run damage @s 1 minecraft:generic
