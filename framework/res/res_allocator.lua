ResAllocator = {}

local uiAssetRootSlug = "Prefabs/UI/"

ResAllocator.Instantiate = function(asset)
    return ResourceManager.Instantiate(asset)
end

ResAllocator.LoadUI = function(slug)
    return ResourceManager.LoadPrefab(uiAssetRootSlug .. slug)
end
