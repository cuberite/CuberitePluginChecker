-- Simulator.lua

-- Implements the Cuberite simulator
--[[
Usage:
	local sim = require("Simulator").create()
	-- Possibly use sim as an upvalue in special API function implementations
	-- Extend the simulator's sandbox etc.
	sim:run(options, api)
--]]





--- Compatibility with both Lua 5.1 and LuaJit
local unpack = unpack or table.unpack





--- Use the Scenario loading library:
local Scenario = dofile("Scenario.lua")





--- The protocol number to use for things that report client protocol
local PROTOCOL_NUMBER = 210  -- client version 1.10.0





--- The class (metatable) to be used for all simulators
local Simulator = {}
Simulator["__index"] = Simulator





--- Adds a new callback request to the queue to be processed
-- a_ParamTypes is an array of strings describing the param types
-- a_Notes is a description of the request for logging purposes
-- a_ParamValues is an optional array of params' values
function Simulator:addCallbackRequest(a_FnToCall, a_ParamTypes, a_Notes, a_ParamValues)
	-- Check params:
	assert(self)
	assert(type(a_FnToCall) == "function")
	local paramTypes = a_ParamTypes or {}
	assert(type(paramTypes) == "table")

	-- Add the request to the queue:
	local n = self.callbackRequests.n + 1
	self.callbackRequests[n] = { Function = a_FnToCall, ParamTypes = paramTypes, ParamValues = a_ParamValues, Notes = a_Notes }
	self.callbackRequests.n = n

	-- Call the notification callback:
	self:callHooks(self.hooks.onAddedRequest)
end





--- Adds a CallbackRequest to call the specified command with the specified CommandSplit
-- a_Handler is the command's registered callback function
-- a_CommandSplit is an array-table of strings used as the splitted command
-- a_PlayerInstance is an optional cPlayer instance representing the player. If not given, a dummy one is created
function Simulator:addCommandCallbackRequest(a_Handler, a_CommandSplit, a_PlayerInstance)
	local player = a_PlayerInstance or self:createInstance({Type = "cPlayer"})
	local entireCmd = table.concat(a_CommandSplit, " ")
	self:addCallbackRequest(a_Handler, nil, string.format("command \"%s\"", entireCmd), { a_CommandSplit, player, entireCmd })
end





--- Adds the hooks to the simulator, based on the options specified by the user
function Simulator:addHooks(a_Options)
	if (a_Options.shouldClearObjects) then
		table.insert(self.hooks.onBeforeCallCallback, Simulator.beforeCallClearObjects)
		table.insert(self.hooks.onAfterCallCallback,  Simulator.afterCallClearObjects)
	end
	if (a_Options.shouldGCObjects) then
		table.insert(self.hooks.onBeforeCallCallback, Simulator.beforeCallGCObjects)
		table.insert(self.hooks.onAfterCallCallback,  Simulator.afterCallGCObjects)
	end
	if (a_Options.shouldFuzzCommands) then
		table.insert(self.hooks.onEmptyRequestQueue, Simulator.fuzzCommandHandlers)
	end
end





--- Adds the specified file / folder redirections
-- The previous redirects are kept
function Simulator:addRedirects(a_Redirects)
	-- Check params:
	assert(self)
	assert(type(a_Redirects) == "table")

	-- Add the redirects:
	for orig, new in pairs(a_Redirects) do
		self.redirects[orig] = new
	end
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallClearObjects(a_Params, a_Returns)
	self.logger:trace("afterCallClearObjects:")
	self.logger:trace("\ta_Params = %s", tostring(a_Params))
	self.logger:trace("\ta_Returns = %s", tostring(a_Returns))
	-- TODO
end





--- Called by the simulator after calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallGCObjects(a_Params, a_Returns)
	self.logger:trace("afterCallGCObjects:")
	self.logger:trace("\ta_Params = %s", tostring(a_Params))
	self.logger:trace("\ta_Returns = %s", tostring(a_Returns))
	-- TODO
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallClearObjects(a_Params)
	self.logger:trace("beforeCallClearObjects:")
	self.logger:trace("\ta_Params = %s", tostring(a_Params))
	-- TODO
end





--- Called by the simulator before calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallGCObjects(a_Params)
	self.logger:trace("beforeCallGCObjects:")
	self.logger:trace("\ta_Params = %s", tostring(a_Params))
	-- TODO
end





--- Calls all the hooks in the specified table with any params
function Simulator:callHooks(a_Hooks, ...)
	-- Check params:
	assert(type(a_Hooks) == "table")

	-- Call the hooks:
	for _, hook in ipairs(a_Hooks) do
		hook(self, ...)
	end
end






