local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "D3V | MIC UP 🔊| .gg/k6ZKwdg4kk",
Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
LoadingTitle = "MIC UP 🔊",
LoadingSubtitle = "by yus",
Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

DisableRayfieldPrompts = false,
DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

ConfigurationSaving = {
    Enabled = false,
    FolderName = nil, -- Create a custom folder for your hub/game
    FileName = "Flux Hub"
},

Discord = {
    Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
    Invite = "k6ZKwdg4kk", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
    RememberJoins = true -- Set this to false to make them join the discord every time they load it up
},

KeySystem = true, -- Set this to true to use our key system
KeySettings = {
    Title = "Mic up",
    Subtitle = "key locked to stop leakers",
    Note = "Discord .gg/k6ZKwdg4kk", -- Use this to tell the user how to get a key  
    FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
    SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
    GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
    Key = {"UWUKITTY"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
}
})
local tab1 = Window:CreateTab("Local Player", nil) -- Title, Image
local tab2 = Window:CreateTab("Players", nil) -- Title, Image
local tab3 = Window:CreateTab("Exploits", nil) -- Title, Image
local tab6 = Window:CreateTab("Map", nil)
local tab7 = Window:CreateTab("Chat", nil)
local tab4 = Window:CreateTab("TPs [working on this]", nil) -- Title, Image 
local tab5 = Window:CreateTab("Animations", nil)
local tab9 = Window:CreateTab("Booths", nil)
local tab8 = Window:CreateTab("Freaky", nil)

Rayfield:Notify({
Title = "Script Loaded",
Content = "Flux Hub, All in one script",
Duration = 5,
Image = 1,
Actions = { -- Notification Buttons
    Ignore = {
        Name = "Okay!",
        Callback = function()
        print("The user tapped Okay!")
    end
},
},
})


local Slider = tab1:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
           game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
 })

 local JumpHeightSlider = tab1:CreateSlider({
    Name = "Jump Height",
    Range = {0, 150}, -- Reasonable range for jump height
    Increment = 1,
    Suffix = "Height",
    CurrentValue = 7.2, -- Default Roblox jump height
    Flag = "Slider2",
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.UseJumpPower = false -- Ensure JumpHeight is used
            humanoid.JumpHeight = Value
        end
    end,
})


-- Services
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Variables
local player = Players.LocalPlayer
local flying = false
local flySpeed = 50 -- Default fly speed
local flyBodyGyro, flyBodyVelocity
local flyLoop

-- Function to start flying
local function startFly()
    if flying then return end
    local char = player.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if not root or not humanoid then return end

    -- Enable flying state
    flying = true
    humanoid.PlatformStand = true -- Prevents falling animation

    -- BodyGyro for rotation stability
    flyBodyGyro = Instance.new("BodyGyro", root)
    flyBodyGyro.P = 90000
    flyBodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
    flyBodyGyro.CFrame = root.CFrame

    -- BodyVelocity for movement
    flyBodyVelocity = Instance.new("BodyVelocity", root)
    flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
    flyBodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000) * humanoid.HipHeight -- Adjust MaxForce based on HipHeight

    -- Flight Loop
    flyLoop = RunService.Heartbeat:Connect(function()
        if not flying or not root or not char then
            flyLoop:Disconnect()
            return
        end

        local moveDirection = Vector3.zero
        local cameraLook = workspace.CurrentCamera.CFrame.LookVector
        local rightVector = workspace.CurrentCamera.CFrame.RightVector

        -- Movement Inputs (Fly in Any Direction You're Looking)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + cameraLook
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - cameraLook
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - rightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + rightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0) -- Up
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0) -- Down
        end

        -- Normalize and apply movement
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * flySpeed
        end
        flyBodyVelocity.Velocity = moveDirection
        flyBodyGyro.CFrame = workspace.CurrentCamera.CFrame
    end)
end

