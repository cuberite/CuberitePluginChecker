-- World.lua

-- Provides special API implementations for cWorld API functions





return
{
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
}
