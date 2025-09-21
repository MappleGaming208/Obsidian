-- Ohio Script Hub for Obsidian
local repo = "https://raw.githubusercontent.com/MappleGaming208/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

Library:Notify({
    Title = "klvxd hub",
    Description = "game.PlaceId is " .. game.PlaceId,
    Time = 4,
    SoundId = 88243474733896,
})

-- Create main window
local Window = Library:CreateWindow({
    Title = "klvxd hub v1 - ohio",
    Footer = "version: mid-sep",
    Icon = nil,
    NotifySide = "Right",
    Center = true,
    ShowCustomCursor = true,
})

-- Tabs
local Tabs = {
    Universal = Window:AddTab("Universal", "globe", "Basic movement & general features"),
    Main = Window:AddTab("Main", "house", "UI toggles & settings"),
    AutoFarms = Window:AddTab("AutoFarms", "tractor", "Autofarm features"),
}

Library:Notify({
    Title = "klvxd hub",
    Description = "loaded",
    Time = 4,
    SoundId = 88243474733896,
})

-- ==== Universal Tab ====
local LeftGroup_Universal = Tabs.Universal:AddLeftGroupbox("Universal Features", "wrench")
local RightGroup_Universal = Tabs.Universal:AddRightGroupbox("Misc Features")

-- Noclip toggle
LeftGroup_Universal:AddToggle("Noclip", {
    Text = "NoClip",
    Default = false,
    Tooltip = "Toggle noclip",
    Callback = function(value)
        Library:Notify({
            Title = "klvxd hub",
            Description = "Noclip " .. (value and "enabled" or "disabled"),
            Time = 4,
            SoundId = 88243474733896,
        })
        -- Your noclip code here
    end
})

-- JumpPower slider
LeftGroup_Universal:AddSlider("JumpPower", {
    Text = "Jump Power",
    Default = 50,
    Min = 1,
    Max = 200,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

-- ==== Main Tab ====
local LeftGroup_Main = Tabs.Main:AddLeftGroupbox("UI Features", "wrench")
LeftGroup_Main:AddToggle("UIVisibility", {
    Text = "Show/Hide UI",
    Default = true,
    Tooltip = "Toggle visibility of crafting UI, locker UI, cameras etc.",
    Callback = function(value)
        -- Example: hide/show some UI elements
        Library:Notify({
            Title = "klvxd hub",
            Description = "UI Visibility: " .. (value and "Shown" or "Hidden"),
            Time = 4,
            SoundId = 88243474733896,
        })
    end
})

-- ==== AutoFarms Tab ====
local LeftGroup_Auto = Tabs.AutoFarms:AddLeftGroupbox("Autofarm Features", "tractor")
-- Placeholder toggles
LeftGroup_Auto:AddToggle("ATM_AutoFarm", { Text = "ATM Autofarm", Default = false, Tooltip = "Farm ATMs" })
LeftGroup_Auto:AddToggle("Bank_AutoFarm", { Text = "Bank Autofarm", Default = false, Tooltip = "Farm banks" })
LeftGroup_Auto:AddToggle("Jewelry_AutoFarm", { Text = "Jewelry Store Autofarm", Default = false, Tooltip = "Farm jewelry store" })
LeftGroup_Auto:AddToggle("Pickup_Items", { Text = "Pickup Useful Items", Default = false, Tooltip = "Auto pickup useful items" })
LeftGroup_Auto:AddToggle("AutoSafes", { Text = "Auto Safes", Default = false, Tooltip = "Farm safes" })
LeftGroup_Auto:AddToggle("GeneralCashFarm", { Text = "General Cash Farm", Default = false, Tooltip = "Farm general cash" })
LeftGroup_Auto:AddToggle("AutoGrabHouse", { Text = "Auto Grab House Stuff", Default = false, Tooltip = "Grab items like airdrops/presents" })
LeftGroup_Auto:AddToggle("AutoSellEverything", { Text = "Auto Sell Everything", Default = false, Tooltip = "Sell all collected items" })
LeftGroup_Auto:AddToggle("AutoCraftRollies", { Text = "Auto Craft Rollies", Default = false, Tooltip = "Auto craft rollies" })
LeftGroup_Auto:AddToggle("AutoSellRollies", { Text = "Auto Sell Rollies", Default = false, Tooltip = "Auto sell crafted rollies" })
LeftGroup_Auto:AddToggle("AutoCollectAirdrops", { Text = "Auto Collect Airdrops", Default = false, Tooltip = "Grab all airdrops" })
LeftGroup_Auto:AddToggle("AutoCollectBoxes", { Text = "Auto Collect Boxes", Default = false, Tooltip = "Collect all boxes" })
LeftGroup_Auto:AddToggle("AutoOpenBoxes", { Text = "Auto Open Boxes", Default = false, Tooltip = "Open all collected boxes" })

-- ==== Settings Tab ====
local LeftGroup_Settings = Tabs.Main:AddLeftGroupbox("Settings", "settings")
LeftGroup_Settings:AddButton("Unload", function()
    Library:Unload()
end)

-- ===== Theme & Save managers =====
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("KlvxdHub")
SaveManager:SetFolder("KlvxdHub/specific-game")
SaveManager:SetSubFolder("specific-place")
SaveManager:BuildConfigSection(Tabs.Main)
ThemeManager:ApplyToTab(Tabs.Main)

Library:OnUnload(function()
    print("Klvxd Hub unloaded!")
end)