-- Function to stop flying
local function stopFly()
    flying = false
    local char = player.Character
    if not char then return end

    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.PlatformStand = false
    end

    -- Clean up
    if flyBodyGyro then flyBodyGyro:Destroy() end
    if flyBodyVelocity then flyBodyVelocity:Destroy() end
    if flyLoop then flyLoop:Disconnect() end
end

-- Toggle Button for Fly
local FlyToggle = tab1:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(state)
        if state then
            startFly()
        else
            stopFly()
        end
    end,
})

-- Flight Speed Slider
local FlySpeedSlider = tab1:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 150},
    Increment = 5,
    Suffix = " Speed",
    CurrentValue = flySpeed,
    Flag = "FlySpeedSlider",
    Callback = function(Value)
        flySpeed = Value
    end,
})


-- Services
local Players = game:GetService("Players")

-- Variables
local player = Players.LocalPlayer
local headsitting = false
local weld

-- Function to find a player by partial name
local function getTargetPlayer(name)
    name = string.lower(name)
    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if string.lower(targetPlayer.Name):sub(1, #name) == name or string.lower(targetPlayer.DisplayName):sub(1, #name) == name then
            return targetPlayer
        end
    end
    return nil
end

-- Function to force sit animation
local function forceSit()
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Sit = true
        end
    end
end

-- Function to sit properly on a player's head
local function headSit(targetPlayer)
    if not player.Character or not targetPlayer or not targetPlayer.Character then return end
    local targetHead = targetPlayer.Character:FindFirstChild("Head")
    local playerRoot = player.Character:FindFirstChild("HumanoidRootPart")

    if targetHead and playerRoot then
        -- Remove existing weld
        if weld then
            weld:Destroy()
        end

        -- Create a new Weld constraint
        weld = Instance.new("Weld")
        weld.Part0 = playerRoot
        weld.Part1 = targetHead
        weld.C0 = CFrame.new(0, -1.5, 0) -- Adjust this offset as needed
        weld.Parent = playerRoot

        -- Force sit animation
        forceSit()

        headsitting = true
    end
end

-- Function to stop headsitting
local function unHeadSit()
    if weld then
        weld:Destroy()
        weld = nil
    end
    headsitting = false

    -- Reset sitting
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Sit = false
        end
    end
end

-- Headsit Input Box (Teleports & Sits)
local HeadSitInput = tab2:CreateInput({
    Name = "Headsit on Player",
    PlaceholderText = "Enter Player Name",
    RemoveTextAfterFocusLost = true,
    Callback = function(playerName)
        local target = getTargetPlayer(playerName)
        if target then
            headSit(target)
        end
    end
})

-- **Unheadsit Button**
local UnHeadSitButton = tab2:CreateButton({
    Name = "Unheadsit",
    Callback = function()
        unHeadSit()
    end
})




 local Button = tab7:CreateButton({
    Name = "Clear Chat",
    Interact = 'Click',
    Callback = function()
 if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r.") else game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Not Supported", Text = "This game has the legacy ROBLOX chat version. The script can only be used in the new version of the ROBLOX chat. Sorry :("}) end
    end,
 })

 local Button = tab5:CreateButton({
    Name = "Dash Animation",
    Interact = 'Click',
    Callback = function()
             loadstring(game:HttpGet("https://raw.githubusercontent.com/yusd3v/DEVHUB-RBX/refs/heads/main/dash%20anim.lua"))()
    end,
 })



local Button = tab3:CreateButton({
    Name = "ctrl click TP",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/yusd3v/DEVHUB-RBX/refs/heads/main/ctrl%20click%20tp.lua  "))()
    end,
})

local Button = tab3:CreateButton({
    Name = "rewind script",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/nomercy0000/rewind/refs/heads/main/reverse"))()
    end,
})

local Button = tab3:CreateButton({
    Name = "noclip [N]",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://pastebin.com/raw/bNWy6Gvb"))()
    end,
})

