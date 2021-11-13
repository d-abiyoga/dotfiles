-- init.lua
-- this is entry file to setting modules located in $XDG_CONFIG_HOME
local modules = {
  "settings",
  "mappings",
  "plugins",
  "plugins.nvim-tree"
} 

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
      error("Error loading" .. "\n\n" .. err)
  end
end
