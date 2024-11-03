-- UIManager.lua
local UIManager = {}
UIManager.__index = UIManager

local function createRoundedElement(element)
    element.BackgroundColor3 = Color3.fromHex("9b64de")
    element.BorderSizePixel = 0
    element.TextColor3 = Color3.fromHex("FFFFFF")
    element.Font = Enum.Font.Gotham
    element.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = element
end

function UIManager.new(title)
    local self = setmetatable({}, UIManager)

    -- Create the Screen GUI
    self.ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))

    -- Create a Frame
    self.Frame = Instance.new("Frame", self.ScreenGui)
    self.Frame.BackgroundColor3 = Color3.fromHex("090114")
    self.Frame.Size = UDim2.new(0, 280, 0, 580)
    self.Frame.Position = UDim2.new(0, 50, 0, 50)
    self.Frame.Visible = true -- Keep the GUI visible initially

    -- Create Title Label
    self.TitleLabel = Instance.new("TextLabel", self.Frame)
    self.TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    self.TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    self.TitleLabel.Text = title
    self.TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.TitleLabel.Font = Enum.Font.Gotham
    self.TitleLabel.TextScaled = true
    self.TitleLabel.BackgroundTransparency = 1

    -- Create a divider line
    self.DividerLine = Instance.new("Frame", self.Frame)
    self.DividerLine.Size = UDim2.new(1, 0, 0, 2)
    self.DividerLine.Position = UDim2.new(0, 0, 0, 50)
    self.DividerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    self.scriptsEnabled = true
    self.keybind = Enum.KeyCode.G -- Default keybind to toggle the GUI
    self:setupKeybindToggle() -- Set up keybind functionality

    return self
end

function UIManager:setupKeybindToggle()
    -- Function to toggle GUI visibility based on keybind
    local player = game.Players.LocalPlayer
    local userInputService = game:GetService("UserInputService")
    
    userInputService.InputBegan:Connect(function(input)
        if input.KeyCode == self.keybind then
            self.Frame.Visible = not self.Frame.Visible
        end
    end)
end

function UIManager:createToggleButton(name, position, callback)
    local toggleButton = Instance.new("TextButton", self.Frame)
    toggleButton.Position = position
    toggleButton.Size = UDim2.new(0, 200, 0, 40)
    toggleButton.Text = name
    createRoundedElement(toggleButton)

    toggleButton.MouseButton1Down:Connect(function()
        self.scriptsEnabled = not self.scriptsEnabled
        toggleButton.Text = self.scriptsEnabled and name .. " ✅" or name .. " ❌"
        if callback then callback(self.scriptsEnabled) end
    end)
end

function UIManager:createActionButton(name, position, callback)
    local actionButton = Instance.new("TextButton", self.Frame)
    actionButton.Position = position
    actionButton.Size = UDim2.new(0, 200, 0, 40)
    actionButton.Text = name
    createRoundedElement(actionButton)

    actionButton.MouseButton1Down:Connect(function()
        if self.scriptsEnabled and callback then
            callback()
        else
            print("Scripts are disabled.")
        end
    end)
end

function UIManager:createTextBox(name, position)
    local textBox = Instance.new("TextBox", self.Frame)
    textBox.Position = position
    textBox.Size = UDim2.new(0, 50, 0, 40)
    textBox.Text = ""
    createRoundedElement(textBox)
    textBox.Name = name
    textBox.PlaceholderText = "Enter " .. name
    return textBox
end

function UIManager:createKeybindButton(name, position)
    local keybindButton = Instance.new("TextButton", self.Frame)
    keybindButton.Position = position
    keybindButton.Size = UDim2.new(0, 200, 0, 40)
    keybindButton.Text = name
    createRoundedElement(keybindButton)

    return keybindButton
end

function UIManager:setKeybind(key)
    local upKeyCode = key:upper()
    local keybind = Enum.KeyCode[upKeyCode]
    if keybind then
        self.keybind = keybind
        print("Keybind set to: " .. upKeyCode)
    else
        print("Please enter a valid character.")
    end
end

return UIManager
