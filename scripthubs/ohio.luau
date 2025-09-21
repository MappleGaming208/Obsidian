local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

local Window = Library:CreateWindow({
    Title = "Klvxd Hub",
    Footer = "version: 1.0",
    Icon = 95816097006870,
    NotifySide = "Right",
    ShowCustomCursor = true,
})

-- Create Tabs
local Tabs = {}
Tabs.Universal = Window:AddTab("Universal", "globe")
Tabs.Main = Window:AddTab("Main", "house")
Tabs.AutoFarm = Window:AddTab("AutoFarm", "tractor")

-- =====================
-- Universal Tab
-- =====================
local UG_Left = Tabs.Universal:AddLeftGroupbox("General Features", "wrench")

UG_Left:AddToggle("KlvxdNoclip", {
    Text = "Noclip",
    Default = false,
    Tooltip = "Enable/disable noclip",
    Callback = function(value)
        if value then
            Library:Notify({
                Title = "Klvxd Hub",
                Description = "Noclip enabled",
                Time = 4,
                SoundId = 88243474733896,
            })
        end
    end
})

UG_Left:AddDivider()

UG_Left:AddSlider("KlvxdJumpPower", {
    Text = "Jump Power",
    Default = 50,
    Min = 1,
    Max = 200,
    Rounding = 0,
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- =====================
-- Main Tab
-- =====================
local MG_Left = Tabs.Main:AddLeftGroupbox("UI", "wrench")

MG_Left:AddToggle("KlvxdUICrafting", {
    Text = "Crafting UI",
    Default = true,
    Callback = function(value)
        -- Example placeholder
        print("Toggle Crafting UI:", value)
    end
})

MG_Left:AddToggle("KlvxdUILocker", {
    Text = "Locker UI",
    Default = true,
    Callback = function(value)
        print("Toggle Locker UI:", value)
    end
})

MG_Left:AddToggle("KlvxdUIPoliceCam", {
    Text = "Police Station Cameras",
    Default = true,
    Callback = function(value)
        print("Toggle Police Cameras UI:", value)
    end
})

-- =====================
-- AutoFarm Tab
-- =====================
local AF_Left = Tabs.AutoFarm:AddLeftGroupbox("Farming Features", "tractor")

AF_Left:AddToggle("KlvxdAutoATM", { Text = "Auto ATM", Default = false })
AF_Left:AddToggle("KlvxdAutoBank", { Text = "Auto Bank", Default = false })
AF_Left:AddToggle("KlvxdAutoJewelry", { Text = "Auto Jewelry Store", Default = false })
AF_Left:AddToggle("KlvxdAutoPickup", { Text = "Pickup Useful Items", Default = false })
AF_Left:AddToggle("KlvxdAutoSafes", { Text = "Auto Safes", Default = false })
AF_Left:AddToggle("KlvxdAutoSell", { Text = "Auto Sell Everything", Default = false })
AF_Left:AddToggle("KlvxdAutoAirdrop", { Text = "Auto Collect Airdrops", Default = false })
AF_Left:AddToggle("KlvxdAutoCraftRollies", { Text = "Auto Craft Rollies", Default = false })
AF_Left:AddToggle("KlvxdAutoCollectBoxes", { Text = "Auto Collect Boxes", Default = false })
AF_Left:AddToggle("KlvxdAutoOpenBoxes", { Text = "Auto Open Boxes", Default = false })

-- Slider for rollie speed (example)
AF_Left:AddSlider("KlvxdRollieSpeed", {
    Text = "Rollie Craft Speed",
    Default = 50,
    Min = 1,
    Max = 100,
    Callback = function(value)
        print("Rollie craft speed set to:", value)
    end
})

-- =====================
-- Settings Tab (UI Settings)
-- =====================
local SettingsTab = Window:AddTab("Settings", "settings")
local SettingsGroup = SettingsTab:AddLeftGroupbox("Menu Options", "wrench")

SettingsGroup:AddToggle("ShowMenu", {
    Text = "Show UI",
    Default = true,
    Callback = function(value)
        Window.Visible = value
    end
})

SettingsGroup:AddButton({
    Text = "Unload Klvxd Hub",
    Func = function() Library:Unload() end
})

-- =====================
-- Theme & Save Managers
-- =====================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("KlvxdHub")
SaveManager:SetFolder("KlvxdHub/specific-game")

-- =====================
-- Notifications Example
-- =====================
Library:Notify({
    Title = "Klvxd Hub",
    Description = "Thanks for using Klvxd Hub!",
    Time = 4,
    SoundId = 88243474733896
})

