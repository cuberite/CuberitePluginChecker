-- ApiLoader.lua

-- Implements the API loader that reads the API description files and injects it into the simulator's sandbox





--- Loads and returns the API description table from the API file
local function loadApiDesc(a_Options)
	local fnam = a_Options.apiDescFileName or "ApiDesc.lua"
	local f, msg = loadfile(fnam)
	if not(f) then
		print("Error loading the API description file " .. fnam .. ".")
		print("Generate it from Cuberite by using its src/Bindings/GenerateBindings.lua script")
		print("You can use the \"-a <filename>\" parameter to specify the API description filename.")
		error("Missing API description")
	end
	return f()
end





--- Loads the API description files and adds the built-in API implementations
-- a_Options is the Options object that can be queried for global options
-- a_Simulator is the simulator object that will be used to simulate the plugin.
local function loadApi(a_Options, a_Simulator)
	local api = loadApiDesc(a_Options)

	local sandbox = a_Simulator.sandbox
	assert(type(sandbox) == "table")

	-- TODO: Inject the API into the sandbox

	return true
end





return
{
	load = loadApi,
}




