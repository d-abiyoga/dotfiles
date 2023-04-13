vim.cmd([[
    let g:user_emmet_mode='a'
    let g:user_emmet_complete_tag = 0
    let g:user_emmet_install_global = 0
    set winbar=%=%m\ %f
    autocmd FileType html,css,scss,typescriptreact,vue,javascript,markdown EmmetInstall
    autocmd BufRead,BufEnter *.astro set filetype=astro
]])

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
