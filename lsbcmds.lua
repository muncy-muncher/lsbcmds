local spawnpos
if workspace:FindFirstChildOfClass("SpawnLocation") then
    spawnpos=workspace:FindFirstChildOfClass("SpawnLocation").Position
else
    spawnpos=Vector3.new(0,10,0)
end

function scorchingstar(length)
	task.spawn(function()
		starttime=length or 60
		time=starttime-1

		local pollen=0

		function format(amount)
		  local formatted = amount
		  while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			if (k==0) then
			  break
			end
		  end
		  return formatted
		end

		local pop=Instance.new("MeshPart")
		pop.MeshId="rbxassetid://2546401234"
		pop.Material=Enum.Material.Neon
		pop.Anchored=true
		pop.CanCollide=false
		pop.Transparency=0.1
		pop.Name="Scorching Star"
		pop.Size=Vector3.new(1,1,2)
		pop.Color=Color3.new(1, 0, 0)
		pop.Parent=workspace

		ef2 = Instance.new("Trail") 
		ef2.Color = ColorSequence.new(Color3.new(1, 0, 0))
		ef2.LightEmission=2
		ef2.Enabled = true 
		ef2.FaceCamera = true 
		ef2.TextureMode = Enum.TextureMode.Stretch 
		ef2.WidthScale = NumberSequence.new(1,0,0,1) 
		ef2.Lifetime=1

		local att0,att1=Instance.new("Attachment"),Instance.new("Attachment")

		att0.Position=pop.Position+Vector3.new(0,0.5,0)
		att1.Position=pop.Position+Vector3.new(0,-0.5,0)

		ef2.Attachment0=att0
		ef2.Attachment1=att1


		local song=Instance.new("Sound")
		song.SoundId="rbxassetid://5066713021"
		song.Volume=3
		song.Looped=true
		song.Parent=pop
		song:Play()

		local name1 = Instance.new("BillboardGui")
		name1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		name1.Active = true
		name1.AlwaysOnTop = true
		name1.Size = UDim2.new(7,0,2,0)
		name1.Name="AboveHead"
		name1.Parent = pop
		local txt=Instance.new("TextLabel")
		txt.Text=tostring(pollen)
		txt.TextScaled=true
		txt.Size=UDim2.new(1,0,1,0)
		txt.BackgroundTransparency=1
		txt.TextColor3=Color3.new(1,1,1)
		txt.Font=Enum.Font.ArialBold
		txt.TextStrokeTransparency=0
		txt.TextStrokeColor3=Color3.new(25/255,77/255,114/255)
		txt.Position=UDim2.new(0.5,0,0.65,0)
		txt.AnchorPoint=Vector2.new(0.5,0.5)
		txt.Parent=name1
		local uig=Instance.new("UIGradient")
		uig.Color=ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.982025, 0.857252, 0.307942)), ColorSequenceKeypoint.new(1, Color3.new(0.996338, 0.834028, 0.680232))})
		uig.Parent=txt
		local healthbar = Instance.new("Frame")
		healthbar.Position = UDim2.new(0.5,0,0,0)
		healthbar.Parent = name1
		healthbar.BorderSizePixel=0
		healthbar.BackgroundColor3=Color3.new(15/255,95/255,51/255)
		healthbar.AnchorPoint=Vector2.new(0.5,0.5)
		healthbar.Size = UDim2.new(0.3, 0, 0.15, 0)
		local healthbar2 = Instance.new("Frame")
		healthbar2.Position = UDim2.new(0,0,0.5,0)
		healthbar2.Parent = healthbar
		healthbar2.BorderSizePixel=0
		healthbar2.BackgroundColor3=Color3.new(34/255,1,48/255)
		healthbar2.AnchorPoint=Vector2.new(0,0.5)
		healthbar2.Size = UDim2.new(math.clamp(time/starttime,0,1),0,1,0)

		local CYCLE_DURATION = 3
		local DISTANCE = 5
		local i = 0
		orbit = game:GetService("RunService").Heartbeat:Connect(function(dt)
			game:GetService("TweenService"):Create(healthbar2, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(math.clamp(time/starttime,0,1),0,1,0)}):Play()
			i = (i + dt/CYCLE_DURATION) % 1
			local alpha = -(2 * math.pi * i)

			pollen+=math.random(5,20)

			txt.Text=tostring(pollen)

			pop.CFrame = CFrame.Angles(0, alpha, 0)
				* CFrame.new(0, 0, DISTANCE)
				* CFrame.Angles(0, -alpha, 0)
				* CFrame.Angles(math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.X),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Y),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Z))
				+ game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				+ Vector3.new(0,5+math.sin(tick()*6),0)
		end)

		spawn(function()
			while true do
				time=time-1
				task.wait(1)
			end
		end)

		ef2.Parent=pop
		att0.Parent=pop
		att1.Parent=pop

		task.spawn(function(...) 
			while task.wait(2) do
				game:GetService("TweenService"):Create(pop, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.new(0.4,0,0)}):Play()
				task.wait(1)
				game:GetService("TweenService"):Create(pop, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.new(1,0,0)}):Play()
			end
		end)

		task.wait(starttime+1)

		local effect=Instance.new("Part")
		effect.Name="effect"
		effect.Size=Vector3.one*5
		effect.Position=pop.Position
		effect.Shape=Enum.PartType.Ball
		effect.CanCollide=false
		effect.Anchored=true
		effect.Material=Enum.Material.Neon
		effect.Color=Color3.new(1, 0, 0)
		effect.Parent=workspace

		orbit:Disconnect()
		pop.Transparency=1

		game:GetService("TweenService"):Create(song, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Volume = 1}):Play()
		game:GetService("TweenService"):Create(effect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Transparency = 1}):Play()
		game:GetService("TweenService"):Create(effect, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = Vector3.one*10}):Play()
		game:GetService("Debris"):AddItem(effect,0.5)
		task.wait(0.5)
		pop:Destroy()
	end)
