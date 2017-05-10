-- Logger.lua

-- Implements a logger that can output log messages and filter them based on loglevel





local Logger =
{
	-- The various log levels:
	ERROR   = 9,  -- Emitting this log also prints stacktrace and terminates the entire program
	WARNING = 5,
	INFO    = 4,
	DEBUG   = 3,
	TRACE   = 1,
}

-- If currentLogLevel is higher than message's loglevel, the message won't be output
Logger.currentLogLevel = Logger.DEBUG





-- Store the "error" function as of loading this file, so that client code may replace it without affecting us:
local error = error





--- Creates a new logger instance based on the parsed options given
function Logger:new(a_Options)
	-- Check params:
	assert(type(self) == "table")
	assert(type(a_Options) == "table")

	local res =
	{
		currentLogLevel = self.currentLogLevel or a_Options.logLevel or Logger.DEBUG,
	}
	setmetatable(res, self)
	self.__index = self
	return res
end





--- Common logging entrypoint, receives all log messages
function Logger:log(a_LogLevel, a_Format, ...)
	-- Check params:
	assert(self)
	assert(type(a_Format) == "string")

	-- If loglevel too high for this message, bail out:
	if (a_LogLevel < self.currentLogLevel) then
		return
	end

	-- Output the message
	print(string.format(a_Format, ...))
	io.stdout:flush()
end





--- Logs the message with an ERROR level and calls global "error" with the same message
-- Usually this terminates the program
function Logger:error(a_Level, a_Fmt, ...)
	assert(self)
	assert(type(a_Level) == "number")
	assert(type(a_Fmt) == "string")

	self:log(Logger.ERROR, a_Fmt, ...)
	error(string.format(a_Fmt, ...), a_Level)
end





--- Logs the message with a WARNING level
function Logger:warning(...)
	assert(self)
	self:log(Logger.WARNING, ...)
end





--- Logs the message with an INFO level
function Logger:info(...)
	assert(self)
	self:log(Logger.INFO, ...)
end





--- Logs the message with a DEBUG level
function Logger:debug(...)
	assert(self)
	self:log(Logger.DEBUG, ...)
end





--- Logs the message with a TRACE level
function Logger:trace(...)
	assert(self)
	self:log(Logger.TRACE, ...)
end





return Logger
