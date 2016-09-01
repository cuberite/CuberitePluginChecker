-- ManualAPI.lua

-- Provides the descriptions for the manually-exported API symbols





local lfs = require("lfs")
local sqlite3 = require("lsqlite3")




return
{
	Classes =
	{
		cFile =
		{
			Functions =
			{
				Copy =
				{
					{
						Params = { {Type = "string"}, {Type = "string"} },
						Returns = { {Type = "bool"} },
						IsStatic = true,
						Implementation = function (a_Simulator, a_ThisClass, a_SrcFileName, a_DstFileName)
							local fIn = io.open(a_SrcFileName, "rb")
							if not(fIn) then
								return false
							end
							local contents = fIn:read("*a")
							fIn:close()
							local fOut = io.open(a_DstFileName, "wb")
							if not(fOut) then
								return false
							end
							fOut:write(contents)
							fOut:close()
							return true
						end,
					},
				},

				IsFile =
				{
					{
						Params = { {Type = "string"} },
						IsStatic = true,
						Returns = { {Type = "bool"} },
						Implementation = function (a_Simulator, a_ThisClass, a_FileName)
							local mode = lfs.attributes(a_FileName, "mode")
							return (mode == "file")
						end
					},
				},
			},  -- Functions
		},  -- cFile



		cPluginManager =
		{
			Functions =
			{
				GetCurrentPlugin =
				{
					{
						Params = {},
						Returns = { {Type = "cPlugin"} },
						Implementation = function (a_Simulator, a_Self)
							local res = a_Simulator:createInstance({Type = "cPlugin"})
							res.GetLocalPath = function (a_Self) return a_Simulator.options.pluginPath end  -- Override the plugin to act as "self"
							return res
						end,
					},
				},
			},  -- Functions
		},  -- cPluginManager



		sqlite3 =
		{
			Functions =
			{
				open =
				{
					IsGlobal = true,  -- Behaves as a global function - doesn't have the "self" param at all
					{
						Params = { {Type = "string"} },
						Implementation = function (a_Simulator, a_FileName)
							return sqlite3.open(a_FileName)
						end,
					}
				}
			},  -- Functions

			Constants =
			{
				OK = { Type = "number", Value = sqlite3.OK, }
			},  -- Constants
		},  -- sqlite3
	},  -- Classes



	Globals =
	{
		Functions =
		{
			LOG =
			{
				{
					Params = { {Type = "string"} },
					Implementation = function (a_Simulator, a_Text)
						print("LOG: " .. a_Text)
					end,
				},
			},
			LOGINFO =
			{
				{
					Params = { {Type = "string"} },
					Implementation = function (a_Simulator, a_Text)
						print("INFO: " .. a_Text)
					end,
				},
			},
			LOGWARNING =
			{
				{
					Params = { {Type = "string"} },
					Implementation = function (a_Simulator, a_Text)
						print("WARNING: " .. a_Text)
					end,
				},
			},
		},  -- Functions
	},  -- Globals
}
