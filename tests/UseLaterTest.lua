-- UseLaterTest.lua

-- Defines the test scenario for the UseLater plugin





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
	},
	playerCommand
	{
		playerName = "player1",
		command = "store",
	},
	playerCommand
	{
		playerName = "player1",
		command = "use",
	},
}
