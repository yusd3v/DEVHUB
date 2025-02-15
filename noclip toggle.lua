local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local noclip = false  -- Start with noclip off

-- Function to toggle noclip mode
local function toggleNoclip()
    noclip = not noclip
    if noclip then
        print("Noclip Enabled")
    else
        print("Noclip Disabled")
        -- Re-enable collisions when disabling noclip
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        -- Force the player to jump once when disabling noclip
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

-- Listen for key press ("N" to toggle noclip)
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.N then
        toggleNoclip()
    end
end)

runService.Stepped:Connect(function()
    if noclip and character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
