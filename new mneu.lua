local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🟢 D3VHUB MICUP 🟢",
    LoadingTitle = "D3V Hub",
    LoadingSubtitle = "by D3VHUB.",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "0000", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "D3V | Key",
       Subtitle = "Get the fucking key you new gen ðŸ˜¡",
       Note = "Join Server for the key discord.gg/Nj3WtEtM",
       FileName = "https://pastebin.com/raw/1tu21VN4", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"123"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local MainTab = Window:CreateTab("🏠  Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("📝Main")
Rayfield:Notify({
   Title = "You executed the script",
   Content = "Fucking Amazing Gui!",
   Duration = 6.5,
   Image = 4483362458,
})


local Slider = MainTab:CreateSlider({
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


local Button = MainTab:CreateButton({
   Name = "Clear Chat",
   Interact = 'Click',
   Callback = function()
if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r.") else game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Not Supported", Text = "This game has the legacy ROBLOX chat version. The script can only be used in the new version of the ROBLOX chat. Sorry :("}) end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Dash Animation",
   Interact = 'Click',
   Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/kgH8b7LD"))()
   end,
})

local MainSection = MainTab:CreateSection("⭐New Shit⭐")

local Button = MainTab:CreateButton({
   Name = "Spam Firework (If you reset it will go away)",
   Interact = 'Click',
   Callback = function()
            -- Create GUI
local gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Top = Instance.new("TextLabel")
local Line = Instance.new("Frame")
local Btn = Instance.new("TextButton")

if gethui then
    gui.Parent = gethui()
elseif syn and syn.protect_gui then
    syn.protect_gui(gui)
    gui.Parent = game.CoreGui
else
    gui.Parent = game:GetService("CoreGui")
end

Main.Name = "fw"
Main.Parent = gui
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.4, 0, 0.4, 0)
Main.Size = UDim2.new(0, 160, 0, 80)
Main.Active = true

local Corner = Instance.new("UICorner", Main)
Corner.CornerRadius = UDim.new(0, 4)

local Shadow = Instance.new("ImageLabel", Main)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundTransparency = 1
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 10, 1, 10)
Shadow.ZIndex = -1
Shadow.Image = "rbxassetid://7912134082"
Shadow.ImageColor3 = Color3.new(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(85, 85, 425, 425)
Shadow.SliceScale = 0.05

Top.BackgroundTransparency = 1
Top.BorderSizePixel = 0
Top.Size = UDim2.new(1, 0, 0, 24)
Top.Font = Enum.Font.Gotham
Top.Text = "  chickens's bombing script"
Top.TextColor3 = Color3.fromRGB(255, 255, 255)
Top.TextSize = 12
Top.TextXAlignment = Enum.TextXAlignment.Left
Top.Parent = Main

Line.BorderSizePixel = 0
Line.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Line.Position = UDim2.new(0, 0, 0, 24)
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Parent = Main

Btn.Name = "fw"
Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Btn.BorderSizePixel = 0
Btn.AnchorPoint = Vector2.new(0.5, 0.5)
Btn.Position = UDim2.new(0.5, 0, 0.5, 12)
Btn.Size = UDim2.new(0.9, 0, 0.5, 0)
Btn.Font = Enum.Font.Gotham
Btn.Text = "Run Firework Script"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.TextSize = 12
Btn.Parent = Main
Btn.AutoButtonColor = false

local BtnCorner = Instance.new("UICorner", Btn)
BtnCorner.CornerRadius = UDim.new(0, 4)

Btn.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    }):Play()
end)

Btn.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(Btn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    }):Play()
end)