end

function process(v1)
    if v1:find("^c/") then
        local thing=v1:split("/")
        loadstring(thing[2])()
        print("Ran source: "..thing[2])
    elseif v1:find("^g/") then
        local thing=v1:split("/")
        if thing[2]=="r" then
            game.Players.LocalPlayer.Character.Humanoid.Health=0
            print("Got reset")
        elseif thing[2]=="re" then
            local pos=game.Players.LocalPlayer.Character:GetPivot()
            game.Players.LocalPlayer.Character.Humanoid.Health=0
            print("Got reset with pos")
            task.wait(game.Players.RespawnTime)
            task.wait(0.05)
            game.Players.LocalPlayer.Character:PivotTo(pos)
        elseif thing[2]=="rj" then
            local m=Instance.new("Message")
            m.Text="Rejoining... Please wait for TeleportService to catch up."
            m.Parent=workspace
            game:GetService("TeleportService"):Teleport(game.PlaceId)
		elseif thing[2]=="sp" then
            game.Players.LocalPlayer.Character:MoveTo(spawnpos)
			print("Got spawn")
		elseif thing[2]=="leave" then
            local m=Instance.new("Message")
			m.Text="Goodbye!"
			m.Parent=workspace
			task.wait(1)
			game:Shutdown()
		end
    elseif v1:find("^r/") then
        local thing=v1:split("/")
        if thing[2]=="iy" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            print("Got Infinite Yield")
		elseif thing[2]=="scorchingstar" then
			if thing[2]:find([[\]]) then
				local tabl=thing[2]:split([[\]])
				length=tonumber(tabl[2])
				scorchingstar(length)
			else
				scorchingstar(60)
			end
            print("Ran \"Scorchingstar\"")
        end
    end
end

local gui=Instance.new("ScreenGui")
gui.Name="Command bar"
gui.IgnoreGuiInset=true
gui.Parent=game.CoreGui
local f=Instance.new("Frame")
f.Position=UDim2.new(0.025,0,0.98,0)
f.BackgroundColor3=Color3.new(0.2,0.2,0.2)
f.Name="CommandBackground"
f.Size=UDim2.new(0.3,0,0.03,0)
f.AnchorPoint=Vector2.new(0,0.5)
f.Parent=gui
local t=Instance.new("TextBox")
t.Name="CommandInput"
t.Position=UDim2.new(0.5,0,0.5,0)
t.TextXAlignment=Enum.TextXAlignment.Left
t.Text=""
t.TextColor3=Color3.new(1,1,1)
t.BackgroundColor3=Color3.new(0.1,0.1,0.1)
t.PlaceholderText="  Input a command, use ' to capture focus."
t.AnchorPoint=Vector2.new(0.5,0.5)
t.Size=UDim2.new(0.99,0,0.8,0)
t.Parent=f
local uic=Instance.new("UICorner")
uic.CornerRadius=UDim.new(0.6)
uic.Parent=f
local uic2=Instance.new("UICorner")
uic2.CornerRadius=UDim.new(0.6)
uic2.Parent=t

game.Players.LocalPlayer.Chatted:Connect(process)

game:GetService("UserInputService").InputBegan:Connect(function(key)
	if not game:GetService("UserInputService"):GetFocusedTextBox() then
		if key.KeyCode==Enum.KeyCode.Quote then
			task.wait()
			t:CaptureFocus()
		end
	end
end)

t.FocusLost:Connect(function(intended)
	if intended then
		process(t.Text)
		t.Text=""
	end
end)

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local TeleportCheck = false
game.Players.LocalPlayer.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/muncy-muncher/lsbcmds/main/lsbcmds.lua'))()")
	end
end)
