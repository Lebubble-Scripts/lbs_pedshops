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
        if QBCore.Shared.Items[item] then 
            print('Label found')
            print(QBCore.Shared.Items[item].label)
            return QBCore.Shared.Items[item].label
        end
    else 
        return 'Item not found'
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
        local itemCount = lib.callback.await('lbs_pedshops:server:qb_getItemCount', false, item)
        print('Item count: ' .. itemCount)
        return itemCount or 0
    end
end


function notifyPlayerTransactionFailure(src, message)
    if Config.Notify == 'ox' then
        TriggerEvent('ox_lib:notify', src, {
            title = "Success",
            description = message,
            type = 'error',
        })
    elseif Config.Notify == 'qb' then
        TriggerEvent('QBCore:Notify', message, 'error')
    end
end