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





--- Adds the callbacks to the simulator, based on the options specified by the user
function Simulator:addCallbacks(a_Options)
	if (a_Options.shouldClearObjects) then
		table.insert(self.callbacks.onBeforeCallCallback, Simulator.beforeCallClearObjects)
		table.insert(self.callbacks.onAfterCallCallback,  Simulator.afterCallClearObjects)
	end
	if (a_Options.shouldGCObjects) then
		table.insert(self.callbacks.onBeforeCallCallback, Simulator.beforeCallGCObjects)
		table.insert(self.callbacks.onAfterCallCallback,  Simulator.afterCallGCObjects)
	end
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallClearObjects(a_Params, a_Returns)
	-- TODO
end





--- Called by the simulator after calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that were given to the callback
-- a_Returns is an array-table of the return values that the callback returned
function Simulator:afterCallGCObjects(a_Params, a_Returns)
	-- TODO
end





--- Called by the simulator after calling the callback, when the ClearObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallClearObjects(a_Params)
	-- TODO
end





--- Called by the simulator before calling the callback, when the GCObjects is specified in the options
-- a_Params is an array-table of the params that are to be given to the callback
function Simulator:beforeCallGCObjects(a_Params)
	-- TODO
end





--- Loads the specified plugin files and executes the globals:
function Simulator:loadFiles(a_FileList)
	-- Check params:
	assert(a_FileList[1])  -- We need at least one file
	
	-- Load the files using a "dofile" chain loader:
	local tmpCode = "dofile(\"" .. table.concat(a_FileList, "\")\ndofile(\"") .. "\")\n"
	local fn = assert(loadstring(tmpCode, "loader"))
	setfenv(fn, self.sandbox)
	return fn()
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
	
	-- Add the callbacks based on the options:
	self:addCallbacks(a_Options)
	
	-- Load the plugin files, execute the globals:
	local code = self:loadFiles(a_Options.pluginFiles)
	
	-- Add the request to call the Initialize function:
	self:addCallbackRequest(code.Initialize,
		{ {Type = "cPlugin" } }
	)
end





--- Creates a new Simulator object with default callbacks
local function createSimulator()
	local res =
	{
		-- Callbacks that the simulator calls for various events
		-- Each member is a table of functions, the simulator calls each function consecutively
		callbacks =
		{
			onBeginRound         = {},  -- When a new callback request is picked from the queue
			onBeforeCallCallback = {},  -- Just before the plugin's code is called
			onAfterCallCallback  = {},  -- Right after the plugin's code returns
			onEndRound           = {},  -- After finishing processing the callback request
			onAddRequest         = {},  -- When a new callback request is added to the queue by the plugin
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
			dofile = dofile,
			getfenv = getfenv,
			load = load,
			loadfile = loadfile,
			loadstring = loadstring,
			setfenv = setfenv,
		}
	}
	setmetatable(res, Simulator)
	return res
end





return
{
	create = createSimulator,
}




