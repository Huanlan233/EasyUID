# $euid.uid_max
execute as @a if score @s euid.uid >= $euid.uid_max euid.uid run scoreboard players operation $euid.uid_max euid.uid += #1 euid.constant
# $euid.uid_player_max
execute as @a if score @s euid.uid > $euid.uid_player_max euid.uid run scoreboard players operation $euid.uid_player_max euid.uid = @s euid.uid

execute as @a unless score @s euid.uid = @s euid.uid run data modify storage euid:data Players append value {UID:-1,UUID:[-1,-1,-1,-1]}
execute as @a unless score @s euid.uid = @s euid.uid run function #euid:register_nbt

execute as @a unless score @s euid.uid = @s euid.uid run scoreboard players operation @s euid.uid = $euid.uid_max euid.uid

# 记录UID和UUID
execute as @a if score @s euid.uid = $euid.uid_player_max euid.uid store result storage euid:data Players[-1].UID int 1 run scoreboard players get @s euid.uid
execute as @a if score @s euid.uid = $euid.uid_player_max euid.uid store result storage euid:data Players[-1].UUID[0] int 1 run data get entity @s UUID[0]
execute as @a if score @s euid.uid = $euid.uid_player_max euid.uid store result storage euid:data Players[-1].UUID[1] int 1 run data get entity @s UUID[1]
execute as @a if score @s euid.uid = $euid.uid_player_max euid.uid store result storage euid:data Players[-1].UUID[2] int 1 run data get entity @s UUID[2]
execute as @a if score @s euid.uid = $euid.uid_player_max euid.uid store result storage euid:data Players[-1].UUID[3] int 1 run data get entity @s UUID[3]