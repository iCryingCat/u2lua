UILayer = {
    scene = "scene",
    common = "common",
    touch = "touch",
    tips = "tips",
}

UINode = {
    low = "low",
    middle = "middle",
    top = "top",
}

UICanvas = {
    pathUICanvas = "UICanvas.prefab",

    scene = {
        canvas = nil,
        low = 1,
        middle = 2,
        top = 3,
    },
    common = {
        canvas = nil,
        low = 1,
        middle = 2,
        top = 3,
    },
    touch = {
        canvas = nil,
        low = 1,
        middle = 2,
        top = 3,
    },
    tips = {
        canvas = nil,
        low = 1,
        middle = 2,
        top = 3,
    },
}

UICanvas.LoadCanvas = function()
    local rootAsset = ResAllocator.LoadUI(UICanvas.pathUICanvas);
    local root = ResAllocator.Instantiate(rootAsset);

    local canvas = root:GetComponent(typeof(Canvas))
    canvas.renderMode = RenderMode.ScreenSpaceCamera
    canvas.worldCamera = Camera.main

    local layers = root:GetComponentsInChildren(typeof(Canvas))
    for i = 1, layers.Length - 1 do
        local layer = layers[i]
        local layerName = layer.gameObject.name
        UICanvas[layerName].canvas = layer
        local nodes = layer.gameObject:GetComponentsInChildren(typeof(RectTransform))
        for j = 1, nodes.Length - 1 do
            local node = nodes[j]
            local nodeName = node.gameObject.name
            UICanvas[layerName][nodeName] = node
        end
    end
end

UICanvas.PushUI = function(uiEntity)
    local tf = uiEntity.transform
    local tag = uiEntity.uiTag
    UICanvas.SetNodeParent(tf, tag)
end

UICanvas.SetNodeParent = function(tf, tag)
    local layer = tag.layer
    local node = tag.node
    if layer == nil then
        layer = UILayer.common
    end
    if node == nil then
        node = UINode.middle
    end
    local nodeParent = UICanvas[layer][node]
    tf:SetParent(nodeParent)
    tf.localScale = Vector3.one
    tf.localPosition = Vector3.zero
    tf.sizeDelta = Vector2.zero
end