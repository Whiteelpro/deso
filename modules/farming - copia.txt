local Services = require("modules/services")
local Config = require("modules/config")
local Combat = require("modules/combat")

local Farming = {}

function Farming.farm()
  while Config.AutoFarm.Enabled do
    for _, mob in pairs(workspace.Enemies:GetChildren()) do
      if mob:FindFirstChild("HumanoidRootPart") and 
         mob:FindFirstChild("Humanoid") and
         mob.Humanoid.Health > 0 then
         
        repeat
          Farming.teleportToMob(mob)
          Combat.attack()
          if Config.AutoFarm.Hitbox then
            Combat.setHitbox(mob)
          end
          wait()
        until not mob or mob.Humanoid.Health <= 0
        
      end
    end
    wait()
  end
end

function Farming.teleportToMob(mob)
  local position = mob.HumanoidRootPart.Position + Config.AutoFarm.Position
  local character = Services.Players.LocalPlayer.Character
  
  if character and character:FindFirstChild("HumanoidRootPart") then
    local distance = (position - character.HumanoidRootPart.Position).magnitude
    local time = distance/Config.AutoFarm.TpSpeed
    
    local tween = game:GetService("TweenService"):Create(
      character.HumanoidRootPart,
      TweenInfo.new(time, Enum.EasingStyle.Linear),
      {CFrame = CFrame.new(position)}
    )
    tween:Play()
    tween.Completed:Wait()
  end
end

return Farming