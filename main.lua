-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TapezGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame with curved edges
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 400) -- Increased size
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Add UICorner for curved edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15) -- Increased corner radius for more rounding
corner.Parent = mainFrame

-- Create the title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
titleLabel.BorderSizePixel = 0
titleLabel.Text = "Tapez"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Parent = mainFrame

-- Create a notification
game.StarterGui:SetCore("SendNotification", {
    Title = "Keybind";
    Text = "The Keybind is '['";
    Duration = 5;
})

-- Create a toggle for showing/hiding GUI
local isVisible = true

local function toggleGui()
    isVisible = not isVisible
    mainFrame.Visible = isVisible
end

-- Keybind to show/hide GUI
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, isProcessed)
    if isProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftBracket then
        toggleGui()
    end
end)

-- Function to create buttons
local function createButton(name, url, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 460, 0, 40) -- Adjust button width
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextScaled = true
    button.Parent = mainFrame
    
    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
    
    return button
end

-- Create buttons with adjusted positions
createButton("Troll Hub (BLATANT)", "https://pastebin.com/raw/90umj7uz", UDim2.new(0, 20, 0, 60))
createButton("HBE (Keybind to on/off  is `)", "https://pastebin.com/raw/0sWKzSAr", UDim2.new(0, 20, 0, 110))
createButton("HBE BLATANT, HITBOX IS BIG LIKE AT 100 (Keybind to on/off  is `)", "https://pastebin.com/raw/dpYVb6Rn", UDim2.new(0, 20, 0, 160))
createButton("ESP (Keybind is G)", "https://pastebin.com/raw/rq50p1CA", UDim2.new(0, 20, 0, 210))
createButton("Arsenal 2krxzy Aim", "https://pastebin.com/raw/W9xe2nds", UDim2.new(0, 20, 0, 260))
createButton("Inf Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", UDim2.new(0, 20, 0, 310))

-- Allow dragging the GUI
local dragging, dragInput, dragStart, startPos
local function startDrag(input)
	dragging = true
	startPos = mainFrame.Position
	dragStart = input.Position
	dragInput = UserInputService.InputChanged:Connect(function(dragInput)
		if dragging then
			local delta = dragInput.Position - dragStart
			mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

local function stopDrag()
	dragging = false
	if dragInput then
		dragInput:Disconnect()
	end
end

-- Connect dragging to the title label
titleLabel.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		startDrag(input)
	end
end)

titleLabel.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		stopDrag()
	end
end)
