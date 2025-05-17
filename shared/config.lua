Config = {}


Config.Notify = 'ox'
Config.Framework = 'qb'
Config.Inventory = 'ox'

if Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qbx' then
    qbx = exports.qbx_core
end