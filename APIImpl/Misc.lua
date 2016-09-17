-- Misc.lua

-- Provides special API implementations for miscellaneous API functions





local sqlite3 = require("lsqlite3")





return
{
	["LOG(string)"] = function (a_Simulator, a_Text)
		print("LOG: " .. a_Text)
	end,

	["LOGWARNING(string)"] = function (a_Simulator, a_Text)
		print("WARNING: " .. a_Text)
	end,

	["LOGERROR(string)"] = function (a_Simulator, a_Text)
		print("ERROR: " .. a_Text)
	end,

	["sqlite3:open(string)"] = function (a_Simulator, a_FileName)
		-- TODO: Add scenario-based filename redirects
		return sqlite3.open(a_FileName)
	end,

}
