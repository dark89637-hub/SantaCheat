-- ═══════════════════════════════════════════════
--   CRAZYSANTA 2026 - Мини-меню с градиентом и снежинками
-- ═══════════════════════════════════════════════

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local TS = game:GetService("TweenService")
local plr = Players.LocalPlayer
local mouse = plr:GetMouse()

local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- === ScreenGui ===
local sg = Instance.new("ScreenGui")
sg.Name = "CrazySantaMini"
sg.ResetOnSpawn = false
sg.Parent = plr:WaitForChild("PlayerGui")

-- === Main Frame ===
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,300,0,500)
frame.Position = UDim2.new(0.5,-150,0.5,-250)
frame.BackgroundColor3 = Color3.fromRGB(20,10,40)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Parent = sg
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,20)

-- Gradient
local gradient = Instance.new("UIGradient", frame)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120,0,200)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,200,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,150,255))
}
gradient.Rotation = 45

-- Shadow
local shadow = Instance.new("UIStroke", frame)
shadow.Thickness = 5
shadow.Color = Color3.new(1,1,1)
shadow.Transparency = 0.2

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "CrazySanta 2026"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 28

-- Close button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0,40,0,40)
closeBtn.Position = UDim2.new(1,-45,0,5)
closeBtn.Text = "X"
closeBtn.TextSize = 28
closeBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,8)
closeBtn.BackgroundColor3 = Color3.fromRGB(255,50,50)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.MouseButton1Click:Connect(function() frame.Visible = false end)

-- === Scrolling buttons ===
local scroll = Instance.new("ScrollingFrame", frame)
scroll.Size = UDim2.new(1,-20,1,-60)
scroll.Position = UDim2.new(0,10,0,50)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 8

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,8)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Button creator
local function createButton(name, callback)
    local b = Instance.new("TextButton", scroll)
    b.Size = UDim2.new(1,0,0,50)
    b.BackgroundColor3 = Color3.fromRGB(50,0,100)
    b.Text = name
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 20
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,12)

    -- Hover animation
    b.MouseEnter:Connect(function()
        TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(100,0,200)}):Play()
    end)
    b.MouseLeave:Connect(function()
        TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3=Color3.fromRGB(50,0,100)}):Play()
    end)
    b.MouseButton1Click:Connect(callback)
end

-- Example functions
createButton("Godmode", function() hum.Health = math.huge end)
createButton("Speed 250", function() hum.WalkSpeed = 250 end)
createButton("Jump 500", function() hum.JumpPower = 500 end)
createButton("Снег 2026!", function()
    for i = 1,20 do
        local p = Instance.new("ParticleEmitter", frame)
        p.Texture = "rbxassetid://241353019"
        p.Rate = 5
        p.Lifetime = NumberRange.new(5)
        p.Speed = NumberRange.new(5,15)
        p.RotSpeed = NumberRange.new(-50,50)
        game.Debris:AddItem(p,6)
    end
end)

-- Toggle menu with Insert
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        frame.Visible = not frame.Visible
    end
end)

print("CrazySanta Mini меню загружено!")
