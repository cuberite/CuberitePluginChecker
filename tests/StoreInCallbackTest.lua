-- StoreInCallbackTest.lua

-- Defines the test scenario for the StoreInCallback plugin





scenario
{
	name = "StoreForLater",
	world
	{
		name = "world",
	},
	initializePlugin(),
	connectPlayer
	{
		name = "player1",
		worldName = "world",
		uuid = "uuid-player1",
	},
	playerCommand
	{
		playerName = "player1",
		command = "uselater",
	},
	playerCommand
	{
		playerName = "player1",
		command = "storeglobally",
	},
}
