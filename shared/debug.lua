debug = {}
debug.print = function(text)
    if Config.Debug then
        print(("^4[MKST] [DIALOG]^7 %s"):format(tostring(text)))
    end
end
