local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "POOP WITH FRIENDS", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Stepped = game.RunService.Stepped
local Root = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame



getgenv().crasher = false
getgenv().poop = false
getgenv().typing = false
getgenv().autoclick = true

function autoclick()
    while getgenv().autoclick do
        wait(0.1)
        for i,v in pairs(game:GetService("Workspace")["unlocked parts"]:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end
    end
end

function typing()
    while getgenv().typing do
        wait()
        local v1 = "typing"
        local event = game:GetService("Players").LocalPlayer.Character.Head.Sound.Typing
        event:FireServer(v1)
    end
end

function poop()
    while getgenv().poop do
        wait()
        fireproximityprompt(game:GetService("Workspace")["locked parts [do not select]"].yesd.Buttons.Head2.ProximityPrompt)
        fireproximityprompt(game:GetService("Workspace")["locked parts [do not select]"].yesd.Buttons.Head.ProximityPrompt)
    end
end

function crasher()
    Stepped:Connect(function()
        while getgenv().crasher do
            wait()
            fireproximityprompt(game:GetService("Workspace")["locked parts [do not select]"].yesd.Buttons.Head2.ProximityPrompt)
            fireproximityprompt(game:GetService("Workspace")["locked parts [do not select]"].yesd.Buttons.Head.ProximityPrompt)
        end
    end)
end

local Tab = Window:MakeTab({
	Name = "annoying",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Loop typing noise",
	Default = false,
	Callback = function(Value)
	    getgenv().typing = Value
	    typing()
		print(Value)
	end    
})

Tab:AddButton({
	Name = "interact with all",
	Callback = function()
	   for i,v in pairs(game:GetService("Workspace")["unlocked parts"]:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end
      		print("button pressed")
  	end    
})

Tab:AddToggle({
	Name = "loop interact with all",
	Default = false,
	Callback = function(Value)
	    getgenv().autoclick = Value
	    autoclick()
		print(Value)
	end    
})

local Tab = Window:MakeTab({
	Name = "poop stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "TP to poop launcher (to make the crasher working)",
	Callback = function()
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18, 3, -129)
      		print("button pressed")
  	end    
})


Tab:AddToggle({
	Name = "Spam poop launcher",
	Default = false,
	Callback = function(Value)
	    getgenv().poop = Value
	    poop()
		print(Value)
	end    
})

Tab:AddToggle({
	Name = "Crash the server (poop launcher)",
	Default = false,
	Callback = function(Value)
	    getgenv().crasher = Value
	    crasher()
		print(Value)
	end    
})

local Tab = Window:MakeTab({
	Name = "mod stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "No camera shake",
	Callback = function()
	    noshake = require(game:GetService("ReplicatedStorage").CameraShaker.CameraShakeInstance)
        noshake.CameraShakeState.FadingIn = 0
        noshake.CameraShakeState.FadingOut = 0
        noshake.CameraShakeState.Sustained = 0
        noshake.CameraShakeState.Inactive = 0
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "No proximity prompt cooldown",
	Callback = function()
	    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
      		print("button pressed")
  	end    
})




