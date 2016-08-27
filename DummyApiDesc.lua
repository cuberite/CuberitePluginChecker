-- DummyApiDesc.lua

-- This is a bogus API description file!
-- Used to debug the project before we have a real API description exported from Cuberite.





return
{
	Classes =
	{
		cPluginManager =
		{
			Constants =
			{
				HOOK_BLOCK_SPREAD = { Type = "number", Value = 0 },
				HOOK_BLOCK_TO_PICKUPS = { Type = "number", Value = 1 },
			},
			Functions =
			{
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
	}
}