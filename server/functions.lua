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
    if Config.Inventory == 'ox' then
        return exports.ox_inventory:GetItemCount(source, item)
    elseif Config.Inventory == 'qb' then
        return Player.Functions.GetItemByName(item).amount
    end
end

function addItem(source, item)
    local src = source
    if Config.Inventory == 'ox' then
        print('Adding item: ' .. item)
        exports.ox_inventory:AddItem(src, item, 1)
    end
end