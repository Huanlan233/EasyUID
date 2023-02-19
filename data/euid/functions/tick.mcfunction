# $euid.uid_max
execute as @a if score @s euid.uid >= $euid.uid_max euid.uid run scoreboard players add $euid.uid_max euid.uid 1
# $euid.uid_player_max
execute as @a if score @s euid.uid > $euid.uid_player_max euid.uid run scoreboard players operation $euid.uid_player_max euid.uid = @s euid.uid

execute as @a unless score @s euid.uid = @s euid.uid run data modify storage euid:data Players append value {UID:-1,UUID:[-1,-1,-1,-1]}

# 记录UID和UUID
execute as @a unless score @s euid.uid = @s euid.uid run data modify storage euid:data Players[-1].UUID set from entity @s UUID
execute as @a unless score @s euid.uid = @s euid.uid store result storage euid:data Players[-1].UID int 1 run scoreboard players operation @s euid.uid = $euid.uid_max euid.uid

