local __object__ = {
    name = 'object'
}
setmetatable(__object__, {})

function __object__:__Clone__(obj)
    local lookup_table = {}
    local function _copy(o)
        if type(o) ~= "table" then
            return o
        elseif lookup_table[o] then
            return lookup_table[o]
        end
        local new_table = {}
        lookup_table[o] = new_table
        for key, value in pairs(o) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(o))
    end

    return _copy(obj)
end

return __object__
