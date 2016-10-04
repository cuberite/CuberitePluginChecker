-- World.lua

-- Provides special API implementations for cWorld API functions





return
{
	["cWorld:GetName()"] = function(a_Simulator, a_Self)
		return rawget(getmetatable(a_Self), "simulatorInternal_Name") or a_Simulator:createInstance({Type = "string"})
	end
}
