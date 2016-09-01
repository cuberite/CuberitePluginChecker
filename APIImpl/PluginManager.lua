-- PluginManager.lua

-- Implements the special API functions needed for cPluginManager to work




return
{
	["cPluginManager:GetPluginsPath()"] = function (a_Simulator)
		return a_Simulator.options.pluginPath .. "/.."
	end
}
