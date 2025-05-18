function getImage(item)
    if GetResourceState('ox_inventory') == 'started' then
        local Items = exports.ox_inventory:Items()
        if Items[item] then 
            if Items[item].client then 
                if Items[item].client.image then 
                    return Items[item].client.image
                else 
                    return Items[item]
                end
            else 
                return Items[item]
            end
        end
    elseif GetResourceState('qb-inventory') == 'started' then
        if QBCore.Shared.Items[item] then 
            if QBCore.Shared.Items[item].image then 
                print('Image found')
                print(QBCore.Shared.Items[item].image)
                return 'nui://qb-inventory/html/images/' .. QBCore.Shared.Items[item].image
            else 
                return QBCore.Shared.Items[item]
            end
        end
    end
end

function getLabel(item)
    if GetResourceState('ox_inventory') == 'started' then
        local Items = exports.ox_inventory:Items()
        if Items[item] then 
            return Items[item].label
        end
    elseif GetResourceState('qb-inventory') == 'started' then
        return QBCore.Shared.Items[item].label
    end
end

function getItemCount(item)
    if GetResourceState('ox_inventory') == 'started' then
        local itemCount = exports.ox_inventory:GetItemCount(item)
        if itemCount then 
            return itemCount[item]
        else
            return 0 
        end
    elseif GetResourceState('qb-inventory') == 'started' then   
        local count = 0
        for k, v in pairs(QBCore.Functions.GetPlayerData().inventory) do 
            if v.name == item then 
                count = count + v.amount
            end
        end
        return count
    end
end