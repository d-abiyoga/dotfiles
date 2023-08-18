vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif

  highlight Cursor guifg=black guibg=white

  set guicursor=n-v-c:block-Cursor,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    colorscheme kanagawa
]])
