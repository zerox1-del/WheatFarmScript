-- Oyuncuyu al
local player = game.Players.LocalPlayer
local stats = player:WaitForChild("leaderstats")
local wheat = stats:WaitForChild("Wheat")
wheat.Value = 1000000000

-- RemoteEvent kontrolü
local harvestEvent = nil
pcall(function()
    harvestEvent = game.ReplicatedStorage:WaitForChild("HarvestWheat", 5) -- 5 saniye bekle
end)

if not harvestEvent then
    warn("HarvestWheat RemoteEvent bulunamadı! Script çalışmayabilir.")
end

-- Otomatik hasat değişkeni
local autoHarvest = true

-- Otomatik hasat döngüsü
game:GetService("RunService").Heartbeat:Connect(function()
    if autoHarvest and harvestEvent then
        pcall(function()
            harvestEvent:FireServer()
        end)
    end
end)

-- Chat komutları ile kontrol
player.Chatted:Connect(function(msg)
    msg = msg:lower()
    if msg == "!stop" then
        autoHarvest = false
        print("✅ Otomatik hasat durduruldu")
    elseif msg == "!start" then
        autoHarvest = true
        print("✅ Otomatik hasat başlatıldı")
    end
end)

print("✅ Delta uyumlu script yüklendi!")
