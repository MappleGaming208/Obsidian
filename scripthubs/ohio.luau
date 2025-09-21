-- klvxd hub Ohio Script
local repo = "https://raw.githubusercontent.com/mapplegaming208/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

-- Initial Notifications
Library:Notify({
    Title = "klvxd hub",
    Description = "game.PlaceId is " .. game.PlaceId,
    Time = 4,
    SoundId = 88243474733896,
})

Library:Notify({
    Title = "klvxd hub",
    Description = "loaded",
    Time = 4,
    SoundId = 88243474733896,
})

Library:Notify({
    Title = "klvxd hub",
    Description = "thanks for using this amazing script by some guy on github",
    Time = 4,
    SoundId = 7695983456,
})

-- Main Window
local hubWin = Library:CreateWindow({
    Title = "klvxd hub v1 - ohio",
    Footer = "version: mid-sep",
    Icon = nil,
    NotifySide = "Right",
    Center = true,
    ShowCustomCursor = true,
})

-- Tabs
local Tabs = {
    Universal = hubWin:AddTab("Universal", "globe", "basic movement stuff"),
    Main = hubWin:AddTab("Main", "house", "main options"),
    AutoFarms = hubWin:AddTab("AutoFarms", "tractor", "autofarmsssssssssssss"),
    Settings = hubWin:AddTab("Settings", "settings", "script settings"),
}

-- UNIVERSAL TAB
do
    local UniversalLeft = Tabs.Universal:AddLeftGroupbox("Movement", "wrench")

    -- Noclip toggle
    UniversalLeft:AddToggle("NoclipToggle", {
        Text = "No-Clip",
        Tooltip = "Toggle noclip on/off",
        Default = false,
        Callback = function(Value)
            Toggles.NoclipToggle.Value = Value
            Library:Notify({
                Title = "klvxd hub",
                Description = "Noclip " .. (Value and "enabled" or "disabled"),
                Time = 3,
                SoundId = 88243474733896,
            })
        end,
    })

    -- Fly slider toggle
    UniversalLeft:AddSlider("FlySpeedSlider", {
        Text = "Alpha13eds",
        Default = 50,
        Min = 1,
        Max = 100,
        Rounding = 1,
        Callback = function(Value)
            -- Fly logic placeholder
        end,
        Tooltip = "Adjust speed for Alpha13eds",
    })

    -- Jump Power slider
    UniversalLeft:AddSlider("JumpPowerSlider", {
        Text = "Jump Power",
        Default = 50,
        Min = 1,
        Max = 200,
        Rounding = 1,
        Tooltip = "Adjust jump power",
    })
end

-- MAIN TAB
do
    local MainLeft = Tabs.Main:AddLeftGroupbox("UI", "wrench")

    MainLeft:AddToggle("ToggleUI", {
        Text = "Toggle Crafting/Locker/Cameras UI",
        Tooltip = "Show or hide main game UI elements",
        Default = true,
        Callback = function(Value)
            -- Toggle actual UI logic
        end,
    })
end

-- AUTO FARMS TAB
do
    local AFLeft = Tabs.AutoFarms:AddLeftGroupbox("Farming", "tractor")

    AFLeft:AddToggle("ATMFarm", { Text = "ATM Autofarm", Tooltip = "Autofarm ATMs" })
    AFLeft:AddToggle("BankFarm", { Text = "Bank Autofarm", Tooltip = "Autofarm Banks" })
    AFLeft:AddToggle("JewelryFarm", { Text = "Jewelry Store Autofarm", Tooltip = "Autofarm Jewelry" })
    AFLeft:AddToggle("PickupUseful", { Text = "Pickup Useful Items", Tooltip = "Autopick important items" })
    AFLeft:AddToggle("SafeFarm", { Text = "Auto Safes", Tooltip = "Autofarm valuable safes" })
    AFLeft:AddToggle("BigSafe", { Text = "Big Safes", Tooltip = "Include big safes" })
    AFLeft:AddToggle("SmallSafe", { Text = "Small Safes", Tooltip = "Include small safes" })
    AFLeft:AddToggle("GoldBigSafe", { Text = "Gold Big Safes", Tooltip = "Include gold big safes" })
    AFLeft:AddToggle("GoldSmallSafe", { Text = "Gold Small Safes", Tooltip = "Include gold small safes" })
    AFLeft:AddToggle("CashFarm", { Text = "General Cash Farm", Tooltip = "Autofarm general cash" })
    AFLeft:AddToggle("HouseStuff", { Text = "Auto Grab House Stuff", Tooltip = "Grab Santa Airdrop, presents, etc." })
    AFLeft:AddToggle("AutoSell", { Text = "Auto Sell Everything", Tooltip = "Automatically sell all items" })
    AFLeft:AddToggle("AutoAirdrop", { Text = "Auto Collect Airdrops", Tooltip = "Autocollect airdrops" })
    AFLeft:AddToggle("AutoCraftRollies", { Text = "Auto Craft Rollies", Tooltip = "Craft your rollies automatically" })
    AFLeft:AddToggle("AutoSellRollies", { Text = "Auto Sell Rollies", Tooltip = "Automatically sell crafted rollies" })
    AFLeft:AddToggle("AutoCollectBoxes", { Text = "Auto Collect Boxes", Tooltip = "Autocollect boxes" })
    AFLeft:AddToggle("AutoOpenBoxes", { Text = "Auto Open Boxes", Tooltip = "Automatically open collected boxes" })
end

-- SETTINGS TAB
do
    local SettingsLeft = Tabs.Settings:AddLeftGroupbox("Script Settings", "settings")

    SettingsLeft:AddButton({
        Text = "Unload Script",
        Func = function()
            Library:Unload()
        end,
        Tooltip = "Unload klvxd hub safely",
    })
end

-- THEME & SAVE MANAGERS
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("klvxd hub")
SaveManager:SetFolder("klvxd hub/specific-game")
SaveManager:SetSubFolder("specific-place")
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

Library:OnUnload(function()
    print("klvxd hub unloaded!")
end)
