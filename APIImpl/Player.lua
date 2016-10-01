-- Player.lua

-- Provides special API implementations for cPlayer API functions





return
{
	["cPlayer:GetName()"] = function(a_Simulator, a_Self)
		return rawget(a_Self, "simulatorInternal_Name") or a_Simulator:createInstance({Type = "string"})
	end,

	["cPlayer:SendMessage(string)"] = function(a_Simulator, a_Player, a_Message)
		a_Simulator.logger:info("Message to player %s: %s", a_Player:GetName(), a_Message)
	end,

	["cPlayer:SendMessage(cCompositeChat)"] = function(a_Simulator, a_Player, a_Chat)
		a_Simulator.logger:info("Message to player %s: %s", a_Player:GetName(), a_Chat:ExtractText())
	end,
}
