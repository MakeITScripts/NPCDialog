client = {}
inMenu = false
Citizen.CreateThread(shared.defineFramework)
client.updateConfig = function()
    Wait(2000)
    SendNUIMessage({
        eventName = "mkst/config",
        payload = {
            color = Config.Color
        }
    })
end
Citizen.CreateThread(client.updateConfig)
