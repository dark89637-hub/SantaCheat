CrazySanta 2026 - 26 читов для Delta / любых эксплойтов

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")

local sg = Instance.new("ScreenGui", game.CoreGui)
sg.Name = "CrazySanta2026"
sg.ResetOnSpawn = false

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0,480,0,720)
frame.Position = UDim2.new(0.5,-240,0.5,-360)
frame.BackgroundColor3 = Color3.fromRGB(15,0,30)
frame.Visible = false
frame.Draggable = true
frame.Active = true
Instance.new("UICorner",frame).CornerRadius = UDim.new(0,20)
local grad = Instance.new("UIGradient",frame)
grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,100)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,200)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,100,200))}
grad.Rotation = 45
Instance.new("UIStroke",frame).Thickness = 4

local title = Instance.new("TextLabel",frame)
title.Size = UDim2.new(1,0,0,80)
title.BackgroundTransparency = 1
title.Text = "CrazySanta 2026"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBlack
title.TextSize = 42

local scroll = Instance.new("ScrollingFrame",frame)
scroll.Size = UDim2.new(0.92,0,0,560)
scroll.Position = UDim2.new(0.04,0,0,130)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 10
scroll.CanvasSize = UDim2.new(0,0,0,2000)

local y = 10
local function btn(txt,func)
    local b = Instance.new("TextButton",scroll)
    b.Size = UDim2.new(1,-20,0,55)
    b.Position = UDim2.new(0,10,0,y)
    b.BackgroundTransparency = 0.8
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 20
    Instance.new("UICorner",b).CornerRadius = UDim.new(0,14)
    b.MouseButton1Click:Connect(func)
    y = y + 65
end

local fly,noclip,infjump = false,false,false

btn("1. Godmode",function() if plr.Character then plr.Character.Humanoid.Health = math.huge end end)
btn("2. Speed 200",function() plr.Character.Humanoid.WalkSpeed = 200 end)
btn("3. Jump 400",function() plr.Character.Humanoid.JumpPower = 400 end)
btn("4. Бесконечный прыжок",function() infjump = not infjump if infjump then uis.JumpRequest:Connect(function() plr.Character.Humanoid:ChangeState("Jumping") end) end end)
btn("5. Полёт (E/Q)",function()
    fly = not fly
    local root = plr.Character.HumanoidRootPart
    local bv = Instance.new("BodyVelocity",root)
    bv.MaxForce = fly and Vector3.new(1e5,1e5,1e5) or Vector3.new(0,0,0)
    if fly then
        spawn(function()
            while fly and wait() do
                local dir = Vector3.new()
                if uis:IsKeyDown(Enum.KeyCode.E) then dir += Vector3.new(0,1,0) end
                if uis:IsKeyDown(Enum.KeyCode.Q) then dir -= Vector3.new(0,1,0) end
                if uis:IsKeyDown(Enum.KeyCode.W) then dir += workspace.CurrentCamera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.S) then dir -= workspace.CurrentCamera.CFrame.LookVector end
                if uis:IsKeyDown(Enum.KeyCode.A) then dir -= workspace.CurrentCamera.CFrame.RightVector end
                if uis:IsKeyDown(Enum.KeyCode.D) then dir += workspace.CurrentCamera.CFrame.RightVector end
                bv.Velocity = dir.Unit * 150
            end
            bv:Destroy()
        end)
    end
end)
btn("6. Noclip",function() noclip = not noclip rs.Stepped:Connect(function() if noclip then for _,v in plr.Character:GetDescendants() do if v:IsA("BasePart") then v.CanCollide = false end end end end) end)
btn("7. Телепорт к курсору (T)",function() mouse.KeyDown:Connect(function(k) if k=="t" then plr.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.p + Vector3.new(0,5,0)) end end) end)
btn("8. ESP",function() for _,p in game.Players:GetPlayers() do if p~=plr and p.Character then Instance.new("Highlight",p.Character).FillColor = Color3.fromRGB(255,0,0) end end end)
btn("9. Fullbright",function() game.Lighting.Brightness = 10 end)
btn("10. FOV 120",function() workspace.CurrentCamera.FieldOfView = 120 end)
btn("11. Invisible",function() for _,v in plr.Character:GetDescendants() do if v:IsA("BasePart") then v.Transparency = 0.7 end end end)
btn("12. Neon",function() for _,v in plr.Character:GetDescendants() do if v:IsA("BasePart") then v.Material = Enum.Material.Neon end end end)
btn("13. Big Head",function() plr.Character.Head.Size = Vector3.new(10,10,10) end)
btn("14. Spin",function() while wait() do plr.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0,math.rad(30),0) end end)
btn("15. Rainbow",function() while wait(0.1) do for _,v in plr.Character:GetDescendants() do if v:IsA("BasePart") then v.Color = Color3.fromHSV(tick()%5/5,1,1) end end end end)
btn("16. Click TP (ПКМ)",function() mouse.Button2Down:Connect(function() plr.Character.HumanoidRootPart.CFrame = mouse.Hit + Vector3.new(0,5,0) end) end)
btn("17. No Gravity",function() workspace.Gravity = 0 end)
btn("18. Freeze All",function() for _,p in game.Players:GetPlayers() do if p.Character then p.Character.HumanoidRootPart.Anchored = true end end end)
btn("19. Unfreeze All",function() for _,p in game.Players:GetPlayers() do if p.Character then p.Character.HumanoidRootPart.Anchored = false end end end)
btn("20. Explode All",function() for _,p in game.Players:GetPlayers() do if p.Character then Instance.new("Explosion",workspace).Position = p.Character.HumanoidRootPart.Position end end end)
btn("21. Speed 500",function() plr.Character.Humanoid.WalkSpeed = 500 end)
btn("22. Jump 1000",function() plr.Character.Humanoid.JumpPower = 1000 end)
btn("23. Fly+Noclip",function() fly = true noclip = true end)
btn("24. Remove Doors",function() for _,v in workspace:GetDescendants() do if string.find(v.Name:lower(),"door") then v:Destroy() end end end)
btn("25. Auto Clicker",function() while wait() do for _,v in workspace:GetDescendants() do if v:IsA("ClickDetector") then fireclickdetector(v) end end end end)
btn("26. Снег 2026!",function()
    for i=1,100 do
        local p = Instance.new("ParticleEmitter",frame)
        p.Texture = "rbxassetid://241353019"
        p.Rate = 0
        p.Lifetime = NumberRange.new(10)
        p:Emit(1)
        game.Debris:AddItem(p,10)
    end
end)

uis.InputBegan:Connect(function(k)
    if k.KeyCode == Enum.KeyCode.Insert then
        frame.Visible = not frame.Visible
    end
end)

print("CrazySanta 2026 загружен! Insert - открыть меню")]])()
