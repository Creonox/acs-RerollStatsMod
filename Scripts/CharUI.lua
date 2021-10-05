local Mod = GameMain:GetMod("rerollstatsmod");

Mod.CharUI = Mod.CharUI or {}
local CharUI = Mod.CharUI


function CharUI:RandomizeClicked(context)
   Mod:Log("Randomize")
end

function CharUI:SetupUI(UiInfo)
    self.ui = UIPackage.createObjectFromURL("ui://1hfe2w88sejd0")
    self.ui.x = 0
    self.ui.y = 0
    self.ui.PerTile.title = "PER"
    self.ui.ConTile.title = "CON"
    self.ui.ChaTile.title = "CHA"
    self.ui.IntTile.title = "INT"
    self.ui.LukTile.title = "LUK"
    self.ui.PotTile.title = "POT"

    UIInfo:AddChild(self.ui)
    GameMain:GetMod("Windows"):GetWindow("RerollMenu"):Show();
end
