scoreboard players reset $0 euid.temp
scoreboard players reset $1 euid.temp

execute if data storage euid:data_temp Input.In[0] store result score $0 euid.temp run data get storage euid:data_temp Input.In[0].UID
execute if data storage euid:data_temp Input.In[1] store result score $1 euid.temp run data get storage euid:data_temp Input.In[1].UID
execute store result score $InputCount euid.temp run data get storage euid:data_temp Input.In


# 如果 $0 > $1 互换元素 index 位置
execute if score $0 euid.temp > $1 euid.temp run data modify storage euid:data_temp Input.In prepend from storage euid:data_temp Input.In[1]
execute if score $0 euid.temp > $1 euid.temp run data remove storage euid:data_temp Input.In[2]

# 将 In[0] 插入到 Out[-1]
data modify storage euid:data_temp Input.Out append from storage euid:data_temp Input.In[0]
data remove storage euid:data_temp Input.In[0]

# 获取 $InputCount
execute store result score $InputCount euid.temp run data get storage euid:data_temp Input.In

# $InputCount != 0
execute if score $InputCount euid.temp matches 1.. run function euid:private/temp/data_sort/data_sort_in_temp

# $InputCount == 0
scoreboard players reset $success euid.temp
execute if score $InputCount euid.temp matches 0 run function euid:private/temp/data_sort/data_sort_out_temp
