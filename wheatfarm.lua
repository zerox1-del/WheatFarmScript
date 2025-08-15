-- Android Wheat Farming Script
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

humanoid.WalkSpeed = 100
humanoid.JumpPower = 100

spawn(function()
    while true do
        for _, wheat in pairs(workspace:GetDescendants()) do
            if wheat:IsA("Part") and wheat.Name:match("Wheat") then
                rootPart.CFrame = wheat.CFrame + Vector3.new(0,3,0)
                if player:FindFirstChild("Pet") then
                    local pet = player.Pet
                    pet.HumanoidRootPart.CFrame = wheat.CFrame + Vector3.new(0,2,0)
                end
                wait(0.1)
            end
        end
        wait(0.5)
    end
end)

spawn(function()
    while true do
        local sellButton = workspace:FindFirstChild("SellButton")
        if sellButton then
            rootPart.CFrame = sellButton.CFrame + Vector3.new(0,3,0)
        end
        if player:FindFirstChild("Inventory") then
            for _, item in pairs(player.Inventory:GetChildren()) do
                item.Parent = workspace
            end
        end
        wait(1)
    end
end)

spawn(function()
    while true do
        local rebirthButton = workspace:FindFirstChild("RebirthButton")
        if rebirthButton then
            rootPart.CFrame = rebirthButton.CFrame + Vector3.new(0,3,0)
        end
        wait(5)
    end
end)
