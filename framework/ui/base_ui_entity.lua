BaseUIEntity = {}
local property = __Class(BaseUIEntity)
property.controller = nil
property.gameObject = nil
property.transform = nil

function property:Load()
    self:BindComponentUnits()
    self:OnBindEvents()
    self:OnLoaded()
end

function property:Show()
    self.gameObject:SetActive(true)
    self:OnShowed()
end

function property:Hide()
    self.gameObject:SetActive(false)
    self:OnHided()
end

function property:Close()
    self:Hide()
    self:OnClosed()
end

function property:Dispose()
    self:Close()
    self:OnDisposed()
end

function property:GetComponentUnit(index)
    return self.controller:GetComponentUnit(index).component
end

function property:BindComponentUnits() end

-- ui生命周期函数
function property:OnBindEvents() end

function property:OnLoaded() end

function property:OnShowed() end

function property:OnHided() end

function property:OnClosed() end

function property:OnDisposed() end
