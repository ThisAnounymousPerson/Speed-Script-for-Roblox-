-- Function to create the GUI
local function createSpeedGUI(player)
    -- Create a ScreenGui
    local speedGUI = Instance.new("ScreenGui")
    speedGUI.Name = "SpeedGUI"
    speedGUI.Parent = player.PlayerGui

    -- Create a Frame to hold UI elements
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 120)
    frame.Position = UDim2.new(0.5, -110, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Dark sleek background
    frame.BackgroundTransparency = 0.2
    frame.Active = true -- Make the frame draggable
    frame.Draggable = true -- Enable dragging
    frame.Parent = speedGUI

    -- Create a UICorner to give the frame rounded edges
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10) -- Adjust the radius for roundness
    corner.Parent = frame

    -- Add a drop shadow effect with UIStroke
    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Transparency = 0.7
    stroke.Parent = frame

    -- Create a Minimize Button
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Size = UDim2.new(0, 25, 0, 25)
    minimizeButton.Position = UDim2.new(1, -30, 0, 5)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Darker button
    minimizeButton.Parent = frame

    -- Round the edges of the minimize button
    local minimizeCorner = Instance.new("UICorner")
    minimizeCorner.CornerRadius = UDim.new(0, 8)
    minimizeCorner.Parent = minimizeButton

    -- Create UI elements (speed label and button)
    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(1, 0, 0, 30)
    speedLabel.Position = UDim2.new(0, 0, 0, 5)
    speedLabel.Text = "Adjust Speed"
    speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedLabel.BackgroundTransparency = 1 -- Make label background transparent
    speedLabel.Font = Enum.Font.Gotham -- Use a modern font
    speedLabel.TextSize = 16
    speedLabel.Parent = frame

    local speedButton = Instance.new("TextButton")
    speedButton.Size = UDim2.new(0.8, 0, 0, 40)
    speedButton.Position = UDim2.new(0.1, 0, 0, 40)
    speedButton.Text = "Set Speed"
    speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedButton.BackgroundColor3 = Color3.fromRGB(60, 140, 255) -- Modern blue color
    speedButton.Font = Enum.Font.Gotham
    speedButton.TextSize = 16
    speedButton.Parent = frame

    -- Round the edges of the speed button
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = speedButton

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
            frame.Size = UDim2.new(0, 220, 0, 120) -- Restore size
            speedLabel.Visible = true
            speedButton.Visible = true
            minimizeButton.Text = "-"
            minimized = false
        else
            frame.Size = UDim2.new(0, 220, 0, 30) -- Minimized size
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
