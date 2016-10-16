-- Network.lua

-- Provides an implementation for the network API. Unlike Cuberites API this is blocking.





local socket = require 'socket'
local http = require 'socket.http'
local https = require 'ssl.https'
local ltn12 = require("ltn12")





local function MakeRequest(a_Method, a_Url)
	local respbody = {}
	local protocol = a_Url:match("^https") and https or http
	local success, status, headers = protocol.request({
		url = a_Url,
		method = a_Method,
		sink = ltn12.sink.table(respbody),
	})
	respbody = table.concat(respbody)
	success = (success ~= nil)
	if (success) then
		status = nil
	end
	
	return success ~= nil, status, respbody, headers
end





return {
	["<static> cUrlClient:Delete(string, function)"] = function(a_Simulator, a_Self, a_Url, a_Callback)
		local success, status, body, headers = MakeRequest("DELETE", a_Url)
		a_Simulator:queueCallbackRequest({
			Function = a_Callback,
			ParamValues = { body, headers },
			Notes = "cUrlClient:Delete request",
		})
		return success, status
	end,
	["<static> cUrlClient:Get(string, function)"] = function(a_Simulator, a_Self, a_Url, a_Callback)
		local success, status, body, headers = MakeRequest("GET", a_Url)
		a_Simulator:queueCallbackRequest({
			Function = a_Callback,
			ParamValues = { body, headers },
			Notes = "cUrlClient:Get request",
		})
		return success, status
	end,
	["<static> cUrlClient:Post(string, function)"] = function(a_Simulator, a_Self, a_Url, a_Callback)
		local success, status, body, headers = MakeRequest("POST", a_Url)
		a_Simulator:queueCallbackRequest({
			Function = a_Callback,
			ParamValues = { body, headers },
			Notes = "cUrlClient:Post request",
		})
		return success, status
	end,
	["<static> cUrlClient:Put(string, function)"] = function(a_Simulator, a_Self, a_Url, a_Callback)
		local success, status, body, headers = MakeRequest("PUT", a_Url)
		a_Simulator:queueCallbackRequest({
			Function = a_Callback,
			ParamValues = { body, headers },
			Notes = "cUrlClient:Put request",
		})
		return success, status
	end,
}




