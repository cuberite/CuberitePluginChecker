-- Options.lua

-- Implements the global options parsed from the command line
-- The module has one global object, into which the options are stored

--[[
The options object contains the following fields:
	apiDescFileName - filename of the API description file, or nil to use the default ("ApiDesc.lua")
	pluginFiles - array-table of all plugin files to check
	shouldClearObjects - bool specifying whether API objects should be cleared after each callback (thus detecting potential use-after-callback)
	shouldGCObjects - bool specifying whether API objects should be GC-ed after each callback (thus detecting storage-after-callback)
--]]





local lfs = require("lfs")





--- Dictionary that assigns a processor function for each known command-line param
-- The processor receives an array of all command-line params, the index for the current option and the global Options table
-- The value returned by the processor is used as the next index; if nil, the next idx is used
local optionProcessor =
{
	-- "-a <filename>" specifies the API description filename
	["-a"] = function (a_Args, a_Idx, a_Options)
		a_Options.apiDescFileName = a_Args[a_Idx + 1]
		if (type(a_Options.apiDescFileName) ~= "string") then
			error("Invalid API description filename parameter")
		end
		return a_Idx + 2
	end,
	
	-- "-c" specifies to clear API objects after each callback
	["-c"] = function (a_Args, a_Idx, a_Options)
		a_Options.shouldClearObjects = true
	end,
	
	-- "-g" specified to GC API objects after each callback
	["-g"] = function (a_Args, a_Idx, a_Options)
		a_Options.shouldGCObjects = true
	end,

	-- "-p <path>" specifies the path to the plugin to simulate
	["-p"] = function (a_Args, a_Idx, a_Options)
		-- Get a list of files from the folder:
		local pluginPath = a_Args[a_Idx + 1]
		local files = {}
		for fnam in lfs.dir(pluginPath) do
			if ((fnam ~= "Info.lua") and string.match(fnam, ".*%.lua")) then
				table.insert(files, pluginPath .. "/" .. fnam)
			end
		end
		if not(files[1]) then
			error("Invalid plugin path \"" .. pluginPath .. "\", no files found.")
		end
		
		-- Sort the files the same way as Cuberite:
		table.sort(files)

		-- Insert the current list of files into a_Options' filelist:
		for _, f in ipairs(files) do
			table.insert(a_Options.pluginFiles, f)
		end
		return a_Idx + 2
	end,
	
}





local options =
{
	pluginFiles = {},
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




