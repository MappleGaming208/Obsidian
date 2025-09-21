-- ==========================
-- SCRIPT HUB (OBSIDIAN)
-- ==========================
local repo = "https://raw.githubusercontent.com/mapplegaming208/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

Library.ForceCheckbox = true
Library.ShowToggleFrameInKeybinds = true

-- ==========================
-- MAIN WINDOW
-- ==========================
local hubWin = Library:CreateWindow({
    Title = "UnSilencedHub v1",
    Footer = "Version: Mid-Sep",
    Icon = nil,
    NotifySide = "Right",
    Center = true,
    ShowCustomCursor = true,
})

-- ==========================
-- TABS (ORDER: Universal, Main, AutoFarms)
-- ==========================
local universalTab = hubWin:AddTab("Universal", "globe", "Basic movement tools")
local mainTab = hubWin:AddTab("Main", "house", "Main universal features")
local autoFarmsTab = hubWin:AddTab("AutoFarms", "tractor", "Autofarming tools")

-- ==========================
-- UNIVERSAL TAB
-- ==========================
local ut = universalTab

-- ===== Movement Group =====
local moveGroup = ut:AddGroupBox("Movement Options")

local jumpPowX = 50
moveGroup:AddSlider({
    Name = "Jump Power",
    Min = 1,
    Max = 200,
    Default = 50,
    Callback = function(val)
        jumpPowX = val
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if hum then hum.JumpPower = jumpPowX end
    end
})
moveGroup:AddLabel("Adjust your jump height dynamically (50 is default)")

local walkSpeedX = 16
moveGroup:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 250,
    Default = 16,
    Callback = function(val)
        walkSpeedX = val
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        if hum then hum.WalkSpeed = walkSpeedX end
    end
})
moveGroup:AddLabel("Adjust your walking speed (16 is default)")

moveGroup:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(state)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        if state then
            ut.NCConn = game:GetService("RunService").Stepped:Connect(function()
                for _, part in pairs(char:GetChildren()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end)
            Library:Notify({Title="Noclip Enabled", Description="You can now pass through walls!", Time=4, SoundId=88243474733896})
        else
            if ut.NCConn then ut.NCConn:Disconnect() ut.NCConn = nil end
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
            Library:Notify({Title="Noclip Disabled", Description="Collisions restored.", Time=4, SoundId=88243474733896})
        end
    end
})
moveGroup:AddLabel("Pass through walls (client-side)")

-- ===== Flying Group =====
local flyGroup = ut:AddGroupBox("Flying Options")
local flyVel89 = 16

flyGroup:AddToggle({
    Name = "Alpha13eds",
    Default = false,
    Callback = function(flyState)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hum = char:FindFirstChildWhichIsA("Humanoid")
        local RS = game:GetService("RunService")
        if flyState then
            Library:Notify({Title="Fly Enabled", Description="Enjoy flying!", Time=4, SoundId=88243474733896})
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            ut.FlyConn = RS.Heartbeat:Connect(function()
                local dir = Vector3.new()
                local UIS = game:GetService("UserInputService")
                if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - workspace.CurrentCamera.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + workspace.CurrentCamera.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.new(0,1,0) end
                char:TranslateBy(dir.Unit * flyVel89)
            end)
        else
            if ut.FlyConn then ut.FlyConn:Disconnect() ut.FlyConn = nil end
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            Library:Notify({Title="Fly Disabled", Description="Back to normal movement", Time=4, SoundId=88243474733896})
        end
    end
})

flyGroup:AddSlider({
    Name = "Momentum",
    Min = 1,
    Max = 100,
    Default = flyVel89,
    Callback = function(val) flyVel89 = val end
})
flyGroup:AddLabel("Adjust your flying speed (internal)")

-- ===== Extras Group =====
local extraGroup = ut:AddGroupBox("Extras")
extraGroup:AddSlider({
    Name = "Gravity",
    Min = 0,
    Max = 196,
    Default = workspace.Gravity,
    Callback = function(val) workspace.Gravity = val end
})
extraGroup:AddLabel("Adjust gravity (196 is default)")

-- ==========================
-- MAIN TAB
-- ==========================
local uiGroup = mainTab:AddGroupBox("UI")

