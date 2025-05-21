repeat 
    Wait(1)
    print('Waiting for GlobalState.PedSalesLoc and GlobalState.PedSalesItems')
until GlobalState.PedSalesLoc ~= nil and GlobalState.PedSalesItems ~= nil


local location = GlobalState.PedSalesLoc
local items = GlobalState.PedSalesItems
local peds = {}

local function openSellMenu(shopId)
    local menu = {}
    for k, v in pairs(items) do 
        menu[#menu + 1] = {
            title = getLabel(k),
            description = "Price: $" .. v,
            icon = getImage(k),
            onSelect = function()
                local itemCount = getItemCount(k)
                if itemCount == 0 then 
                    notifyPlayerTransactionFailure(PlayerPedId(), "You don't have any " .. getLabel(k) .. "s to sell.")
                    return
                end
                local input = lib.inputDialog('Sell Amount', {
                    {type = 'slider', label = 'Amount', min = 1, max = itemCount, default = 1}
                })
                if input and input[1] then 
                    TriggerServerEvent('lbs_pedshops:server:sellItem', k, v, input[1])
                end
            end
        }
    end
    lib.registerContext({
        id = 'ped_sales',
        title = "Sales Menu",
        options = menu
    })
    lib.showContext('ped_sales')
end

local function openBuyMenu(shopId)
    local menu = {}
    for k, v in pairs(items) do 
        menu[#menu + 1] = {
            title = getLabel(k),
            description = "Price: $" .. v,
            icon = getImage(k),
            onSelect = function()
                local itemCount = getItemCount(k)
                local input = lib.inputDialog('Buy Amount', {
                    {type = 'slider', label = 'Amount', min = 1, max = 100, default = 1}
                })
                if input and input[1] then 
                    print('Buying ' .. input[1] .. ' of ' .. k)
                    TriggerServerEvent('lbs_pedshops:server:buyItem', k, v, input[1])
                end
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
                    openBuyMenu(k)
                end,
            }, 
            {
                name = "sell",
                icon = 'fas fa-shopping-cart',
                label = "Sell Items",
                onSelect = function()
                    openSellMenu(k)
                end,
            },
        })
    end
end

spawnPeds()