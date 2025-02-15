local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:FindFirstChildOfClass("PlayerGui")

-- Create the main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true  -- Make the UI draggable
frame.Parent = screenGui

-- Create a UI Corner for rounded edges
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame

-- Create the button
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 30)
button.Text = "Get Coordinates"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
button.Parent = frame

-- Create a UI Corner for button rounding
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = button

-- Function to get and copy coordinates
local function getCoords()
    local pos = rootPart.Position
    local coords = string.format("%.2f, %.2f, %.2f", pos.X, pos.Y, pos.Z) -- Only numbers
    
    -- Copy to clipboard
    setclipboard(coords)
    
    -- Change button text temporarily to confirm action
    button.Text = "Copied!"
    task.wait(1.5)
    button.Text = "Get Coordinates"
end

button.MouseButton1Click:Connect(getCoords)
