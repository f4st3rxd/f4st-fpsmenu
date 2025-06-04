local Data = {}
local colors = {
    reset = "\27[0m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m"
}

RegisterCallback("f4-fpsmenu:onPlayerLoaded", function(source)
    local name = GetPlayerName(source)
    local photo = GetPlayerPhoto(source)

    return {name = name, photo = photo}
end)

RegisterNetEvent("f4-fpsmenu:savePlayerData", function(data)
    local playerLicense = GetPlayerIdentifier(source, 0)

    if not Data[playerLicense] then
        Data[playerLicense] = {}
    end
    Data[playerLicense] = data
end)

RegisterNetEvent("f4-fpsmenu:resetPlayerData", function()
    local playerLicense = GetPlayerIdentifier(source, 0)

    if Data[playerLicense] then
        Data[playerLicense] = nil
    end
end)

RegisterCallback('f4-fpsmenu:loadPlayerData', function(playerLicense)
    if Data[playerLicense] then
        return Data[playerLicense]
    else
        return 'not_found'
    end
end)

local function debugPrint(...)
    if Config.DebugMode then
        print(colors.yellow .. "[DEBUG]", ..., colors.reset)
    end
end

local function LoadData()
    local jsonData = LoadResourceFile(GetCurrentResourceName(), "data.json")
    if jsonData then
        local success, decoded = pcall(function()
            return json.decode(jsonData)
        end)
        if success and decoded then
            Data = decoded
            debugPrint("Loaded data:", json.encode(Data))
        else
        end
    else
        Data = {}
    end
end

local function SaveData()
    local encoded = json.encode(Data, { indent = true })
    if encoded then
        SaveResourceFile(GetCurrentResourceName(), "data.json", encoded, -1)
        debugPrint("Saved data:", encoded)
    else
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        LoadData()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        SaveData()
    end
end)
