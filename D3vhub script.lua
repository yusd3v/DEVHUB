local Flux = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt"))()

-- List of valid keys
local validKeys = {
    "KEY-BaVT3eGNp9uk7UL",
    "KEY-PLx94mDzA7yQ2Tg",
    "KEY-Ks8dGmBvR5oXjN1",
    "KEY-Qp4YrNzM7XaV5Lb",
    "KEY-Wo9JmXgB26Tq8Ky",
    "KEY-DzA3VpY7NXqL4Km",
    "KEY-XjN1GmBv5oK8dR2",
    "KEY-NzM7XaV5LbQp4Yr",
    "KEY-MB26Tq8KyWo9JmXg",
    "KEY-L4KmDzA3VpY7NXq",
    "dev-key"
}

local keyEntered = false

local keyWindow = Flux:Window("Key System", "Enter Key to Access UI", Color3.fromRGB(0, 0, 0), nil, false)
keyWindow.BackgroundTransparency = 0.4 -- Make it more transparent
local keyTab = keyWindow:Tab("Key Entry", "http://www.roblox.com/asset/?id=6023426915")
local socialsTab = keyWindow:Tab("Socials", "http://www.roblox.com/asset/?id=6023426915")

keyTab:Textbox("Enter Key", "Input the correct key to unlock UI.", true, function(input)
    for _, key in pairs(validKeys) do
        if input == key then
            keyEntered = true
            keyWindow:Destroy() -- Fully remove key UI
            break
        end
    end
    if not keyEntered then
        Flux:Notification("Incorrect Key!", "Try Again")
    end
end)

socialsTab:Button("Buy a key here", "Copy Discord link", function()
    setclipboard("https://discord.gg/d3vhub")
    Flux:Notification("Copied Discord link!", "Success")
end)

repeat wait() until keyEntered

-- Main UI (Locked in center, no dragging)
local win = Flux:Window("D3VHUB", "MIC UP 🔊", Color3.fromRGB(0, 0, 0), nil, false)
win.BackgroundTransparency = 0.3 

-- Home Tab
local homeTab = win:Tab("Home", "http://www.roblox.com/asset/?id=6023426915")
homeTab:Button("Info", "General information about the script.", function()
    Flux:Notification("D3VHUB is a powerful script with various features!", "Info")
end)
homeTab:Button("Help", "How to use the script.", function()
    Flux:Notification("To use D3VHUB, enter a valid key and explore the available features!", "Help")
end)
homeTab:Button("Credits", "Acknowledgments for the script.", function()
    Flux:Notification("Developed by yusd3v and credits to other", "Credits")
end)

-- Player Tab
local playerTab = win:Tab("Player", "http://www.roblox.com/asset/?id=6022668888")
playerTab:Slider("Player Speed", "Adjust your movement speed.", 0, 120, 16, function(value)
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("Humanoid") then
        player.Humanoid.WalkSpeed = value
    end
end)
playerTab:Slider("Player Jump Height", "Adjust your jump height.", 0, 200, 50, function(value)
    local player = game.Players.LocalPlayer.Character
    if player and player:FindFirstChild("Humanoid") then
        player.Humanoid.UseJumpPower = true
        player.Humanoid.JumpPower = value
    end
end)

-- Extra Feature Tabs
local function createExtraTab(tabName, features)
    local tab = win:Tab(tabName, "http://www.roblox.com/asset/?id=6023426915")

    for _, feature in pairs(features) do
        tab:Button(feature.name, feature.desc, function()
            local success, err = pcall(function()
                loadstring(game:HttpGet(feature.scriptURL))()
            end)
            
            if success then
                Flux:Notification(feature.name .. " executed!", "Success")
            else
                Flux:Notification("Error loading " .. feature.name .. ": " .. err, "Error")
            end
        end)
    end
end

createExtraTab("Map", {
    {name = "Graphics", desc = "makes your game look alot nicer.", scriptURL = "https://pastebin.com/raw/F0vzkbCC"},
    {name = "Baseplate", desc = "adds a huge baseplate and gui to toggle [H]", scriptURL = "https://pastebin.com/raw/7Z71ga7C"}
})

createExtraTab("Exploits", {
    {name = "rewind", desc = "Allows you to rewind by holding [C]", scriptURL = "https://raw.githubusercontent.com/nomercy0000/rewind/refs/heads/main/reverse"},
    {name = "infiniteyield", desc = "good script [;]", scriptURL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {name = "systembroken", desc = "very good menu needs updated tho [B]", scriptURL = "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"},      
    {name = "CTRL Click TP", desc = "just as it sounds ctrl click tp", scriptURL = "https://pastebin.com/raw/2xGwLCAY"}   
})


createExtraTab("Freaky", {
    {name = "Jerk off", desc = "...", scriptURL = "https://pastefy.app/YZoglOyJ/raw"},
    {name = "Face bang", desc = "... [Z]", scriptURL = "https://raw.githubusercontent.com/EnterpriseExperience/bruhlolw/refs/heads/main/face_bang_script.lua"}
})


createExtraTab("Animation", {
    {name = "emote menu", desc = "simple emotes menu [,]", scriptURL = "https://raw.githubusercontent.com/platinumicy/emotemenu/refs/heads/main/skibbiti"},  
})

createExtraTab("risky", {
    {name = "vc unbanner", desc = "use at your own risk", scriptURL = "https://raw.githubusercontent.com/platinumicy/unsuspend/refs/heads/main/unsuspend"},      
})
-- createExtraTab("TPs [working on this]", {
--     {name = "Extra Feature 5", desc = "More cool stuff.", scriptURL = ""},
--     {name = "Extra Feature 6", desc = "Even more awesome features.", scriptURL = ""}
-- })


-- zoomout [starts on load]

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