-- Firework Script Functionality
local function runFireworkScript()
    local run = true
    local plr = game:GetService("Players").LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")

    if hrp then
        local old = hrp.CFrame -- Save original position

        while run do
            task.wait()
            workspace.FallenPartsDestroyHeight = math.huge * -1 -- Avoid invalid 0/0 operation

            -- Fire ToolEvent
            local toolEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ToolEvent")
            if toolEvent then
                toolEvent:FireServer("FireworkLaunch")
            end

            -- Teleport character
            hrp.CFrame = CFrame.new(old.Position.X, old.Position.Y - 170, old.Position.Z)
            task.wait(1)

            -- Equip and activate FireworkLaunch tool
            local firework = plr.Backpack:FindFirstChild("FireworkLaunch")
            if firework then
                firework.Parent = char
                firework:Activate()
            end

            -- Return character to original position
            hrp.CFrame = old
            task.wait(3.5)

            -- Delete inventory
            local deleteInventory = game:GetService("ReplicatedStorage"):FindFirstChild("DeleteInventory")
            if deleteInventory then
                deleteInventory:FireServer()
            end

            run = false
        end
    end
end

-- Button Click Event
Btn.MouseButton1Click:Connect(function()
    print("Running Firework Script...")
    runFireworkScript()
end)

-- Dragging Functionality for Main Frame
local UserInputService = game:GetService("UserInputService")
local dragToggle
local dragSpeed = 0.1
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    game:GetService("TweenService"):Create(Main, TweenInfo.new(dragSpeed), {Position = position}):Play()
end

Main.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not dragToggle then
        dragToggle = true
        dragStart = input.Position
        startPos = Main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragToggle then
            updateInput(input)
        end
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Map Shitter",
   Interact = 'Click',
   Callback = function()
            local players = game:GetService("Players")
local run_service = game:GetService("RunService")
local replicated_storage = game:GetService("ReplicatedStorage")

local local_player = players.LocalPlayer
local ragdoll_event = replicated_storage.RagdollEvent

local character = local_player.Character

local offset = 100000
local root_part = character.HumanoidRootPart
local old_cframe = root_part.CFrame * CFrame.new(0, 2, 0) * CFrame.Angles(math.rad(-90), 0, 0)
task.wait()
local head = character.Head
local upper_torso = character.UpperTorso
local lower_torso = character.LowerTorso

local right_upper_arm = character.RightUpperArm
local right_lower_arm = character.RightLowerArm
local right_hand = character.RightHand

local left_upper_arm = character.LeftUpperArm
local left_lower_arm = character.LeftLowerArm
local left_hand = character.LeftHand

local right_upper_leg = character.RightUpperLeg
local right_lower_leg = character.RightLowerLeg
local right_foot = character.RightFoot

local left_upper_leg = character.LeftUpperLeg
local left_lower_leg = character.LeftLowerLeg
local left_foot = character.LeftFoot

ragdoll_event:FireServer()
upper_torso:WaitForChild("BallSocketConstraint")

local function set_velocity_to_zero(part)
    part.AssemblyLinearVelocity = Vector3.zero
    part.AssemblyAngularVelocity = Vector3.zero
end

run_service.Heartbeat:Connect(function()
    head.CFrame = old_cframe * CFrame.new(0, 0, -offset / 2)
    upper_torso.CFrame = old_cframe * CFrame.new(0, offset, 0)
    lower_torso.CFrame = old_cframe * CFrame.new(0, -offset / 2, 0)

    right_upper_arm.CFrame = old_cframe * CFrame.new(offset, 0, 0)
    right_lower_arm.CFrame = old_cframe * CFrame.new(offset * 1.5, 0, 0)
    right_hand.CFrame = old_cframe * CFrame.new(offset * 2, 0, 0)

    left_upper_arm.CFrame = old_cframe * CFrame.new(-offset, 0, 0)
    left_lower_arm.CFrame = old_cframe * CFrame.new(-offset * 1.5, 0, 0)
    left_hand.CFrame = old_cframe * CFrame.new(-offset * 2, 0, 0)

    right_upper_leg.CFrame = old_cframe * CFrame.new(offset / 2, -offset, 0)
    right_lower_leg.CFrame = old_cframe * CFrame.new(offset / 2, -offset * 1.5, 0)
    right_foot.CFrame = old_cframe * CFrame.new(offset / 2, -offset * 2, 0)

    left_upper_leg.CFrame = old_cframe * CFrame.new(-offset / 2, -offset, 0)
    left_lower_leg.CFrame = old_cframe * CFrame.new(-offset / 2, -offset * 1.5, 0)
    left_foot.CFrame = old_cframe * CFrame.new(-offset / 2, -offset * 2, 0)

    set_velocity_to_zero(head)
    set_velocity_to_zero(upper_torso)
    set_velocity_to_zero(lower_torso)
    set_velocity_to_zero(right_upper_arm)
    set_velocity_to_zero(right_lower_arm)
    set_velocity_to_zero(right_hand)
    set_velocity_to_zero(left_upper_arm)
    set_velocity_to_zero(left_lower_arm)
    set_velocity_to_zero(left_hand)
    set_velocity_to_zero(right_upper_leg)
    set_velocity_to_zero(right_lower_leg)
    set_velocity_to_zero(right_foot)
    set_velocity_to_zero(left_upper_leg)
    set_velocity_to_zero(left_lower_leg)
    set_velocity_to_zero(left_foot)
end)

   end,
})

