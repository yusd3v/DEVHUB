local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "D3V | MIC UP 🔊",
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
    Invite = "uwu", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
    RememberJoins = true -- Set this to false to make them join the discord every time they load it up
},

KeySystem = false, -- Set this to true to use our key system
KeySettings = {
    Title = "Mic up",
    Subtitle = "locked to trusted ppl only",
    Note = "Discord yusd3v dm for the key ", -- Use this to tell the user how to get a key
    FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
    SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
    GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
    Key = {"w"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
}
})

local tab1 = Window:CreateTab("Local Player", nil) -- Title, Image
local tab2 = Window:CreateTab("Players", nil) -- Title, Image
local tab3 = Window:CreateTab("Exploits", nil) -- Title, Image
local tab6 = Window:CreateTab("Map", nil)
local tab7 = Window:CreateTab("Chat", nil)
local tab4 = Window:CreateTab("TPs [working on this]", nil) -- Title, Image 
local tab5 = Window:CreateTab("Animations", nil)
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
             loadstring(game:HttpGet("https://pastebin.com/raw/qWeSAumd"))()
    end,
 })



local Button = tab3:CreateButton({
    Name = "ctrl click TP",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://pastebin.com/raw/2xGwLCAY"))()
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

local Button = tab3:CreateButton({
    Name = "noclip [N]",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://pastebin.com/raw/bNWy6Gvb"))()
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
loadstring(game:HttpGet("https://pastebin.com/raw/F0vzkbCC"))()
    end,
})


local Button = tab6:CreateButton({
    Name = "baseplate v1.1",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://pastebin.com/raw/7Z71ga7C"))()
    end,
})

local Button = tab1:CreateButton({
    Name = "vc unbanner [WORKS]",
    Callback = function()
            local IsStudio = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/platinumicy/unsuspend/refs/heads/main/unsuspend"))()
    end,
})



local BangInput = tab2:CreateInput({
    Name = "Bang Command",
    PlaceholderText = "Enter Player Name",
    RemoveTextAfterFocusLost = false,
    Callback = function(playerName)
       local speaker = game.Players.LocalPlayer
       if not speaker or not speaker.Character then return end
 
       local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
       if not humanoid then return end
 
       -- Load the animation
       bangAnim = Instance.new("Animation")
       bangAnim.AnimationId = speaker.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15 
          and "rbxassetid://5918726674" or "rbxassetid://148840371"
 
       bang = humanoid:LoadAnimation(bangAnim)
       bang:Play(0.1, 1, 1)
       bang:AdjustSpeed(3) -- Default speed
 
       -- Cleanup on death
       bangDied = humanoid.Died:Connect(function()
          bang:Stop()
          bangAnim:Destroy()
          bangDied:Disconnect()
          if bangLoop then bangLoop:Disconnect() end
       end)
 
       -- Get target player
       local targetPlayer = game.Players:FindFirstChild(playerName)
       if targetPlayer and targetPlayer.Character then
          local bangOffset = CFrame.new(0, 0, 1.1)
          bangLoop = game:GetService("RunService").Stepped:Connect(function()
             pcall(function()
                local otherRoot = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if otherRoot then
                   local speakerRoot = speaker.Character:FindFirstChild("HumanoidRootPart")
                   if speakerRoot then
                      speakerRoot.CFrame = otherRoot.CFrame * bangOffset
                   end
                end
             end)
          end)
       end
    end
 })
 

local Button = tab2:CreateButton({
    Name = "Unbang",
    Callback = function()
       if bangDied then
          bangDied:Disconnect()
       end
       if bang then
          bang:Stop()
       end
       if bangAnim then
          bangAnim:Destroy()
       end
       if bangLoop then
          bangLoop:Disconnect()
       end
    end,
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





-- teleports [working on this.]

local TeleportButton = tab4:CreateButton({
    Name = "TP To Private Room (Roof)",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(4220.37842, 23.5336628, 61.3636169) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab4:CreateButton({
    Name = "TP To Stage Mic",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(-61.6848221, 10.0853853, 229.676834) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab4:CreateButton({
    Name = "TP To Donut Shop (Behind Counter)",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(-122.382172, 3.22726321, -83.5359192) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })
 local TeleportButton = tab4:CreateButton({
    Name = "TP To Tower (Highest Part)",
    Callback = function()
       local player = game.Players.LocalPlayer
       if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          -- Set coordinates (change these values as needed)
          local targetPosition = Vector3.new(58.0468788, 313.312622, 225.215027) -- X, Y, Z coordinates
 
          -- Teleport the player
          player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
       end
    end,
 })

