-- Services
local Players = game:GetService("Players")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer

-----------------------------------------------------------
-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ServerCrasherGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main Frame (smaller, rounded, with gradient)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 160) -- expanded size when not minimized
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
}
UIGradient.Parent = MainFrame

-- Title Bar (for dragging, with title, minimize, and close buttons)
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 28)
TitleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -90, 1, 0)  -- leave space for two buttons
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Server lagger"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.Parent = TitleBar

-- Minimize Button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 40, 1, 0)
MinimizeButton.Position = UDim2.new(1, -90, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.Text = "–"
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Parent = TitleBar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 1, 0)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleBar

-- Content Frame (holds the two toggle buttons)
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, -28)
ContentFrame.Position = UDim2.new(0, 0, 0, 28)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Lag Server Button (exact functionality as original "Lag Switch")
local LagServerButton = Instance.new("TextButton")
LagServerButton.Name = "LagServerButton"
LagServerButton.Size = UDim2.new(0.85, 0, 0, 40)
LagServerButton.Position = UDim2.new(0.075, 0, 0, 10)
LagServerButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
LagServerButton.Text = "Lag Server: OFF"
LagServerButton.TextColor3 = Color3.new(1, 1, 1)
LagServerButton.Font = Enum.Font.Gotham
LagServerButton.TextSize = 16
LagServerButton.Parent = ContentFrame

-- Anti Lag Button
local AntiLagButton = Instance.new("TextButton")
AntiLagButton.Name = "AntiLagButton"
AntiLagButton.Size = UDim2.new(0.85, 0, 0, 40)
AntiLagButton.Position = UDim2.new(0.075, 0, 0, 60)
AntiLagButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AntiLagButton.Text = "Anti Lag: OFF"
AntiLagButton.TextColor3 = Color3.new(1, 1, 1)
AntiLagButton.Font = Enum.Font.Gotham
AntiLagButton.TextSize = 16
AntiLagButton.Parent = ContentFrame

-----------------------------------------------------------
-- Draggable Functionality (mouse and touch)
local dragging, dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	MainFrame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

-- Close Button Functionality
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Minimize Functionality: toggle content visibility and adjust frame size
local minimized = false
local expandedSize = UDim2.new(0, 300, 0, 160)
local minimizedSize = UDim2.new(0, 300, 0, 28)

MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		ContentFrame.Visible = false
		MainFrame:TweenSize(minimizedSize, "Out", "Quad", 0.2, true)
		MinimizeButton.Text = "+"
	else
		ContentFrame.Visible = true
		MainFrame:TweenSize(expandedSize, "Out", "Quad", 0.2, true)
		MinimizeButton.Text = "–"
	end
end)

-----------------------------------------------------------
-- EXACT Original Lag Server & Anti Lag Functionality

-- Remote events and functions (from original file)
local ragdollEvent = replicatedStorage:FindFirstChild("RagdollEvent")
local unragdollEvent = replicatedStorage:FindFirstChild("UnragdollEvent")
local ToggleDisallowEvent = replicatedStorage:WaitForChild("ToggleDisallowEvent")
local ModifyUserEvent = replicatedStorage:WaitForChild("ModifyUserEvent")
local ModifyUsername_upvr = replicatedStorage:WaitForChild("ModifyUsername")
local micEvent = replicatedStorage:WaitForChild("MicEvent")

-----------------------------------------------------------
-- Lag Server (originally "Lag Switch") variables and functions

local lagToggled = false      -- corresponds to "toggled" in original file
local lagEnabled = false      -- corresponds to "enabled" in original file
local ragdollConnection
local lastModifiedUsername = nil

local function setVelocityToZero(part)
	if part then
		part.AssemblyLinearVelocity = Vector3.zero
		part.AssemblyAngularVelocity = Vector3.zero
	end
end

local function isDonutInInventory()
	for _, item in ipairs(localPlayer.Backpack:GetChildren()) do
		if item.Name == "GradientDonut" then
			return true
		end
	end
	return false
end

local function loopFunction()
	-- Original file uses a while loop; here we call it once if lagToggled is true.
	while lagToggled do
		micEvent:FireServer("GradientDonut")
		if isDonutInInventory() then
			local donut = localPlayer.Backpack:FindFirstChild("GradientDonut")
			if donut then
				donut.Parent = localPlayer.Character
			end
		end
		wait(2)
	end
end

