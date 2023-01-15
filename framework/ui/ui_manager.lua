require 'u2lua/framework/lib/res_manager'

UIManager = {}
local property = __Class(UIManager)

property.LoadUIGO = function(view)
    local uiPath = view.pathAsset
    local uiPref = ResManager.LoadUI(uiPath)
    local uiGO = ResManager.Instantiate(uiPref)
    return uiGO;
end

property.BindGO = function(ui, go)
    local controller = go:GetComponent(typeof(UIEntityController))
    ui.controller = controller
    ui.gameObject = go
    ui.transform = go.transform
    print("BindGO", ui)
    ui:Load()
end

property.New = function(uiUnit)
    local uiGO = property.LoadUIGO(uiUnit)
    print("New", uiGO)
    local ui = uiUnit:__New()
    print("New", ui)
    property.BindGO(ui, uiGO)
    return ui
end

property.Show = function(uiUnit)
    print("Show", uiUnit)
    local ui = property.New(uiUnit)
    print("Show", ui)
    ui:Show()
    return ui
end
