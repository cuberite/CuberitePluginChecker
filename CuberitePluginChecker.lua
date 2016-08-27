-- CuberitePluginChecker.lua

-- Implements the main entrypoint for the project





-- Load the libraries:
local Options = require("Options")
local ApiLoader = require("ApiLoader")
local Simulator = require("Simulator")





-- The main entrypoint:
local options = Options.parseCommandLine(...)
if not(options.pluginFiles[1]) then
	error("No plugin to check was specified.\nUse the -p <path> option to specify the plugin.")
end
local simulator = Simulator.create(options)
ApiLoader.load(options, simulator)
simulator:run(options)




