-- Minimal.lua
-- Provides a minimal plugin for testing purposes





function Initialize(a_Plugin)
	LOG("Initializing the Minimal plugin.")
	cPluginManager:Get():BindCommand("minimal", "minimal",
		function (a_Split, a_Player, a_EntireCmd)
			LOG("Minimal cmd has been called: \"" .. a_EntireCmd .. "\"")
		end,
		"Testing command for the Minimal plugin"
	)
end




