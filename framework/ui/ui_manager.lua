require 'u2lua/framework/lib/res_manager'

_CLS.UIManager = {}
UIManager = __Class(_CLS.UIManager)

local LoadUIGO = function(view)
    local uiPath = view.pathAsset
    local uiPref = ResManager.LoadUI(uiPath)
    local uiGO = ResManager.Instantiate(uiPref)
    return uiGO;
end

UIManager.BindGO = function(ui, go)
    print(go)
    local controller = go:GetComponent(typeof(UIEntityController))
    print(controller)
    ui.controller = controller
    ui.gameObject = go
    ui.transform = go.transform
    ui:Load()
end

UIManager.New = function(uiUnit)
    local uiGO = LoadUIGO(uiUnit)
    local ui = uiUnit:__New()
    UIManager.BindGO(ui, uiGO)
    return ui
end

UIManager.Show = function(uiUnit)
    local ui = UIManager.New(uiUnit)
    ui:Show()
    return ui
end
