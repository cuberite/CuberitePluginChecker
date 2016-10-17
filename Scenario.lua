-- Scenario.lua

-- Implements the Scenario - a way to describe a detailed test case

--[[
A scenario is loaded from a file with special syntax - basically a long chained function call of predefined
global functions that form a scenario specification. A single scenario consists of an array-table of actions,
these actions are then called one after another by the simulator. Each action is either a function or a table
that has an "execute" member that provides the function that is to be called. It receives a single argument,
the Simulator instance.

Actions:
	- loadPluginFiles   -- Loads all the plugin files and executes the globals
	- initializePlugin  -- Calls the Initialize function. If not loaded, loads the plugin files first.
	- world             -- Creates a new world
	- playerConnect     -- Simulates a new player connecting to the server
	- playerCommand     -- Simulates a player executing a command
	- fuzzAllCommands   -- Simulates a player executing each command with a wide range of parameters (fuzzing)
	- fsCreateFile      -- Creates a file, possibly with content
	- fsCopyFile        -- Copies a file
	- fsRenameFile      -- Renames a file
	- fsDeleteFile      -- Deletes a file
	- fsCreateFolder    -- Creates a new folder (recursive)
	- fsRenameFolder    -- Renames an existing folder
	- fsDeleteFolder    -- Deletes a folder (optionally recursive

Example scenario file:
scenario
{
	world
	{
		name = "world",
	},
	playerConnect
	{
		name = "player",
		worldName = "world",
	},
}
--]]





--- Class used for representing a scenario:
local Scenario = {}
Scenario.__index = Scenario





--- Sandbox handler of the "redirect" keyword.
-- Returns an action that sets up file / folder redirects in the simulator
local function sandboxRedirect(a_Table)
	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator:addRedirects(a_Table)
	end
end




--- Sandbox handler of the "world" keyword.
-- Returns an action that creates a new game world
local function sandboxWorld(a_Table)
	-- Check the attributes:
	local name = a_Table.name
	if not(name) then
		error("Error in scenario file, world doesn't have the required \"name\" attribute", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: processing action \"world\" for world %s.", name)
		a_Simulator:createNewWorld(a_Table)
	end
end





--- Sandbox handler of the "connectPlayer" keyword.
-- Simulates a player connection
local function sandboxConnectPlayer(a_Table)
	-- Check the attributes:
	local name = a_Table.name
	if not(name) then
		error("Error in scenario file, connectPlayer doesn't have the required \"name\" attribute", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: processing action \"connectPlayer\" for player %s.", name)
		a_Simulator:connectPlayer(a_Table)
	end
end





--- Sandbox handler of the "playerCommand" keyword.
-- Simulates a player executing a command
local function sandboxPlayerCommand(a_Table)
	-- Check the attributes:
	local playerName = a_Table.playerName
	local command = a_Table.command
	if not(playerName) then
		error("Error in scenario file, playerCommand doesn't have the required \"playerName\" attribute", 2)
	end
	if not(command) then
		error("Error in scenario file, playerCommand doesn't have the required \"command\" attribute", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace(
			"Scenario: processing action \"playerCommand\" for player %s, command \"%s\".",
			playerName, command
		)
		if not(a_Simulator.players[playerName]) then
			a_Simulator.logger:error(
				"Scenario error: attempting to execute a command on behalf of player \"%s\" who is not connected. Use the \"connectPlayer\" action to connect the player before executing commands.",
				playerName
			)
		end
		a_Simulator:executePlayerCommand(playerName, command)
	end
end





--- Fuzzes a single command
-- a_Simulator is the simulator instance on which to fuzz the commands
-- a_Command is the registered command (string) being fuzzed
-- a_PlayerName is the name of the player who is to be impersonated for the command
-- a_Choices is the array-table of choices for the command parameters
-- a_MinLen is the minimum length of the fuzzed command parameter array
-- a_MaxLen is the maximum length of the fuzzed command parameter array
local function fuzzCommand(a_Simulator, a_Command, a_PlayerName, a_Choices, a_MinLen, a_MaxLen)
	-- Recursively fuzzes a single command
	-- a_CurrentIndex is the index into the a_Split array specifying the index that this recursion level should modify
	-- a_Split is the command params split array
	-- The recursion is called "backwards", the last param is chosen first and then the previous param is recursed
	-- When a_CurrentIndex is zero, the actual command handlers are invoked
	local function fuzzSingleCommand(a_Simulator, a_Command, a_PlayerName, a_Choices, a_NumChoices, a_CurrentIndex, a_Split)
		if (a_CurrentIndex == 0) then
			-- We've built the whole command, serialize the params into a string and execute it:
			a_Simulator.logger:info("Scenario: fuzzing command \"%s\".", a_Command .. " " .. table.concat(a_Split, " "))
			a_Simulator:executePlayerCommand(a_PlayerName, a_Command .. " " .. table.concat(a_Split, " "))
			-- Process all queued callbacks:
			a_Simulator:processAllQueuedCallbackRequests()
			return
		end

		-- Try all choices on position <a_CurrentIndex> and recurse:
		for ch = 1, a_NumChoices do
			a_Split[a_CurrentIndex] = a_Choices[ch]
			fuzzSingleCommand(a_Simulator, a_Command, a_PlayerName, a_Choices, a_NumChoices, a_CurrentIndex - 1, a_Split)
		end
	end

	-- Start the fuzzing:
	for len = a_MinLen, a_MaxLen do
		fuzzSingleCommand(a_Simulator, a_Command, a_PlayerName, a_Choices, #a_Choices, len, {})
	end  -- for len - number of chosen params
end





--- Sandbox handler of the "fuzzAllCommands" keyword.
-- Simulates a player executing each registered command with all kinds of parameters
local function sandboxFuzzAllCommands(a_Table)
	-- Check the attributes:
	local choices = a_Table.choices
	if (not(choices) or (type(choices) ~= "table") or not(choices[1])) then
		error("Error in scenario file, fuzzAllCommands doesn't have the required \"choices\" array-table attribute", 2)
	end
	local maxLen = tonumber(a_Table.maxLen)
	if not(maxLen) then
		error("Error in scenario file, fuzzAllCommands doesn't have the required \"maxLen\" number attribute", 2)
	end
	if (not(a_Table.playerName) or (type(a_Table.playerName) ~= "string")) then
		error("Error in scenario file, fuzzAllCommands doesn't have the required \"playerName\" string attribute", 2)
	end
	a_Table.maxLen = maxLen
	a_Table.minLen = a_Table.minLen or 0

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: processing action \"fuzzAllCommands\".")
		if not(a_Simulator.players[a_Table.playerName]) then
			a_Simulator.logger:error(
				"Scenario error: attempting to fuzz all commands impersonating player \"%s\" who is not connected. Use the \"connectPlayer\" action to connect the player before fuzzing commands.",
				a_Table.playerName
			)
		end
		for cmd, cmdReg in pairs(a_Simulator.registeredCommandHandlers) do
			fuzzCommand(a_Simulator, cmd, a_Table.playerName, a_Table.choices, a_Table.minLen, a_Table.maxLen)
		end
	end
end





--- Sandbox handler of the "initializePlugin" keyword.
-- Initializes the plugin (and loads it before that if not loaded yet)
local function sandboxInitializePlugin(a_Table)
	return
	{
		isInitializePlugin = true,
		execute = function(a_Simulator)
			if not(a_Simulator.isPluginLoaded) then
				a_Simulator:loadPluginFiles()
				a_Simulator.isPluginLoaded = true
			end
			a_Simulator:initializePlugin()
		end,
	}
end





--- Sandbox handler of the "loadPluginFiles" keyword.
-- Loads the plugin files into the simulator
local function sandboxLoadPluginFiles(a_Table)
	return
	{
		isLoadPluginFiles = true,
		execute = function(a_Simulator)
			a_Simulator:loadPluginFiles()
			a_Simulator.isPluginLoaded = true
		end,
	}
end





--- Sandbox handler of the "fsCreateFile" keyword.
-- Creates a file and, if specified, fills it with content
local function sandboxFsCreateFile(a_Table)
	-- Check params:
	if (type(a_Table.fileName) ~= "string") then
		error("Error in scenario file, fsCreateFile is missing the required \"fileName\" attribute.", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: Creating file %s", a_Table.fileName)
		local f = assert(io.open(a_Table.fileName, "wb"))
		if (a_Table.contents) then
			f:write(a_Table.contents)
		end
		f:close()
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsCopyFile(a_Table)
	-- Check params:
	if (type(a_Table.srcFileName) ~= "string") then
		error("Error in scenario file, fsCopyFile is missing the required \"srcFileName\" attribute.", 2)
	end
	if (type(a_Table.dstFileName) ~= "string") then
		error("Error in scenario file, fsCopyFile is missing the required \"dstFileName\" attribute.", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: Copying file %s to %s", a_Table.srcFileName, a_Table.dstFileName)
		assert(utils.copyFile(a_Table.srcFileName, a_Table.dstFileName))
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsRenameFile(a_Table)
	-- Check params:
	if (type(a_Table.oldFileName) ~= "string") then
		error("Error in scenario file, fsRenameFile is missing the required \"oldFileName\" attribute.", 2)
	end
	if (type(a_Table.newFileName) ~= "string") then
		error("Error in scenario file, fsRenameFile is missing the required \"newFileName\" attribute.", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: Renaming file %s to %s", a_Table.oldFileName, a_Table.newFileName)
		assert(os.rename(a_Table.oldFileName, a_Table.newFileName))
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsDeleteFile(a_Table)
	-- Check params:
	if (type(a_Table.fileName) ~= "string") then
		error("Error in scenario file, fsDeleteFile is missing the required \"fileName\" attribute.", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger.trace("Scenario: Deleting file %s", a_Table.fileName)
		assert(os.remove(a_Table.fileName))
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsCreateFolder(a_Table)
	-- Check params:
	if (type(a_Table.path) ~= "string") then
		error("Error in scenario file, fsCreateFolder is missing the required \"path\" attribute.", 2)
	end

	-- Return the implementation:
	return function(a_Simulator)
		a_Simulator.logger.trace("Scenario: Creating folder %s", a_Table.path)
		assert(utils.createFolderRecursive(a_Table.path), string.format("Cannot create folder %s", a_Table.path))
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsRenameFolder(a_Table)
	-- Check params:
	if (type(a_Table.oldPath) ~= "string") then
		error("Error in scenario file, fsRenameFolder is missing the required \"oldPath\" attribute.", 2)
	end
	if (type(a_Table.newPath) ~= "string") then
		error("Error in scenario file, fsRenameFolder is missing the required \"newPath\" attribute.", 2)
	end

	-- Return the implementation:
	return function(a_Simulator)
		a_Simulator.logger:trace("Scenario: Renaming folder %s to %s", a_Table.oldPath, a_Table.newPath)
		assert(os.rename(a_Table.oldPath, a_Table.newPath))
	end
end





--- Sandbox handler of the "fs" keyword.
local function sandboxFsDeleteFolder(a_Table)
	-- Check params:
	if (type(a_Table.path) ~= "string") then
		error("Error in scenario file, fsDeleteFolder is missing the required \"path\" attribute.", 2)
	end

	-- Return the action implementation:
	return function(a_Simulator)
		a_Simulator.logger.trace("Scenario: Deleting folder %s", a_Table.path)
		assert(utils.deleteFolderContents(a_Table.path))
		assert(os.remove(a_Table.path))
	end
end






-------------------------------------------------------------------------------------------------------
--- The sandbox used for scenario files
-- Provides only the scenario functions
local scenarioSandbox =
{
	scenario          = nil,  -- Will be explicitly modified for each file being loaded
	redirect          = sandboxRedirect,
	world             = sandboxWorld,
	connectPlayer     = sandboxConnectPlayer,
	playerCommand     = sandboxPlayerCommand,
	fuzzAllCommands   = sandboxFuzzAllCommands,
	initializePlugin  = sandboxInitializePlugin,
	loadPluginFiles   = sandboxLoadPluginFiles,
	fsCreateFile      = sandboxFsCreateFile,
	fsCopyFile        = sandboxFsCopyFile,
	fsRenameFile      = sandboxFsRenameFile,
	fsDeleteFile      = sandboxFsDeleteFile,
	fsCreateFolder    = sandboxFsCreateFolder,
	fsRenameFolder    = sandboxFsRenameFolder,
	fsDeleteFolder    = sandboxFsDeleteFolder,
}





--- Loads a scenario from file
-- Returns the loaded scenario
-- Raises an error if the scenario cannot be loaded
function Scenario:new(a_FileName, a_Logger)
	-- Check params:
	assert(type(a_FileName) == "string")
	assert(type(a_Logger) == "table")

	-- Create a new scenario instance:
	local res =
	{
		fileName = a_FileName,
		logger = a_Logger,
	}
	setmetatable(res, Scenario)

	-- Modify the sandbox to fit this specific scenario file:
	scenarioSandbox.scenario = function (a_Table)
		if (res.scenario) then
			error("Multiple \"scenario\" top level keywords. Only one is supported.", 2)
		end
		local hasInitialization = false
		local hasLoading = false
		for idx, action in ipairs(a_Table) do
			local t = type(action)
			if (t == "table") then
				if (action.isInitializePlugin) then
					if (hasInitialization) then
						error(string.format("Error in scenario file %s: element #%d is plugin initialization, but the plugin is already initialized before.", a_FileName, idx))
					end
					hasInitialization = true
					hasLoading = true
				elseif (action.isLoadPluginFiles) then
					if (hasLoading) then
						error(string.format("Error in scenario file %s: element #%d is plugin load, but the plugin has already been loaded before.", a_FileName, idx))
					end
					hasLoading = true
				end
			elseif (t ~= "function") then
				error(string.format("Error in scenario file %s: element #%d is not an action", a_FileName, idx))
			end
		end
		if not(hasInitialization) then
			a_Logger:warning("Scenario file %s is missing the \"initializePlugin\" action, the plugin will not be fully loaded.", a_FileName)
		end
		if not(hasLoading) then
			error(string.format(
				"Scenario file %s doesn't specify the action to load the plugin files. Use either the \"initializePlugin\" action, or the explicit \"loadPluginFiles\" action.",
				a_FileName
			))
		end
		res.actions = a_Table
	end

	-- Load the scenario:
	local scenarioFn, msg = loadfile(a_FileName)
	if not(scenarioFn) then
		error(string.format("Cannot load scenario from file %s: %s", a_FileName, msg or "<unknown error>"))
	end
	setfenv(scenarioFn, scenarioSandbox)
	scenarioFn()

	-- Check that a proper scenario was created:
	if not(res.actions) then
		error(string.format("Scenario file %s is invalid, it doesn't have a \"scenario\" top-level element", a_FileName))
	end

	-- Remove the sandbox customization (just in case):
	scenarioSandbox.result = nil

	return res
end





--- Executes the next part of the scenario on the specified simulator
-- Returns true if the scenario has finished and shouldn't be executed anymore
function Scenario:execute(a_Simulator)
	-- Check params:
	assert(self)
	assert(type(a_Simulator) == "table")

	-- Execute each action in the scenario:
	for idx, action in ipairs(self.actions) do
		local t = type(action)
		if (t == "function") then
			action(a_Simulator)
		elseif (t == "table") then
			action.execute(a_Simulator)
		else
			assert(false, "Unknown scenario action runtime")
		end

		-- After executing the action, execute any callbacks queued in the simulator:
		a_Simulator:processAllQueuedCallbackRequests()
	end
end





return Scenario
