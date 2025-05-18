repeat 
    Wait(1)
    print('Waiting for GlobalState.PedSalesLoc and GlobalState.PedSalesItems')
until GlobalState.PedSalesLoc ~= nil and GlobalState.PedSalesPurchItems ~= nil


local location = GlobalState.PedSalesLoc
local purchItems = GlobalState.PedSalesPurchItems
local peds = {}

local function openShopMenu(shopId)
    local menu = {}
    for k, v in pairs(purchItems) do 
        menu[#menu + 1] = {
            title = getLabel(k),
            description = "Price: $" .. v,
            icon = getImage(k),
            onSelect = function()
                print('Selected item: ' .. k)
                TriggerServerEvent('lbs_pedshops:server:buyItem', k, v)
                TriggerServerEvent('test')
                print('triggered server event')
            end,
        }
    end
    lib.registerContext({
        id = 'ped_sales',
        title = "Sales Menu",
        options = menu
    })
    lib.showContext('ped_sales')
end

local function spawnPeds()
    for k, v in pairs(location) do
        local model = GetHashKey('a_m_m_business_01')
        RequestModel(model)
        repeat 
            Wait(10)
        until HasModelLoaded(model)
        peds[k] = CreatePed(4, 'a_m_m_business_01', v.loc.x, v.loc.y, v.loc.z - 1, 0.0, false, true)
        FreezeEntityPosition(peds[k], true)
        SetEntityInvincible(peds[k], true)
        SetBlockingOfNonTemporaryEvents(peds[k], true)
        SetModelAsNoLongerNeeded('a_m_m_business_01')
        exports.ox_target:addLocalEntity(peds[k], {
            {
                name = "buy",
                icon = 'fas fa-shopping-cart',
                label = "Buy Items",
                onSelect = function()
                    openShopMenu(k)
                end,
            }
            
            
        })
    end
end

spawnPeds()