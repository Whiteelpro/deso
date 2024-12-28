local Services = require("modules/services")
local Config = require("modules/config")

local ESP = {}

function ESP.createBillboard(parent, text, color)
  local billboard = Instance.new("BillboardGui")
  billboard.Name = "ESP"
  billboard.Size = UDim2.new(1, 200, 1, 30)
  billboard.Adornee = parent
  billboard.AlwaysOnTop = true
  
  local label = Instance.new("TextLabel", billboard)
  label.Text = text
  label.TextColor3 = color
  label.Size = UDim2.new(1, 0, 1, 0)
  label.BackgroundTransparency = 1
  
  return billboard
end

function ESP.updateESP()
  if Config.ESP.Players then
    ESP.updatePlayers()
  end
  
  if Config.ESP.Chests then
    ESP.updateChests() 
  end
  
  if Config.ESP.Fruits then
    ESP.updateFruits()
  end
end

return ESP