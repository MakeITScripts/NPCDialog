client.globalInit = function()
    if not Config.ToggleRandomDialogs then
        debug.print(
            "Talking with npc around map is toggle as false, if you want it change Config.ToggleRandomDialogs in config.lua to true")
        return
    end
    local usedTarget = shared.getUsedTarget()
    if usedTarget == "ox_target" then
        exports['ox_target']:addGlobalPed({{
            name = 'NPCTalk',
            label = Config.Locale.Talk,
            icon = 'fa-solid fa-comments',
            distance = 1.75,
            onSelect = function(data)
                client.onSelect(data)
            end,
            canInteract = function(entity)
                local interactResponse = client.canInteract(entity)
                return interactResponse
            end
        }})
    elseif usedTarget == "qb-target" then
        exports['qb-target']:AddGlobalPed({
            options = {{
                num = 1,
                icon = "fa-solid fa-comments",
                label = Config.Locale.Talk,
                targeticon = "fa-solid fa-comments",
                action = function(entity)
                    local data = {
                        entity = entity
                    }
                    client.onSelect(data)
                end,
                canInteract = function(entity, distance, data)
                    return client.canInteract(entity)
                end
            }},
            distance = 1.75
        })
    else
        debug.print(
            "You do not have any supported target in your resources (supported targets are: ox_target and qb-target). Your target isn't supported? Contact us at our discord: discord.gg/makeit, we can help :)")
    end
end
Citizen.CreateThread(client.globalInit)
client.canInteract = function(entity)
    if GetPedType(entity) == 28 or IsPedFleeing(entity) or IsPedAPlayer(entity) or IsPedInAnyVehicle(entity, false) or
        IsPedDeadOrDying(entity, 1) then
        return false
    end
    if IsPedInCombat(entity, cache.ped) or IsEntityAMissionEntity(entity) or IsPedRunningRagdollTask(entity) then
        return false
    end
    TaskTurnPedToFaceEntity(entity, cache.ped, -1)
    return true
end
client.onSelect = function(data)
    if Entity(data.entity).state.isTalking then
        return client.showNotify(Config.Locale.CurrentlyTalking, "error")
    end
    local gender = client.getPedGender(data.entity)
    local pedName = Entity(data.entity).state.pedName
    local netId = NetworkGetNetworkIdFromEntity(data.entity)
    local spawnName = client.getSpawnName(data.entity)
    if not pedName then
        pedName = client.getName(gender)
    end
    local dialog = Config.Dialogs[math.random(#Config.Dialogs)]
    if not dialog then
        return debug.print("Can't find aby dialogs, check if you configured them correctly in config.lua file")
    end
    TriggerServerEvent("mkst/npcdialog/talk", {
        entity = netId,
        name = pedName
    })
    SetNuiFocus(true, true)
    if inMenu then
        return
    end
    inMenu = true
    SendNUIMessage({
        eventName = "mkst/open/dialog",
        payload = {
            open = true,
            data = {
                pedSpawn = spawnName,
                pedName = pedName,
                pedJob = Config.Locale.Pedestrian,
                scenarios = {dialog}
            }
        }
    })
    client.createCam(data.entity)

end
currentEntity = nil
client.createCam = function(entity, isForce)
    if entity then
        currentEntity = entity
        PlayAmbientSpeech1(entity, 'GENERIC_HI', 'SPEECH_PARAMS_STANDARD')

        Wait(100)
        local pedCoords = GetEntityCoords(entity)
        if not isForce then
            TaskLookAtEntity(entity, cache.ped, -1, 2048, 3)
            TaskTurnPedToFaceEntity(entity, cache.ped, -1)
            ClearPedTasks(entity)
        end
        SetPedKeepTask(entity, true)
        SetBlockingOfNonTemporaryEvents(entity, true)
        SetPedFleeAttributes(entity, 0, 0)
        SetPedConfigFlag(entity, 225, true)
        FreezeEntityPosition(entity, true)
        Wait(50)
        local offset = GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.6, 0.0)
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        RenderScriptCams(true, true, 1500, true, true)
        SetCamCoord(cam, offset.x, offset.y, offset.z + 0.55)
        PointCamAtCoord(cam, pedCoords.x, pedCoords.y, pedCoords.z + 0.55)
    end
end
