local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(1, -250, 0.5, -75)  -- Middle-right of the screen
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.Parent = screenGui

-- Draggable functionality (on the title area)
local dragInput, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and input.Position.Y <= 50 then
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragInput = nil
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragInput then
        updateInput(input)
    end
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = mainFrame

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.3, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Script by Yus"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.GothamBold
textLabel.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0.5, 0)
toggleButton.Position = UDim2.new(0, 0, 0.3, 0)
toggleButton.Text = "Off"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
toggleButton.Font = Enum.Font.GothamBold
toggleButton.Parent = mainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Parent = toggleButton

-- Textures Button
local texturesButton = Instance.new("TextButton")
texturesButton.Size = UDim2.new(1, 0, 0.2, 0)
texturesButton.Position = UDim2.new(0, 0, 0.8, 0)
texturesButton.Text = "Textures"
texturesButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)  -- Yellow for Textures button
texturesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
texturesButton.TextScaled = true
texturesButton.Font = Enum.Font.GothamBold
texturesButton.Parent = mainFrame

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(1, 0, 0.2, 0)
discordButton.Position = UDim2.new(0, 0, 1, 0)
discordButton.Text = "Discord"
discordButton.BackgroundColor3 = Color3.fromRGB(28, 161, 242)
discordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.TextScaled = true
discordButton.Font = Enum.Font.GothamBold
discordButton.Parent = mainFrame

local discordStroke = Instance.new("UIStroke")
discordStroke.Thickness = 2
discordStroke.Color = Color3.fromRGB(0, 0, 0)
discordStroke.Parent = discordButton

-- Notification Label
local notificationLabel = Instance.new("TextLabel")
notificationLabel.Size = UDim2.new(0, 300, 0, 40)
notificationLabel.Position = UDim2.new(0.5, -150, 0, 5)
notificationLabel.BackgroundTransparency = 1
notificationLabel.Text = ""
notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
notificationLabel.TextScaled = true
notificationLabel.Font = Enum.Font.Gotham
notificationLabel.Parent = screenGui

-- Baseplate Settings
local baseplates = {}
local currentTexture = "Asphalt"  -- Set default texture to Asphalt

for X = -10000, 10000, 512 do
    for Z = -10000, 10000, 512 do
        local P = Instance.new("Part")
        P.Anchored = true
        P.Locked = true
        P.Size = Vector3.new(512, 1, 512)
        P.CFrame = CFrame.new(X, -0.5, Z)

        -- Default texture set to Asphalt
        if currentTexture == "Asphalt" then
            P.Material = Enum.Material.Asphalt
            P.Color = Color3.fromRGB(50, 50, 50)  -- Darker grey for the asphalt
        end
        
        P.Transparency = 1
        P.CanCollide = false
        P.Parent = game.Workspace

        table.insert(baseplates, P)
    end
end

local function toggleBaseplate()
    for _, part in pairs(baseplates) do
        if part.Transparency == 0 then
            part.Transparency = 1
            part.CanCollide = false
        else
            part.Transparency = 0
            part.CanCollide = true
        end
    end

    if toggleButton.Text == "Off" then
        toggleButton.BackgroundColor3 = Color3.fromRGB(85, 255, 85)
        toggleButton.Text = "On"
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
        toggleButton.Text = "Off"
    end
end

toggleButton.MouseButton1Click:Connect(function()
    toggleBaseplate()
end)

-- Discord Button Functionality
discordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/2Y9xnBXNy9")
    notificationLabel.Text = "Discord link copied to clipboard!"
    task.delay(2, function()
        notificationLabel.Text = ""
    end)
end)

-- Texture Menu and UI Updates
local textureMenu = Instance.new("Frame")
textureMenu.Size = UDim2.new(0, 600, 0, 300)
textureMenu.Position = UDim2.new(0.5, -300, 0.5, -150)
textureMenu.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
textureMenu.BackgroundTransparency = 0.5  -- Make the texture menu's background transparent
textureMenu.Visible = false
textureMenu.Parent = screenGui

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 15)
UICorner2.Parent = textureMenu

-- Title for Texture Menu removed

-- Create a grid layout for the texture buttons (3 per row)
local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = textureMenu
gridLayout.CellSize = UDim2.new(0, 180, 0, 50)
gridLayout.FillDirection = Enum.FillDirection.Vertical  -- Make buttons go vertically under the title
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10)

local textureButtons = {}

-- Generate the texture buttons dynamically
local textures = {
    "Asphalt", "Grass"  -- Only Asphalt and Grass as options now
}

for i, texture in ipairs(textures) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Text = texture
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Parent = textureMenu

    button.MouseButton1Click:Connect(function()
        currentTexture = texture
        -- Update the texture for all baseplates
        for _, part in ipairs(baseplates) do
            if texture == "Asphalt" then
                part.Material = Enum.Material.Asphalt
                part.Color = Color3.fromRGB(50, 50, 50)
            elseif texture == "Grass" then
                part.Material = Enum.Material.Grass
                part.Color = Color3.fromRGB(0, 180, 0)  -- Darker green for grass (micup-like)
            end
        end

        notificationLabel.Text = "Texture changed to " .. texture
        task.delay(2, function()
            notificationLabel.Text = ""
        end)

        -- Hide the texture menu after a selection is made
        textureMenu.Visible = false
    end)
end

texturesButton.MouseButton1Click:Connect(function()
    textureMenu.Visible = not textureMenu.Visible
end)

-- Toggle UI visibility with H key press
local uiVisible = true
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.H then
        uiVisible = not uiVisible
        mainFrame.Visible = uiVisible

        -- Only show texture menu if it was already visible before hiding
        if uiVisible then
            textureMenu.Visible = texturesButton.Text == "Textures" and textureMenu.Visible or false
        end
    end
end)
