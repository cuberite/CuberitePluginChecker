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

	["cRoot:ForEachWorld(function)"] = function(a_Simulator, a_Root, a_Callback)
		for worldName, _ in pairs(a_Simulator.worlds) do
			local world = a_Simulator:createInstance({Type = "cWorld"})
			getmetatable(world).simulatorInternal_Name = worldName
			a_Callback(world)
		end
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
