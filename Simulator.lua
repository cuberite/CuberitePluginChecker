-- Simulator.lua

-- Implements the Cuberite simulator
--[[
Usage:
	local sim = require("Simulator").create()
	-- Possibly use sim as an upvalue in special API function implementations
	-- Extend the simulator's sandbox etc.
	sim:run(options, api)
--]]





--- The class (metatable) to be used for all simulators
local Simulator = {}
Simulator["__index"] = Simulator





--- Adds a new callback request to the queue to be processed
function Simulator:addCallbackRequest(a_FnToCall, a_Params, a_Notes)
	-- Check params:
	assert(self)
	assert(type(a_FnToCall) == "function")
	local params = a_Params or {}
	assert(type(params) == "table")

	-- Add the request to the queue:
	local n = self.callbackRequests.n + 1
	self.callbackRequests[n] = { Function = a_FnToCall, Params = params, Notes = a_Notes }
	self.callbackRequests.n = n

	-- Call the notification callback:
	self:callHooks(self.hooks.onAddedRequest)
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
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallClearObjects(a_Params, a_Returns)
	print("afterCallClearObjects:")
	print("\ta_Params = " .. tostring(a_Params))
	print("\ta_Returns = " .. tostring(a_Returns))
	-- TODO
end





--- Called by the simulator after calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallGCObjects(a_Params, a_Returns)
	print("afterCallGCObjects:")
	print("\ta_Params = " .. tostring(a_Params))
	print("\ta_Returns = " .. tostring(a_Returns))
	-- TODO
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallClearObjects(a_Params)
	print("beforeCallClearObjects:")
	print("\ta_Params = " .. tostring(a_Params))
	-- TODO
end





--- Called by the simulator before calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallGCObjects(a_Params)
	print("beforeCallGCObjects:")
	print("\ta_Params = " .. tostring(a_Params))
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





--- Loads the specified plugin files and executes the globals:
function Simulator:loadFiles(a_FileList)
	-- Check params:
	assert(a_FileList[1])  -- We need at least one file

	-- Load and execute each file:
	for _, fnam in ipairs(a_FileList) do
		local fn = assert(loadfile(fnam))
		setfenv(fn, self.sandbox)
		fn()
	end
end





--- Processes a single callback request
-- Prepares the params and calls the function
-- Calls the appropriate simulator hooks
function Simulator:processCallbackRequest(a_Request)
	-- Check params:
	assert(self)
	assert(a_Request)
	assert(a_Request.Function)
	assert(a_Request.Params)

	if (a_Request.Notes) then
		print("Calling request: " .. a_Request.Notes)
	end

	self:callHooks(self.hooks.onBeginRound, a_Request)

	-- Prepare the params:
	local params = {}
	-- TODO

	self:callHooks(self.hooks.onBeforeCallCallback, a_Request, params)

	-- Call the callback:
	local returns = {}
	-- TODO

	self:callHooks(self.hooks.onAfterCallCallback, a_Request, params, returns)

	self:callHooks(self.hooks.onEndRound, a_Request)
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
	while (self.callbackRequests.n > 0) do
		local request = self.callbackRequests[self.callbackRequests.n]
		self.callbackRequests.n = self.callbackRequests.n - 1
		self:processCallbackRequest(request)
		if (self.callbackRequests.n == 0) then
			self:callHooks(self.hooks.onEmptyRequestQueue)
		end
	end
end





--- Creates a new Simulator object with default callbacks
local function createSimulator()
	local res =
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
			dofile = dofile,
			error = error,
			getfenv = getfenv,
			getmetatable = getmetatable,
			ipairs = ipairs,
			load = load,
			loadfile = loadfile,
			loadstring = loadstring,
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

		-- The LIFO of requests for calling back
		-- Array of { Function = <fn>, Params = { <ParamTypes> }, Notes = <optional-string> }
		-- Has an additional count in "n" for easy access
		callbackRequests =
		{
			n = 0,
		},
	}
	setmetatable(res, Simulator)
	return res
end





return
{
	create = createSimulator,
}




