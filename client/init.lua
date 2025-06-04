playerData = {}
isPlayerLoaded = false
uiOpen = false
Data = {
    OptimizePeds = false, --
    OptimizeObjects = false,--
    RemoveParticles = false,--
    DisableRain = false, 
    OptimizeShadows = false,--
    OptimizeLights = false,--
    LowRender = false,--
    RemoveObjects = false,--
    ClearPedDamage = false,--
}

RegisterCommand(Config.openCommand, function()
    if not uiOpen then 
        openMenu()
        uiOpen = true
    end 
end, false)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    uiOpen = false
end)

AddEventHandler('playerSpawned', function()
    Wait(250)
    local cacheData = TriggerCallback('f4-fpsmenu:loadPlayerData')

    if not cacheData == 'not_found' then
        Data = cacheData
        SendNUIMessage({
            action = 'loadSettings',
            data = Data,
            locales = locales
        })
        SendNotify(Locales.SettingsLoaded, 'success')
    end 
end)

AddEventHandler('onResourceStart', function(res)
    if res == GetCurrentResourceName() then
        Wait(1000)
        local cacheData = TriggerCallback('f4-fpsmenu:loadPlayerData')

        if not cacheData == 'not_found' then
            Data = cacheData
            SendNUIMessage({
                action = 'loadSettings',
                data = Data,
                locales = locales
            })
            SendNotify(Locales.SettingsLoaded, 'success')
        end 
    end
end)

CreateThread(function()
    while true do 
        local sleep = 2500
        if uiOpen then 
            sleep = 2400
            SendNUIMessage({
                action = 'updateFps',
                fps = GetFPS()
            })
        else 
            sleep = 2500
        end 
        Wait(sleep)
    end 
end)

RegisterNUICallback('updateCheckBoxData', function(data, cb)
    Data = data 

    if not Data.OptimizePeds then 
        SetEntityAlpha(PlayerPedId(), 255)
    end

    if Data.DisableRain then 
        SetWeatherTypeNowPersist("CLEAR")
        SetWeatherTypeNow("CLEAR")
        SetWeatherTypeOverTime("CLEAR", 1.0)
        SetWind(0.0)
        SetWindSpeed(0.0)
    else 
        SetWeatherTypeNowPersist("EXTRASUNNY")
        SetWeatherTypeNow("EXTRASUNNY")
        SetWeatherTypeOverTime("EXTRASUNNY", 1.0)
        SetWindSpeed(1.0)
    end

    if Data.OptimizeShadows then 
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
    else
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
    end 

    if not Data.OptimizeLights then 
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
    end

    if Data.LowRender then 
        SetTimecycleModifier('yell_tunnel_nodirect')
    else 
        SetTimecycleModifier()
        ClearTimecycleModifier()
        ClearExtraTimecycleModifier()
    end
end)

RegisterNUICallback('saveData', function(data, cb)
    TriggerServerEvent("f4-fpsmenu:savePlayerData", data)
    SendNotify(Locales.DataSave, 'success')
end)

RegisterNUICallback('resetData', function(data, cb)
    TriggerServerEvent("f4-fpsmenu:resetPlayerData")

    Data = {
        OptimizePeds = false, --
        OptimizeObjects = false,--
        RemoveParticles = false,--
        DisableRain = false, 
        OptimizeShadows = false,--
        OptimizeLights = false,--
        LowRender = false,--
        RemoveObjects = false,--
        ClearPedDamage = false,--
    }

    SetWeatherTypeNowPersist("EXTRASUNNY")
    SetWeatherTypeNow("EXTRASUNNY")
    SetWeatherTypeOverTime("EXTRASUNNY", 1.0)
    SetWindSpeed(1.0)
    RopeDrawShadowEnabled(true)
    CascadeShadowsSetAircraftMode(true)
    CascadeShadowsEnableEntityTracker(false)
    CascadeShadowsSetDynamicDepthMode(true)
    CascadeShadowsSetEntityTrackerScale(5.0)
    CascadeShadowsSetDynamicDepthValue(5.0)
    CascadeShadowsSetCascadeBoundsScale(5.0)
    SetFlashLightFadeDistance(10.0)
    SetLightsCutoffDistanceTweak(10.0)
    DistantCopCarSirens(true)
    SetArtificialLightsState(false)
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
    SendNotify(Locales.DataReset, 'success')
end)

RegisterNUICallback('importNotify', function(data)
    if data then 
        SendNotify(Locales.ImportSuccess, 'success')
    else 
        SendNotify(Locales.ImportError, 'error')
    end 
end)

RegisterNUICallback('exportNotify', function(data)
    SendNotify(Locales.ExportSuccess, 'success')
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.OptimizePeds then 
            sleep = 1000
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    end
                end
                SetPedAoBlobRendering(ped, false)
            end 
  
        end 
        Wait(sleep)
    end 
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.RemoveObjects then 
            sleep = 1000
            ClearAllBrokenGlass()
            ClearHdArea()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
        end 
        Wait(sleep)
    end
end)


CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.RemoveParticles then 
            sleep = 1000 
            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
        end 
        Wait(sleep) 
    end 
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.ClearPedDamage then 
            sleep = 1000
            ClearPedBloodDamage(PlayerPedId())
            ClearPedWetness(PlayerPedId())
            ClearPedEnvDirt(PlayerPedId())
            ResetPedVisibleDamage(PlayerPedId())
        end 
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.OptimizeLights then 
            sleep = 1
            SetFlashLightFadeDistance(0.0)
            SetLightsCutoffDistanceTweak(0.0)
            DistantCopCarSirens(false)
            SetArtificialLightsState(true)
            
            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
        end
        Wait(sleep) 
    end 
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.LowRender then 
            sleep = 1
            OverrideLodscaleThisFrame(0.6)
        end 
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do 
        local sleep = 2500 
        if Data.OptimizeObjects then 
            sleep = 1000
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    end
                end
                Citizen.Wait(1)
            end
          
        end 
        Wait(sleep)
    end 
end)