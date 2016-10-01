-- Scenario.lua

-- Implements the Scenario - a way to describe a detailed test case

--[[
A scenario is loaded from a file with special syntax - basically a long chained function call of predefined
global functions that form a scenario specification. A single scenario consists of an array-table of actions,
these actions are then called one after another by the simulator. Each action is a table that has an
"executeAction" member that provides the function that is to be called, it receives a single argument, the
Simulator instance.

Example scenario file:
scenario
{
	world
	{
		name = "world",
	},
	player.connect
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





--- The sandbox used for scenario files
-- Provides only the scenario functions
local scenarioSandbox =
{
	scenario = nil,  -- Will be explicitly modified for each file being loaded
	redirect = sandboxRedirect,
	world = sandboxWorld,
	connectPlayer = sandboxConnectPlayer,
	playerCommand = sandboxPlayerCommand,
	fuzzAllCommands = sandboxFuzzAllCommands,
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
		currentSubscenario = 1,
		fileName = a_FileName,
		logger = a_Logger,
	}
	setmetatable(res, Scenario)

	-- Modify the sandbox to fit this specific scenario file:
	scenarioSandbox.scenario = function (a_Table)
		a_Table.currentAction = 1
		for idx, action in ipairs(a_Table) do
			if not(type(action) == "function") then
				error(string.format("Error in scenario file %s: element %d is not an action", a_FileName, idx))
			end
		end
		table.insert(res, a_Table)
	end

	-- Load the scenario:
	local scenarioFn, msg = loadfile(a_FileName)
	if not(scenarioFn) then
		error(string.format("Cannot load scenario from file %s: %s", a_FileName, msg or "<unknown error>"))
	end
	setfenv(scenarioFn, scenarioSandbox)
	scenarioFn()

	-- Check that a proper scenario was created:
	if not(res[1]) then
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

	-- If we've executed all the subscenarios, bail out:
	if (self.currentSubscenario > #self) then
		return true
	end
	local subscenario = self[self.currentSubscenario]

	-- If we've executed all actions in the subscenario, move to the next subscenario:
	if (subscenario.currentAction > #subscenario) then
		self.currentSubscenario = self.currentSubscenario + 1
		a_Simulator:clearState()
		return false
	end
	local action = subscenario[subscenario.currentAction]

	-- Execute the next action in the subscenario:
	self.logger:trace("Executing action #%d in subscenario #%d (%s) of scenario file %s",
		subscenario.currentAction,
		self.currentSubscenario, subscenario.name or "<no name>",
		self.fileName
	)
	action(a_Simulator)
	subscenario.currentAction = subscenario.currentAction + 1
end





return Scenario
