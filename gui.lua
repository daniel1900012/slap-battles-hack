local SlapAura = false

-- Create the tab first
local Tab2 = Window:MakeTab({
    Name = "Slap Aura",
    Icon = "rbxassetid://YourIconIdHere", -- Replace with the actual icon ID
    PremiumOnly = false,
})

-- Now, you can add the toggle button to Tab2
Tab2:AddToggle({
    Name = "Slap Aura",
    Default = false,
    Callback = function(Value)
        SlapAura = Value
        while SlapAura do
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart and player.Character:FindFirstChild("Dead") == nil then
                        local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
                        if Magnitude <= 25 then
                            game.ReplicatedStorage.Events.Slap:FireServer(player.Character:WaitForChild("Head"))
                        end
                    end
                end
            end
            wait() -- Adjust the wait time based on your needs
        end
    end,
})
