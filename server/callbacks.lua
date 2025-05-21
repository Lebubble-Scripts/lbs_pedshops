lib.callback.register('lbs_pedshops:server:qb_getItemCount', function(source, item)
    local count = exports['qb-inventory']:GetItemCount(source, item)
    return count or 0 
end)