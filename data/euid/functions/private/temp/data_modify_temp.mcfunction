# 获取 Players[-1] 的 UID
execute store result score @s euid.temp run data get storage euid:data_temp Input[-1].UID
# 如果和玩家的 UID 不相同则将 Players[-1] 移到列表开头, Players[-2] 变成 Players[-1] 继续检测
execute unless score @s euid.uid = @s euid.temp run data modify storage euid:data_temp Input prepend from storage euid:data_temp Input[-1]

execute unless score @s euid.uid = @s euid.temp run data remove storage euid:data_temp Input[-1]
# 如果相同则获取 euid:input 的内容进行修改
execute if score @s euid.uid = @s euid.temp run data modify storage euid:data_temp Input[-1] merge from storage euid:input Input

execute if score @s euid.uid = @s euid.temp run data modify storage euid:data Players set from storage euid:data_temp Input
# 递归执行
execute unless score @s euid.uid = @s euid.temp run function euid:private/temp/data_modify_temp