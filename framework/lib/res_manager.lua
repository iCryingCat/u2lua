ResManager = {}
local property = __Class(ResManager)

local UI_ROOT_PATH = "Prefabs/UI/"

property.Instantiate = function(path)
    return ResourceAllocator.Instantiate(path)
end

property.LoadUI = function(path)
    local uipath = UI_ROOT_PATH .. path
    return ResourceAllocator.LoadPrefab(uipath)
end
