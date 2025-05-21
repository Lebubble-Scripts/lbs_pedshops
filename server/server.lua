local locations = {
    {loc = vector3(813.28, -252.25, 65.99), name = "Location 1"},
    {loc = vector3(820.76, -244.4, 65.98), name = "Location 2"},
    {loc = vector3(833.41, -248.55, 65.85), name = "Location 3"},
}


local Items = Config.Items


GlobalState.PedSalesLoc = locations
GlobalState.PedSalesItems = Items

local function verifyItem(item)
    if Config.Framework == 'qb' then 
        if QBCore.Shared.Items[item] then 
            return QBCore.Shared.Items[item]
        else
            return false
        end
    else
        return Items[item]
    end
end

local function verifyPrice(item)
    local itemPrice = Items[item]
    return itemPrice
end

local function checkDist(src, location)
    local pcoord = GetEntityCoords(GetPlayerPed(src))
    for _, v in pairs(locations) do
        local dist = #(pcoord - v.loc)
        if dist < 3.0 then
            return true
        end
    end
    return false
end

RegisterServerEvent('lbs_pedshops:server:buyItem', function(item, price, amount)
    local src = source
    local Player = getPlayer(src)
    local itemPrice = verifyPrice(item)
    if not verifyItem(item) then return end
    if type(itemPrice) ~= "number" then return end
    if not checkDist(src, location) then return end

    if Player.Functions.RemoveMoney('cash', (itemPrice * amount)) then 
        addItem(src, item, amount)
        notifyPlayerTransaction(src, item, (itemPrice  * amount),amount, 'buy')
    end

end)


RegisterServerEvent('lbs_pedshops:server:sellItem', function(item, price, amount)
    local src = source
    local Player = getPlayer(src)
    local itemPrice = verifyPrice(item)
    if not verifyItem(item) then return end
    if type(itemPrice) ~= "number" then return end
    if not checkDist(src, location) then return end
    if Player.Functions.RemoveItem(item, amount) then 
        Player.Functions.AddMoney('cash', ((itemPrice * 0.5) * amount))
        notifyPlayerTransaction(src, item, ((itemPrice * 0.5) * amount), amount, 'sell')
    end
end)

