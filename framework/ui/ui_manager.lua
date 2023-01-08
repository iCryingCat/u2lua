require 'u2lua/framework/lib/res_manager'

_CLS.UIManager = {}
UIManager = __Class(_CLS.UIManager)

local LoadUIGO = function(view)
    local uiPath = view.BindingPath()
    local uiPref = ResManager.LoadUI(uiPath)
    local uiGO = ResManager.Instantiate(uiPref)
    return uiGO;
end

UIManager.BindGO = function(ui, go)
    local container = go:GetComponent(typeof(UIContainer))
    ui.uiContainer = container
    ui.gameObject = go
    ui.transform = go.transform
    ui:Load()
end

UIManager.New = function(view)
    local uiGO = LoadUIGO(view)
    local ui = view:__New()
    UIManager.BindGO(ui, uiGO)
    return ui
end

UIManager.Show = function(view)
    local ui = UIManager.New(view)
    ui:Show()
    return ui
end
