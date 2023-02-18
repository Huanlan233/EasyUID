data modify storage euid:data_temp Input set from storage euid:data Players

scoreboard objectives add euid.temp dummy

function euid:private/temp/data_remove_temp

scoreboard objectives remove euid.temp

# 清空temp
data remove storage euid:data_temp Input