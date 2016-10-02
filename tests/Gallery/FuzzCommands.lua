-- FuzzCommands.lua

-- Defines a scenario for fuzzing the commands





scenario
{
	name = "Fuzz all commands",
	redirect -- Redirect files / folders
	{
		["Galleries.cfg"] = "tests/Gallery/FuzzCommands.cfg",
		["Galleries.example.cfg"] = "tests/Gallery/FuzzCommands.example.cfg",
		["Galleries.sqlite"] = "tests/Gallery/FuzzCommands.sqlite",
	},
	world  -- Create a world
	{
		name = "world",
	},
	connectPlayer  -- Simulate a player connection
	{
		name = "player1",
		worldName = "world",
	},
	connectPlayer
	{
		name = "player2",
		worldName = "world",
	},
	playerCommand  -- Execute a command handler on behalf of this player
	{
		playerName = "player1",
		command = "/gallery claim first",
	},
	fuzzAllCommands  -- fuzz all registered commands
	{
		playerName = "player1",
		choices =
		{
			"world",
			"first",
			"player1",
			"player2",
			"1",
		},
		maxLen = 2,  -- Max number of elements chosen from "choices"
	},
}
