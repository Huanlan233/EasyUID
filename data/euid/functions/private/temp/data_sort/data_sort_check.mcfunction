execute store result score $InputCount euid.temp run data get storage euid:data_temp Input.In

execute if score $InputCount euid.temp = $success euid.temp run data modify storage euid:data Players set from storage euid:data_temp Input.In
execute unless score $InputCount euid.temp = $success euid.temp run function euid:private/temp/data_sort/data_sort_in_temp