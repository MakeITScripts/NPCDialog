client.spawnForcedPeds = function()
    for k, v in pairs(Config.forcedInteractions) do
        local ped =
            client.spawnPed(v.pedSpawn or "u_m_y_imporage", vec3(v.coords.x, v.coords.y, v.coords.z), v.coords.w)
        if v.anim then
            Citizen.CreateThread(function()
                TaskStartScenarioInPlace(ped, v.anim, 0, true)
                while true do
                    Citizen.Wait(2000)
                    if not IsPedUsingScenario(ped, v.anim) then
                        TaskStartScenarioInPlace(ped, v.anim, 0, true)
                    end
                end
            end)
        end
        local usedTarget = shared.getUsedTarget()
        if usedTarget == "ox_target" then
            exports['ox_target']:addLocalEntity(ped, {{
                name = 'talkWIthZyd' .. k,
                label = v.targetTitle or Config.Locale.Talk,
                icon = 'fa-solid fa-comments',
                distance = 1.75,
                onSelect = function(data)
                    client.selected(ped, k)
                end
            }})
        elseif usedTarget == "qb-target" then
            exports['qb-target']:AddTargetEntity(ped, {
                options = {{
                    num = 1,
                    label = v.targetTitle or Config.Locale.Talk,
                    targeticon = "fa-solid fa-comments",
                    action = function(entity)
                        client.selected(ped, k)
                    end
                }},
                distance = 1.75
            })
        else
            debug.print(
                "You do not have any supported target in your resources (support targets are: ox_target and qb-target). Your target isn't supported? Contact us at our discord: discord.gg/makeit, we can help :)")
        end
    end
end
Citizen.CreateThread(client.spawnForcedPeds)
client.selected = function(entity, index)
    local netId = NetworkGetNetworkIdFromEntity(entity)
    local configIndex = Config.forcedInteractions[index]
    TriggerServerEvent("mkst/npcdialog/talk", {
        entity = netId,
        name = configIndex.pedName
    })
    if inMenu then
        return
    end
    inMenu = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        eventName = "mkst/open/dialog",
        payload = {
            open = true,
            data = {
                pedSpawn = configIndex.pedSpawn or "u_m_y_imporage",
                pedName = configIndex.pedName or "MakeIT Hero",
                pedJob = configIndex.pedJob or "Developer @ MakeIT Studio",
                scenarios = {configIndex.scenarios}
            }
        }
    })
    client.createCam(entity, true)
end
