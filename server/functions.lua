function getPlayer(source)
    if Config.Framework == 'qb' then
        return QBCore.Functions.GetPlayer(source)
    elseif Config.Framework == 'esx' then
        return ESX.GetPlayerFromId(source)
    elseif Config.Framework == 'qbx' then 
        return qbx:GetPlayer(source)
    end
end


function getPlayerName(source)
    local Player = getPlayer(source)
    if Config.Framework == 'qb' then
        return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    elseif Config.Framework == 'esx' then
        return Player.getName()
    elseif Config.Framework == 'qbx' then
        return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    end
end

function getItemCount(item)
    local Player = getPlayer(source)
    if GetResourceState('ox_inventory') == 'started' then
        return exports.ox_inventory:GetItemCount(source, item)
    elseif GetResourceState('qb-inventory') == 'started' then
        return Player.Functions.GetItemByName(item).amount
    end
    return 0
end

function addItem(source, item, amount)
    local src = source
    if GetResourceState('ox_inventory') == 'started' then
        print('Adding item: ' .. item)
        exports.ox_inventory:AddItem(src, item, amount)
    elseif GetResourceState('qb-inventory') == 'started' then
        exports['qb-inventory']:AddItem(src, item, amount)
    end
end

function notifyPlayerTransaction(source, item, price, amount, action)
    if action == 'sell' then 
        action = 'sold'
    elseif action == 'buy' then 
        action = 'bought'
    end 
    if Config.Notify == 'ox' then
        TriggerClientEvent('ox_lib:notify', source, {
            title = "Success",
            description = "You ".. action .. ' ' .. amount .. ' ' .. item .. " for $" .. price,
            type = "success",
        })
    elseif Config.Notify == 'qb' then
        TriggerClientEvent('QBCore:Notify', source, "You " .. action .. ' '.. amount .. ' ' .. item .. " for $" .. price, "success")
    end
end

