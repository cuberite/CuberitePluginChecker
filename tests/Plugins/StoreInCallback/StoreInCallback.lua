-- StoreInCallback.lua

-- Implements a test Cuberite plugin that stores for later an instance from a callback inside a command callback




local g_Player





local function onCmdTest(a_Split, a_Player)
	--[[
	a_Player:GetWorld():FindAndDoWithPlayer(
		"something",
	--]]
	a_Player:GetWorld():ForEachPlayer(
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)
end





function Initialize()
	cPluginManager:BindCommand("test", "", onCmdTest)
	return true
end



