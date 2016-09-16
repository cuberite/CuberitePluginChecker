-- PluginManager.lua

-- Implements the special API functions needed for cPluginManager to work




return
{
	["cPluginManager:GetCurrentPlugin()"] = function (a_Simulator, a_Self)
		local res = a_Simulator:createInstance({Type = "cPlugin"})
		res.GetLocalPath = function (a_Self) return a_Simulator.options.pluginPath end  -- Override the plugin to act as "self"
		return res
	end,

	["cPluginManager:GetPluginsPath()"] = function (a_Simulator)
		return a_Simulator.options.pluginPath .. "/.."
	end
}
