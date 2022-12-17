-- Example config in Lua
--[[ vim.g.tokyonight_style = "day" ]]
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { border = "orange", hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif

  " set guicursor=n:blinkon1

  colorscheme kanagawa
]])
