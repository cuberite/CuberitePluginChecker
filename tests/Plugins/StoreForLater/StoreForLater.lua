-- StoreForLater.lua

-- Implements a test Cuberite plugin that stores an instance from a command callback for later





local function onCmdTest(a_Split, a_Player)
	g_Player = a_Player
end





function Initialize()
	cPluginManager:BindCommand("test", "", onCmdTest)
	return true
end



