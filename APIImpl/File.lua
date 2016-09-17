-- File.lua

-- Provides special API implementations for cFile functions





return
{
	["cFile:Copy(string, string)"] = function (a_Simulator, a_ThisClass, a_SrcFileName, a_DstFileName)
		local fIn = io.open(a_SrcFileName, "rb")
		if not(fIn) then
			return false
		end
		local contents = fIn:read("*a")
		fIn:close()
		local fOut = io.open(a_DstFileName, "wb")
		if not(fOut) then
			return false
		end
		fOut:write(contents)
		fOut:close()
		return true
	end,

	["cFile:IsFile(string)"] = function (a_Simulator, a_ThisClass, a_FileName)
		local mode = lfs.attributes(a_FileName, "mode")
		return (mode == "file")
	end,
}