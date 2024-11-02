-- SimpleGUIModule.lua
local SimpleGUI = {}

function SimpleGUI:CreateUI()
    -- Create the Screen GUI
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local DividerLine = Instance.new("Frame")

    -- Set properties for the Screen GUI
    ScreenGui.Name = "MainGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Set properties for the Frame
    Frame.Name = "MainFrame"
    Frame.BackgroundColor3 = Color3.fromHex("090114")
    Frame.Size = UDim2.new(0, 280, 0, 580)
    Frame.Position = UDim2.new(0, 50, 0, 50)
    Frame.Parent = ScreenGui

    -- Create Title Label
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.Text = "Tapez"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.TextScaled = true
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = Frame

    -- Create a divider line
    DividerLine.Name = "DividerLine"
    DividerLine.Size = UDim2.new(1, 0, 0, 2)
    DividerLine.Position = UDim2.new(0, 0, 0, 50)
    DividerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    DividerLine.Parent = Frame

    return Frame -- Return the frame for further customization
end

function SimpleGUI:CreateRoundedElement(element)
    element.BackgroundColor3 = Color3.fromHex("9b64de")
    element.BorderSizePixel = 0
    element.TextColor3 = Color3.fromHex("FFFFFF")
    element.Font = Enum.Font.Gotham
    element.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = element
end

function SimpleGUI:AddButton(frame, name, position, text, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Position = position
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Text = text
    self:CreateRoundedElement(button)
    button.Parent = frame
    button.MouseButton1Down:Connect(callback)
end

function SimpleGUI:AddToggle(frame, name, position, text, initialState, toggleCallback)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = name
    toggleButton.Position = position
    toggleButton.Size = UDim2.new(0, 200, 0, 40)
    toggleButton.Text = text .. (initialState and " ✅" or " ❌")
    self:CreateRoundedElement(toggleButton)
    toggleButton.Parent = frame

    local state = initialState
    toggleButton.MouseButton1Down:Connect(function()
        state = not state
        toggleButton.Text = text .. (state and " ✅" or " ❌")
        toggleCallback(state)
    end)
end

function SimpleGUI:AddTextBoxWithButton(frame, buttonName, textboxName, position, buttonText, textboxPlaceholder, buttonCallback)
    local button = Instance.new("TextButton")
    button.Name = buttonName
    button.Position = UDim2.new(0, 0, 0, 0)
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Text = buttonText
    self:CreateRoundedElement(button)
    button.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Name = textboxName
    textBox.Size = UDim2.new(0, 80, 0, 40)
    textBox.Position = UDim2.new(0.65, 0, 0, 0)  -- Positioned next to button
    textBox.PlaceholderText = textboxPlaceholder
    self:CreateRoundedElement(textBox)
    textBox.Parent = frame

    button.MouseButton1Down:Connect(function()
        buttonCallback(textBox.Text)
    end)
end

return SimpleGUI
