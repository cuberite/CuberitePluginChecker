-- CompositeChat.lua

-- Provides special API implementations for cCompositeChat API functions





return
{
	["cCompositeChat:AddRunCommandPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Command, a_Style)
		a_Self.simulatorInternal_Parts = a_Self.simulatorInternal_Parts or {}
		table.insert(a_Self.simulatorInternal_Parts, { text = a_Text, command = a_Command, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddSuggestCommandPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Command, a_Style)
		a_Self.simulatorInternal_Parts = a_Self.simulatorInternal_Parts or {}
		table.insert(a_Self.simulatorInternal_Parts, { text = a_Text, command = a_Command, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddTextPart(string, string)"] = function(a_Simulator, a_Self, a_Text, a_Style)
		a_Self.simulatorInternal_Parts = a_Self.simulatorInternal_Parts or {}
		table.insert(a_Self.simulatorInternal_Parts, { text = a_Text, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:AddUrlPart(string, string, string)"] = function(a_Simulator, a_Self, a_Text, a_Url, a_Style)
		a_Self.simulatorInternal_Parts = a_Self.simulatorInternal_Parts or {}
		table.insert(a_Self.simulatorInternal_Parts, { text = a_Text, url = a_Url, style = a_Style })
		return a_Self
	end,
	["cCompositeChat:ExtractText()"] = function(a_Simulator, a_Self)
		local res = {}
		for idx, part in ipairs(a_Self.simulatorInternal_Parts or {}) do
			res[idx] = part.text or ""
		end
		return table.concat(res)
	end,
}
