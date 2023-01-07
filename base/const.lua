local __Const__ = {}
local definedMap = {}
__Const__.__newindex = function(t, k, v)
    if definedMap[k] == nil then
        definedMap[k] = v
    else
        error("不允许对常量赋值！")
    end
end;
__Const__.__index = definedMap
setmetatable(__Const__, {})

return __Const__
