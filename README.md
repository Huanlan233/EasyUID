# EasyUID
一款简易的UID管理器。

## 使用

### data_get

`data_get` 会获取对应玩家的 `data` 并返回到 `euid:return` 里。
```MCFUNCTION
execute as <玩家> run function euid:data/data_get
```

假设 `Players` 列表中有一群玩家的 `data` 如下:
```JSON
Players:[{"UID":0,"UUID":[1,1,1,1]},{"UID":1,"UUID":[2,2,2,2]},{"UID":2,"UUID":[3,3,3,3]}]
```

如果想获取该玩家的 `data` , 那么返回值则为, `euid:return` :
```JSON
"Player":{"UID":0,"UUID":[1,1,1,1]}
```

### data_modify

`data_modify` 会从 `euid:input` 中的 `Input` 获取值, 将对应玩家的 `data` 的某一值进行改变(已有元素)或者增加(未有元素)。
```MCFUNCTION
execute as <玩家> run function euid:data/data_modify
```

假设 `Players` 列表中有一玩家的 `data` 如下:
```JSON
{"UID":0,"UUID":[1,1,1,1],"List":["1"]}
```

如果想修改该玩家的 `data` 内的 `List` , 则向 `euid:input` 输入:
```MCFUNCTION
data modify storage euid:input Input set value {List:["2","4"]}
```

那么该玩家的 `data` 内的 `List` 会变为
假设`data`列表中有一玩家的值如下:
```JSON
{"UID":0,"UUID":[1,1,1,1],"List":["2","4"]}
```

### data_remove

`data_remove` 会执行 `#euid:data_remove`, 你可以在内添加自定义移除内容
```MCFUNCTION
execute as <玩家> run function euid:data/data_remove
```

假设 `Players` 列表中有一玩家的 `data` 如下:
```JSON
{"UID":0,"UUID":[1,1,1,1],"List":["1"]}
```

如果想删除该玩家的 `data` 内的 `List`, 则向 `#euid:data_remove` 添加删除函数:
```JSON
{
    "values": [
        "example:rm/list"
    ]
}
```
同时你可以在删除函数内添加限定条件等:
```MCFUNCTION
execute if ...... run data remove storage euid:data_temp Players[-1].将移除的NBT
```

## 注意事项

- 当玩家列表过大那么 `data_modify` 和 `data_get` (默认最大同时执行指令的数量为65536,如果出现此类问题请将最大同时执行指令增加)
- 当 `data_modify` 执行完后不会自动清除 `euid:input` 的内容