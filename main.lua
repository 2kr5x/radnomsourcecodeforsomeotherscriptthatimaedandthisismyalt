local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/2kr5x/radnomsourcecodeforsomeotherscriptthatimaedandthisismyalt/refs/heads/main/source.lua"))()

-- Create the main frame
local Frame = GuiLibrary:CreateFrame("My Awesome GUI")

-- Create toggle scripts button
local scriptsEnabled = true
local toggleButton = GuiLibrary:CreateButton(Frame, "Toggle Scripts", UDim2.new(0.1, 0, 0.15, 0), function()
    scriptsEnabled = not scriptsEnabled
    toggleButton.Text = scriptsEnabled and "Scripts Enabled ✅" or "Scripts Disabled ❌"
    print("Scripts Enabled: " .. tostring(scriptsEnabled))
end)

-- Create a sample button
GuiLibrary:CreateButton(Frame, "Sample Action", UDim2.new(0.1, 0, 0.25, 0), function()
    if scriptsEnabled then
        print("Sample action executed")
    else
        print("Scripts are disabled.")
    end
end)

-- Create a set speed button and textbox
local speedTextBox = GuiLibrary:CreateTextBox(Frame, "SpeedInput", UDim2.new(0.65, 0, 0.35, 0))
local setSpeedButton = GuiLibrary:CreateButton(Frame, "Set Speed", UDim2.new(0.1, 0, 0.35, 0), function()
    if scriptsEnabled then
        local speedValue = tonumber(speedTextBox.Text)
        if speedValue and speedValue > 0 then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
            print("Walk speed set to: " .. speedValue)
        else
            print("Invalid speed value. Please enter a positive number.")
        end
    else
        print("Scripts are disabled.")
    end
end)

-- Make the frame draggable
GuiLibrary:MakeDraggable(Frame)

