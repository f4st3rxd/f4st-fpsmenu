Config = {
    openCommand = "fpsmenu",
    useKeybind = false,
    openKey = "F5"
}

Locales = {
    Welcome = "Welcome",
    Main = "Main",
    World = "World",
    Other = "Other",
    Settings = "Settings",
    OptimizePeds = "Optimize Peds",
    OptimizeObjects = "Optimize Objects",
    RemoveParticles = "Remove Particles",
    DisableRain = "Disable Rain & Wind",
    OptimizeShadows = "Optimize Shadows",
    OptimizeLights = "Optimize Lights",
    LowRender = "Low Render & Textures",
    RemoveEmptyObjects = "Remove Empty And Broken Objects",
    ClearPedDamageAndDirt = "Clear Ped Damage And Dirt",
    ImportConfig = "Import Config",
    ExportConfig = "Export Config",
    SaveConfig = "Save Config",
    ResetConfig = "Reset Config",
    DataSave = "Your settings have been successfully saved and will work automatically every time you enter the game",
    DataReset = "Your settings were reset successfully",
    SettingsLoaded = "Your settings loaded successfully",
    ExportSuccess = "Your settings were copied successfully",
    ImportSuccess = "The settings you entered were loaded successfully",
    ImportError = "You entered an incorrect config code",
}

function SendNotify(txt, type)
    TriggerEvent('ox_lib:notify', {
        title = 'Fps Menu',
        description = txt,
        type = type,
        duration = 5000
    })
end