local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Azure - Bloxstrap for Roblox Mobile",
    LoadingTitle = "Azure Utility",
    LoadingSubtitle = "By RontuYT on YouTube.",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AzureConfigs", -- Change if i need to store configs in a different folder this hopefully just works as a demo for the realy thing.
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

-- Placeholder for game IDs
local GameIDs = MainTab:CreateSection("Game IDs")
GameIDs:CreateLabel("Game Lobby ID: [Enter ID Here]")
GameIDs:CreateLabel("Game Mega ID: [Enter ID Here]")
GameIDs:CreateLabel("Game Micro ID: [Enter ID Here]")

-- Custom Client tab setup
local CustomClientTab = Window:CreateTab("CustomClient", 4483362458) -- Tab name and optional icon ID ig

-- Section for Custom Client features
local CustomClientSection = CustomClientTab:CreateSection("Custom Client Features")

-- Button for FFlagDebugGreySky in CustomClient
CustomClientSection:CreateButton({
    Name = "FFlagDebugGreySky",
    Callback = function()
        local greySky = Instance.new("Sky")
        greySky.Name = "GreySky"
        greySky.SkyboxBk = "rbxassetid://7036680743" -- A placeholder skybox ID with grey elememnts reminder to chnage below
        greySky.SkyboxDn = ""
        greySky.SkyboxFt = "rbxassetid://7036680743" -- I need to change these later
        greySky.SkyboxLf = "rbxassetid://7036680743"
        greySky.SkyboxRt = "rbxassetid://7036680743"
        greySky.SkyboxUp = "rbxassetid://7036680743"
        greySky.Parent = game.Lighting
        
        print("Grey Sky Applied")
    end
})

-- Dropdown for selecting custom fonts
local fonts = {"Legacy", "Arial", "SourceSans", "ComicSans", "Gotham", "GothamBold", "GothamBlack"}

CustomClientSection:CreateDropdown({
    Name = "Select Custom Font",
    Options = fonts,
    CurrentOption = "SourceSans",
    Flag = "CustomFontDropdown",
    Callback = function(selectedFont)
        -- Change the font of all GUI elements in the game
        for _, obj in pairs(game:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                obj.Font = Enum.Font[selectedFont]
            end
        end
        
        print("Custom Font Applied: " .. selectedFont)
    end
})

-- Load the configuration
Rayfield:LoadConfiguration()
