_CLS.BaseView = {}
BaseView = __Class(_CLS.BaseView)
BaseView.uiContainer = nil
BaseView.gameObject = nil
BaseView.transform = nil

function BaseView:Load()
    self:BindVars()
    self:OnBindEvents()
    self:OnLoaded()
end

function BaseView:Show()
    self.gameObject:SetActive(true)
    self:OnShowed()
end

function BaseView:Hide()
    self.gameObject:SetActive(false)
    self:OnHided()
end

function BaseView:Close()
    self:Hide()
    self:OnClosed()
end

function BaseView:Dispose()
    self:Close()
    self:OnDisposed()
end

function BaseView:GetVar(index)
    return self.uiContainer:GetVar(index).component
end

function BaseView:BindingPath() end

function BaseView:BindVars()

end

-- ui生命周期函数
function BaseView:OnBindEvents() end

function BaseView:OnLoaded() end

function BaseView:OnShowed() end

function BaseView:OnHided() end

function BaseView:OnClosed() end

function BaseView:OnDisposed() end
