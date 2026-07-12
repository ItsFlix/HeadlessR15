local Players = game:GetService("Players")

local player = Players.LocalPlayer
local plr = player 
local character = player.Character or player.CharacterAdded:Wait()
local char = character
local humanoid = character:WaitForChild("Humanoid")

local function PlayAnim(character)

    local humanoid = character:WaitForChild("Humanoid")
    local animate = character:WaitForChild("Animate")

    if character:FindFirstChild("OnlyOnce") then
        return
    end

    Instance.new("BoolValue", character).Name = "OnlyOnce"

    animate.Disabled = true

    for _,track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        track:Stop()
    end

    animate.Disabled = false

    task.wait(0.1)

    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://100199766676370"

    local track = humanoid.Animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Action
    track.Looped = true
    track:Play()

end

player.CharacterAdded:Connect(PlayAnim)

if player.Character then
    PlayAnim(player.Character)
end
