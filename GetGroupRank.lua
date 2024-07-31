local Players = game:GetService("Players")
local groupId = 33484457

-- Function to set the player's group rank value
local function setGroupRank(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local tpPart = workspace:FindFirstChild("Rank")
    
    if tpPart and tpPart:FindFirstChild("Value") then
        local value = tpPart.Value
        local groupRank = player:GetRankInGroup(groupId)
        value.Value = groupRank
    end
end

-- Connect to CharacterAdded event for all existing players
for _, player in Players:GetPlayers() do
    player.CharacterAdded:Connect(function()
        setGroupRank(player)
    end)
end

-- Connect to CharacterAdded event for new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        setGroupRank(player)
    end)
end)