local get_os_name = require("utils.get_os_name")

local default_prog
local set_environment_variables = {}

if get_os_name.get_os_name() == "Windows" then
   return { "pwsh.exe" }
else
   return { 
      default_prog = default_prog,
      set_environment_variables = set_environment_variables,
    }
end
