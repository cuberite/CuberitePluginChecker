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
			if not(mt.simulatorInternal_ClassName) then
				return false, "The \"self\" parameter is not a Cuberite class"
			end
			if (mt.simulatorInternal_ClassName ~= a_ClassName) then
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
			if not(classMT.simulatorInternal_ClassName) then
				return false, "The \"self\" parameter is not a Cuberite class instance"
			end
			if (classMT.simulatorInternal_ClassName ~= a_ClassName) then
				return false, string.format(
					"The \"self\" parameter is a different class instance. Expected %s, got %s.",
					a_ClassName, classMT.simulatorInternal_ClassName
				)
			end
		end
	end

	-- Check the type of each plugin parameter:
	for idx = paramOffset + 1, a_NumParams do
		local param = a_Params[idx]
		local signatureParam = a_FnSignature.Params[idx - paramOffset]
		if (type(param) == "table") then
			-- This is most likely a class, check the class type:
			local classType = (getmetatable(param) or {}).simulatorInternal_ClassName or "table"
			if (classType ~= signatureParam.Type) then
				return false, string.format("Param #%d doesn't match, expected %s, got %s",
					idx - paramOffset, signatureParam.Type, classType
				)
			end
		else
			-- This is a basic Lua type, check directly:
			if (type(param) ~= signatureParam.Type) then
				return false, string.format("Param #%d doesn't match, expected %s, got %s",
					idx - paramOffset, signatureParam.Type, type(param)
				)
			end
		end
	end

	-- All params have matched
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
	if (a_ClassApi.Functions[a_SymbolName]) then
		return self:createClassFunction(a_ClassApi.Functions[a_SymbolName], a_SymbolName, a_ClassName)
	elseif (a_ClassApi.Constants[a_SymbolName]) then
		return self:createClassConstant(a_ClassApi.Constants[a_SymbolName], a_SymbolName)
	elseif (a_ClassApi.Variables[a_SymbolName]) then
		return self:createClassVariable(a_ClassApi.Variables[a_SymbolName], a_SymbolName)
	end

	-- Endpoint not found:
	return nil
end





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

	print("Creating class " .. a_ClassName)
	-- Create a metatable that dynamically creates the API endpoints, and stores info about the class:
	local mt =
	{
		__index = function(a_Table, a_SymbolName)
			if ((a_SymbolName == "__tostring") or (a_SymbolName == "__serialize")) then
				-- Used by debuggers all the time, spamming the log. Bail out early.
				return nil
			end
			print("Creating an API endpoint " .. a_ClassName .. "." .. a_SymbolName)
			local endpoint = self:createApiEndpoint(a_ClassApi, a_SymbolName, a_ClassName)
			if not(endpoint) then
				error("Attempting to use a non-existent API: " .. a_ClassName .. "." .. a_SymbolName)
			end
			return endpoint
		end,
		simulatorInternal_ClassName = a_ClassName,
		simulatorInternal_ClassApi = a_ClassApi,
	}
	local res = {__index}
	res.__index = res
	return setmetatable(res, mt)
end





--- Creates a dummy API function implementation based on its API description:
function Simulator:createClassFunction(a_FnDesc, a_FnName, a_ClassName)
	-- Check params:
	assert(self)
	assert(type(a_FnDesc) == "table")
	assert(type(a_FnName) == "string")
	assert(type(a_ClassName) == "string")

	return function(...)
		print("Calling function " .. a_ClassName .. "." .. a_FnName)
		local params = { ... }
		self:callHooks(self.hooks.onApiFunctionCall, a_ClassName, a_FnName, params)
		local signature, msgs = self:findClassFunctionSignatureFromParams(a_FnDesc, params, a_ClassName)
		if not(signature) then
			error(
				string.format("Function %s.%s used with wrong parameters, there is no overload that can take these:\n\t%s\nMatcher messages:\n\t%s",
				a_ClassName, a_FnName,
				table.concat(self:listParamTypes(params), "\n\t"),
				table.concat(msgs, "\n\t"))
			)
		end
		if (signature.Implementation) then
			-- This function has a specific implementation, call it:
			return signature.Implementation(self, ...)
		else
			-- Provide a default implementation by default-constructing the return values:
			return unpack(self:createInstances(signature.Returns))
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
	elseif (t == "bool") then
		return true
	end

	-- If it is a class param, create a class instance:
	local classTable = self.sandbox[t]
	if not(classTable) then
		error("Requested an unknown param type for callback request")
	end
	print("Created a new instance of " .. t)
	local res = {}
	setmetatable(res, classTable)
	assert(classTable.__index == classTable)
	return res
end





--- Creates all object instances required for a callback request
-- Returns the instances as an array-table
function Simulator:createInstances(a_TypeDefList)
	-- Check params:
	assert(type(a_TypeDefList) == "table")

	-- Create the instances:
	local res = {}
	for idx, td in ipairs(a_TypeDefList) do
		res[idx] = self:createInstance(td)
	end
	return res
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
	local numSelfParams, className
	if (a_FnDesc.IsGlobal) then
		numSelfParams = 0
	else
		numSelfParams = 1
		className = a_ClassName
	end
	local msgs = {}
	for _, signature in ipairs(a_FnDesc) do
		local numSignatureParams = #(signature.Params) + numSelfParams
		if (numSignatureParams == numParamsGiven) then
			local doesMatch, msg = self:checkClassFunctionSignature(signature, a_Params, numParamsGiven, className)
			if (doesMatch) then
				return signature
			end
			table.insert(msgs, msg or "<no message>")
		else
			table.insert(msgs, string.format(
				"Parameter count doesn't match, expected %d, got %d (overload \"%s\")",
				numSignatureParams, numParamsGiven,
				self:prettyPrintSignature(signature)
			))
		end
	end

	-- None of the signatures matched the params, report an error:
	return nil, msgs
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
			print("WARNING: Attempting to use an unknown Global value " .. a_SymbolName .. ", nil will be returned")
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
				t = mt.simulatorInternal_ClassName
			else
				local classMT = getmetatable(mt)
				if (classMT and classMT.simulatorInternal_ClassName) then
					-- class instance
					t = classMT.simulatorInternal_ClassName
				end
			end
		end
		res[idx] = t
	end
	return res
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
	assert(a_Request.Params)

	if (a_Request.Notes) then
		print("Calling request: " .. a_Request.Notes)
	end

	self:callHooks(self.hooks.onBeginRound, a_Request)

	-- Prepare the params:
	local params = self:createInstances(a_Request.Params or {})
	self:callHooks(self.hooks.onBeforeCallCallback, a_Request, params)

	-- Call the callback:
	local returns = { a_Request.Function(unpack(params)) }

	-- Process the returned values and finalize the params:
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

	-- TODO: Add callback-requests for commands and web-tabs from a pre-configured test definition file (?)

	-- As long as there are callback requests in the queue, dequeue and process them, in a LIFO manner:
	print("Running the simulator")
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




