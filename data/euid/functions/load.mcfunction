scoreboard objectives add euid.uid dummy

scoreboard objectives add euid.constant dummy
scoreboard players set #1 euid.constant 1

scoreboard objectives add euid.temp dummy

data remove storage euid:result Result
data remove storage euid:input Input