require("u2lua/base/type")
require("u2lua/base/object")

_CLS = {}

__Class = function(t)
    if t.__type == __Type__ then
        error("类型：" .. t .. "已定义！")
    end
    local class = t
    class.__type = __Type__
    function class:__Ctor(...) end

    function class:__Extends(baseType)
        if type(baseType) ~= "table" then
            error("基类：" .. baseType .. "不是table类型！")
        end

        if baseType.__type == nil then
            error("基类：" .. baseType .. "未定义！")
        end

        self.base = baseType
        self.__index = baseType
        setmetatable(class, baseType)
        return class
    end

    function class:__New(...)
        local obj = __Object__.__Clone(self)
        obj:__Ctor(...)
        return obj
    end

    _CLS[class] = #_CLS
    class.__index = class
    setmetatable(class, {})
    return class
end
