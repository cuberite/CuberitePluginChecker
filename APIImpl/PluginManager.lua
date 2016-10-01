-- PluginManager.lua

-- Implements the special API functions needed for cPluginManager to work





--- Implementation of the cPluginManager:BindCommand function
-- There are two separate API endpoints for the same implementation, so the implementation is pulled into a common function
local function BindCommand(a_Simulator, a_Self, a_Command, a_Permission, a_Callback, a_HelpString)
	if (a_Command:match("%s")) then
		a_Simulator.logger:trace("Registering a command containing whitespace(%s), such a handler will never be called by Cuberite.%s", a_Command, debug.traceback("", 2))
	end
	if (a_Simulator.registeredCommandHandlers[a_Command]) then
		a_Simulator.logger:info("Registering  a command that is already registered (%s). The second handler will not be called / tested.", a_Command)
		return
	end
	a_Simulator.registeredCommandHandlers[a_Command] =
	{
		permission = a_Permission,
		callback = a_Callback,
		helpString = a_HelpString,
	}
	return true
end





return
{
	["<static> cPluginManager:AddHook(cPluginManager#PluginHook, function)"] = function (a_Simulator, a_Self, a_HookType, a_Callback)
		local hooks = a_Simulator.hooks[a_HookType] or {}
		a_Simulator.registeredHooks[a_HookType] = hooks
		table.insert(hooks, a_Callback)
	end,

	["<static> cPluginManager:BindCommand(string, string, function, string)"] = BindCommand,
	["cPluginManager:BindCommand(string, string, function, string)"] = BindCommand,

	["cPluginManager:GetCurrentPlugin()"] = function (a_Simulator, a_Self)
		local res = a_Simulator:createInstance({Type = "cPlugin"})
		res.GetLocalPath = function (a_Self) return a_Simulator.options.pluginPath end  -- Override the plugin to act as "self"
		return res
	end,

	["<static> cPluginManager:GetPluginsPath()"] = function (a_Simulator)
		return a_Simulator.options.pluginPath .. "/.."
	end,

}
