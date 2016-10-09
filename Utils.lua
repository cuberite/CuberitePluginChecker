-- Utils.lua

-- Implements various utility functions, in the "util" table





util =
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
				deleteFolderContents(fullName)
			end
			os.remove(fullName)
		end
	end,
}
