shared = {}
shared.getUsedTarget = function()
    if GetResourceState('ox_target') == 'started' then
        return 'ox_target'
    elseif GetResourceState('qb-target') == 'started' then
        return 'qb-target'
    else
        return 'none'
    end
end

shared.getUsedFramework = function()
    if GetResourceState('es_extended') == 'started' then
        return 'esx'
    elseif GetResourceState('ox_core') == 'started' then
        return 'ox_core'
    elseif GetResourceState('qb-core') == 'started' then
        return 'qb-core'
    elseif GetResourceState('qbx_core') == 'started' or GetResourceState('qbox') == 'started' then
        return 'qbox'
    else
        return 'none'
    end
end

shared.defineFramework = function()
    local used = shared.getUsedFramework()
    if used == 'esx' then
        shared.framework = exports['es_extended']:getSharedObject()
        debug.print('Detected: ESX')
    elseif used == 'ox_core' then
        shared.framework = exports['ox_core']:GetCoreObject()
        debug.print('Detected: OX_CORE')
    elseif used == 'qb-core' then
        shared.framework = exports['qb-core']:GetCoreObject()
        debug.print('Detected: QB-CORE')
    elseif used == 'qbox' then
        shared.framework = exports['qbx_core']:GetCoreObject()
        debug.print('Detected: QBOX')
    else
        debug.print('Have not detected any framework')
        shared.framework = nil
    end
end
