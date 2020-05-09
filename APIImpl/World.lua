-- World.lua

-- Provides special API implementations for cWorld API functions





--- Implements the common code for DoWithXYZAt() for all block entities
local function doWithBlockEntityWorker(a_Simulator, a_World, a_BlockX, a_BlockY, a_BlockZ, a_Callback, a_EntityType)
	local blockEntity = a_Simulator:createInstance({Type = a_EntityType})
	local mt = getmetatable(blockEntity)
	mt.simulatorInternal_BlockX = a_BlockX
	mt.simulatorInternal_BlockY = a_BlockY
	mt.simulatorInternal_BlockZ = a_BlockZ
	return a_Simulator:processCallbackRequest({
		Function = a_Callback,
		ParamValues = { blockEntity },
		Notes = string.format("DoWithBlockEntity(%s) callback", a_EntityType),
	})
end





--- Implements the common code for ForEachXYZInChunk() for all block entities
local function forEachBlockEntityInChunkWorker(a_Simulator, a_World, a_ChunkX, a_ChunkZ, a_Callback, a_EntityType)
	local blockX = a_ChunkX * 16 + 8
	local blockZ = a_ChunkZ * 16 + 8
	for y = 16, 20 do
		local blockEntity = a_Simulator:createInstance({Type = a_EntityType})
		local mt = getmetatable(blockEntity)
		mt.simulatorInternal_BlockX = blockX
		mt.simulatorInternal_BlockY = y
		mt.simulatorInternal_BlockZ = blockZ
		local res = a_Simulator:processCallbackRequest({
			Function = a_Callback,
			ParamValues = { blockEntity },
			Notes = string.format("ForEachBlockEntity(%s) callback", a_EntityType),
		})
		if (res[1]) then
			return false
		end
	end
	return true
end





