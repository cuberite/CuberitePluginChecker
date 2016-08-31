-- ApiLoader.lua

-- Implements the API loader that reads the API description files and injects it into the simulator's sandbox

--[[
API table format, being returned from the loader:
{
	Classes =
	{
		cClass =
		{
			Functions =
			{
				Fn1 =
				{
					{
						Params =
						{
							{ Type = "string" },
							{ Type = "number" },
							{ Type = "cPlugin" },
						},
						Returns =
						{
							{ Type = "bool" }
						},
						Implementation = function (...) ... end,  -- Special implementation, executed within the simulator; first param is the Simulator object
					},
					{
						Params = ...,
						Returns = ...,
						IsStatic = true,
					},
				},  -- Fn1
			},  -- Functions
			Variables =
			{
				Var1 = { Type = "bool" },
			},
			Constants =
			{
				Const1 = { Type = "string" },
			},
		},  -- cClass
	},  -- Classes
	Globals =
	{
		Functions = ...  -- Same as in any cClass
	},
}
--]]





--- Translation from C types to Lua types
-- Dictionary of "CType" -> "LuaType"
local g_CTypeToLuaType =
{
	AString = "string",
	bool = "boolean",
	Byte = "number",
	char = "number",
	double = "number",
	float = "number",
	ForEachChunkProvider = "cWorld",
	int = "number",
	size_t = "number",
	unsigned = "number",
	["const AString"] = "string",
	["const char*"] = "string",
	["std::string"] = "string",
	["Vector3<int>"]    = "Vector3i",
	["Vector3<float>"]  = "Vector3f",
	["Vector3<double>"] = "Vector3d",
}





--- Converts C++ types (AString, int) in a function signature to their Lua counterparts:
-- Modifies a_FnSignature directly
local function convertParamTypes(a_FnSignature)
	-- Convert params:
	a_FnSignature.Params = a_FnSignature.Params or {}
	for _, param in ipairs(a_FnSignature.Params) do
		param.Type = g_CTypeToLuaType[param.Type] or param.Type
	end

	-- Convert returns:
	a_FnSignature.Returns = a_FnSignature.Returns or {}
	for _, ret in ipairs(a_FnSignature.Returns) do
		ret.Type = g_CTypeToLuaType[ret.type] or ret.Type
	end
end





--- Normalizes the class description for a single class (or globals)
-- Makes sure Functions, Constants and Variables are present
-- Makes sure each function has a multi-signature description format (FnName = { {desc1}, {desc2}, ... })
local function normalizeClass(a_Class)
	assert(a_Class)

	local fns = {}
	for fnName, desc in pairs(a_Class.Functions or {}) do
		if not(desc[1]) then
			convertParamTypes(desc)
			fns[fnName] = {desc}  -- Convert single-signature functions to same format as multi-signature ones
		else
			for _, signature in ipairs(desc) do
				convertParamTypes(signature)
			end
			fns[fnName] = desc
		end
	end
	a_Class.Functions = fns
	a_Class.Constants = a_Class.Constants or {}
	a_Class.Variables = a_Class.Variables or {}
end





--- Loads the API description files
-- a_Options is the Options object that can be queried for global options
-- Returns the API description
local function loadApi(a_Options)
	-- Check params
	assert(type(a_Options) == "table")

	-- TODO: Add the possibility to load multiple APIDesc files (eg. one for automatic bindings, one for manual) (?)
	-- TODO: Make the loader use the format output already in Cuberite's src/Bindings/BindingsProcessor.lua into the docs folder
	-- TODO: Add the possibility of providing Implementation for functions declared elsewhere in the APIDesc

	-- Load from file:
	local fnam = a_Options.apiDescFileName or "ApiDesc.lua"
	local f, msg = loadfile(fnam)
	if not(f) then
		print("Error loading the API description file " .. fnam .. ".")
		print("Generate it from Cuberite by using its src/Bindings/GenerateBindings.lua script")
		print("You can use the \"-a <filename>\" parameter to specify the API description filename.")
		error("Missing API description")
	end
	local api = assert(f(), "Failed to load API description")
	assert(type(api) == "table", "API description is invalid, not a table")
	assert(type(api.Classes) == "table", "API description is invalid, has no Classes table")
	assert(type(api.Globals) == "table", "API description is invalid, has no Globals table")

	-- Make sure each class has a properly formatted Functions, Constants and Variables members:
	for k, v in pairs(api.Classes) do
		normalizeClass(v)
	end
	normalizeClass(api.Globals)

	-- Mark all global functions as global:
	for _, fn in pairs(api.Globals.Functions) do
		fn.IsGlobal = true
		--[[
		for _, signature in ipairs(fn) do
			signature.IsGlobal = true
		end
		--]]
	end

	return api
end





return
{
	load = loadApi,
}




