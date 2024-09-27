-- Function to create the GUI
local function createSpeedGUI(player)
    -- Create a ScreenGui
    local speedGUI = Instance.new("ScreenGui")
    speedGUI.Name = "SpeedGUI"
    speedGUI.Parent = player.PlayerGui

    -- Create a Frame to hold UI elements
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    frame.Active = true -- Make the frame draggable
    frame.Draggable = true -- Enable dragging
    frame.Parent = speedGUI

    -- Create a Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 20, 0, 20)
    minimizeButton.Position = UDim2.new(1, -25, 0, 5)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    minimizeButton.Parent = frame

    -- Create UI elements (speed label and button)
    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(1, 0, 0, 30)
    speedLabel.Position = UDim2.new(0, 0, 0, 5)
    speedLabel.Text = "Adjust Speed"
    speedLabel.TextColor3 = Color3.new(1, 1, 1)
    speedLabel.Parent = frame

    local speedButton = Instance.new("TextButton")
    speedButton.Size = UDim2.new(0.8, 0, 0, 30)
    speedButton.Position = UDim2.new(0.1, 0, 0, 40)
    speedButton.Text = "Set Speed"
    speedButton.TextColor3 = Color3.new(1, 1, 1)
    speedButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    speedButton.Parent = frame

    -- Function to handle changing speed
    speedButton.MouseButton1Click:Connect(function()
        local newSpeed = tonumber(prompt("Enter new speed:")) -- Prompt user for speed
        if newSpeed then
            player.Character.Humanoid.WalkSpeed = newSpeed
        else
            warn("Invalid input. Please enter a number.")
        end
    end)

    -- Minimize functionality
    local minimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        if minimized then
            frame.Size = UDim2.new(0, 200, 0, 100) -- Restore size
            speedLabel.Visible = true
            speedButton.Visible = true
            minimizeButton.Text = "-"
            minimized = false
        else
            frame.Size = UDim2.new(0, 200, 0, 25) -- Minimized size
            speedLabel.Visible = false
            speedButton.Visible = false
            minimizeButton.Text = "+"
            minimized = true
        end
    end)
end

-- Function to trigger GUI creation when a player joins the game
game.Players.PlayerAdded:Connect(function(player)
    createSpeedGUI(player)
end)
