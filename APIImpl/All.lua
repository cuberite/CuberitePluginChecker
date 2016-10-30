-- All.lua

-- Combines all APIImpl files, for simple cmdline inclusion (simply do "-i APIImpl/All.lua")





--- List all the APIImpl files:
local filenames =
{
	"APIImpl/CompositeChat.lua",
	"APIImpl/File.lua",
	"APIImpl/Misc.lua",
	"APIImpl/Network.lua",
	"APIImpl/Player.lua",
	"APIImpl/PluginManager.lua",
	"APIImpl/UI.lua",
	"APIImpl/World.lua",
}




-- Combine all the results into a single table:
local res = {}
for _, fnam in ipairs(filenames) do
	local impl = dofile(fnam)
	for k, v in pairs(impl) do
		if not(not(res[k])) then
			error(string.format(
				"Implementation for %s is defined in two places, one of them is %s, the other is unknown, but earlier in the APIImpl.lua's filelist",
				k, fnam
			))
		end
		res[k] = v
	end
end
return res
