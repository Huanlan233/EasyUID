scoreboard players reset $0 euid.temp
scoreboard players reset $1 euid.temp

execute if data storage euid:data_temp Input.Out[0] store result score $0 euid.temp run data get storage euid:data_temp Input.Out[0].UID
execute if data storage euid:data_temp Input.Out[1] store result score $1 euid.temp run data get storage euid:data_temp Input.Out[1].UID
execute store result score $OutCount euid.temp run data get storage euid:data_temp Input.Out

# 检查正确
execute if score $OutCount euid.temp matches 2.. if score $1 euid.temp > $0 euid.temp run scoreboard players add $success euid.temp 1
execute if score $OutCount euid.temp matches 1 run scoreboard players add $success euid.temp 1

execute if score $OutCount euid.temp matches 2.. if score $1 euid.temp < $0 euid.temp run scoreboard players add $success euid.temp 1

# 如果 $0 > $1 互换元素 index 位置
execute if score $0 euid.temp > $1 euid.temp run data modify storage euid:data_temp Input.Out prepend from storage euid:data_temp Input.Out[1]
execute if score $0 euid.temp > $1 euid.temp run data remove storage euid:data_temp Input.Out[2]

# 将 Out[0] 插入到 In[-1]
data modify storage euid:data_temp Input.In append from storage euid:data_temp Input.Out[0]
data remove storage euid:data_temp Input.Out[0]

# 获取 $OutCount
execute store result score $OutCount euid.temp run data get storage euid:data_temp Input.Out

# $OutCount != 0
execute if score $OutCount euid.temp matches 1.. run function euid:private/temp/data_sort/data_sort_out_temp

# $OutCount == 0
execute if score $OutCount euid.temp matches 0 run function euid:private/temp/data_sort/data_sort_check