--- Checks whether the given parameters match the given function signature
-- Assumes that the parameter counts are the same (checked by the caller)
-- a_FnSignature is an array-table of params, as given by the API description
-- a_Params is an array-table of parameters received from the plugin
-- a_NumParams is the number of parameters in a_Params (specified separately due to possible nil parameters)
-- a_ClassName is the name of the class in which the function resides, or nil if the function is a global
-- Returns true if the signature matches, false and optional error message on mismatch
function Simulator:checkClassFunctionSignature(a_FnSignature, a_Params, a_NumParams, a_ClassName)
	-- Check params:
	assert(type(a_FnSignature) == "table")
	assert(type(a_Params) == "table")
	assert(type(a_NumParams) == "number")

	-- If the function is in a class, check the "self" param:
	local paramOffset = 0
	if (a_ClassName) then
		paramOffset = 1
		if (type(a_Params[1]) ~= "table") then
			return false, "The \"self\" parameter is not a class (table)"
		end
		if (a_FnSignature.IsStatic) then
			-- For a static function, the first param should be the class itself:
			local mt = getmetatable(a_Params[1])
			if not(mt) then
				return false, "The \"self\" parameter is not a class (metatable)"
			end
			if not(rawget(mt, "simulatorInternal_ClassName")) then
				return false, "The \"self\" parameter is not a Cuberite class"
			end
			if not(self:classInheritsFrom(mt.simulatorInternal_ClassName, a_ClassName)) then
				return false, string.format(
					"The \"self\" parameter is a different class. Expected %s, got %s.",
					a_ClassName, mt.simulatorInternal_ClassName
				)
			end
		else
			-- For a non-static function, the first param should be an instance of the class:
			local mt = getmetatable(a_Params[1])
			if not(mt) then
				return false, "The \"self\" parameter is not a class instance (metatable)"
			end
			local classMT = getmetatable(mt)
			if not(classMT) then
				return false, "The \"self\" parameter is not a class instance (class metatable)"
			end
			if not(rawget(classMT, "simulatorInternal_ClassName")) then
				return false, "The \"self\" parameter is not a Cuberite class instance"
			end
			if not(self:classInheritsFrom(classMT.simulatorInternal_ClassName, a_ClassName)) then
				return false, string.format(
					"The \"self\" parameter is a different class instance. Expected %s, got %s.",
					a_ClassName, classMT.simulatorInternal_ClassName
				)
			end
		end
	end

	-- Check the type of each plugin parameter:
	for idx = paramOffset + 1, a_NumParams do
		local signatureParam = a_FnSignature.Params[idx - paramOffset]
		if not(signatureParam) then
			return false, string.format("There are more parameters (%d) than in the signature (%d)", a_NumParams - paramOffset, idx - paramOffset - 1)
		end
		local param = a_Params[idx]
		local paramType = self:typeOf(param)
		if not(self:paramTypesMatch(paramType, signatureParam.Type)) then
			return false, string.format("Param #%d doesn't match, expected %s, got %s",
				idx - paramOffset, signatureParam.Type, paramType
			)
		end
	end

	-- All given params have matched, now check that all the leftover params in the signature are optional:
	local idx = a_NumParams + 1
	while (a_FnSignature.Params[idx]) do
		if not(a_FnSignature.Params[idx].IsOptional) then
			return false, string.format("Param #d (%s) is missing.", idx, a_FnSignature.Params[idx].Type)
		end
		idx = idx + 1
	end

	-- All params have matched
	return true
end





--- Checks the inheritance tree
-- Returns true if class "a_ChildName" inherits from class "a_ParentName" (or they are the same)
function Simulator:classInheritsFrom(a_ChildName, a_ParentName)
	-- Check params:
	assert(self)
	assert(type(a_ChildName) == "string")
	assert(type(a_ParentName) == "string")

	-- If they are the same class, consider them inheriting:
	if (a_ChildName == a_ParentName) then
		return true
	end

	-- Check the inheritance using the child class API:
	local childClass = self.sandbox[a_ChildName]
	if not(childClass) then
		self.logger:warning("Attempting to check inheritance for non-existent class \"%s\".", a_ChildName)
		return false
	end
	local childMT = getmetatable(childClass) or {}
	local childApi = childMT.simulatorInternal_ClassApi or {}
	for _, parent in ipairs(childApi.Inherits or {}) do
		if (self:classInheritsFrom(parent, a_ParentName)) then
			return true
		end
	end

	-- None of the inherited classes matched
	return false
end





--- Removes all state information previously added through a scenario
-- Removes worlds, players
function Simulator:clearState()
	-- Check params:
	assert(self)

	self.worlds = {}
	self.players = {}
end





