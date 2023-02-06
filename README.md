# EasyUID
一款简易的UID管理器。

## 使用

### data_get

`data_get`会获取对应玩家的`data`并返回到`euid:return`里。
```MCFUNCTION
execute as <玩家> run function euid:data/data_get
```

假设`Players`列表中有一玩家的`data`如下:
```JSON
{"UID":0,"UUID":[114,114,114,114]}
```

如果想获取该玩家的`data`, 那么返回值则为, `euid:return`:
```JSON
"Player":{"UID":0,"UUID":[114,114,114,114]}
```

### data_modify

`data_modify`会从`euid:input`中的`Input`获取值, 将对应玩家的`data`的某一值进行改变(已有元素)或者增加(未有元素)。
```MCFUNCTION
execute as <玩家> run function euid:data/data_modify
```

假设`Players`列表中有一玩家的`data`如下:
```JSON
{"UID":0,"UUID":[114,114,114,114],"List":["1"]}
```

如果想修改该玩家的`data`内的`List`, 则向`euid:input`输入:
```MCFUNCTION
data modify storage euid:input Input append from storage value {List:["2","4"]}
```

那么该玩家的`data`内的`List`会变为
假设`data`列表中有一玩家的值如下:
```JSON
{"UID":0,"UUID":[114,114,114,114],"List":["2","4"]}
```

## 注意事项
`data_get`函数查找的时间复杂度为O(n)，列表数据越多则查找时间越长。