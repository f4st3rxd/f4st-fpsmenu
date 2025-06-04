function openMenu()
    if not isPlayerLoaded then 
        playerData = TriggerCallback('f4-fpsmenu:onPlayerLoaded')
        isPlayerLoaded = true

        SendNUIMessage({
            action = 'loadData',
            name = playerData.name,
            photo = playerData.photo
        })
    end 

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openMenu',
    })
end 

function GetFPS()
	local fps = math.floor(1.0 / GetFrameTime())
	return fps
end

local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

function GetWorldObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function GetWorldPeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetWorldVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end