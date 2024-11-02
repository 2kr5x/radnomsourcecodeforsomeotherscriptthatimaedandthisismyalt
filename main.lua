local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/2kr5x/radnomsourcecodeforsomeotherscriptthatimaedandthisismyalt/refs/heads/main/source.lua"))()

local SimpleGUI = require(script.SimpleGUIModule)

-- Create Gui 
local Frame = SimpleGUI:CreateUI()

local scriptsEnabled = true

-- Create a Toggle Button
SimpleGUI:AddToggle(Frame, "ToggleScripts", UDim2.new(0.1, 0, 0.15, 0), "Toggle Scripts", scriptsEnabled, function(enabled)
    scriptsEnabled = enabled
    print("Scripts Enabled: " .. tostring(scriptsEnabled))
end)

-- Create a Sample Button
SimpleGUI:AddButton(Frame, "SampleButton", UDim2.new(0.1, 0, 0.25, 0), "Sample Action", function()
    if scriptsEnabled then
        print("Sample action executed")
    else
        print("Scripts are disabled.")
    end
end)

-- Create a Speed Input with Button
SimpleGUI:AddTextBoxWithButton(Frame, "SetSpeedButton", "SpeedInput", UDim2.new(0.1, 0, 0.35, 0), "Set Speed", "Enter Speed", function(speedStr)
    local speedValue = tonumber(speedStr)
    if speedValue and speedValue > 0 then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
        print("Walk speed set to: " .. speedValue)
    else
        print("Invalid speed value. Please enter a positive number.")
    end
end)

-- Additional UI elements can be added using similar methods
