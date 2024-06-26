local api = vim.api
local cmd = api.nvim_command

local U = {}

-- Key mapping
function U.map(mode, key, result, opts)
  local options = { noremap = true, silent = true, expr = false }

  if opts then
    options = vim.tbl_extend("keep", opts, options)
  end

  api.nvim_set_keymap(mode, key, result, options)
end

function U.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  end

  return false
end

return U
