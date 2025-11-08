RegisterNuiCallback('mkst/close/dialog', function()
    SetNuiFocus(false, false)
    inMenu = false
    RenderScriptCams(false, true, 500, true, true)
    DestroyAllCams(true)
    FreezeEntityPosition(currentEntity, false)
    TriggerServerEvent("mkst/npcdialog/stopTalking", {
        entity = NetworkGetNetworkIdFromEntity(currentEntity)
    })
end)
RegisterNuiCallback("function", function(data, cb)
    for _, pedData in pairs(Config.forcedInteractions) do
        if pedData.pedName == data.npc then
            local texts = pedData.scenarios.Texts
            for _, textData in pairs(texts) do
                if textData.options then
                    for _, option in pairs(textData.options) do
                        if option.text == data.option and option.action == "function" then
                            local funcName = option.functions
                            if funcName and functions[funcName] then
                                functions[funcName]()
                            else
                                debug.print('Function ' .. funcName ..
                                                " cannot be found in config_functions.lua configure it!")
                            end
                        end
                    end
                end
            end
        end
    end
    cb("OK")
end)
