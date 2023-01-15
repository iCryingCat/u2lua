__Object__ = {
    name = 'object'
}
setmetatable(__Object__, {})

function __Object__.__Clone(source)
    local lookup_table = {}
    local function _Copy(obj)
        if type(obj) ~= "table" then
            return obj
        elseif lookup_table[obj] then
            return lookup_table[obj]
        end
        local newObj = {}
        lookup_table[obj] = newObj
        for key, value in pairs(obj) do
            newObj[_Copy(key)] = _Copy(value)
        end
        return setmetatable(newObj, getmetatable(obj))
    end

    return _Copy(source)
end
