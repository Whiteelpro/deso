-- Variables globales
local GG = (getgenv and getgenv()) or _G or shared
local Iden = GG.IdenG or identifyexecutor()

-- Servicios
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")

-- Referencias locales
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Backpack = LocalPlayer.Backpack
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Data = LocalPlayer.Data

-- Configuración
local Config = {
  AutoFarm = {
    Enabled = false,
    Distance = 180,
    Position = Vector3.new(0, 19, -10),
    TpSpeed = 2
  },
  Combat = {
    KillAura = false,
    FastAttack = false
  },
  Player = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoClip = false
  }
}

-- Funciones de utilidad
local function dist(position)
  return LocalPlayer:DistanceFromCharacter(position)
end

local function tp(position, speed)
  if Character and Character:FindFirstChild("HumanoidRootPart") then
    local hrp = Character.HumanoidRootPart
    local distance = (position - hrp.Position).magnitude
    local time = distance/speed
    
    local tween = game:GetService("TweenService"):Create(
      hrp,
      TweenInfo.new(time, Enum.EasingStyle.Linear),
      {CFrame = CFrame.new(position)}
    )
    tween:Play()
    tween.Completed:Wait()
  end
end

-- Sistema de combate
local function attack()
  VirtualUser:CaptureController()
  VirtualUser:Button1Down(Vector2.new(9999, 9999))
end

-- Sistema de farming
local function farm()
  while Config.AutoFarm.Enabled do
    for _,mob in pairs(workspace.Enemies:GetChildren()) do
      if mob:FindFirstChild("HumanoidRootPart") and 
         mob:FindFirstChild("Humanoid") and
         mob.Humanoid.Health > 0 then
         
        repeat
          tp(mob.HumanoidRootPart.Position + Config.AutoFarm.Position, Config.AutoFarm.TpSpeed)
          attack()
          wait()
        until not mob or mob.Humanoid.Health <= 0
        
      end
    end
    wait()
  end
end

-- Inicialización
farm()