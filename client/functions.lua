client.showNotify = function(text, type)
    local used = shared.getUsedFramework()
    type = type or 'info'
    if used == 'esx' and shared.framework then
        shared.framework.ShowNotification(text)
    elseif used == 'ox_core' then
        lib.notify({
            title = Config.Locale.NotifyTitle,
            description = text,
            type = type
        })
    elseif used == 'qb-core' and shared.framework then
        shared.framework.shared.Notify(text, type)
    elseif used == 'qbox' and shared.framework then
        shared.framework.shared.Notify(text, type)
    else
        SetNotificationTextEntry("STRING")
        AddTextComponentSubstringPlayerName(text)
        DrawNotification(false, true)
    end
end
client.getPedGender = function(entity)
    return GetPedType(entity) == 4 and 'M' or 'F'
end
client.getName = function(gender)
    local firstName = Config.FirstNames[gender][math.random(1, #Config.FirstNames[gender])]
    local lastName = Config.LastNames[math.random(1, #Config.LastNames)]
    return firstName .. ' ' .. lastName
end
client.getSpawnName = function(entity)
    if not DoesEntityExist(entity) then
        return "u_m_y_imporage"
    end
    local name = GetEntityArchetypeName(entity)
    if not name or name == "" then
        return "u_m_y_imporage"
    end

    return name
end

local persistentPeds = {}

client.spawnPed = function(modelName, coords, heading)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end
    local ped = CreatePed(4, model, coords.x, coords.y, coords.z, heading or 0.0, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    persistentPeds[ped] = true
    SetEntityInvincible(ped, true)
    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanRagdoll(ped, false)
    SetPedFleeAttributes(ped, 0, false)
    SetPedCombatAttributes(ped, 46, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanBeTargetted(ped, false)
    SetPedKeepTask(ped, true)
    TaskStandStill(ped, -1)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetModelAsNoLongerNeeded(model)
    return ped
end

Citizen.CreateThread(function()
    while true do
        Wait(10000)
        for p, _ in pairs(persistentPeds) do
            if not DoesEntityExist(p) then
                persistentPeds[p] = nil
                debug.print("Ped despawned, respawning")
            else
                SetEntityAsMissionEntity(p, true, true)
                SetEntityInvincible(p, true)
                SetEntityProofs(p, true, true, true, true, true, true, true, true)
                SetBlockingOfNonTemporaryEvents(p, true)
                SetPedCanBeTargetted(p, false)
                SetPedKeepTask(p, true)
                TaskStandStill(p, -1)
            end
        end
    end
end)
