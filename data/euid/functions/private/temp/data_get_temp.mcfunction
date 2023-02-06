execute store result score @s euid.temp run data get storage euid:data_temp Players[-1].UID

execute unless score @s euid.uid = @s euid.temp run data remove storage euid:data_temp Players[-1]

execute if score @s euid.uid = @s euid.temp run data modify storage euid:return Player set from storage euid:data_temp Players[-1]

execute unless score @s euid.uid = @s euid.temp run function euid:private/temp/data_get_temp