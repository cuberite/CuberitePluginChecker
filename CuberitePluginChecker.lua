-- CuberitePluginChecker.lua

-- Implements the main entrypoint for the project





-- Load the libraries:
local Options = dofile("Options.lua")
local ApiLoader = dofile("ApiLoader.lua")
local Simulator = dofile("Simulator.lua")





-- The main entrypoint:
local options = Options.parseCommandLine(...)
if not(options.pluginFiles[1]) then
	error("No plugin to check was specified.\nUse the -p <path> option to specify the plugin.")
end
local simulator = Simulator.create(options)
local api = ApiLoader.load(options)
simulator:injectApi(api)
simulator:run(options)
print("Simulator has finished running")




