-- UseLater.lua

-- Implements a test Cuberite plugin that stores an instance from a command callback and uses it later on





local g_Player





local function onCmdStore(a_Split, a_Player)
	g_Player = a_Player
end





local function onCmdUse(a_Split, a_Player)
	g_Player:SendMessage("test")
end





function Initialize()
	cPluginManager:BindCommand("store", "", onCmdStore)
	cPluginManager:BindCommand("use",   "", onCmdUse)
	return true
end