local function toggleRagdoll()
	local character = localPlayer.Character
	if not character then return end
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	
	if lagEnabled then
		-- Before ragdolling, perform character switching as in original
		if lagToggled then
			lastModifiedUsername = "24k_mxtty1"
			ModifyUsername_upvr:FireServer("24k_mxtty1")
			wait(1)
		else
			ToggleDisallowEvent:FireServer()
			ModifyUserEvent:FireServer(localPlayer.Name)
			wait(1)
			ToggleDisallowEvent:FireServer()
		end

		if humanoid then
			humanoid.PlatformStand = true
		end
		if rootPart then
			rootPart.Anchored = true
		end
		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				part.Anchored = true
				part.AssemblyLinearVelocity = Vector3.zero
				part.AssemblyAngularVelocity = Vector3.zero
			end
		end

		ragdollEvent:FireServer()
		wait(0.2)
		local oldCFrame = rootPart.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(math.rad(-90), 0, 0)
		local offset = 100000
		ragdollConnection = runService.Heartbeat:Connect(function()
			if not character or not lagEnabled then return end
			local parts = {
				Head = oldCFrame * CFrame.new(0, 0, -offset/2),
				UpperTorso = oldCFrame * CFrame.new(0, offset, 0),
				LowerTorso = oldCFrame * CFrame.new(0, -offset/2, 0),
				RightUpperArm = oldCFrame * CFrame.new(offset, 0, 0),
				RightLowerArm = oldCFrame * CFrame.new(offset*1.5, 0, 0),
				RightHand = oldCFrame * CFrame.new(offset*2, 0, 0),
				LeftUpperArm = oldCFrame * CFrame.new(-offset, 0, 0),
				LeftLowerArm = oldCFrame * CFrame.new(-offset*1.5, 0, 0),
				LeftHand = oldCFrame * CFrame.new(-offset*2, 0, 0),
				RightUpperLeg = oldCFrame * CFrame.new(offset/2, -offset, 0),
				RightLowerLeg = oldCFrame * CFrame.new(offset/2, -offset*1.5, 0),
				RightFoot = oldCFrame * CFrame.new(offset/2, -offset*2, 0),
				LeftUpperLeg = oldCFrame * CFrame.new(-offset/2, -offset, 0),
				LeftLowerLeg = oldCFrame * CFrame.new(-offset/2, -offset*1.5, 0),
				LeftFoot = oldCFrame * CFrame.new(-offset/2, -offset*2, 0)
			}
			for partName, cf in pairs(parts) do
				local part = character:FindFirstChild(partName)
				if part then
					part.CFrame = cf
					setVelocityToZero(part)
				end
			end
		end)
		
		if lagToggled then
			-- Call loopFunction if lagToggled is true (mimicking original behavior)
			spawn(loopFunction)
		end
	else
		-- Disable Lag Server effect
		unragdollEvent:FireServer()
		if ragdollConnection then
			ragdollConnection:Disconnect()
		end
		for _, part in pairs(character:GetChildren()) do
			if part:IsA("BasePart") then
				part.Anchored = false
			end
		end
		if humanoid then
			humanoid.PlatformStand = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
		end
		ToggleDisallowEvent:FireServer()
		ModifyUserEvent:FireServer(localPlayer.Name)
		wait(1)
		ToggleDisallowEvent:FireServer()
	end
end

-- Callback for Lag Server Button (exactly as in original file)
LagServerButton.MouseButton1Click:Connect(function()
	lagToggled = not lagToggled
	lagEnabled = lagToggled  -- both are set to the same state as per original code
	if lagToggled then
		LagServerButton.Text = "Lag Server: ON"
	else
		LagServerButton.Text = "Lag Server: OFF"
	end
	toggleRagdoll()
end)

-----------------------------------------------------------
-- Anti Lag Section (exact original functionality)

local targetItemNames = {"aura", "Fluffy Satin Gloves Black"}
local antiLagToggled = false  -- separate variable for anti lag

local function hasItemInName(accessory)
	for _, itemName in pairs(targetItemNames) do
		if accessory.Name:lower():find(itemName:lower()) then
			return true
		end
	end
	return false
end

local function isAccessoryOnHeadOrAbove(accessory)
	local handle = accessory:FindFirstChild("Handle")
	if handle and handle.Parent and handle.Parent.Name == "Head" then
		return true
	end
	local attachment = accessory:FindFirstChildWhichIsA("Attachment")
	if attachment and attachment.Parent and attachment.Parent.Name == "Head" then
		return true
	end
	if accessory.Parent and accessory.Parent:IsA("Model") then
		local head = accessory.Parent:FindFirstChild("Head")
		if head and handle and handle.Position.Y >= head.Position.Y then
			return true
		end
	end
	return false
end

local function removeTargetedItems(character)
	if not character then return end
	for _, item in pairs(character:GetChildren()) do
		if item:IsA("Accessory") and hasItemInName(item) then
			if not isAccessoryOnHeadOrAbove(item) then
				item:Destroy()
			end
		end
	end
end

local function removeGradientDonuts()
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and string.lower(obj.Name):find("gradientdonut") then
			obj:Destroy()
		end
	end
end

local function continuouslyCheckItems()
	while antiLagToggled do
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character then
				removeTargetedItems(player.Character)
			end
		end
		removeGradientDonuts()
		wait(1)
	end
end

-- Callback for Anti Lag Button (exact original behavior)
AntiLagButton.MouseButton1Click:Connect(function()
	antiLagToggled = not antiLagToggled
	if antiLagToggled then
		AntiLagButton.Text = "Anti Lag: ON"
		spawn(continuouslyCheckItems)
	else
		AntiLagButton.Text = "Anti Lag: OFF"
	end
end)
