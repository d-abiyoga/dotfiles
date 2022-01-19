local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('config')..'/lua-language-server'
--local home = os.getenv("HOME")
--local sumneko_root_path = (home .. '/.local/share')..'/lua-language-server'
--local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local home = os.getenv("HOME")
local sumneko_root_path = (home .. '/.local/share/nvim/lsp_servers/sumneko_lua/extension/server')
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
--local sumneko_binary_path = vim.fn.exepath('lua-language-server')
--local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      },
      telemetry = {
        enable = false,
      }
    }
  }
}
