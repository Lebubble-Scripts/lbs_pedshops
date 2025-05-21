Config = {}


Config.Notify = 'qb'        -- 'ox', 'qb'
Config.Framework = 'qb'     -- 'qbx', 'qb',


-- Do not change this unless you know what you are doing
if Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'qbx' then
    qbx = exports.qbx_core
end



-- If you are using qb-inventory, ensure the item names match the item names in qb-core/shared/items.lua
-- If you are using ox_inventory, ensure the item names match the item names in ox_inventory/data/items.lua
Config.Items = {
    lockpick = 10,          -- item = price
    bandage = 5,
    tosti = 2,
    water_bottle = 1,
}