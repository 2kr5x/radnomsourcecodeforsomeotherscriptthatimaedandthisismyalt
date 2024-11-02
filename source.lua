local MyGuiLibrary = {}

-- Create the Screen GUI
function MyGuiLibrary:createScreen()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
  
    ScreenGui.Name = "MainGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Frame.Name = "MainFrame"
    Frame.BackgroundColor3 = Color3.fromHex("090114")
    Frame.Size = UDim2.new(0, 280, 0, 580)
    Frame.Position = UDim2.new(0, 50, 0, 50)
    Frame.Parent = ScreenGui

    self.Frame = Frame
    return Frame
end

-- Function to create a label
function MyGuiLibrary:createLabel(parent, text, position)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 50)
    label.Position = position
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Parent = parent
    return label
end

-- Function to create a divider line
function MyGuiLibrary:createDivider(parent, position)
    local dividerLine = Instance.new("Frame")
    dividerLine.Size = UDim2.new(1, 0, 0, 2)
    dividerLine.Position = position
    dividerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    dividerLine.Parent = parent
end

-- Function to create rounded UI elements
function MyGuiLibrary:createRoundedElement(element)
    element.BackgroundColor3 = Color3.fromHex("9b64de")
    element.BorderSizePixel = 0
    element.TextColor3 = Color3.fromHex("FFFFFF")
    element.Font = Enum.Font.Gotham
    element.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = element
end

-- Function to create a button
function MyGuiLibrary:createButton(parent, text, position, callback)
    local button = Instance.new("TextButton")
    button.Position = position
    button.Size = UDim2.new(0, 200, 0, 40)
    button.Text = text
    self:createRoundedElement(button)
    button.Parent = parent

    button.MouseButton1Down:Connect(callback)
    return button
end

-- Function to create a textbox
function MyGuiLibrary:createTextBox(parent, position, placeholderText)
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 40)
    textBox.Position = position
    textBox.PlaceholderText = placeholderText
    self:createRoundedElement(textBox)
    textBox.Parent = parent
    return textBox
end

return MyGuiLibrary
