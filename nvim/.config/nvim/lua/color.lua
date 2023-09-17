-- Example config in Lua
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { border = "orange", hint = "orange", error = "#ff0000" }

require('kanagawa').setup({
    undercurl = true,
    keywordStyle = { italic = true },
    globalStatus = true,
    dimInactive = true,
})

vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})


-- Load the colorscheme
vim.cmd([[
  " if has('termguicolors')
  "   set termguicolors
  " endif
  set termguicolors

  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

  " set guicursor=n:blinkon1

  colorscheme kanagawa
]])