--- Collapses the relative parts of the path, such as "folder/../"
function Simulator:collapseRelativePath(a_Path)
	-- Check params:
	assert(type(a_Path) == "string")

	-- Split the path and rebuild without the relativeness:
	local res = {}
	a_Path:gsub("[^/]+",
		function(a_Part)
			if (a_Part == "..") then
				if ((#res > 0) and (res[#res - 1] ~= "..")) then  -- The previous part is not relative
					table.remove(res)
				else
					table.insert(res, a_Part)
				end
			else
				table.insert(res, a_Part)
			end
		end
	)
	return table.concat(res, "/")
end





--- Simulates a player joining the game
-- a_PlayerDesc is a dictionary-table describing the player (name, worldName, gameMode, ip)
-- "name" is compulsory, the rest is optional
-- Calls all the hooks that are normally triggered for a joining player
-- If any of the hooks refuse the join, doesn't add the player and returns false
-- Returns true if the player was added successfully
function Simulator:connectPlayer(a_PlayerDesc)
	-- Check params:
	assert(self)
	assert(type(a_PlayerDesc) == "table")
	local playerName = a_PlayerDesc.name
	assert(type(playerName) == "string")
	assert(self.defaultWorldName, "No world in the simulator")

	-- Create the player, with some reasonable defaults:
	a_PlayerDesc.worldName = a_PlayerDesc.worldName or self.defaultWorldName
	self.players[playerName] = a_PlayerDesc

	-- Call the hooks to simulate the player joining:
	local client = self:createInstance({Type = "cClientHandle"})
	client.simulatorInternal_PlayerName = playerName
	if (self:executeHookCallback("HOOK_LOGIN", client, PROTOCOL_NUMBER, playerName)) then
		self.logger:trace("Plugin refused player \"%s\" to connect.", playerName)
		self.players[playerName] = nil  -- Remove the player
		return false
	end
	self:executeHookCallback("HOOK_PLAYER_JOINED", self:getPlayerByName(playerName))

	-- If the plugin kicked the player, abort:
	if not(self.players[playerName]) then
		self.logger:trace("Plugin kicked player \"%s\" while they were joining.", playerName)
		return false
	end

	-- Spawn the player:
	self:executeHookCallback("HOOK_PLAYER_SPAWNED", self:getPlayerByName(playerName))
	if not(self.players[playerName]) then
		self.logger:trace("Plugin kicked player \"%s\" while they were spawning.", playerName)
		return false
	end

	return true
end





--- Creates an API endpoint (function, constant or variable) dynamically
-- a_ClassApi is the API description of the class or the Globals
-- a_SymbolName is the name of the symbol that is requested
-- a_ClassName is the name of the class (or "Globals") where the function resides; for logging purposes only
function Simulator:createApiEndpoint(a_ClassApi, a_SymbolName, a_ClassName)
	-- CheckParams:
	assert(self)
	assert(type(a_ClassApi) == "table")
	assert(a_ClassApi.Functions)
	assert(a_ClassApi.Constants)
	assert(a_ClassApi.Variables)
	assert(type(a_SymbolName) == "string")
	assert(type(a_ClassName) == "string")

	-- Create the endpoint:
	local res
	if (a_ClassApi.Functions[a_SymbolName]) then
		res = self:createClassFunction(a_ClassApi.Functions[a_SymbolName], a_SymbolName, a_ClassName)
	elseif (a_ClassApi.Constants[a_SymbolName]) then
		res = self:createClassConstant(a_ClassApi.Constants[a_SymbolName], a_SymbolName, a_ClassName)
	elseif (a_ClassApi.Variables[a_SymbolName]) then
		res = self:createClassVariable(a_ClassApi.Variables[a_SymbolName], a_SymbolName, a_ClassName)
	end
	if (res) then
		return res
	end

	-- If not found, try to create it in the class parents:
	for _, className in ipairs(a_ClassApi.Inherits or {}) do
		local res = self.sandbox[className][a_SymbolName]
		if (res) then
			return res
		end
	end

	-- Endpoint not found:
	return nil
end





--- Definitions for operators
-- This table pairs operators' APIDoc names with their Lua Meta-method names and names used for logging
local g_Operators =
{
	{ docName = "operator_div",   metaName = "__div", logName = "operator div" },
	{ docName = "operator_eq",    metaName = "__eq",  logName = "operator eq" },
	{ docName = "operator_minus", metaName = "__sub", logName = "operator minus" },
	{ docName = "operator_minus", metaName = "__unm", logName = "operator unary-minus" },
	{ docName = "operator_mul",   metaName = "__mul", logName = "operator mul" },
	{ docName = "operator_plus",  metaName = "__add", logName = "operator plus" },
}





--- Creates a sandbox implementation of the specified API class
-- a_ClassName is the name of the class (used for error-reporting)
-- a_ClassApi is the class' API description
-- Returns a table that is to be stored in the sandbox under the class' name
function Simulator:createClass(a_ClassName, a_ClassApi)
	-- Check params:
	assert(self)
	assert(type(a_ClassName) == "string")
	assert(type(a_ClassApi) == "table")
	assert(a_ClassApi.Functions)
	assert(a_ClassApi.Constants)
	assert(a_ClassApi.Variables)

	self.logger:trace("Creating class \"%s\".", a_ClassName)
	-- Create a metatable that dynamically creates the API endpoints, and stores info about the class:
	local mt =
	{
		__index = function(a_Table, a_SymbolName)
			if ((a_SymbolName == "__tostring") or (a_SymbolName == "__serialize")) then
				-- Used by debuggers all the time, spamming the log. Bail out early.
				return nil
			end
			self.logger:trace("Creating an API endpoint \"%s.%s\".", a_ClassName, a_SymbolName)
			local endpoint = self:createApiEndpoint(a_ClassApi, a_SymbolName, a_ClassName)
			if not(endpoint) then
				self.logger:error("Attempting to use a non-existent API: \"%s.%s\".", a_ClassName, a_SymbolName)
			end
			return endpoint
		end,
		simulatorInternal_ClassName = a_ClassName,
		simulatorInternal_ClassApi = a_ClassApi,
	}

	-- If the class has a constructor, add it to the meta-table, because it doesn't go through the __index meta-method:
	if (a_ClassApi.Functions.new) then
		mt.__call = function (...)
			self.logger:trace("Creating constructor for class %s.", a_ClassName)
			local endpoint = self:createApiEndpoint(a_ClassApi, "new", a_ClassName)
			if not(endpoint) then
				self.logger:error("Attempting to use a constructor for class %s that doesn't have one.", a_ClassName)
			end
			return endpoint(...)
		end
	end
	if (a_ClassApi.Functions.constructor) then
		mt.__call = function (...)
			self.logger:trace("Creating constructor for class %s.", a_ClassName)
			local endpoint = self:createApiEndpoint(a_ClassApi, "constructor", a_ClassName)
			if not(endpoint) then
				self.logger:error("Attempting to use a constructor for class %s that doesn't have one.", a_ClassName)
			end
			return endpoint(...)
		end
	end

	-- Add any operators to the class-table, because they don't go through the __index meta-method:
	-- Also they apparently don't go through meta-table nesting, so need to create them directly in the class-table
	local res = {}
	res.__index = res
	for _, op in ipairs(g_Operators) do
		if (a_ClassApi.Functions[op.docName]) then
			res[op.metaName] = function (...)
				self.logger:trace("Creating %s for class %s", op.logName, a_ClassName)
				local endpoint = self:createApiEndpoint(a_ClassApi, op.docName, a_ClassName)
				if not(endpoint) then
					self.logger:error("Attempting to use %s for class %s that doesn't have one.", op.logName, a_ClassName)
				end
				return endpoint(...)
			end
		end
	end

	setmetatable(res, mt)
	self.sandbox[a_ClassName] = res  -- Store the class for the next time (needed at least for operator_eq)
	return res
end





--- Creates a constant based on its API description
-- Provides a dummy value if no value is given
function Simulator:createClassConstant(a_ConstDesc, a_ConstName, a_ClassName)
	-- Check params:
	assert(self)
	assert(type(a_ConstDesc) == "table")
	assert(type(a_ConstName) == "string")
	assert(type(a_ClassName) == "string")

	-- If the value is specified, return it directly:
	if (a_ConstDesc.Value) then
		return a_ConstDesc.Value
	end

	-- Synthesize a dummy value of the proper type:
	if not(a_ConstDesc.Type) then
		self.logger:error("Simulator error: API description for constant %s.%s doesn't provide value nor type", a_ClassName, a_ConstName)
	end
	return self:createInstance(a_ConstDesc)
end





--- Creates a variable based on its API description
function Simulator:createClassVariable(a_VarDesc, a_VarName, a_ClassName)
	-- Check params:
	assert(self)
	assert(type(a_VarDesc) == "table")
	assert(type(a_VarName) == "string")
	assert(type(a_ClassName) == "string")

	-- If the value is specified, return it directly:
	if (a_VarDesc.Value) then
		return a_VarDesc.Value
	end

	-- Synthesize a dummy value of the proper type:
	return self:createInstance(a_VarDesc)
end





--- Creates a dummy API function implementation based on its API description:
function Simulator:createClassFunction(a_FnDesc, a_FnName, a_ClassName)
	-- Check params:
	assert(self)
	assert(type(a_FnDesc) == "table")
	assert(type(a_FnName) == "string")
	assert(type(a_ClassName) == "string")

	return function(...)
		self.logger:trace("Calling function %s.%s.", a_ClassName, a_FnName)
		local params = { ... }
		self:callHooks(self.hooks.onApiFunctionCall, a_ClassName, a_FnName, params)
		local signature, msgs = self:findClassFunctionSignatureFromParams(a_FnDesc, params, a_ClassName)
		if not(signature) then
			self.logger:error(
				"Function %s.%s used with wrong parameters, there is no overload that can take these:\n\t%s\nMatcher messages:\n\t%s",
				a_ClassName, a_FnName,
				table.concat(self:listParamTypes(params), "\n\t"),
				table.concat(msgs, "\n\t")
			)
		end
		if (signature.Implementation) then
			-- This function has a specific implementation, call it:
			return signature.Implementation(self, ...)
		else
			-- Provide a default implementation by default-constructing the return values:
			return unpack(self:createInstances(signature.Returns, params[1]))
		end
	end
end





--- Creates a single instance of a type - for a callback request or as an API function return value
function Simulator:createInstance(a_TypeDef)
	-- Check params:
	assert(self)
	assert(type(a_TypeDef) == "table")
	local t = a_TypeDef.Type
	assert(t)

	-- If it is a built-in type, create it directly:
	if (t == "string") then
		self.testStringIndex = (self.testStringIndex + 1) % 5  -- Repeat the same string every 5 calls
		return "TestString" .. self.testStringIndex
	elseif (t == "number") then
		self.testNumber = (self.testNumber + 1) % 5  -- Repeat the same number every 5 calls
		return self.testNumber
	elseif (t == "boolean") then
		return true
	end

	-- If it is a class param, create a class instance:
	local classTable = self.sandbox[t]
	if not(classTable) then
		self.logger:error("Requested an unknown param type for callback request: \"%s\".", t)
	end
	self.logger:trace("Created a new instance of %s", t)
	local res = {}
	setmetatable(res, classTable)
	assert(classTable.__index == classTable)
	return res
end





--- Creates all object instances required for a callback request
-- a_TypeDefList is an array of type descriptions ({Type = "string"})
-- a_Self is the value that should be returned whenever the type specifies "self" (used by chaining functions)
-- Returns the instances as an array-table
function Simulator:createInstances(a_TypeDefList, a_Self)
	-- Check params:
	assert(type(a_TypeDefList) == "table")

	-- Create the instances:
	local res = {}
	for idx, td in ipairs(a_TypeDefList) do
		if (td.Type == "self") then
			res[idx] = a_Self
		else
			res[idx] = self:createInstance(td)
		end
	end
	return res
end





--- Creates a new world with the specified parameters
-- a_WorldDesc is a dictionary-table containing the world description - name, dimension, default gamemode etc.
-- Only the name member is compulsory, the rest are optional
-- After creating the world, the world creation hooks are executed
function Simulator:createNewWorld(a_WorldDesc)
	-- Check params:
	assert(self)
	assert(type(a_WorldDesc) == "table")
	assert(type(a_WorldDesc.name) == "string")

	-- Check if such a world already present:
	local worldName = a_WorldDesc.name
	if (self.worlds[worldName]) then
		self.logger:error("Cannot create world, a world with name \"%s\" already exists.", worldName)
	end

	-- Create the world:
	self.logger:trace("Creating new world \"%s\".", worldName)
	a_WorldDesc.dimension = a_WorldDesc.dimension or 0
	a_WorldDesc.defaultGameMode = a_WorldDesc.defaultGameMode or 0
	self.worlds[worldName] = a_WorldDesc
	if not(self.defaultWorldName) then
		self.defaultWorldName = worldName
	end

	-- Call the hooks for the world creation:
	local world = self:createInstance({Type = "cWorld"})
	world.simulatorInternal_worldName = worldName
	self:executeHookCallback("HOOK_WORLD_STARTED", world)
end





--- Replacement for the sandbox's dofile function
-- Needs to apply the sandbox to the loaded code
function Simulator:dofile(a_FileName)
	-- Check params:
	assert(self)
	assert(type(self.sandbox) == "table")

	self.logger:trace("Executing file \"%s\".", a_FileName)
	local res, msg = loadfile(a_FileName)
	if (res) then
		setfenv(res, self.sandbox)
	end
	return res()
end





--- Executes a callback request simulating the specified hook type
-- a_HookTypeStr is the string name of the hook ("HOOK_PLAYER_DISCONNECTING" etc.)
-- All the rest of the params are given to the hook as-is
-- If a hook returns true (abort), stops processing the hooks and returns false
-- Otherwise returns false and the rest of the values returned by the hook
function Simulator:executeHookCallback(a_HookTypeStr, ...)
	-- Check params:
	assert(self)
	assert(type(a_HookTypeStr) == "string")
	local hookType = self.sandbox.cPluginManager[a_HookTypeStr]
	assert(hookType)

	-- Call all hook handlers:
	self.logger:trace("Triggering hook handlers for %s", a_HookTypeStr)
	local params = {...}
	local hooks = self.registeredHooks[a_HookType] or {}
	local res
	for idx, callback in ipairs(hooks) do
		res = self:processCallbackRequest(
			{
				Function = callback,
				ParamValues = params,
				Notes = a_HookTypeStr,
			}
		)
		if (res[1]) then
			-- The hook asked for an abort
			self.logger:trace("Hook handler #%d for hook %s aborted the hook chain.", idx, a_HookTypeStr)
			return true
		end
		-- TODO: Some hooks should have special processing - returning a value overwrites the param for the rest of the hooks
	end
	if (res) then
		return false, unpack(res, 2)
	else
		return false
	end
end





--- Executes a callback request simulating the player executing the specified command
-- Calls the command execution hooks and if they allow, the command handler itself
-- Returns true if the command was executed, false if not.
-- Doesn't care whether the player is in the list of connected players or not
function Simulator:executePlayerCommand(a_PlayerName, a_CommandString)
	-- Check params:
	assert(self)
	assert(type(a_PlayerName) == "string")
	assert(type(a_CommandString) == "string")

	-- Call the command execution hook:
	local split = self:splitCommandString(a_CommandString)
	if (self:executeHookCallback("HOOK_EXECUTE_COMMAND", self:getPlayerByName(a_PlayerName), split, a_CommandString)) then
		self.logger:trace("Plugin hook refused to execute command \"%s\" from player %s.", a_CommandString, a_PlayerName)
		return false
	end

	-- Call the command handler:
	split = self:splitCommandString(a_CommandString)  -- Re-split, in case the hooks changed it
	local cmdReg = self.registeredCommandHandlers[split[1]]
	if not(cmdReg) then
		self.logger:warning("Trying to execute command \"%s\" for which there's no registered handler.", split[1])
		return
	end
	self:processCallbackRequest(
		{
			Function = cmdReg.callback,
			ParamValues = { split, self:getPlayerByName(a_PlayerName), a_CommandString },
			Notes = "Command " .. a_CommandString,
		}
	)
end





--- Returns the API signature for a function, based on its params (overload-resolution)
-- a_FnDesc is the function's description table (array of signatures and map of properties)
-- a_Params is an array-table of the params given by the plugin
-- Returns the signature of the function (item in a_FnDescs) that matches the params
-- If no signature matches, returns nil and an array-table of error messages from signature-matching
function Simulator:findClassFunctionSignatureFromParams(a_FnDesc, a_Params, a_ClassName)
	-- Check params:
	assert(self)
	assert(type(a_FnDesc) == "table")
	assert(type(a_Params) == "table")

	-- Find the number of params in a_Params (note that some may be nil, in which case Lua's "#" operator doesn't work)
	local numParamsGiven = 0
	for k, v in pairs(a_Params) do
		if (numParamsGiven < k) then
			numParamsGiven = k
		end
	end

	-- Check the signatures that have the same number of params:
	local msgs = {}
	for _, signature in ipairs(a_FnDesc) do
		local numSelfParams, className
		if (signature.IsGlobal) then
			numSelfParams = 0
		else
			numSelfParams = 1
			className = a_ClassName
		end
		local numSignatureParams = #(signature.Params) + numSelfParams
		local doesMatch, msg = self:checkClassFunctionSignature(signature, a_Params, numParamsGiven, className)
		if (doesMatch) then
			return signature
		end
		table.insert(msgs, (msg or "<no message>") .. " (signature: " .. self:prettyPrintSignature(signature) .. ")")
	end

	-- None of the signatures matched the params, report an error:
	return nil, msgs
end





--- Called when the request queue is empty and command fuzzing is enabled
-- If there is a command yet to be fuzzed, queues its request
function Simulator:fuzzCommandHandlers()
	-- Check params:
	assert(self)

	-- If called for the first time, make a list of not-yet-fuzzed commands:
	if not(self.currentFuzzedCommandTest) then
		self.logger:trace("Starting the command fuzzer")
		self.commandsToFuzz = {}
		local idx = 1
		for cmd, _ in pairs(self.registeredCommandHandlers) do
			self.commandsToFuzz[idx] = cmd
			idx = idx + 1
		end
		self.currentFuzzedCommandTest = 1
	end

	-- If no more commands to fuzz, bail out:
	if not(self.commandsToFuzz[1]) then
		return
	end

	-- Add the fuzzing request for the next command handler into the queue:
	local test = self.currentFuzzedCommandTest
	local cmd = splitCommandString(self.commandsToFuzz[1])
	local desc = self.registeredCommandHandlers[cmd[1]]
	if (test == 1) then
		self:addCommandCallbackRequest(desc.callback, cmd)
	elseif (test == 2) then
		table.insert(cmd, "a")
		self:addCommandCallbackRequest(desc.callback, cmd)
	elseif (test == 3) then
		table.insert(cmd, "1")
		self:addCommandCallbackRequest(desc.callback, cmd)

	-- TODO: more tests here

	else
		-- All tests done, move to next command (using recursion):
		table.remove(self.commandsToFuzz, 1)
		self.currentFuzzedCommandTest = 1
		self:fuzzCommandHandlers()
		return
	end
	self.currentFuzzedCommandTest = self.currentFuzzedCommandTest + 1
end





--- Returns a cPlayer instance that is bound to the specified player
-- If the player is not in the list of players, returns nil
function Simulator:getPlayerByName(a_PlayerName)
	-- Check params:
	assert(self)
	assert(type(a_PlayerName) == "string")

	-- If the player is not currently connected, return nil:
	if not(self.players[a_PlayerName]) then
		return nil
	end

	-- Create a new instance and bind it:
	local player = self:createInstance({Type = "cPlayer"})
	player.simulatorInternal_Name = a_PlayerName
	return player
end





--- Injects the API classes and global symbols into the simulator's sandbox
function Simulator:injectApi(a_ApiDesc)
	-- Check params:
	assert(self)

	-- Inject the metatable override that creates global API symbols:
	local sandboxMT = getmetatable(self.sandbox)
	if not(sandboxMT) then
		sandboxMT = {}
		setmetatable(self.sandbox, sandboxMT)
	end
	local prevIndex = sandboxMT.__index
	sandboxMT.__index = function(a_Table, a_SymbolName)
		-- If a class is requested, create it:
		if (a_ApiDesc.Classes[a_SymbolName]) then
			return self:createClass(a_SymbolName, a_ApiDesc.Classes[a_SymbolName])
		end

		-- If a global API symbol is requested, create it:
		local endpoint = self:createApiEndpoint(a_ApiDesc.Globals, a_SymbolName, "Globals")
		if (endpoint) then
			return endpoint
		end

		-- Failed to create the endpoint, chain to previous __index or raise an error:
		if not(prevIndex) then
			self.logger:warning("Attempting to use an unknown Global value \"%s\", nil will be returned", a_SymbolName)
			return nil
		end
		assert(type(prevIndex) == "function")  -- We don't support table-based __index yet (but can be done)
		return prevIndex(a_Table, a_SymbolName)
	end
end





--- Returns an array-table of a_Params' types
-- Resolves class types
function Simulator:listParamTypes(a_Params)
	local res = {}
	for idx, param in ipairs(a_Params) do
		local pt = type(param)
		local t = pt
		if (pt == "table") then  -- Could be a class or a class instance
			local mt = getmetatable(param)
			if (mt and rawget(mt, "simulatorInternal_ClassName")) then
				-- class
				t = mt.simulatorInternal_ClassName .. " (class)"
			else
				local classMT = getmetatable(mt)
				if (classMT and rawget(classMT, "simulatorInternal_ClassName")) then
					-- class instance
					t = classMT.simulatorInternal_ClassName .. " (instance)"
				end
			end
		end
		res[idx] = t
	end
	return res
end





--- Replacement for the global "loadfile" symbol in the sandbox
-- Needs to apply the sandbox to the loaded code
function Simulator:loadfile(a_FileName)
	-- Check params:
	assert(self)
	assert(type(self.sandbox) == "table")

	local res, msg = loadfile(a_FileName)
	if (res) then
		setfenv(res, self.sandbox)
	end
	return res, msg
end





--- Loads the specified plugin files and executes the globals:
function Simulator:loadFiles(a_FileList)
	-- Check params:
	assert(self)
	assert(a_FileList[1])  -- We need at least one file

	-- Load and execute each file:
	for _, fnam in ipairs(a_FileList) do
		local fn = assert(loadfile(fnam))
		setfenv(fn, self.sandbox)
		fn()
	end
end





--- Loads all scenarios from files specified in the options
function Simulator:loadScenarios(a_Options)
	-- Check params:
	assert(self)
	assert(type(a_Options) == "table")
	assert(type(a_Options.scenarioFileNames) == "table")

	-- Load the scenarios:
	for idx, fnam in ipairs(a_Options.scenarioFileNames) do
		self.scenarios[idx] = Scenario:new(fnam, self.logger)
	end
end





--- Replacement for the global "loadstring" symbol in the sandbox
-- Needs to apply the sandbox to the loaded code
function Simulator:loadstring(a_String)
	-- Check params:
	assert(self)
	assert(type(self.sandbox) == "table")

	local res, msg = loadstring(a_String)
	if not(res) then
		setfenv(res, self.sandbox)
	end
	return res, msg
end





--- Compares the type of a parameter to the type in the signature
-- Returns true if the param type is compatible with the signature
-- Compatibility is either being equal, or the ParamType being a number and SignatureType being an enum
function Simulator:paramTypesMatch(a_ParamType, a_SignatureType)
	-- Check params:
	assert(type(a_ParamType) == "string")
	assert(type(a_SignatureType) == "string")
	assert(self)

	-- If the signature type is "any", any param type matches:
	if (a_SignatureType == "any") then
		return true
	end

	-- If the types are equal, return "compatible":
	if (a_ParamType == a_SignatureType) then
		return true
	end

	-- If the signature says an enum and the param is a number, return "compatible":
	local signatureClass, signatureEnum = a_SignatureType:match("([a-zA-Z0-9]+)%#([a-zA-Z0-9]+)")
	if (signatureClass and signatureEnum) then
		-- For now we don't check whether it actually is an enum and whether the value is correct
		-- Just assume all is OK
		-- TODO: Proper checks
		return (a_ParamType == "number")
	end

	return false
end





--- Pretty-prints the function signature for display to the user
-- a_Signature is a single APIDesc signature of the function
function Simulator:prettyPrintSignature(a_Signature)
	-- Check params:
	assert(self)
	assert(type(a_Signature) == "table")
	assert(type(a_Signature.Params) == "table")
	assert(type(a_Signature.Returns) == "table")

	-- Output the params:
	local res = "("
	for idx, param in ipairs(a_Signature.Params) do
		if (idx > 1) then
			res = res .. ", "
		end
		res = res .. param.Type
	end
	res = res .. ") -> ("

	-- Output the returns:
	for idx, ret in ipairs(a_Signature.Returns) do
		if (idx > 1) then
			res = res .. ", "
		end
		res = res .. ret.Type
	end
	return res .. ")"
end





--- Processes a single callback request
-- Prepares the params and calls the function
-- Calls the appropriate simulator hooks
function Simulator:processCallbackRequest(a_Request)
	-- Check params:
	assert(self)
	assert(a_Request)
	assert(a_Request.Function)

	if (a_Request.Notes) then
		self.logger:debug("Calling request \"%s\".", a_Request.Notes)
	end

	self:callHooks(self.hooks.onBeginRound, a_Request)

	-- Prepare the params:
	local params = a_Request.ParamValues or self:createInstances(a_Request.ParamTypes or {})
	self:callHooks(self.hooks.onBeforeCallCallback, a_Request, params)

	-- Call the callback:
	local returns = { a_Request.Function(unpack(params)) }

	-- Process the returned values and finalize the params:
	self:callHooks(self.hooks.onAfterCallCallback, a_Request, params, returns)

	self:callHooks(self.hooks.onEndRound, a_Request)
	return returns
end





--- Called when the callback request queue is empty, to fill it with the next scenario, if available
function Simulator:queueNextScenario()
	-- Check params:
	assert(self)

	-- If there is a scenario left, execute it until it queues a callback request or has no work left:
	local scenario = self.scenarios[1]
	while(true) do
		if not(scenario) then
			-- No more scenarios to execute
			return
		end
		if (scenario:execute(self)) then
			-- The scenario has finished, remove it and go to the next one:
			table.remove(self.scenarios, 1)
			scenario = self.scenarios[1]
			if not(scenario) then
				-- No more scenarios to execute
				return
			end
		end
		if (self.callbackRequests.n > 0) then
			-- The scenario has produced a callback request, execute it:
			return
		end
		-- The scenario has advanced but doesn't have work for us to do, execute it again in the next loop
	end
end





--- Returns a path to use, while checking for redirection
function Simulator:redirectPath(a_Path)
	-- Check params:
	assert(self)
	assert(type(a_Path) == "string")

	a_Path = self:collapseRelativePath(a_Path)

	-- If there is a matching entry in the redirects, use it:
	local match = self.redirects[a_Path]
	if (match) then
		return match
	end

	-- If there is a full foldername match, use it:
	-- (eg. redirect for "folder1/folder2/", path is "folder1/folder2/folder3/file.txt" -> use the redirect for the front part
	local idx = 0
	while (true) do
		idx = a_Path:find("/", idx + 1)  -- find the next slash
		if not(idx) then
			return a_Path
		end
		local match = self.redirects[a_Path:sub(1, idx)]  -- check the path up to the current slash for redirects:
		if (match) then
			return match .. a_Path.sub(idx + 1)
		end
	end
end





--- Simulates the plugin, may hard-abort on error
-- a_Options is the Options object that can be queried for global options
-- a_Api is the complete API description
function Simulator:run(a_Options)
	-- Check params:
	assert(type(a_Options) == "table")  -- We have an Options object
	assert(a_Options.pluginFiles)       -- There is a list of files
	assert(a_Options.pluginFiles[1])    -- The list is not empty

	-- Store the options so that they can be retrieved later on:
	self.options = a_Options

	-- Add the hooks based on the options:
	self:addHooks(a_Options)

	-- Load the plugin files, execute the globals:
	self:loadFiles(a_Options.pluginFiles)
	assert(self.sandbox.Initialize, "The plugin doesn't have the Initialize() function.")

	-- Add the request to call the Initialize function:
	self:addCallbackRequest(
		self.sandbox.Initialize,
		{ {Type = "cPlugin" } },
		"Initialize()"
	)

	-- As long as there are callback requests in the queue, dequeue and process them, in a LIFO manner:
	self.logger:trace("Running the simulator")
	while (self.callbackRequests.n > 0) do
		local request = self.callbackRequests[self.callbackRequests.n]
		self.callbackRequests.n = self.callbackRequests.n - 1
		self:processCallbackRequest(request)
		if (self.callbackRequests.n == 0) then
			self:queueNextScenario()
			if (self.callbackRequests.n == 0) then
				self:callHooks(self.hooks.onEmptyRequestQueue)
			end
		end
	end
end





--- Splits the command string at spaces
-- Returns an array-table of strings of the original command, just like Cuberite command processor works
function Simulator:splitCommandString(a_Cmd)
	local res = {}
	for w in a_Cmd:gmatch("%S+") do
		table.insert(res, w)
	end
	return res
end





--- Returns the type of the object
-- Takes into account the emulated class types as well as the basic Lua types
function Simulator:typeOf(a_Object)
	-- Check params:
	assert(self)
	assert(getmetatable(self) == Simulator)

	local t = type(a_Object)
	if (t ~= "table") then
		-- Basic Lua type
		return t
	end

	-- Check whether the object is a Cuberite class or class instance:
	local mt = getmetatable(a_Object)
	if not(mt) then
		-- Basic Lua table
		return "table"
	end
	if (rawget(mt, "simulatorInternal_ClassName")) then
		-- Cuberite class
		return mt.simulatorInternal_ClassName
	end
	local mtmt = getmetatable(mt)
	if not(mtmt) then
		-- Basic Lua table (with a metatable)
		return "table"
	end
	if (rawget(mtmt, "simulatorInternal_ClassName")) then
		-- Cuberite class instance
		return mtmt.simulatorInternal_ClassName
	end
	-- Basic Lua table (with dual metatable)
	return "table"
end





--- Creates a new Simulator object with default callbacks
local function createSimulator(a_Options, a_Logger)
	-- Check params:
	assert(type(a_Options) == "table")
	assert(type(a_Logger) == "table")

	local res
	res =
	{
		-- Hooks that the simulator calls for various events
		-- Each member is a table of functions, the simulator calls each function consecutively
		hooks =
		{
			onBeginRound         = {},  -- When a new callback request is picked from the queue
			onBeforeCallCallback = {},  -- Just before the plugin's code is called
			onAfterCallCallback  = {},  -- Right after the plugin's code returns
			onEndRound           = {},  -- After finishing processing the callback request
			onAddedRequest       = {},  -- Aftera new callback request is added to the callback request queue
			onEmptyRequestQueue  = {},  -- When the callback request queue is empty. Hook may insert more requests.
			onApiFunctionCall    = {},  -- An API function is being called
		},

		-- The sandbox in which the plugin's code will be executed. Filled with defaults for now:
		sandbox =
		{
			-- Default Lua libraries:
			io = io,
			math = math,
			os = os,
			string = string,
			table = table,

			-- Default Lua globals:
			assert = assert,
			collectgarbage = collectgarbage,
			dofile = function (a_FileName) return res:dofile(a_FileName) end,
			error = error,
			getfenv = getfenv,
			getmetatable = getmetatable,
			ipairs = ipairs,
			load = load,
			loadfile = function(a_FileName) return res:loadfile(a_FileName) end,
			loadstring = function(a_String) return res:loadstring(a_String) end,
			next = next,
			pairs = pairs,
			pcall = pcall,
			print = print,
			rawequal = rawequal,
			rawget = rawget,
			rawset = rawset,
			select = select,
			setfenv = setfenv,
			setmetatable = setmetatable,
			tonumber = tonumber,
			tostring = tostring,
			type = type,
			unpack = unpack,
			xpcall = xpcall,
			_VERSION = _VERSION,

			-- Indication about the simulator:
			IsPluginCheckerSimulator = true,
			PluginCheckerSimulatorVersion = 1,
		},

		-- The hooks that the plugin has registered
		-- A dictionary of HookType -> { callback1, callback2, ... }
		registeredHooks = {},

		-- The command handlers registered by the plugin
		-- A dictionary of Command -> { permission, callback, helpString }
		registeredCommandHandlers = {},

		-- The LIFO of requests for calling back
		-- Array of { Function = <fn>, ParamTypes = { <ParamTypes> }, ParamValues = { <OptionalParamValues> }, Notes = <optional-string> }
		-- ParamTypes is an array of strings describing the param types
		-- Param values is an optional array of param values to use. If present, ParamTypes is ignored
		-- Notes is a description for logging purposes
		-- Has an additional count in "n" for easy access
		callbackRequests =
		{
			n = 0,
		},

		-- Values used for synthesizing semi-random API return values:
		testStringIndex = 1,
		testNumber = 1,

		-- Store the options so that they may be retrieved later on:
		options = a_Options,

		-- Store the logger for later use:
		logger = a_Logger,

		-- Array-table of scenarios that should be executed once the plugin is initialized
		scenarios = {},

		-- A dictionary of file / folder redirections. Maps the original path to the new path.
		redirects = {},

		-- State manipulated through scenarios:
		worlds = {},
		players = {},
	}
	setmetatable(res, Simulator)
	return res
end





return
{
	create = createSimulator,
}




