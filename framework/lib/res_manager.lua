_CLS.ResManager = {}
ResManager = __Class(_CLS.ResManager)

local UI_ROOT_PATH = "ui/prefabs/"

ResManager.Instantiate = function(path)
    return ResourceManager.Instantiate(path)
end

ResManager.LoadUI = function(path)
    local uipath = UI_ROOT_PATH .. path
    return ResourceManager.LoadPrefab(uipath)
end
