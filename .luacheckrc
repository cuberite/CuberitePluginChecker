-- This file is the config file for the tool named Luacheck
-- Documentation: http://luacheck.readthedocs.io/en/stable/index.html

-- Ignore unused function and loop arguments
unused_args = false

-- Allow self defined globals
allow_defined = true

-- Ignore files / directories
exclude_files =
{
	"tests/",  -- CuberitePluginChecker
}

-- Ignore variables, warning codes
ignore =
{
	"113",  -- Accessing an undefined global variable.
	"211",  -- Unused local variable.
	"421",  -- Shadowing a local variable.
	"432",  -- Shadowing an upvalue argument.
	"511",  -- Unreachable code.
}
