_CLS.BaseUIEntity = {}
BaseUIEntity = __Class(_CLS.BaseUIEntity)
BaseUIEntity.controller = nil
BaseUIEntity.gameObject = nil
BaseUIEntity.transform = nil
-- BaseUIEntity.pathAsset = error("未绑定预制体资源")

function BaseUIEntity:Load()
    self:BindComponentUnits()
    self:OnBindEvents()
    self:OnLoaded()
end

function BaseUIEntity:Show()
    self.gameObject:SetActive(true)
    self:OnShowed()
end

function BaseUIEntity:Hide()
    self.gameObject:SetActive(false)
    self:OnHided()
end

function BaseUIEntity:Close()
    self:Hide()
    self:OnClosed()
end

function BaseUIEntity:Dispose()
    self:Close()
    self:OnDisposed()
end

function BaseUIEntity:GetComponentUnit(index)
    return self.controller:GetComponentUnit(index).component
end

function BaseUIEntity:BindComponentUnits() end

-- ui生命周期函数
function BaseUIEntity:OnBindEvents() end

function BaseUIEntity:OnLoaded() end

function BaseUIEntity:OnShowed() end

function BaseUIEntity:OnHided() end

function BaseUIEntity:OnClosed() end

function BaseUIEntity:OnDisposed() end
