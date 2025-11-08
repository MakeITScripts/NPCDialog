RegisterNetEvent('mkst/npcdialog/talk', function(data)
    local netId = NetworkGetEntityFromNetworkId(data.entity)
    Entity(netId).state:set('isTalking', true, true)
    if Entity(netId).state.pedName then
        return
    end

    Entity(netId).state:set('pedName', data.name, true)
    debug.print("Saved data about ped to his state")
end)
RegisterNetEvent('mkst/npcdialog/stopTalking', function(data)
    local netId = NetworkGetEntityFromNetworkId(data.entity)
    Entity(netId).state:set('isTalking', false, true)
end)
