server = {}
server.welcomePrint = function()
    Wait(3000)
    print("^4[MakeIT Studio]^7 Thanks for choosing ours scripts! It means a lot to us!")
    Wait(1000)
    print("^4[MakeIT Studio]^7 If you have any issues or sugestions feel free to let us know @ discord.gg/makeit")
end
Citizen.CreateThread(server.welcomePrint)
