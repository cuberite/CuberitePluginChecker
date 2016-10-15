-- File.lua

-- Provides special API implementations for cFile functions





local lfs = require("lfs")





local g_IsOSWindows = (package.cpath:match("%.dll"))





return
{
	["<static> cFile:Copy(string, string)"] = function(a_Simulator, a_ThisClass, a_SrcFileName, a_DstFileName)
		if (a_SrcFileName == "") then
			a_Simulator.logger:error(2, "Attempting to copy console to file %q.", a_DstFileName)
		end
		if (a_DstFileName == "") then
			a_Simulator.logger:error(2, "Attempting to copy file %q to console.", a_SrcFileName)
		end
		a_SrcFileName = a_Simulator:redirectPath(a_SrcFileName)
		a_DstFileName = a_Simulator:redirectPath(a_DstFileName)
		assert(a_SrcFileName ~= "")
		assert(a_DstFileName ~= "")
		local isSuccess, msg = util.copyFile(a_SrcFileName, a_DstFileName)
		if not(isSuccess) then
			a_Simulator.logger.debug("cFile:Copy failed: %s", msg)
		end
		return isSuccess
	end,

	["<static> cFile:CreateFolder(string)"] = function(a_Simulator, a_ThisClass, a_Folder)
		a_Folder = a_Simulator:redirectPath(a_Folder)
		return lfs.mkdir(a_Folder)
	end,

	["<static> cFile:CreateFolderRecursive(string)"] = function(a_Simulator, a_ThisClass, a_Folder)
		a_Folder = a_Simulator:redirectPath(a_Folder)
		return (utils.createFolderRecursive(a_Folder))
	end,

	["<static> cFile:Delete(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		a_Path = a_Simulator:redirectPath(a_Path)
		return (os.remove(a_Path) ~= nil)
	end,

	["<static> cFile:DeleteFile(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		if not(cFile:IsFile(a_Path)) then
			return false
		end
		a_Path = a_Simulator:redirectPath(a_Path)
		return (os.remove(a_Path) ~= nil)
	end,

	["<static> cFile:DeleteFolder(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		if not(cFile:IsFolder(a_Path)) then
			return false
		end
		a_Path = a_Simulator:redirectPath(a_Path)
		return (os.remove(a_Path) ~= nil)
	end,

	["<static> cFile:DeleteFolderContents(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		if not(cFile:IsFolder(a_Path)) then
			return false
		end
		a_Path = a_Simulator:redirectPath(a_Path)
		return deleteFolderContents(a_Path)
	end,

	["<static> cFile:Exists(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		error("cFile:Exists is obsolete and should not be used")
	end,

	["<static> cFile:GetExecutableExt()"] = function(a_Simulator, a_ThisClass)
		return g_IsOSWindows and ".exe" or ""
	end,

	["<static> cFile:GetFolderContents(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		local res = {}
		a_Path = a_Simulator:redirectPath(a_Path)
		for fnam in lfs.dir(a_Path) do
			if ((fnam ~= ".") and (fnam ~= "..")) then
				table.insert(res, fnam)
			end
		end
		return res
	end,

	["<static> cFile:GetLastModificationTime(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		a_Path = a_Simulator:redirectPath(a_Path)
		return lfs.attributes(a_Path, "modification")
	end,

	["<static> cFile:GetPathSeparator()"] = function(a_Simulator, a_ThisClass)
		return "/"
	end,

	["<static> cFile:GetSize(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		return lfs.attributes(a_Simulator:redirectPath(a_Path), "size")
	end,

	["<static> cFile:IsFile(string)"] = function(a_Simulator, a_ThisClass, a_FileName)
		a_FileName = a_Simulator:redirectPath(a_FileName)
		local mode = lfs.attributes(a_FileName, "mode")
		return (mode == "file")
	end,

	["<static> cFile:IsFolder(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		a_Path = a_Simulator:redirectPath(a_Path)
		local mode = lfs.attributes(a_Path, "mode")
		return (mode == "directory")
	end,

	["<static> cFile:ReadWholeFile(string)"] = function(a_Simulator, a_ThisClass, a_Path)
		local f = io.open(a_Simulator:redirectPath(a_Path), "rb")
		if not(f) then
			return ""
		end
		local res = f:read("*all")
		f:close()
		return res
	end,

	["<static> cFile:Rename(string, string)"] = function(a_Simulator, a_ThisClass, a_SrcPath, a_DstPath)
		return (os.rename(a_SrcPath, a_DstPath) ~= nil)
	end,
}
