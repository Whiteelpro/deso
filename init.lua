local Services = require("modules/services")
local Config = require("modules/config")
local Combat = require("modules/combat")
local Farming = require("modules/farming") 
local ESP = require("modules/esp")

-- Inicialización
local function init()
  -- Configurar servicios
  local LocalPlayer = Services.Players.LocalPlayer
  local Character = LocalPlayer.Character
  
  -- Iniciar sistemas
  Farming.farm()
  
  -- Actualizar ESP
  Services.RunService.RenderStepped:Connect(function()
    ESP.updateESP()
  end)
  
  -- Manejar inputs
  Services.UserInputService.InputBegan:Connect(function(input)
    -- Manejar teclas
  end)
end

init()