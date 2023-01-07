_C.UIManager = {}
UIManager = __Class__(_C.UIManager)

local UI_ROOT_PATH = "Res/UI/Prefab/"

local LoadUIResource = function(path)
    local uipath = UI_ROOT_PATH .. path
    return ResManager.LoadPrefab(uipath)
end

local LoadUI = function(view)
    local uiPath = view.BindingPath()
    local uiPref = LoadUIResource(uiPath)
    local uiGO = ResourceManager.Instantiate(uiPref)
    return uiGO;
end

UIManager.BindGO = function(ui, go)
    ui.gameObject = go
    ui.transform = go.transform
    ui:Load()
end

UIManager.New = function(view)
    local uiGO = LoadUI(view)
    local ui = view:__New__()
    UIManager.BindGO(ui, uiGO)
    return ui
end

UIManager.Show = function(view)
    local ui = UIManager.New(view)
    return ui
end
