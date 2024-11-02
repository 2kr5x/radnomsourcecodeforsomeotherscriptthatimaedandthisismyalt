-- GUI Library
local GuiLibrary = {}
-- Function to create a new Frame
function GuiLibrary:CreateFrame(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    local DividerLine = Instance.new("Frame")
    -- Initialize properties
    ScreenGui.Name = "MainGUI"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Frame.Name = "MainFrame"
    Frame.BackgroundColor3 = Color3.fromHex("090114")
    Frame.Size = UDim2.new(0, 280, 0, 580)
    Frame.Position = UDim2.new(0, 50, 0, 50)
    Frame.Parent = ScreenGui
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.Position = UDim2.new(0, 0, 0, 0)
    TitleLabel.Text = title or "Title"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.TextScaled = true
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Parent = Frame
    DividerLine.Name = "DividerLine"
    DividerLine.Size = UDim2.new(1, 0, 0, 2)
    DividerLine.Position = UDim2.new(0, 0, 0, 50)
    DividerLine.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    DividerLine.Parent = Frame
    return Frame
end
-- Function to create buttons
function GuiLibrary:CreateButton(parent, buttonName, position, callback)
    local Button = Instance.new("TextButton")
    Button.Name = buttonName
    Button.Position = position
    Button.Size = UDim2.new(0, 200, 0, 40)
    Button.Text = buttonName
    self:CreateRoundedElement(Button)
    Button.Parent = parent
    Button.MouseButton1Down:Connect(callback)
    return Button
end
-- Function to create text boxes
function GuiLibrary:CreateTextBox(parent, textboxName, position)
    local TextBox = Instance.new("TextBox")
    TextBox.Name = textboxName
    TextBox.Size = UDim2.new(0, 100, 0, 40)
    TextBox.Position = position
    TextBox.Text = ""
    self:CreateRoundedElement(TextBox)
    TextBox.Parent = parent
    return TextBox
end
-- Function to create rounded UI elements
function GuiLibrary:CreateRoundedElement(element)
    element.BackgroundColor3 = Color3.fromHex("9b64de")
    element.BorderSizePixel = 0
    element.TextColor3 = Color3.fromHex("FFFFFF")
    element.Font = Enum.Font.Gotham
    element.TextScaled = true
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = element
end
-- Function to make the frame draggable
function GuiLibrary:MakeDraggable(frame)
    local dragging
    local dragStart
    local startPos
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(0, startPos.X + delta.X, 0, startPos.Y + delta.Y)
    end
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
end
return GuiLibrary
