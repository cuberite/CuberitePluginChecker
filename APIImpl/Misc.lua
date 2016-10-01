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
	end
}
