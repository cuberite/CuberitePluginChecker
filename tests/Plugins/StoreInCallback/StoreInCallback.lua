-- StoreInCallback.lua

-- Implements a test Cuberite plugin that stores for later an instance from a callback inside a command callback




local g_Player
local g_Entity





local function onCmdUseLater(a_Split, a_Player)
	-- These test detection of storing an instance given to this call for a later callback
	-- Currently not found by the Checker, because it calls the callbacks immediately (#12)

	a_Player:GetWorld():PrepareChunk(
		2, 3,
		function(a_ChunkX, a_ChunkZ)
			a_Player:SendMessage(string.format("Chunk [%d, %d] prepared.", a_ChunkX, a_ChunkZ))
		end
	)

	a_Player:GetWorld():ChunkStay(
		{ {2, 3}, {4, 5} },
		function(a_ChunkX, a_ChunkZ)
			a_Player:SendMessage(string.format("Chunk [%d, %d] available", a_ChunkX, a_ChunkZ))
		end,
		function()
			a_Player:SendMessage("All chunks available.")
		end
	)

	a_Player:GetWorld():QueueTask(
		function(a_CBWorld)
			a_Player:SendMessage("Queued task")
		end
	)

	a_Player:GetWorld():ScheduleTask(
		10,
		function(a_CBWorld)
			a_Player:SendMessage("Queued task")
		end
	)
end





local function onCmdStoreGlobally(a_Split, a_Player)
	-- Whichever of these is first, it should raise an error in the simulator:

	a_Player:GetWorld():ForEachEntity(
		function(a_Entity)
			g_Entity = a_Entity  -- Store
		end
	)

	a_Player:GetWorld():ForEachChestInChunk(1, 1,
		function(a_CBChest)
			g_Entity = a_CBChest  -- Store
		end
	)

	a_Player:GetWorld():DoWithBrewingstandAt(1, 1, 1,
		function(a_CBBrewingstand)
			g_Entity = a_CBBrewingstand  -- Store
		end
	)

	a_Player:GetWorld():DoWithEntityByID(
		a_Player:GetUniqueID(),
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)

	a_Player:GetWorld():DoWithPlayerByUUID(
		"uuid-player1",
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)

	a_Player:GetWorld():DoWithPlayer(
		"player1",
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)

	a_Player:GetWorld():FindAndDoWithPlayer(
		"something",
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)

	a_Player:GetWorld():ForEachPlayer(
		function(a_CBPlayer)
			g_Player = a_CBPlayer  -- Store
		end
	)
end





function Initialize()
	cPluginManager:BindCommand("storeglobally", "", onCmdStoreGlobally)
	cPluginManager:BindCommand("uselater", "",      onCmdUseLater)
	return true
end



