# Kullanıcıya wheatfarm.lua dosyası oluşturup içine verdiğimiz kodu yazalım

code = """\
local player = game.Players.LocalPlayer
local stats = player:WaitForChild("leaderstats")
local wheat = stats:WaitForChild("Wheat")

-- Başlangıçta 1B buğday
wheat.Value = 1000000000

local rs = game:GetService("RunService")
local harvestEvent = game.ReplicatedStorage:WaitForChild("HarvestWheat")

local autoHarvest = true

rs.Heartbeat:Connect(function()
    if autoHarvest then
        pcall(function()
            harvestEvent:FireServer()
        end)
    end
end)

-- Chatten aç/kapat komutları
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
"""

file_path = "/mnt/data/wheatfarm.lua"

with open(file_path, "w") as f:
    f.write(code)

file_path
