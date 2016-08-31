-- DummyApiDesc.lua

-- This is a bogus API description file!
-- Used to debug the project before we have a real API description exported from Cuberite.





return
{
	Classes =
	{
		cPlugin =
		{
			Functions =
			{
			},  -- Functions
		},  -- cPlugin


		cPluginManager =
		{
			Constants =
			{
				HOOK_BLOCK_SPREAD = { Type = "number", Value = 0 },
				HOOK_BLOCK_TO_PICKUPS = { Type = "number", Value = 1 },
			},
			Functions =
			{
				BindCommand =
				{
					Params =
					{
						{ Type = "string" },    -- command
						{ Type = "string" },    -- permission
						{ Type = "function" },  -- callback
						{ Type = "string" },    -- help
					},
				},
				Get =
				{
					IsStatic = true,
					Returns =
					{
						{ Type = "cPluginManager" }
					},
				},
				IsCommandBound =
				{
				},
			},  -- Functions
		},  -- cPluginManager


		cRoot =
		{
			Functions =
			{
				BroadcastChat =
				{
					Params =
					{
						{ Name = "a_MessageText", Type = "AString" },
						{ Name = "a_MessageType", Type = "AString" },
					},
				},
				Get =
				{
					IsStatic = true,
					Returns =
					{
						{ Type = "cRoot" },
					},
				},
				GetPluginManager =
				{
					Returns =
					{
						{ Type = "cPluginManager" },
					},
				},
			},
		},  -- cRoot
	},  -- Classes


	Globals =
	{
		Functions =
		{
			LOG =
			{
				Params =
				{
					{ Name = "text", Type = "string" },
				},
				Implementation = function (a_Simulator, a_Text) print("LOG: " .. a_Text) end,
			},
		},  -- Functions
	},  -- Globals
}