uiGroup:AddToggle({
    Name = "Crafting UI",
    Default = true,
    Callback = function(state)
        local craftingUI = workspace:FindFirstChild("CraftingUI")
        if craftingUI then craftingUI.Visible = state end
        Library:Notify({Title="UI Toggle", Description=state and "Crafting UI shown" or "Crafting UI hidden", Time=4, SoundId=88243474733896})
    end
})
uiGroup:AddLabel("Toggle the Crafting interface")

uiGroup:AddToggle({
    Name = "Locker UI",
    Default = true,
    Callback = function(state)
        local lockerUI = workspace:FindFirstChild("LockerUI")
        if lockerUI then lockerUI.Visible = state end
        Library:Notify({Title="UI Toggle", Description=state and "Locker UI shown" or "Locker UI hidden", Time=4, SoundId=88243474733896})
    end
})
uiGroup:AddLabel("Toggle the Locker interface")

uiGroup:AddToggle({
    Name = "Police Station Cameras",
    Default = true,
    Callback = function(state)
        local camsUI = workspace:FindFirstChild("PoliceCamsUI")
        if camsUI then camsUI.Visible = state end
        Library:Notify({Title="UI Toggle", Description=state and "Cameras shown" or "Cameras hidden", Time=4, SoundId=88243474733896})
    end
})
uiGroup:AddLabel("Toggle the Police Station Cameras")

-- ==========================
-- AUTO FARMS TAB
-- ==========================
local af = autoFarmsTab

-- Safes Group
local safesGroup = af:AddGroupBox("Safes Options")
safesGroup:AddToggle({ Name = "Auto Small Safes", Default = false, Callback = function(t) end })
safesGroup:AddLabel("Automatically farm small safes")
safesGroup:AddDivider()
safesGroup:AddToggle({ Name = "Auto Big Safes", Default = false, Callback = function(t) end })
safesGroup:AddLabel("Automatically farm big safes")
safesGroup:AddDivider()
safesGroup:AddToggle({ Name = "Auto Gold Small Safes", Default = false, Callback = function(t) end })
safesGroup:AddLabel("Automatically farm gold small safes")
safesGroup:AddToggle({ Name = "Auto Gold Big Safes", Default = false, Callback = function(t) end })
safesGroup:AddLabel("Automatically farm gold big safes")

-- Crafting Group (Boxes + Rollies)
local craftingGroup = af:AddGroupBox("Crafting")
craftingGroup:AddToggle({ Name = "Auto Collect Boxes", Default = false, Callback = function(t) end })
craftingGroup:AddLabel("Automatically collect boxes")
craftingGroup:AddDivider()
craftingGroup:AddToggle({ Name = "Auto Open Boxes", Default = false, Callback = function(t) end })
craftingGroup:AddLabel("Automatically open collected boxes")
craftingGroup:AddDivider()
craftingGroup:AddToggle({ Name = "Auto Craft Rollies", Default = false, Callback = function(t) end })
craftingGroup:AddLabel("Automatically craft Rollies")
craftingGroup:AddDivider()
craftingGroup:AddToggle({ Name = "Auto Sell Rollies", Default = false, Callback = function(t) end })
craftingGroup:AddLabel("Automatically sell crafted Rollies")

-- House Items Group
local houseGroup = af:AddGroupBox("House Items")
houseGroup:AddToggle({ Name = "Auto Grab House Items", Default = false, Callback = function(t) end })
houseGroup:AddLabel("Automatically collect house items like presents or airdrops")

-- General Group
local generalGroup = af:AddGroupBox("General")
generalGroup:AddToggle({ Name = "ATM Autofarm", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically farm ATMs for cash")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "Bank Autofarm", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically farm banks for money")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "Jewellery Store Autofarm", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically farm the jewellery store")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "Pickup Useful Items", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically pick up useful items")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "General Cash Farm", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Farm cash from general sources")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "Auto Sell Everything", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically sell all items you collect")
generalGroup:AddDivider()
generalGroup:AddToggle({ Name = "Auto Collect Airdrops", Default = false, Callback = function(t) end })
generalGroup:AddLabel("Automatically collect airdrops")

-- ==========================
-- FINAL NOTIFICATION
-- ==========================
Library:Notify({
    Title = "UnSilencedHub",
    Description = "Thanks for using this amazing script by some guy on GitHub",
    Time = 4,
    SoundId = 7695983456
})

