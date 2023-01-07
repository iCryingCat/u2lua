_C.BaseView = {}
BaseView = __Class__(_C.BaseView)
BaseView.uiContainer = nil
BaseView.gameObject = nil
BaseView.transform = nil

function BaseView:Load()
    self:OnBindUGUI()
    self:OnBindEvents()
    self:OnLoaded()
end

function BaseView:Show()
    self.gameObject.SetActive(true)
    self:OnShowed()
end

function BaseView:Hide()
    self.gameObject.SetActive(false)
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

function BaseView:BindingPath() end
function BaseView:OnBindUGUI(index)
    return self.uiContainer:GetComponent(index).component
end

function BaseView:OnBindBaseView()

end

-- ui生命周期函数
function BaseView:OnBindEvents() end

function BaseView:OnLoaded() end

function BaseView:OnShowed() end

function BaseView:OnHided() end

function BaseView:OnClosed() end

function BaseView:OnDisposed() end
