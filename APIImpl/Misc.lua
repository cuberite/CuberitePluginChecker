-- Misc.lua

-- Provides special API implementations for miscellaneous API functions





local sqlite3 = require("lsqlite3")





return
{
	["LOG(string)"] = function (a_Simulator, a_Text)
		a_Simulator.logger:info("LOG: %s", a_Text)
	end,

	["LOGWARNING(string)"] = function (a_Simulator, a_Text)
		a_Simulator.logger:warning("LOGWARNING: %s", a_Text)
	end,

	["LOGERROR(string)"] = function (a_Simulator, a_Text)
		a_Simulator.logger:warning("LOGERROR: %s", a_Text)
	end,

	["<static, global> sqlite3:open(string)"] = function (a_Simulator, a_FileName)
		return sqlite3.open(a_Simulator:redirectPath(a_FileName))
	end,

	["<static, global> tolua:type(any)"] = function (a_Simulator, a_Object)
		return a_Simulator:typeOf(a_Object)
	end,

	["cRoot:DoWithPlayerByUUID(string, function)"] = function(a_Simulator, a_Root, a_PlayerUUID, a_Callback)
		for playerName, player in pairs(a_Simulator.players) do
			if (player.uuid == a_Uuid) then
				local res = a_Simulator:processCallbackRequest({
					Function = a_Callback,
					ParamValues = { a_Simulator:getPlayerByName(playerName) },
					Notes = string.format("cRoot:DoWithPlayerByUUID() for player %s", playerName),
				})
				return true
			end
		end
		return false  -- player not found
	end,

	["cRoot:FindAndDoWithPlayer(string, function)"] = function(a_Simulator, a_Root, a_PlayerName, a_Callback)
		local player = a_Simulator:getPlayerByName(a_PlayerName)
		if not(player) then
			return false
		end
		a_Simulator:processCallbackRequest({
			Function = a_Callback,
			ParamValues = { player },
			Notes = string.format("cRoot:FindAndDoWithPlayer() callback for player %s", a_PlayerName),
		})
		return true
	end,

	["cRoot:ForEachPlayer(function)"] = function(a_Simulator, a_Root, a_Callback)
		for playerName, _ in pairs(a_Simulator.players) do
			local player = a_Simulator:getPlayerByName(playerName)
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { player },
				Notes = string.format("cRoot:ForEachPlayer() callback for player %s", playerName),
			})
			if not(res and res[1]) then
				return false
			end
		end
		return true
	end,

	["cRoot:ForEachWorld(function)"] = function(a_Simulator, a_Root, a_Callback)
		for worldName, _ in pairs(a_Simulator.worlds) do
			local world = a_Simulator:createInstance({Type = "cWorld"})
			getmetatable(world).simulatorInternal_Name = worldName
			local res = a_Simulator:processCallbackRequest({
				Function = a_Callback,
				ParamValues = { world },
				Notes = string.format("cRoot:ForEachWorld() callback for world %s", worldName),
			})
			if not(res and res[1]) then
				return false
			end
		end
		return true
	end,

	["cEntity:GetUniqueID()"] = function(a_Simulator, a_Self)
		return rawget(getmetatable(a_Self), "simulatorInternal_UniqueID")
	end,

	["StringSplit(string, string)"] = function (a_Simulator, a_Text, a_Splitter)
		local res, i = {}, 1
		for split in a_Text:gmatch("([^" .. a_Splitter .. "]+)") do
			res[i] = split
			i = i + 1
		end
		return res
	end,

	["ItemTypeToString(number)"] = function(a_Simulator, a_ItemType)
		for key, value in pairs(a_Simulator.sandbox) do
			if (key:match("^E_") and (value == a_ItemType)) then
				local name = key:match("^E_.-_(.*)"):gsub("_", ""):lower()
				return name
			end
		end
	end
}
