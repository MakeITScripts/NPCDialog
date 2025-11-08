cache = {}
client.startCache = function()
    while true do
        cache.ped = PlayerPedId()
        cache.coords = GetEntityCoords(cache.ped)
        Wait(6000)
    end
end
Citizen.CreateThread(client.startCache)