local MainSection = MainTab:CreateSection("Once Enabled✔️ You Can NOT Disable❌")
local trackValue = false -- match to the default value of the toggle
local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local Toggle = MainTab:CreateToggle({
   Name = "Anti Void",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)

            b = Instance.new("Part", Workspace)
            b.Size = Vector3.new(10000, 0, 10000)
            b.BrickColor = BrickColor.new("Dark Green")
            b.Anchored = true
            b.Transparency = 1
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Anti Bang",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://pastebin.com/raw/Wcxvy501"))()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Unsuspend Vc",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/platinumicy/unsuspend/refs/heads/main/unsuspend"))()
   end,
})

local MainSection = MainTab:CreateSection("Made by D3V | R15 FE Animations Coming Soon..")

local PlrTab = Window:CreateTab("😎Players", nil) -- Title, Image
local Section = PlrTab:CreateSection("Fucking Fun Shit You New Gens")

local Toggle = PlrTab:CreateToggle({
   Name = "InfiniteYield",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Toggle = PlrTab:CreateToggle({
   Name = "FE Emotes (Comma)",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            --keybind to open is comma
--made by Gi#7331

local IsStudio = false

local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local AvatarEditorService = game:GetService("AvatarEditorService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local Emotes = {}
local function AddEmote(name: string, id: IntValue, price: IntValue?)
	if not (name and id) then
		return
	end

	table.insert(Emotes, {
		["name"] = name,
		["id"] = id,
		["icon"] = "rbxthumb://type=Asset&id=".. id .."&w=150&h=150",
		["price"] = price or 0,
		["index"] = #Emotes + 1,
		["sort"] = {}
	})
end
local CurrentSort = "newestfirst"

local FavoriteOff = "rbxassetid://10651060677"
local FavoriteOn = "rbxassetid://10651061109"
local FavoritedEmotes = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Emotes"
ScreenGui.DisplayOrder = 2
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = false

local BackFrame = Instance.new("Frame")
BackFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
BackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
BackFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
BackFrame.SizeConstraint = Enum.SizeConstraint.RelativeYY
BackFrame.BackgroundTransparency = 1
BackFrame.BorderSizePixel = 0
BackFrame.Parent = ScreenGui

local EmoteName = Instance.new("TextLabel")
EmoteName.Name = "EmoteName"
EmoteName.TextScaled = true
EmoteName.AnchorPoint = Vector2.new(0.5, 0.5)
EmoteName.Position = UDim2.new(-0.1, 0, 0.5, 0)
EmoteName.Size = UDim2.new(0.2, 0, 0.2, 0)
EmoteName.SizeConstraint = Enum.SizeConstraint.RelativeYY
EmoteName.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EmoteName.TextColor3 = Color3.new(1, 1, 1)
EmoteName.BorderSizePixel = 0
EmoteName.Parent = BackFrame

local Corner = Instance.new("UICorner")
Corner.Parent = EmoteName

local Loading = Instance.new("TextLabel", BackFrame)
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.Text = "Loading..."
Loading.TextColor3 = Color3.new(1, 1, 1)
Loading.BackgroundColor3 = Color3.new(0, 0, 0)
Loading.TextScaled = true
Loading.BackgroundTransparency = 0.5
Loading.Size = UDim2.fromScale(0.2, 0.1)
Loading.Position = UDim2.fromScale(0.5, 0.2)
Corner:Clone().Parent = Loading

local Frame = Instance.new("ScrollingFrame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
Frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
Frame.ScrollingDirection = Enum.ScrollingDirection.Y
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.BackgroundTransparency = 1
Frame.ScrollBarThickness = 5
Frame.BorderSizePixel = 0
Frame.MouseLeave:Connect(function()
	EmoteName.Text = "Select an Emote"
end)
Frame.Parent = BackFrame

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.105, 0, 0, 0)
Grid.CellPadding = UDim2.new(0.006, 0, 0.006, 0)
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.Parent = Frame

local SortFrame = Instance.new("Frame")
SortFrame.Visible = false
SortFrame.BorderSizePixel = 0
SortFrame.Position = UDim2.new(1, 5, -0.125, 0)
SortFrame.Size = UDim2.new(0.2, 0, 0, 0)
SortFrame.AutomaticSize = Enum.AutomaticSize.Y
SortFrame.BackgroundTransparency = 1
Corner:Clone().Parent = SortFrame
SortFrame.Parent = BackFrame

local SortList = Instance.new("UIListLayout")
SortList.Padding = UDim.new(0.02, 0)
SortList.HorizontalAlignment = Enum.HorizontalAlignment.Center
SortList.VerticalAlignment = Enum.VerticalAlignment.Top
SortList.SortOrder = Enum.SortOrder.LayoutOrder
SortList.Parent = SortFrame

local function SortEmotes()
	for i,Emote in pairs(Emotes) do
		local EmoteButton = Frame:FindFirstChild(Emote.id)
		if not EmoteButton then
			continue
		end
		local IsFavorited = table.find(FavoritedEmotes, Emote.id)
		EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + ((IsFavorited and 0) or #Emotes)
		EmoteButton.number.Text = Emote.sort[CurrentSort]
	end
end

local function createsort(order, text, sort)
	local CreatedSort = Instance.new("TextButton")
	CreatedSort.SizeConstraint = Enum.SizeConstraint.RelativeXX
	CreatedSort.Size = UDim2.new(1, 0, 0.2, 0)
	CreatedSort.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	CreatedSort.LayoutOrder = order
	CreatedSort.TextColor3 = Color3.new(1, 1, 1)
	CreatedSort.Text = text
	CreatedSort.TextScaled = true
	CreatedSort.BorderSizePixel = 0
	Corner:Clone().Parent = CreatedSort
	CreatedSort.Parent = SortFrame
	CreatedSort.MouseButton1Click:Connect(function()
		SortFrame.Visible = false
		CurrentSort = sort
		SortEmotes()
	end)
	return CreatedSort
end

createsort(1, "Newest First", "newestfirst")
createsort(2, "Oldest First", "oldestfirst")
createsort(3, "Alphabetically First", "alphabeticfirst")
createsort(4, "Alphabetically Last", "alphabeticlast")
createsort(5, "Highest Price", "highestprice")
createsort(6, "Lowest Price", "lowestprice")

local SortButton = Instance.new("TextButton")
SortButton.BorderSizePixel = 0
SortButton.AnchorPoint = Vector2.new(0.5, 0.5)
SortButton.Position = UDim2.new(0.925, -5, -0.075, 0)
SortButton.Size = UDim2.new(0.15, 0, 0.1, 0)
SortButton.TextScaled = true
SortButton.TextColor3 = Color3.new(1, 1, 1)
SortButton.BackgroundColor3 = Color3.new(0, 0, 0)
SortButton.BackgroundTransparency = 0.3
SortButton.Text = "Sort"
SortButton.MouseButton1Click:Connect(function()
	SortFrame.Visible = not SortFrame.Visible
end)
Corner:Clone().Parent = SortButton
SortButton.Parent = BackFrame

local CloseButton = Instance.new("TextButton")
CloseButton.BorderSizePixel = 0
CloseButton.AnchorPoint = Vector2.new(0.5, 0.5)
CloseButton.Position = UDim2.new(0.075, 0, -0.075, 0)
CloseButton.Size = UDim2.new(0.15, 0, 0.1, 0)
CloseButton.TextScaled = true
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(0, 0, 0)
CloseButton.BackgroundTransparency = 0.3
CloseButton.Text = "Close"
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui.Enabled = false
end)
Corner:Clone().Parent = CloseButton
CloseButton.Parent = BackFrame

local SearchBar = Instance.new("TextBox")
SearchBar.BorderSizePixel = 0
SearchBar.AnchorPoint = Vector2.new(0.5, 0.5)
SearchBar.Position = UDim2.new(0.5, 0, -0.075, 0)
SearchBar.Size = UDim2.new(0.55, 0, 0.1, 0)
SearchBar.TextScaled = true
SearchBar.PlaceholderText = "Search"
SearchBar.TextColor3 = Color3.new(1, 1, 1)
SearchBar.BackgroundColor3 = Color3.new(0, 0, 0)
SearchBar.BackgroundTransparency = 0.3
SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
	local text = SearchBar.Text:lower()
	local buttons = Frame:GetChildren()
	if text ~= text:sub(1,50) then
		SearchBar.Text = SearchBar.Text:sub(1,50)
		text = SearchBar.Text:lower()
	end
	if text ~= ""  then
		for i,button in pairs(buttons) do
			if button:IsA("GuiButton") then
				local name = button:GetAttribute("name"):lower()
				if name:match(text) then
					button.Visible = true
				else
					button.Visible = false
				end
			end
		end
	else
		for i,button in pairs(buttons) do
			if button:IsA("GuiButton") then
				button.Visible = true
			end
		end
	end
end)
Corner:Clone().Parent = SearchBar
SearchBar.Parent = BackFrame

local function openemotes(name, state, input)
	if state == Enum.UserInputState.Begin then
		ScreenGui.Enabled = not ScreenGui.Enabled
	end
end

if IsStudio then
	ContextActionService:BindActionAtPriority(
		"Emote Menu",
		openemotes,
		true,
		2001,
		Enum.KeyCode.Comma
	)
else
	ContextActionService:BindCoreActionAtPriority(
		"Emote Menu",
		openemotes,
		true,
		2001,
		Enum.KeyCode.Comma
	)
end

local inputconnect
ScreenGui:GetPropertyChangedSignal("Enabled"):Connect(function()
	if ScreenGui.Enabled == true then
		EmoteName.Text = "Select an Emote"
		SearchBar.Text = ""
		SortFrame.Visible = false
		GuiService:SetEmotesMenuOpen(false)
		inputconnect = UserInputService.InputBegan:Connect(function(input, processed)
			if not processed then
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					ScreenGui.Enabled = false
				end
			end
		end)
	else
		inputconnect:Disconnect()
	end
end)

if not IsStudio then
	GuiService.EmotesMenuOpenChanged:Connect(function(isopen)
		if isopen then
			ScreenGui.Enabled = false
		end
	end)
end

GuiService.MenuOpened:Connect(function()
	ScreenGui.Enabled = false
end)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local LocalPlayer = Players.LocalPlayer

if IsStudio then
	ScreenGui.Parent = LocalPlayer.PlayerGui
else
	--thanks inf yield
	local SynV3 = syn and DrawingImmediate
	if (not is_sirhurt_closure) and (not SynV3) and (syn and syn.protect_gui) then
		syn.protect_gui(ScreenGui)
		ScreenGui.Parent = CoreGui
	elseif get_hidden_gui or gethui then
		local hiddenUI = get_hidden_gui or gethui
		ScreenGui.Parent = hiddenUI()
	else
		ScreenGui.Parent = CoreGui
	end
end


local function SendNotification(title, text)
	if (not IsStudio) and syn and syn.toast_notification then
		syn.toast_notification({
			Type = ToastType.Error,
			Title = title,
			Content = text
		})
	else
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text
		})
	end
end

local function HumanoidPlayEmote(humanoid, name, id)
	if IsStudio then
		return humanoid:PlayEmote(name)
	else
		return humanoid:PlayEmoteAndGetAnimTrackById(id)
	end
end

local function PlayEmote(name: string, id: IntValue)
	ScreenGui.Enabled = false
	SearchBar.Text = ""
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	local Description = Humanoid and Humanoid:FindFirstChildOfClass("HumanoidDescription")
	if not Description then
		return
	end
	if LocalPlayer.Character.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
		local succ, err = pcall(function()
			HumanoidPlayEmote(Humanoid, name, id)
		end)
		if not succ then
			Description:AddEmote(name, id)
			HumanoidPlayEmote(Humanoid, name, id)
		end
	else
		SendNotification(
			"r6? lol",
			"you gotta be r15 dude"
		)
	end
end

local function WaitForChildOfClass(parent, class)
	local child = parent:FindFirstChildOfClass(class)
	while not child or child.ClassName ~= class do
		child = parent.ChildAdded:Wait()
	end
	return child
end

local params = CatalogSearchParams.new()
params.AssetTypes = {Enum.AvatarAssetType.EmoteAnimation}
params.SortType = Enum.CatalogSortType.RecentlyCreated
params.SortAggregation = Enum.CatalogSortAggregation.AllTime
params.IncludeOffSale = true
params.CreatorName = "Roblox"
params.Limit = 120

local function getCatalogPage()
	local success, catalogPage = pcall(function()
		return AvatarEditorService:SearchCatalog(params)
	end)
	if not success then
		task.wait(5)
		return getCatalogPage()
	end
	return catalogPage
end

local catalogPage = getCatalogPage()

local pages = {}

while true do
	local currentPage = catalogPage:GetCurrentPage()
	table.insert(pages, currentPage)
	if catalogPage.IsFinished then
		break
	end
	local function AdvanceToNextPage()
		local success = pcall(function()
			catalogPage:AdvanceToNextPageAsync()
		end)
		if not success then
			task.wait(5)
			return AdvanceToNextPage()
		end
	end
	AdvanceToNextPage()
end

local totalEmotes = {}
for _, page in pairs(pages) do
	for _, emote in pairs(page) do
		table.insert(totalEmotes, emote)
	end
end

for i, Emote in pairs(totalEmotes) do
	AddEmote(Emote.Name, Emote.Id, Emote.Price)
end

--unreleased emotes
AddEmote("Arm Wave", 5915773155)
AddEmote("Head Banging", 5915779725)
AddEmote("Face Calisthenics", 9830731012)

--finished loading
Loading:Destroy()

--sorting options setup
table.sort(Emotes, function(a, b)
	return a.index < b.index
end)
for i,v in pairs(Emotes) do
	v.sort.newestfirst = i
end

table.sort(Emotes, function(a, b)
	return a.index > b.index
end)
for i,v in pairs(Emotes) do
	v.sort.oldestfirst = i
end

table.sort(Emotes, function(a, b)
	return a.name:lower() < b.name:lower()
end)
for i,v in pairs(Emotes) do
	v.sort.alphabeticfirst = i
end

table.sort(Emotes, function(a, b)
	return a.name:lower() > b.name:lower()
end)
for i,v in pairs(Emotes) do
	v.sort.alphabeticlast = i
end

table.sort(Emotes, function(a, b)
	return a.price < b.price
end)
for i,v in pairs(Emotes) do
	v.sort.lowestprice = i
end

table.sort(Emotes, function(a, b)
	return a.price > b.price
end)
for i,v in pairs(Emotes) do
	v.sort.highestprice = i
end


local function IsFileFunc(...)
	if IsStudio then
		return
	elseif isfile then
		return isfile(...)
	end
end

local function WriteFileFunc(...)
	if IsStudio then
		return
	elseif writefile then
		return writefile(...)
	end
end

local function ReadFileFunc(...)
	if IsStudio then
		return
	elseif readfile then
		return readfile(...)
	end
end

if not IsStudio then
	if IsFileFunc("FavoritedEmotes.txt") then
		if not pcall(function()
			FavoritedEmotes = HttpService:JSONDecode(ReadFileFunc("FavoritedEmotes.txt"))
		end) then
			FavoritedEmotes = {}
		end
	else
		WriteFileFunc("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
	end
	local UpdatedFavorites = {}
	for i,name in pairs(FavoritedEmotes) do
		if typeof(name) == "string" then
			for i,emote in pairs(Emotes) do
				if emote.name == name then
					table.insert(UpdatedFavorites, emote.id)
					break
				end
			end
		end
	end
	if #UpdatedFavorites ~= 0 then
		FavoritedEmotes = UpdatedFavorites
		WriteFileFunc("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
	end
end


local function CharacterAdded(Character)
	for i,v in pairs(Frame:GetChildren()) do
		if not v:IsA("UIGridLayout") then
			v:Destroy()
		end
	end
	local Humanoid = WaitForChildOfClass(Character, "Humanoid")
	local Description = Humanoid:WaitForChild("HumanoidDescription", 5) or Instance.new("HumanoidDescription", Humanoid)
	local random = Instance.new("TextButton")
	local Ratio = Instance.new("UIAspectRatioConstraint")
	Ratio.AspectType = Enum.AspectType.ScaleWithParentSize
	Ratio.Parent = random
	random.LayoutOrder = 0
	random.TextColor3 = Color3.new(1, 1, 1)
	random.BorderSizePixel = 0
	random.BackgroundTransparency = 0.5
	random.BackgroundColor3 = Color3.new(0, 0, 0)
	random.TextScaled = true
	random.Text = "Random"
	random:SetAttribute("name", "")
	Corner:Clone().Parent = random
	random.MouseButton1Click:Connect(function()
		local randomemote = Emotes[math.random(1, #Emotes)]
		PlayEmote(randomemote.name, randomemote.id)
	end)
	random.MouseEnter:Connect(function()
		EmoteName.Text = "Random"
	end)
	random.Parent = Frame
	for i,Emote in pairs(Emotes) do
		Description:AddEmote(Emote.name, Emote.id)
		local EmoteButton = Instance.new("ImageButton")
		local IsFavorited = table.find(FavoritedEmotes, Emote.id)
		EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + ((IsFavorited and 0) or #Emotes)
		EmoteButton.Name = Emote.id
		EmoteButton:SetAttribute("name", Emote.name)
		Corner:Clone().Parent = EmoteButton
		EmoteButton.Image = Emote.icon
		EmoteButton.BackgroundTransparency = 0.5
		EmoteButton.BackgroundColor3 = Color3.new(0, 0, 0)
		EmoteButton.BorderSizePixel = 0
		Ratio:Clone().Parent = EmoteButton
		local EmoteNumber = Instance.new("TextLabel")
		EmoteNumber.Name = "number"
		EmoteNumber.TextScaled = true
		EmoteNumber.BackgroundTransparency = 1
		EmoteNumber.TextColor3 = Color3.new(1, 1, 1)
		EmoteNumber.BorderSizePixel = 0
		EmoteNumber.AnchorPoint = Vector2.new(0.5, 0.5)
		EmoteNumber.Size = UDim2.new(0.2, 0, 0.2, 0)
		EmoteNumber.Position = UDim2.new(0.1, 0, 0.9, 0)
		EmoteNumber.Text = Emote.sort[CurrentSort]
		EmoteNumber.TextXAlignment = Enum.TextXAlignment.Center
		EmoteNumber.TextYAlignment = Enum.TextYAlignment.Center
		local UIStroke = Instance.new("UIStroke")
		UIStroke.Transparency = 0.5
		UIStroke.Parent = EmoteNumber
		EmoteNumber.Parent = EmoteButton
		EmoteButton.Parent = Frame
		EmoteButton.MouseButton1Click:Connect(function()
			PlayEmote(Emote.name, Emote.id)
		end)
		EmoteButton.MouseEnter:Connect(function()
			EmoteName.Text = Emote.name
		end)
		local Favorite = Instance.new("ImageButton")
		Favorite.Name = "favorite"
		if table.find(FavoritedEmotes, Emote.id) then
			Favorite.Image = FavoriteOn
		else
			Favorite.Image = FavoriteOff
		end
		Favorite.AnchorPoint = Vector2.new(0.5, 0.5)
		Favorite.Size = UDim2.new(0.2, 0, 0.2, 0)
		Favorite.Position = UDim2.new(0.9, 0, 0.9, 0)
		Favorite.BorderSizePixel = 0
		Favorite.BackgroundTransparency = 1
		Favorite.Parent = EmoteButton
		Favorite.MouseButton1Click:Connect(function()
			local index = table.find(FavoritedEmotes, Emote.id)
			if index then
				table.remove(FavoritedEmotes, index)
				Favorite.Image = FavoriteOff
				EmoteButton.LayoutOrder = Emote.sort[CurrentSort] + #Emotes
			else
				table.insert(FavoritedEmotes, Emote.id)
				Favorite.Image = FavoriteOn
				EmoteButton.LayoutOrder = Emote.sort[CurrentSort]
			end
			WriteFileFunc("FavoritedEmotes.txt", HttpService:JSONEncode(FavoritedEmotes))
		end)
	end
	for i=1,9 do
		local EmoteButton = Instance.new("Frame")
		EmoteButton.LayoutOrder = 2147483647
		EmoteButton.Name = "filler"
		EmoteButton.BackgroundTransparency = 1
		EmoteButton.BorderSizePixel = 0
		Ratio:Clone().Parent = EmoteButton
		EmoteButton.Visible = true
		EmoteButton.Parent = Frame
		EmoteButton.MouseEnter:Connect(function()
			EmoteName.Text = "Select an Emote"
		end)
	end
end

if LocalPlayer.Character then
	CharacterAdded(LocalPlayer.Character)
end

   end,
})

local Toggle = PlrTab:CreateToggle({
   Name = "Illusion",
   CurrentValue = false,
   Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-FE-Illusion-Script-12744"))()
   end,
})

local Toggle = PlrTab:CreateToggle({
   Name = "Fuck Face (Press Z)",
   CurrentValue = false,
   Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nomercy0000/face-fuck/refs/heads/main/mic%20up"))()
   end,
})

local Toggle = PlrTab:CreateToggle({
   Name = "Reverse (Hold C)",
   CurrentValue = false,
   Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nomercy0000/rewind/refs/heads/main/reverse"))()
   end,
})

local Toggle = PlrTab:CreateToggle({
   Name = "Jerk Off Tool",
   CurrentValue = false,
   Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
            loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})



local TeleportTab = Window:CreateTab("📌Teleports", nil) -- Title, Image
local Section = TeleportTab:CreateSection("Place")

local Button = TeleportTab:CreateButton({
   Name = "Tower",

   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(57.94701385498047, 313.1626281738281, 223.73561096191406)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Jail",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.25281524658203, 5.045921802520752, 38.55887985229492)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Bathroom",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-95.38079071044922, 4.948324680328369, 87.41197204589844)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Donut Shop",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-107.625, 3.077263593673706, -83.3763656616211)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Hidden Comfort Room",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(218.5366973876953, 23.26265525817871, 57.320518493652344)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Aesthetic Area",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-96.96603393554688, 5.333242416381836, 120.62106323242188)
   end,
})


local Button = TeleportTab:CreateButton({
   Name = "Behind Donut Shop",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-118.29837799072266, 2.8500003814697266, -114.58101654052734)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Stage 1",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28.23289680480957, 7.650236129760742, -66.38084411621094)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Stage 2",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-62.122314453125, 4.84999942779541, 216.62425231933594)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Sofa Area",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(217.70094299316406, 5.388758182525635, -11.42751407623291)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Invisible Circle",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.09608459472656, 61.33655548095703, -112.99852752685547)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Stands",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(129.11279296875, 2.8500003814697266, 76.20549774169922)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Red Sofa",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(27.374330520629883, 7.663952350616455, 86.99574279785156)
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Voting Area",
   Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-129.65127563476562, 4.84999942779541, 81.5405044555664)
   end,
})

local MiscTab = Window:CreateTab("📈Status", nil) -- Title, Image
local Section = MiscTab:CreateSection("Place")

local Section = MiscTab:CreateSection("More Shit Coming Soon I Promise Pookie 😩")