local Button = tab3:CreateButton({
    Name = "infiniteyield",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

local Button = tab3:CreateButton({
    Name = "systembroken",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end,
})


local Button = tab8:CreateButton({
    Name = "jerkoff",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
    end,
})

local Button = tab5:CreateButton({
    Name = "emote menu [KEY-,]",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/platinumicy/emotemenu/refs/heads/main/skibbiti"))()
    end,
})

local Button = tab8:CreateButton({
    Name = "face bang",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/bruhlolw/refs/heads/main/face_bang_script.lua"))()
    end,
})

local Button = tab6:CreateButton({
    Name = "graphics",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/yusd3v/DEVHUB-RBX/refs/heads/main/graphics.lua"))()
    end,
})


local Button = tab6:CreateButton({
    Name = "baseplate",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/yusd3v/DEVHUB-RBX/refs/heads/main/baseplate.lua"))()
    end,
})

local Button = tab1:CreateButton({
    Name = "vc unbanner [WORKS]",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/platinumicy/unsuspend/refs/heads/main/unsuspend"))()
    end,
})


local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local speaker = Players.LocalPlayer
local bang, bangLoop, bangDied, bangAnim

-- Function to find player from partial name
local function getTargetPlayer(name)
    name = string.lower(name)
    for _, player in ipairs(Players:GetPlayers()) do
        if string.lower(player.Name):sub(1, #name) == name or string.lower(player.DisplayName):sub(1, #name) == name then
            return player
        end
    end
    return nil
end

-- Bang Command Input
local BangInput = tab2:CreateInput({
    Name = "Bang Player",
    PlaceholderText = "Enter Player Name",
    RemoveTextAfterFocusLost = false,
    Callback = function(playerName)
        if not speaker or not speaker.Character then return end
        local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
        local speakerRoot = speaker.Character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not speakerRoot then return end

        -- Stop any existing animation
        if bang then bang:Stop() end

        -- Load animation
        bangAnim = Instance.new("Animation")
        bangAnim.AnimationId = humanoid.RigType == Enum.HumanoidRigType.R15 
            and "rbxassetid://5918726674" or "rbxassetid://148840371"
        
        bang = humanoid:LoadAnimation(bangAnim)
        bang:Play(0.1, 1, 1)
        bang:AdjustSpeed(3)

        -- Cleanup on death
        if bangDied then bangDied:Disconnect() end
        bangDied = humanoid.Died:Connect(function()
            bang:Stop()
            bangAnim:Destroy()
            if bangLoop then bangLoop:Disconnect() end
        end)

        -- Find target player
        local targetPlayer = getTargetPlayer(playerName)
        if targetPlayer and targetPlayer.Character then
            local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                -- Disconnect previous loop
                if bangLoop then bangLoop:Disconnect() end

                -- Attach and move **EXACTLY BEHIND & CENTERED**
                bangLoop = RunService.Heartbeat:Connect(function()
                    if speaker.Character and targetRoot and speaker.Character:FindFirstChild("HumanoidRootPart") then
                        local behindOffset = -targetRoot.CFrame.LookVector * 2 -- Move 2 studs behind
                        local centeredOffset = targetRoot.CFrame.RightVector * 0 -- Ensures perfect centering
                        local newPosition = targetRoot.CFrame.Position + behindOffset + centeredOffset
                        speakerRoot.CFrame = CFrame.new(newPosition, targetRoot.Position) -- Face the target
                    end
                end)
            end
        end
    end
})


local UnbangButton = tab2:CreateButton({
    Name = "Stop Bang",
    Callback = function()
        if bangDied then bangDied:Disconnect() end
        if bangLoop then bangLoop:Disconnect() end
        if bang then bang:Stop() end
        if bangAnim then bangAnim:Destroy() end
    end
})


local Players = game:GetService("Players")
local speaker = Players.LocalPlayer

-- Function to find a player from partial name
local function getTargetPlayer(name)
    name = string.lower(name)
    for _, player in ipairs(Players:GetPlayers()) do
        if string.lower(player.Name):sub(1, #name) == name or string.lower(player.DisplayName):sub(1, #name) == name then
            return player
        end
    end
    return nil
end

-- Teleport Input Field
local TeleportInput = tab2:CreateInput({
    Name = "Teleport to Player",
    PlaceholderText = "Enter Player Name",
    RemoveTextAfterFocusLost = false,
    Callback = function(playerName)
        local success, err = pcall(function()
            -- Find target player
            local targetPlayer = getTargetPlayer(playerName)
            if targetPlayer and targetPlayer.Character then
                local targetRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                local speakerRoot = speaker.Character and speaker.Character:FindFirstChild("HumanoidRootPart")

                if targetRoot and speakerRoot then
                    speakerRoot.CFrame = targetRoot.CFrame + Vector3.new(0, 2, 0) -- Teleport slightly above
                end
            end

            -- Clear text box after teleport
            TeleportInput:Set("")
        end)

        -- Prevent button from going red (error handling)
        if not success then
            warn("Teleport Error:", err)
        end
    end
})





-- zoom out 
local player = game.Players.LocalPlayer

-- Ensure the script only runs once
if player:FindFirstChild("CameraZoomApplied") then
    print("CameraMaxZoomDistance already set.")
else
    -- Set the max zoom distance
    player.CameraMaxZoomDistance = 800000
    
    -- Create a marker to prevent reapplying
    local marker = Instance.new("BoolValue")
    marker.Name = "CameraZoomApplied"
    marker.Parent = player

    print("CameraMaxZoomDistance set successfully!")
end

-- anti AFK
wait(0.5)  

local VirtualUser = game:service("VirtualUser")  
local Player = game:service("Players").LocalPlayer  

Player.Idled:connect(function()  
    VirtualUser:CaptureController()  
    VirtualUser:ClickButton2(Vector2.new())  
end)

-- anti void
game.Workspace.FallenPartsDestroyHeight = 0/0

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local sittingPrevention
local sittingConnection

local function preventSitting()
    if player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            sittingConnection = humanoid.Seated:Connect(function(isSeated)
                if isSeated then
                    humanoid.Sit = false -- Instantly force the player to stand
                end
            end)
        end
    end
end

local function enableSittingPrevention()
    sittingPrevention = player.CharacterAdded:Connect(preventSitting)
    preventSitting()
end

local function disableSittingPrevention()
    if sittingPrevention then
        sittingPrevention:Disconnect()
        sittingPrevention = nil
    end
    if sittingConnection then
        sittingConnection:Disconnect()
        sittingConnection = nil
    end
end

-- Toggle Button for Tab 6
local SitBlockToggle = tab6:CreateToggle({
    Name = "Block Sitting",
    CurrentValue = false,
    Flag = "SitBlock",
    Callback = function(state)
        if state then
            enableSittingPrevention()
        else
            disableSittingPrevention()
        end
    end,
})



-- teleports [working on this.]


local TeleportButton = tab4:CreateButton({
    Name = "Chill spot [Void]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(-9051.74, 2.86, -6032.70) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })

 local TeleportButton = tab4:CreateButton({
    Name = "Extra Baseplate Button",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(-117.79, 3.32, -112.62) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })

 -- booth TPs
 local TeleportButton = tab9:CreateButton({
    Name = "Booth 1 [TP]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(154.75, 8.11, 136.46) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab9:CreateButton({
    Name = "Booth 2 [TP]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(155.44, 8.11, 104.87) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab9:CreateButton({
    Name = "Booth 3 [TP]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(155.21, 8.11, 74.48) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab9:CreateButton({
    Name = "Booth 4 [TP]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(155.18, 8.11, 43.54) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab9:CreateButton({
    Name = "Booth 5 [TP]",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(155.84, 8.11, 12.29) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
