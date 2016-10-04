-- CompositeChat.lua

-- Provides special API implementations for cCompositeChat API functions





return
{
	["<static> cCompositeChat:constructor(string, eMessageType)"] = function(a_Simulator, a_SelfClass, a_Text, a_MessageType)
		local res = a_Simulator:createInstance({Type = "cCompositeChat"})
		getmetatable(res).simulatorInternal_Parts = { {text = a_Text} }
		return res
	end,

	["cCompositeChat:AddRunCommandPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Command, a_Style)
		table.insert(getmetatable(a_Self).simulatorInternal_Parts, { text = a_Text, command = a_Command, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddSuggestCommandPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Command, a_Style)
		table.insert(getmetatable(a_Self).simulatorInternal_Parts, { text = a_Text, command = a_Command, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddTextPart(string, string)"] = function(a_Simulator, a_Self, a_Text, a_Style)
		table.insert(getmetatable(a_Self).simulatorInternal_Parts, { text = a_Text, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddUrlPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Url, a_Style)
		table.insert(getmetatable(a_Self).simulatorInternal_Parts, { text = a_Text, url = a_Url, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:ExtractText()"] = function(a_Simulator, a_Self)
		local res = {}
		for idx, part in ipairs(rawget(getmetatable(a_Self), "simulatorInternal_Parts") or {}) do
			res[idx] = part.text or ""
		end
		return table.concat(res)
	end,
}
