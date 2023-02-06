scoreboard objectives add euid.uid dummy
scoreboard players set $euid.uid_max euid.uid 0
scoreboard players set $euid.uid_player_max euid.uid 0

scoreboard objectives add euid.constant dummy
scoreboard players set #1 euid.constant 1

scoreboard objectives add euid.temp dummy