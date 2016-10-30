-- UI.lua

-- Provides special API implementations for UI-related API functions





return
{
	["cLuaWindow:SetOnClosing(function)"] = function(a_Simulator, a_Self, a_Callback)
		getmetatable(a_Self).simulatorInternal_OnClosingCallback = a_Callback
	end,

	["cLuaWindow:SetOnSlotChanged(function)"] = function(a_Simulator, a_Self, a_Callback)
		getmetatable(a_Self).simulatorInternal_OnSlotChangedCallback = a_Callback
	end,
}
