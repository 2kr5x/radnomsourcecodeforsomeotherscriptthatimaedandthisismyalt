local UIManager = loadstring(game:HttpGet("https://pastebin.com/raw/WuPSSxS0"))()

local ui = UIManager.new("Tapez")

-- Create UI elements using the library
ui:createToggleButton("Toggle Scripts", UDim2.new(0.1, 0, 0.15, 0), function(enabled)
    print("Scripts Enabled: " .. tostring(enabled))
end)

ui:createActionButton("Sample Action", UDim2.new(0.1, 0, 0.25, 0), function()
    print("Sample action executed")
end)

local speedInput = ui:createTextBox("Speed", UDim2.new(0.80, 0, 0.35, 0))
ui:createActionButton("Set Speed", UDim2.new(0.1, 0, 0.35, 0), function()
    local speedValue = tonumber(speedInput.Text)
    if speedValue and speedValue > 0 then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
        print("Walk speed set to: " .. speedValue)
    else
        print("Invalid speed value. Please enter a positive number.")
    end
end)

local keybindInput = ui:createTextBox("Keybind", UDim2.new(0.8, 0, 0.45, 0))
local keybindButton = ui:createKeybindButton("Set Keybind", UDim2.new(0.1, 0, 0.45, 0))

keybindButton.MouseButton1Down:Connect(function()
    local key = keybindInput.Text:sub(1, 1)
    if key and #key > 0 then
        local upKeyCode = key:upper()
        local keybind = Enum.KeyCode[upKeyCode]
        if keybind then
            print("Keybind set to: " .. upKeyCode)
        else
            print("Please enter a valid character.")
        end
    end
end)
