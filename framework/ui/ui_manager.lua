UIManager = {}

UIManager.ShowUI = function(ui)
    local uiEntity = __Class(ui):__Extends(BaseUIEntity)
    local ui = UIManager.NewUI(uiEntity)
    ui:Show()
    return ui
end

UIManager.InstantiateUI = function(uiType, parent)
    local uiClass = __Class(uiType):__Extends(BaseUIEntity)
    local uiEntity = UIManager.NewUI(uiClass)
    uiEntity.transform.SetParent(parent)
    return uiEntity
end

UIManager.NewUI = function(uiClass)
    local uiInstance = UIManager.LoadUIAsset(uiClass)
    local uiEntity = uiClass:__New()
    UIManager.BindEntityController(uiEntity, uiInstance)
    UICanvas.PushUI(uiEntity)
    return uiEntity
end

UIManager.LoadUIAsset = function(uiClass)
    local uiAssetSlug = uiClass.slug
    local uiAsset = ResAllocator.LoadUI(uiAssetSlug)
    local uiInstance = ResAllocator.Instantiate(uiAsset)
    return uiInstance;
end

UIManager.BindEntityController = function(uiEntity, uiInstance)
    uiEntity.gameObject = uiInstance
    uiEntity.transform = uiInstance.transform

    local controller = uiInstance:GetComponent(typeof(UIEntityController))
    uiEntity.controller = controller

    local listCompUnits = controller.listCompUnits;
    for _, unit in pairs(listCompUnits) do
        local fieldName = unit.fieldName
        uiEntity[fieldName] = unit.component
    end

    uiEntity:Load()
end
