# CuberitePluginChecker
This is a set of scripts that can automatically check a Cuberite plugin for some basic errors:
- syntax errors (the plugin is loaded into a Lua engine)
- API errors
- type errors
- storing a value from a callback for later reuse

The Checker has a simulator that mimics the Cuberite API (by sourcing the API description from Cuberite itself), so it has a pretty good picture about what API functions are available, what types of parameters they take etc. From this, a workable testing platform can be built.

In order to be able to check the plugin more thoroughly, the Checker needs a Scenario file that governs each individual check. The file specifies which actions and in what order the simulator performs.


# The checking methods
The Checker can detect if your plugin stores a value received in a callback for later reuse (which is an operation not permitted by Cuberite). There are two ways to detect this - GarbageCollecting and Clearing.

GarbageCollecting means that after each callback, the Checker will call Lua's garbage collector and see whether all of the values that have been passed to the callback have been collected. This detects all instances when a value is stored for later. It is expected that this method may become too slow for large project / many scenarios, but until you actually experience an unacceptable slowdown, you should prefer to use this method.

Clearing means that after each callback the Checker will remove all API functions from the object given to the callback. So if a plugin tries to access such an object later on, it will trigger an error. This method is expected to be faster than GarbageCollecting, but it will only detect when the object is actually used later on. If not all codepaths are tested, it is possible for this method to miss the store operation. Use this method only when GarbageCollecting is too slow for you.

# Setting up
The Checker requires a bit of a setup in order to run. It needs the API descriptions from Cuberite, which come from two separate sources - the AutoAPI (symbols exported automatically through a script during Cuberite build process); and the ManualAPI (symbols exported manually and documented in the APIDump built-in Cuberite plugin). Because the API evolves all the time, it is recommended to grab the latest version, rather than storing a fixed version somewhere.

## AutoAPI
During Cuberite build, the build process generates the API descriptions for all automatically-exported API symbols. This is output into the `src/Bindings/docs` folder, and this entire folder is needed by the Checker. It is expected that this data will be made available on official Cuberite servers soon, until then, you can use http://cuberite.xoft.cz/AutoAPI.tgz which is updated several times a day.

## ManualAPI
If you install the ManualApiDump plugin (https://github.com/madmaxoft/ManualApiDump) into your Cuberite, executing the `manualapi` console command will generate a `ManualAPI.lua` file next to the server executable. This file contains the descriptions for all manually-exported API symbols (Note that the APIDump plugin needs to be present for this to work). Again, it is expected that this data will be made available from the official Cuberite servers soon, until then, you can use http://cuberite.xoft.cz/ManualAPI.lua which is updated several times a day.

# Running
To sum up, before running you need these:
- your plugin files
- AutoAPI files
- ManualAPI file
- CuberitePluginChecker
- One or more Scenario files specific for your plugin
- Lua interpreter, with `luafilesystem` and `lsqlite3` modules installed (LuaRocks preferred)

To run the Checker, execute it in your Lua interpreter, while in the Checker's folder:
```
lua CuberitePluginChecker.lua -a <path/to/AutoAPI> -e <path/to/ManualAPI> -p <path/to/your/plugin> -s <ScenarioFile> [options]
```
The `path/to/AutoAPI` should point to the folder containing the AutoAPI files (such as `_all.lua`). The `path/to/ManualAPI` should point directly to the `ManualAPI.lua` file. The `path/to/your/plugin` should point to the folder where your plugin files are.
Options further specify the behaviour of the Checker:
- `-g` uses a GarbageCollecting check for callbacks. This is the preferred check method
- `-c` uses a Clearing check for callbacks.
- `-l <loglevel>` specifies the amount of diagnostic output that the plugin generates:
	- `1` = trace, everything is logged in great detail
	- `3` = debug (default)
	- `4` = info
	- `5` = warning
	- `9` = fatal error

When the Checker detects a problem, it displays the stack-trace where the problem occured and exits with a non-zero exit code. When no problem is detected, it exits with a zero exit code.

# Scenario file
The scenario file is used to tell the simulator what actions it should perform and in what order. It can specify the worlds available, players connecting and disconnecting, executing commands and more. The Checker supports only one scenario file per session, but you can test multiple scenarios by executing the Checker multiple times, each time with a different scenario file.

If you don't provide a scenario file, the Checker only loads the plugin and executes its `Initialize` function.

See the [ScenarioFiles.md](ScenarioFiles.md) file for detailed information about scenario files.
