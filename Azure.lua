local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Azure - Bloxstrap for Roblox Mobile",
    LoadingTitle = "Azure Utility",
    LoadingSubtitle = "By Oce4nic Softwares",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AzureConfigs", -- Change if you want to store configs in a different folder
        FileName = "AzureSettings"
    },
    KeySystem = false,
    KeySettings = {
        Title = "Azure",
        Subtitle = "Key System",
        Note = "Enter your key",
        FileName = "AzureKey",
        SaveKey = true,
        GrabKeyFromSite = "https://yourwebsite.com/key", -- URL to fetch the key from
        Key = "YOUR_KEY_HERE"
    }
})

-- Main tab setup
local MainTab = Window:CreateTab("Main", 4483362458) -- Tab name and optional icon ID

-- Settings section
local SettingsSection = MainTab:CreateSection("Settings")

-- Toggle for enabling custom features
SettingsSection:CreateToggle({
    Name = "Enable Custom Features",
    CurrentValue = false,
    Flag = "CustomFeatureToggle",
    Callback = function(Value)
        print("Custom Features Enabled: " .. tostring(Value))
    end
})

-- Button to launch Roblox
SettingsSection:CreateButton({
    Name = "Launch Roblox",
    Callback = function()
        print("Launching Roblox...")
    end
})

-- Slider for graphics quality
SettingsSection:CreateSlider({
    Name = "Graphics Quality",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Level",
    CurrentValue = 5,
    Flag = "GraphicsSlider",
    Callback = function(Value)
        print("Graphics Quality Set to: " .. tostring(Value))
    end
})

-- Dropdown to select Roblox version
SettingsSection:CreateDropdown({
    Name = "Select Roblox Version",
    Options = {"Stable", "Beta", "Legacy"},
    CurrentOption = "Stable",
    Flag = "VersionDropdown",
    Callback = function(Option)
        print("Selected Roblox Version: " .. Option)
    end
})

-- Button for FFlagDebugGreySky
SettingsSection:CreateButton({
    Name = "FFlagDebugGreySky",
    Callback = function()
        local greySky = Instance.new("Sky")
        greySky.Name = "GreySky"
        greySky.SkyboxBk = "rbxassetid://7036680743" -- A placeholder skybox ID with grey tones
        greySky.SkyboxDn = ""
        greySky.SkyboxFt = "rbxassetid://7036680743" -- Apply similar skybox ID to all directions for consistency
        greySky.SkyboxLf = "rbxassetid://7036680743"
        greySky.SkyboxRt = "rbxassetid://7036680743"
        greySky.SkyboxUp = "rbxassetid://7036680743"
        greySky.Parent = game.Lighting
        
        print("Grey Sky Applied")
    end
})

-- Placeholder for game IDs
local GameIDs = MainTab:CreateSection("Game IDs")
GameIDs:CreateLabel("Roblox Bedwars Lobby ID: [Enter ID Here]")
GameIDs:CreateLabel("Mega Game ID: [Enter ID Here]")
GameIDs:CreateLabel("Micro Game ID: [Enter ID Here]")

-- Load the configuration
Rayfield:LoadConfiguration()
