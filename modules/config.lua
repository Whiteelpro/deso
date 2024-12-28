-- Configuración global del juego
return {
  AutoFarm = {
    Enabled = false,
    Distance = 180,
    Position = Vector3.new(0, 19, -10),
    TpSpeed = 2,
    Hitbox = false,
    BringMob = false,
    BringMobType = "Target",
    BringMobDistance = 180
  },
  Combat = {
    KillAura = false,
    FastAttack = false,
    AutoBuso = true,
    AutoKillTarget = false
  },
  Player = {
    WalkSpeed = 16,
    JumpPower = 50,
    NoClip = false,
    InfiniteEnergy = false
  },
  Teleport = {
    Bypass = false,
    Speed = 2
  },
  ESP = {
    Players = false,
    Chests = false,
    Fruits = false,
    Islands = false
  }
}