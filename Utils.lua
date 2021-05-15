-- Utils.lua

-- Implements various utility functions, in the "util" table





local lfs = require("lfs")





utils =
{
	--- Copies the file contents
	-- Returns true on success, false and message on failure
	copyFile = function(a_SrcFileName, a_DstFileName)
		local fIn, msg = io.open(a_SrcFileName, "rb")
		if not(fIn) then
			return false, string.format("copyFile: failed to open src file %q: %s", a_SrcFileName, msg)
		end
		local contents = fIn:read("*a")
		fIn:close()
		local fOut
		fOut, msg = io.open(a_DstFileName, "wb")
		if not(fOut) then
			return false, string.format("copyFile: failed to open dst file %q: %s", a_DstFileName, msg)
		end
		local isSuccess
		isSuccess, msg = fOut:write(contents)
		if not(isSuccess) then
			return false, msg
		end
		fOut:close()
		return true
	end,


	--- Creates a folder recursively, creating any intermediate folders needed
	createFolderRecursive = function(a_Folder)
		local pathSoFar = {}
		-- TODO: rewrite this to use string.find instead of string.gsub, to account for absolute linux paths
		a_Folder:gsub("[^/]*",
			function(a_Match)
				table.insert(pathSoFar, a_Match)
				lfs.mkdir(table.concat(pathSoFar, "/"))
			end
		)
		return (lfs.attributes(a_Folder, "mode") == "directory")
	end,


	--- Recursively deletes all contents of a specified folder
	deleteFolderContents = function(a_Path)
		for fnam in lfs.dir(a_Path) do
			local fullName = a_Path .. "/" .. fnam
			if (lfs.attributes(fullName, "mode") == "directory") then
				utils.deleteFolderContents(fullName)
			end
			os.remove(fullName)
		end
	end,


	-- Returns true if the specified filename represents a file in the FS
	isFile = function(a_FileName)
		local mode = lfs.attributes(a_FileName, "mode")
		return (mode == "file")
	end,


	-- Returns true if the specified path represents a folder in the FS
	isFolder = function(a_Path)
		local mode = lfs.attributes(a_Path, "mode")
		return (mode == "directory")
	end,


	--- Returns a pretty-printed function signature for display to the user
	-- a_Signature is a single APIDesc signature of the function
	-- a_FnName is an optional name of the function, if not present, no name will be printed
	prettyPrintFunctionSignature = function(a_Signature, a_FnName)
		-- Check params:
		assert(type(a_Signature) == "table")
		assert(type(a_Signature.Params) == "table")
		assert(type(a_Signature.Returns) == "table")

		-- Output the qualifiers:
		local res = ""
		local qualifiers = {}
		if (a_Signature.IsStatic) then
			qualifiers[1] = "static"
		end
		if (a_Signature.IsGlobal) then
			qualifiers[#qualifiers + 1] = "global"
		end
		if (qualifiers[1]) then
			res = "<" .. table.concat(qualifiers, ", ") .. "> "
		end

		-- Output the function name, if present:
		res = res .. (a_FnName or "")

		-- Output the params:
		res = res .. "("
		for idx, param in ipairs(a_Signature.Params) do
			if (idx > 1) then
				res = res .. ", "
			end
			res = res .. param.Type
		end
		res = res .. ") -> ("

		-- Output the returns:
		for idx, ret in ipairs(a_Signature.Returns) do
			if (idx > 1) then
				res = res .. ", "
			end
			res = res .. ret.Type
		end
		return res .. ")"
	end,

}
