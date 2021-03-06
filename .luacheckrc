-- This file is the config file for the tool named Luacheck
-- Documentation: http://luacheck.readthedocs.io/en/stable/index.html

-- Ignore unused function and loop arguments
unused_args = false

-- Allow self defined globals
allow_defined = true

-- Ignore files / directories
exclude_files =
{
	"tests/",

	-- Not present in git, but used locally for on-the-fly checking:
	"InfoReg.lua",
	"AutoAPI/",
}

-- Ignore variables, warning codes
ignore =
{
	"631",  -- Line too long.
}
