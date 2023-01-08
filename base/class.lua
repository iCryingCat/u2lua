require("u2lua/base/type")

_CLS = {}
_G._CLS = _CLS

__Class = function(_c)
    if _c.__type then
        error("类型：" .. _c .. "已定义！")
    end
    local class = _c
    class.__type = __Type__
    function class:__Ctor(...) end

    function class:__Extends(baseType)
        if type(baseType) ~= "table" then
            error("基类：" .. baseType .. "不是table类型！")
        end

        if baseType.__type == nil then
            error("基类：" .. baseType .. "未定义！")
        end

        class.base = baseType
        class.__index = baseType
        setmetatable(class, baseType)
        return class
    end

    function class:__New(...)
        local obj = {}
        for k, v in pairs(self) do
            obj[k] = v
        end
        obj.__index = class
        setmetatable(obj, class)

        obj:__Ctor(...)
        return obj
    end

    class.__index = class
    setmetatable(class, {})
    return class
end
