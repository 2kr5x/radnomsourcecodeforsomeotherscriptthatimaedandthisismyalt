local UIManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/2kr5x/radnomsourcecodeforsomeotherscriptthatimaedandthisismyalt/refs/heads/main/source.lua"))()

local ui = UIManager.new("Tapez")

-- Create UI elements using the library

-- Create Toggle Button
ui:createToggleButton("Toggle Scripts", UDim2.new(0.1, 0, 0.15, 0), function(enabled)
    print("Scripts Enabled: " .. tostring(enabled))
end)

-- Create ESP Button
ui:createActionButton("ESP (Keybind is G)", UDim2.new(0.1, 0, 0.25, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/P8KUbX1E"))()
end)

-- Create Trigger Bot Button
ui:createActionButton("Trigger Bot (Keybind is E)", UDim2.new(0.1, 0, 0.35, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/bM1LUbN9"))()
end)

-- Create HBE Bot Button
ui:createActionButton("HBE (Keybind is )", UDim2.new(0.1, 0, 0.45, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/0sWKzSAr"))()
end)

-- Create Arsenal Bot Button
ui:createActionButton("Arsenal (Keybind is U)", UDim2.new(0.1, 0, 0.55, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/W9xe2nds"))()
end)

-- Create Bedwars Bot Button
ui:createActionButton("Bedwars (Keybind is RightShift)", UDim2.new(0.1, 0, 0.65, 0), function()
    loadstring(game:HttpGet("https://github.com/cocotv666/Aurora/blob/main/Aurora_bedwars"))()
end)

-- Create TrollHub Bot Button
ui:createActionButton("Troll Hub", UDim2.new(0.1, 0, 0.745, 0), function()
    loadstring(game:HttpGet("https://pastebin.com/raw/90umj7uz"))()
end)

-- Create Text Box With Button (Example Speed)
local speedInput = ui:createTextBox("Speed", UDim2.new(0.80, 0, 0.84, 0))
ui:createActionButton("Set Speed", UDim2.new(0.1, 0, 0.84, 0), function()
    local speedValue = tonumber(speedInput.Text)
    if speedValue and speedValue > 0 then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
        print("Walk speed set to: " .. speedValue)
    else
        print("Invalid speed value. Please enter a positive number.")
    end
end)

-- Create Keybind Text Box With Keybind Button 
local keybindInput = ui:createTextBox("Keybind", UDim2.new(0.8, 1, 0.92, 0)) 
local keybindButton = ui:createKeybindButton("Set Keybind", UDim2.new(0.1, 0, 0.92, 0))

keybindButton.MouseButton1Down:Connect(function()
    local key = keybindInput.Text:sub(1, 1)
    if key and #key > 0 then
        ui:setKeybind(key) -- Call the setKeybind function from UIManager
    end
end)
