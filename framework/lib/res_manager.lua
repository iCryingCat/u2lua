ResManager = {}

local UI_ROOT_PATH = "Prefabs/UI/"

ResManager.Instantiate = function(path)
    return ResourceAllocator.Instantiate(path)
end

ResManager.LoadUI = function(path)
    local uipath = UI_ROOT_PATH .. path
    return ResourceAllocator.LoadPrefab(uipath)
end
