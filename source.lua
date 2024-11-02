-- GUI Library
local GUIBuilder = {}

function GUIBuilder:createScreenGui(name, player)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = player:WaitForChild("PlayerGui")
    return screenGui
end

function GUIBuilder:createFrame(name, position, size, parent)
    local frame = Instance.new("Frame")
    frame.Name = name
    frame.BackgroundColor3 = Color3.fromHex("090114")
    frame.Size = size
    frame.Position = position
    frame.Parent = parent
    return frame
end

function GUIBuilder:createLabel(name, position, size, text, parent)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = size
    label.Position = position
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Parent = parent
    return label
end

function GUIBuilder:createRoundedButton(name, position, size, text, parent)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Position = position
    button.Size = size
    button.Text = text
    button.BackgroundColor3 = Color3.fromHex("9b64de")
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromHex("FFFFFF")
    button.Font = Enum.Font.Gotham
    button.TextScaled = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = button
    
    button.Parent = parent
    return button
end

function GUIBuilder:createTextBox(name, position, size, placeholder, parent)
    local textBox = Instance.new("TextBox")
    textBox.Name = name
    textBox.Size = size
    textBox.Position = position
    textBox.PlaceholderText = placeholder
    textBox.BackgroundColor3 = Color3.fromHex("9b64de")
    textBox.BorderSizePixel = 0
    textBox.TextColor3 = Color3.fromHex("FFFFFF")
    textBox.Font = Enum.Font.Gotham
    textBox.TextScaled = true
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = textBox
    
    textBox.Parent = parent
    return textBox
end

return GUIBuilder
