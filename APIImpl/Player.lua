-- Player.lua

-- Provides special API implementations for cPlayer API functions





return
{
	["cPlayer:GetName()"] = function(a_Simulator, a_Self)
		return rawget(a_Self, "simulatorInternal_Name") or a_Simulator:createInstance({Type = "string"})
	end,

	["cEntity:GetWorld()"] = function(a_Simulator, a_Self)
		local res = a_Simulator:createInstance({Type = "cWorld"})
		local playerName = rawget(a_Self, "simulatorInternal_Name")
		if (playerName) then
			res.simulatorInternal_Name = a_Simulator.players[playerName].worldName
		end
		return res
	end,

	["cPlayer:SendMessage(string)"] = function(a_Simulator, a_Player, a_Message)
		a_Simulator.logger:info("Message to player %s: %s", a_Player:GetName(), a_Message)
	end,

	["cPlayer:SendMessage(cCompositeChat)"] = function(a_Simulator, a_Player, a_Chat)
		a_Simulator.logger:info("Message to player %s: %s", a_Player:GetName(), a_Chat:ExtractText())
	end,
}
