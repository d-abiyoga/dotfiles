--[[
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

--vim.opt.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#fb4934 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#fabd2f gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#b8bb26 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#8ec07c gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#83a598 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#d3869b gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_conterx_start = true,
--[[
--
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
--]]
}
