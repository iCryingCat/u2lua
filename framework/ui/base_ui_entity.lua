local UITag = {
    layer = nil,
    node = nil,
    needMask = nil,
    isSingleton = nil,
}

BaseUIEntity = __Class({
    gameObject = nil,
    transform = nil,
    controller = nil,
    uiTag = nil,
})

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

function BaseUIEntity:BindComponentUnits() end

-- ui生命周期函数
function BaseUIEntity:OnBindEvents() end

function BaseUIEntity:OnLoaded() end

function BaseUIEntity:OnShowed() end

function BaseUIEntity:OnHided() end

function BaseUIEntity:OnClosed() end
