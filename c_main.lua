RegisterCommand("pedname", function(source, args, rawCommand)
    if #args == 0 then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "Du måste ange en modell! Använd /pedname [modelnamn]"}
        })
        return
    end
    local modelName = args[1]
    local model = GetHashKey(modelName)
    if not IsModelInCdimage(model) or not IsModelValid(model) then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "Ogiltig modell! Kontrollera att du skrev rätt."}
        })
        return
    end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500) 
    end

    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)

    TriggerEvent('chat:addMessage', {
        color = {0, 255, 0},
        multiline = true,
        args = {"System", "Du har nu bytt ped till " .. modelName}
    })
end, false)
