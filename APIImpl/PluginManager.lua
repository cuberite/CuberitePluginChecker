-- PluginManager.lua

-- Implements the special API functions needed for cPluginManager to work





--- Implementation of the AddWebTab API functions in cPluginLua and cWebAdmin
local function addWebTab(a_Simulator, a_Title, a_Url, a_Callback)
	a_Simulator.registeredWebTabs[a_Url] =
	{
		title = a_Title,
		callback = a_Callback,
	}
end





--- Returns a cPluginLua instance that acts as the current plugin
local function getCurrentPlugin(a_Simulator, a_Self)
		local res = a_Simulator:createInstance({Type = "cPluginLua"})
		-- Save the path to the plugin folder in the self variable
		getmetatable(res).simulatorInternal_pluginPath = a_Simulator.options.pluginPath
		return res
end





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





--- Implementation of the cPluginManager:BindConsoleCommand function
-- There are two separate API endpoints for the same implementation, so the implementation is pulled into a common function
local function BindConsoleCommand(a_Simulator, a_Self, a_Command, a_Callback, a_HelpString)
	if (a_Command:match("%s")) then
		a_Simulator.logger:trace("Registering a console command containing whitespace(%s), such a handler will never be called by Cuberite.%s", a_Command, debug.traceback("", 2))
	end
	if (a_Simulator.registeredConsoleCommandHandlers[a_Command]) then
		a_Simulator.logger:info("Registering  a console command that is already registered (%s). The second handler will not be called / tested.", a_Command)
		return
	end
	a_Simulator.registeredConsoleCommandHandlers[a_Command] =
	{
		callback = a_Callback,
		helpString = a_HelpString,
	}
	return true
end





--- Implementation of the cPluginManager:ForEachPlugin function
-- There are two separate API endpoints for the same implementation
local function ForEachPlugin(a_Simulator, a_Self, a_Callback)
	local res = a_Simulator:processCallbackRequest({
		Function = a_Callback,
		ParamValues = { a_Self:GetCurrentPlugin() },
		Notes = "cPluginManager:ForEachPlugin() callback",
	})
	return not(res == true)  -- If the callback signalized an abort, return false
end





return
{
	["cPlugin:GetLocalFolder()"] = function(a_Simulator, a_Self)
		return getmetatable(a_Self).simulatorInternal_pluginPath or a_Simulator:createInstance({Type = "string"})
	end,

	["cPluginLua:AddWebTab(string, function)"] = function(a_Simulator, a_Self, a_Title, a_Callback)
		a_Simulator.logger:warning("Plugin uses the deprecated function cPluginLua:AddWebTab")
		return addWebTab(a_Simulator, a_Title, a_Title, a_Callback)
	end,

	["<static> cPluginManager:AddHook(cPluginManager#PluginHook, function)"] = function(a_Simulator, a_Self, a_HookType, a_Callback)
		local hooks = a_Simulator.hooks[a_HookType] or {}
		a_Simulator.registeredHooks[a_HookType] = hooks
		table.insert(hooks, a_Callback)
	end,

	["<static> cPluginManager:BindCommand(string, string, function, string)"] = BindCommand,

	["cPluginManager:BindCommand(string, string, function, string)"] = BindCommand,

	["<static> cPluginManager:BindConsoleCommand(string, function, string)"] = BindConsoleCommand,

	["cPluginManager:BindConsoleCommand(string, function, string)"] = BindConsoleCommand,

	["<static> cPluginManager:DoWithPlugin(string, function) -> (boolean)"] = function(a_Simulator, a_Class, a_PluginName, a_Callback)
		-- The currently tested plugin is the only one present, if the name matches, call with "self":
		local currPlugin = getCurrentPlugin(a_Simulator)
		if (a_PluginName == currPlugin:GetName()) then
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { currPlugin },
				Notes = "cPluginManager:DoWithPlugin() callback",
			})
			return (res == true)  -- Convert the return value to a single bool
		end

		-- Plugin not found:
		return false
	end,

	["cPluginManager:ForEachCommand(function) -> (boolean)"] = function(a_Simulator, a_Self, a_Callback)
		for cmd, desc in pairs(a_Simulator.registeredCommandHandlers) do
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { cmd, desc.permission, desc.helpString },
				Notes = string.format("cPluginManager:ForEachCommand() callback, command %s", cmd),
			})
			if (res == true) then
				a_Simulator.logger:trace("cPluginManager:ForEachCommand() callback has aborted the loop at command %s", cmd)
				return false
			end
		end  -- for cmd, desc
		return true
	end,

	["cPluginManager:ForEachConsoleCommand(function) -> (boolean)"] = function(a_Simulator, a_Self, a_Callback)
		for cmd, desc in pairs(a_Simulator.registeredConsoleCommandHandlers) do
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { cmd, desc.helpString },
				Notes = string.format("cPluginManager:ForEachConsoleCommand() callback, command %s", cmd),
			})
			if (res == true) then
				a_Simulator.logger:trace("cPluginManager:ForEachConsoleCommand() callback has aborted the loop at command %s", cmd)
				return false
			end
		end  -- for cmd, desc
		return true
	end,

	["<static> cPluginManager:ForEachPlugin(function) -> (boolean)"] = ForEachPlugin,

	["cPluginManager:ForEachPlugin(function) -> (boolean)"] = ForEachPlugin,

	["cPluginManager:GetCurrentPlugin()"] = getCurrentPlugin,

	["<static> cPluginManager:GetPluginsPath()"] = function (a_Simulator)
		return a_Simulator.options.pluginPath .. "/.."
	end,

	["<static> cWebAdmin:AddWebTab(string, string, function)"] = function(a_Simulator, a_Self, a_Title, a_Url, a_Callback)
		return addWebTab(a_Simulator, a_Title, a_Url, a_Callback)
	end,

}
