-- Options.lua

-- Implements the global options parsed from the command line
-- The module has one global object, into which the options are stored

--[[
The commandline options understood by the framework:
	-a <path>      -- Path to the AutoAPI description files (by Cuberite's BindingsProcessor)
	-c             -- Check by clearing each API object after each callback
	-e <filename>  -- Load file as extra API description (ManualAPI.lua by ManualApiDump plugin)
	-f             -- Fuzz command handlers (send various garbate to them to test their user-input resilience)
	-g             -- Check by running garbage-collector after each callback
	-i <filename>  -- Load special API implementation from the file (files in APIImpl folder)
	-l <loglevel>  -- Use the specified loglevel (1 = trace, 2 = debug, 3 = info, 4 = warning, 5 = error)
	-p <path>      -- Plugin path
	-s <filename>  -- Load a scenario from the specified file

The options object contains the following fields:
	apiImplementationFiles - array-table of filenames to load the API implementation from
	autoApiDescPath        - path to the automatic API description files (by Cuberite's BindingsProcessor)
	extraApiFiles          - array-table of filenames to load as extra API descriptions (for manual API)
	logLevel               - number specifying the loglevel to use, or nil
	pluginFiles            - array-table of filenames for all plugin files to check. Each item already includes pluginPath
	pluginPath             - path to the plugin's files
	scenarioFileNames      - array-table of filenames to load as scenario files
	shouldClearObjects     - bool specifying whether API objects should be cleared after each callback (thus detecting potential use-after-callback)
	shouldFuzzCommands     - bool specifying whether commands should be fuzzed
	shouldGCObjects        - bool specifying whether API objects should be GC-ed after each callback (thus detecting storage-after-callback)
--]]





local lfs = require("lfs")





--- Dictionary that assigns a processor function for each known command-line param
-- The processor receives an array of all command-line params, the index for the current option and the global Options table
-- The value returned by the processor is used as the next index; if nil, the next idx is used
local optionProcessor =
{
	-- "-a <path>" specifies the path to the automatic API description files (by Cuberite's BindingsProcessor)
	["-a"] = function (a_Args, a_Idx, a_Options)
		a_Options.autoApiDescPath = a_Args[a_Idx + 1]
		if (type(a_Options.autoApiDescPath) ~= "string") then
			error("Invalid API description path parameter (-a)")
		end
		return a_Idx + 2
	end,

	-- "-c" specifies to clear API objects after each callback
	["-c"] = function (a_Args, a_Idx, a_Options)
		a_Options.shouldClearObjects = true
	end,

	-- "-e <filename>" specifies an extra file to load as API description (may be used multiple times)
	["-e"] = function (a_Args, a_Idx, a_Options)
		local fnam = a_Args[a_Idx + 1]
		if (type(fnam) ~= "string") then
			error("Invalid extra API filename parameter (-e)")
		end
		table.insert(a_Options.extraApiFiles, fnam)
		return a_Idx + 2
	end,

	-- "-f" specifies to do command fuzzing
	["-f"] = function (a_Args, a_Idx, a_Options)
		a_Options.shouldFuzzCommands = true
	end,

	-- "-g" specified to GC API objects after each callback
	["-g"] = function (a_Args, a_Idx, a_Options)
		a_Options.shouldGCObjects = true
	end,

	-- "-i <filename>" specifies an API implementation file to load
	["-i"] = function (a_Args, a_Idx, a_Options)
		local fnam = a_Args[a_Idx + 1]
		if (type(fnam) ~= "string") then
			error("Invalid extra API filename parameter (-i)")
		end
		table.insert(a_Options.apiImplementationFiles, fnam)
		return a_Idx + 2
	end,

	["-l"] = function (a_Args, a_Idx, a_Options)
		local level = tonumber(a_Args[a_Idx + 1])
		if not(level) then
			error(string.format("Invalid loglevel: \"%s\".", tostring(a_Args[a_Idx + 1])))
		end
		a_Options.logLevel = level
		return a_Idx + 2
	end,

	-- "-p <path>" specifies the path to the plugin to simulate
	["-p"] = function (a_Args, a_Idx, a_Options)
		-- Get a list of files from the folder:
		local pluginPath = a_Args[a_Idx + 1]
		local files = {}
		local hasInfoLua = false
		for fnam in lfs.dir(pluginPath) do
			if (string.match(fnam, ".*%.lua")) then
				if (fnam ~= "Info.lua") then
					table.insert(files, pluginPath .. "/" .. fnam)
				else
					hasInfoLua = true
				end
			end
		end
		if not(files[1]) then
			error("Invalid plugin path \"" .. pluginPath .. "\", no files found.")
		end

		-- Sort the files the same way as Cuberite:
		table.sort(files)
		if (hasInfoLua) then
			table.insert(files, pluginPath .. "/Info.lua")
		end

		-- Insert the current list of files into a_Options' filelist:
		for _, f in ipairs(files) do
			table.insert(a_Options.pluginFiles, f)
		end
		a_Options.pluginPath = pluginPath
		return a_Idx + 2
	end,


	-- -s <filename> -- Load a scenario from the specified file
	["-s"] = function (a_Args, a_Idx, a_Options)
		local fileName = a_Args[a_Idx + 1]
		if not(fileName) then
			error(string.format("Invalid option \"-s\" (%d), expected a scenario filename following it.", a_Idx))
		end
		table.insert(a_Options.scenarioFileNames, fileName)
		return a_Idx + 2
	end,
}





local options =
{
	apiImplementationFiles = {},
	extraApiFiles = {},
	pluginFiles = {},
	scenarioFileNames = {},
}





options.parseCommandLine = function(...)
	local args = { ... }
	local idx = 1
	while (args[idx]) do
		local option = args[idx]
		if not(optionProcessor[option]) then
			error("Unknown option: \"" .. option .. "\".")
		end
		idx = optionProcessor[option](args, idx, options) or (idx + 1)
	end
	return options
end





return options




