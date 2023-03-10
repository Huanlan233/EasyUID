# 获取 Players[-1] 的 UID
execute store result score @s euid.temp run data get storage euid:data_temp Input[-1].UID

# 如果和玩家的UID不相同则移除 Players[-1]
execute unless score @s euid.uid = @s euid.temp run data remove storage euid:data_temp Input[-1]

# 如果相同则将结果返回到 euid:result Result.Content
execute if score @s euid.uid = @s euid.temp run data modify storage euid:result Result.Content set from storage euid:data_temp Input[-1]

# 递归执行
execute unless score @s euid.uid = @s euid.temp run function euid:private/temp/data_get_temp