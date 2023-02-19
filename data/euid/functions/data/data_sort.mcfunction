data modify storage euid:data_temp Input.In set from storage euid:data Players
data modify storage euid:data_temp Input.Out set value []

scoreboard objectives add euid.temp dummy

function euid:private/temp/data_sort/data_sort_in_temp

scoreboard objectives remove euid.temp
data remove storage euid:data_temp Input