return
{
	["cWorld:ChunkStay(table, function, function)"] = function(a_Simulator, a_Self, a_ChunkCoords, a_OnChunkAvailable, a_OnAllChunksAvailable)
		-- Call the OnChunkAvailable for each chunk:
		if (a_OnChunkAvailable) then
			for _, chunkCoords in ipairs(a_ChunkCoords) do
				assert(type(chunkCoords[1]) == "number")
				assert(type(chunkCoords[2]) == "number")
				a_Simulator:queueCallbackRequest({
					Function = a_OnChunkAvailable,
					ParamValues = { chunkCoords[1], chunkCoords[2] },
					Notes = string.format("cWorld:ChunkStay(): OnChunkAvailable(%d, %d)", chunkCoords[1], chunkCoords[2]),
				})
			end
		end

		-- Call the OnAllChunksAvailable:
		if (a_OnAllChunksAvailable) then
			a_Simulator:queueCallbackRequest({
				Function = a_OnAllChunksAvailable,
				ParamValues = { },
				Notes = "cWorld:ChunkStay(): OnAllChunksAvailable",
			})
		end
	end,


	["cWorld:DoWithBeaconAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cBeaconEntity")
	end,


	["cWorld:DoWithBlockEntityAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		-- We don't know what entity might be there, simulate a chest:
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cChestEntity")
	end,


	["cWorld:DoWithBrewingstandAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cBrewingstandEntity")
	end,


	["cWorld:DoWithChestAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cChestEntity")
	end,


	["cWorld:DoWithCommandBlockAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cCommandBlockEntity")
	end,


	["cWorld:DoWithDispenserAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cDispenserEntity")
	end,


	["cWorld:DoWithDropSpenserAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		-- We don't know what block entity might be there, simulate a dispenser:
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cDispenserEntity")
	end,


	["cWorld:DoWithDropperAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cDropperEntity")
	end,


	["cWorld:DoWithEntityByID(number, function)"] = function(a_Simulator, a_Self, a_UniqueID, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:DoWithEntityByID() cannot execute the callback, because the cWorld has no name.")
			return
		end

		-- Check if the EntityID is a player:
		for playerName, player in pairs(a_Simulator.players) do
			if ((player.worldName == worldName) and (player.uniqueID == a_UniqueID)) then
				local res = a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = string.format("cWorld:DoWithEntityByID() for player %s", playerName),
				})
				return true
			end
		end
		return false  -- player not found
	end,


	["cWorld:DoWithFlowerPotAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cFlowerPotEntity")
	end,


	["cWorld:DoWithFurnaceAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cFurnaceEntity")
	end,


	["cWorld:DoWithMobHeadAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cMobHeadEntity")
	end,


	["cWorld:DoWithNoteBlockAt(number, number, number, function)"] = function(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback)
		return doWithBlockEntityWorker(a_Simulator, a_Self, a_BlockX, a_BlockY, a_BlockZ, a_Callback, "cNoteBlockEntity")
	end,


	["cWorld:DoWithPlayer(string, function)"] = function(a_Simulator, a_Self, a_PlayerName, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:DoWithPlayer() cannot execute the callback, because the cWorld has no name.")
			return
		end

		local exactMatch = a_Simulator.players[a_PlayerName]
		if (exactMatch and (exactMatch.worldName == worldName)) then
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { a_Simulator:getPlayerByName(a_PlayerName) },
				Notes = string.format("cWorld:DoWithPlayer() for player %s", a_PlayerName),
			})
			return true
		end
		return false  -- player not found
	end,


	["cWorld:DoWithPlayerByUUID(UUID, function)"] = function(a_Simulator, a_Self, a_Uuid, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:DoWithPlayerByUUID() cannot execute the callback, because the cWorld has no name.")
			return
		end

		for playerName, player in pairs(a_Simulator.players) do
			if ((player.worldName == worldName) and (player.uuid == a_Uuid)) then
				local res = a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = string.format("cWorld:DoWithPlayerByUUID() for player %s", playerName),
				})
				return true
			end
		end
		return false  -- player not found
	end,


	["cWorld:ForEachBlockEntityInChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		-- We don't know what block entities might be there, simulate a chest:
		return forEachBlockEntityInChunkWorker(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback, "cChestEntity")
	end,


	["cWorld:ForEachBrewingstandInChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		return forEachBlockEntityInChunkWorker(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback, "cBrewingstandEntity")
	end,


	["cWorld:ForEachChestInChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		return forEachBlockEntityInChunkWorker(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback, "cChestEntity")
	end,


	["cWorld:ForEachEntity(function)"] = function(a_Simulator, a_Self, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:ForEachEntity() cannot execute the callback, because the cWorld has no name.")
			return
		end

		-- Currently only players are simulated:
		for playerName, player in pairs(a_Simulator.players) do
			if (player.worldName == worldName) then
				a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = "cWorld:ForEachEntity() callback",
				})
			end
		end
	end,


	["cWorld:ForEachEntityInBox(cBoundingBox, function)"] = function(a_Simulator, a_Self, a_BoundingBox, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:ForEachEntityInBox() cannot execute the callback, because the cWorld has no name.")
			return
		end

		-- Currently only players are simulated:
		for playerName, player in pairs(a_Simulator.players) do
			if (player.worldName == worldName) then
				a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = "cWorld:ForEachEntityInBox() callback",
				})
			end
		end
	end,


	["cWorld:ForEachEntityInChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:ForEachEntityInChunk() cannot execute the callback, because the cWorld has no name.")
			return
		end

		-- Currently only players are simulated:
		for playerName, player in pairs(a_Simulator.players) do
			if (player.worldName == worldName) then
				a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = "cWorld:ForEachEntityInChunk() callback",
				})
			end
		end
	end,


	["cWorld:ForEachFurnaceInChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		return forEachBlockEntityInChunkWorker(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback, "cFurnaceEntity")
	end,


	["cWorld:FindAndDoWithPlayer(string, function)"] = function(a_Simulator, a_Self, a_PlayerName, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:FindAndDoWithPlayer() cannot execute the callback, because the cWorld has no name.")
			return
		end

		-- If there is an exact match, use that:
		local exactMatch = a_Simulator.players[a_PlayerName]
		if (exactMatch and (exactMatch.worldName == worldName)) then
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { a_Simulator:getPlayerByName(a_PlayerName) },
				Notes = string.format("cWorld:FindAndDoWithPlayer() for player %s", a_PlayerName),
			})
			return true
		end

		-- If no exact match, use the first player in the world:
		for playerName, player in pairs(a_Simulator.players) do
			if (player.worldName == worldName) then
				local res = a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = string.format("cWorld:FindAndDoWithPlayer() for player %s", playerName),
				})
				return true
			end
		end
		return false  -- no player found
	end,


	["cWorld:ForEachPlayer(function)"] = function(a_Simulator, a_Self, a_Callback)
		local worldName = rawget(getmetatable(a_Self), "simulatorInternal_Name")
		if not(worldName) then
			a_Simulator.logger:debug("cWorld:ForEachPlayer() cannot execute the callback, because the cWorld has no name.")
			return
		end
		for playerName, player in pairs(a_Simulator.players) do
			if (player.worldName == worldName) then
				local res = a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = string.format("cWorld:ForEachPlayer() for player %s", playerName),
				})
				if (res[1]) then
					return false
				end
			end
		end
		return true
	end,


	["cWorld:GetName()"] = function(a_Simulator, a_Self)
		return rawget(getmetatable(a_Self), "simulatorInternal_Name") or a_Simulator:createInstance({Type = "string"})
	end,


	["cWorld:GetTimeOfDay()"] = function(a_Simulator, a_Self)
		return getmetatable(a_Self).simulatorInternal_TimeOfDay or 0
	end,


	["cWorld:PrepareChunk(number, number, function)"] = function(a_Simulator, a_Self, a_ChunkX, a_ChunkZ, a_Callback)
		a_Simulator:queueCallbackRequest({
			Function = a_Callback,
			ParamValues = { a_ChunkX, a_ChunkZ },
			Notes = string.format("cWorld:PrepareChunk callback(%d, %d)", a_ChunkX, a_ChunkZ),
		})
	end,


	["cWorld:QueueTask(function)"] = function(a_Simulator, a_Self, a_Task)
		a_Simulator:queueCallbackRequest({
			Function = a_Task,
			ParamValues = { a_Self },
			Notes = "cWorld:QueueTask callback",
		})
	end,

	["cWorld:ScheduleTask(number, function)"] = function(a_Simulator, a_Self, a_NumTicks, a_Task)
		a_Simulator:queueCallbackRequest({
			Function = a_Task,
			ParamValues = { a_Self },
			Notes = "cWorld:ScheduleTask callback",
		})
	end,

	["cWorld:SetTimeOfDay(number)"] = function(a_Simulator, a_Self, a_Time)
		getmetatable(a_Self).simulatorInternal_TimeOfDay = a_Time
	end,
}
