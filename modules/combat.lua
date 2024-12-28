local Services = require("modules/services")
local Config = require("modules/config")

local Combat = {}

function Combat.attack()
  Services.VirtualUser:CaptureController()
  Services.VirtualUser:Button1Down(Vector2.new(9999, 9999))
end

function Combat.setHitbox(mob)
  if not mob:FindFirstChild("HumanoidRootPart") then return end
  
  mob.HumanoidRootPart.CanCollide = false
  mob.HumanoidRootPart.Size = Vector3.new(64, 64, 64)
  mob.Humanoid.WalkSpeed = 0
  
  if mob:FindFirstChild("Animator") then
    mob.Animator:Destroy()
  end
end

return Combat