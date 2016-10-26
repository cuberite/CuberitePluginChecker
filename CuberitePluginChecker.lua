-- CuberitePluginChecker.lua

-- Implements the main entrypoint for the project





-- Load the libraries:
dofile("Utils.lua")
local Options   = dofile("Options.lua")
local ApiLoader = dofile("ApiLoader.lua")
local Simulator = dofile("Simulator.lua")
local Logger    = dofile("Logger.lua")





-- The main entrypoint:
local options = Options.parseCommandLine(...)
if not(options.pluginFiles[1]) then
	error("No plugin to check was specified.\nUse the -p <path> option to specify the plugin.")
end
local logger = Logger:new(options)
local simulator = Simulator.create(options, logger)
local api = ApiLoader.load(options, logger)
simulator:injectApi(api)
simulator:run(options)
logger:info("Simulator has finished running")




