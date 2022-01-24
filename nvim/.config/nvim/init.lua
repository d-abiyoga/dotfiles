-- init.lua
-- this is entry file to setting modules located in $XDG_CONFIG_HOME
local modules = {
	"options",
	"keymaps",
	"plugins",
	"color",
	"plugins.cmp", --TODO: should goes to plugins
	"lsp",
	"autocommands",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		error("Error loading" .. "\n\n" .. err)
	end
end
